<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.model.GiocoModel,it.gameshub.bean.Carrello,it.gameshub.bean.Utente,it.gameshub.bean.Immagine,it.gameshub.bean.ItemOrder,it.gameshub.model.CartaModel,it.gameshub.bean.Carta"%>

<% 
	Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
	Gioco product = (Gioco) request.getAttribute("product");
	
	Carrello cart = (Carrello) request.getSession().getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Checkout</title>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="css/site.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="css/PaymentPage.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
	<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	<script src="js/custom.js"></script>

<style>	

body {
    
    font-size: 16px !important;
    
}

#infoi {
    
    top: 5.3px !important;
    left: 25.4px !important;
    
}

#address-error{
	padding-left:12.7px;
	padding-top:7.6px;
}

#city-error{
	padding-left:12.7px;
	padding-top:7.6px;
}
.error{
border-color: red !important;
color: red !important;}


#checkoutPage{
	margin-top: 50px !important;
}

.navbar-collapse.collapse {
    display: flex !important;
    }
.navbar-right {
    margin-left: 30px;
}
	.navbar-brand {
  display: inline-block !important;
  padding-top: 0.3125rem !important;
  padding-bottom: 0.3125rem !important;
  margin-right: 1rem !important;
  font-size: 1.25rem !important;
  line-height: inherit !important;
  white-space: nowrap !important;
}
    .nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background-color: transparent;
}

.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
     background-color: transparent; 
    border-color: #337ab7;
}

.btn-outline-secondary {
    color: #6c757d;
    background-color: transparent;
    background-image: none;
    border-color: #6c757d;
    border-radius: 5px;
}
</style>



</head>
<body>

<script type="text/javascript">
	window.onload = function() {
	  var input = document.getElementById("address").focus();
	}
</script>

<%   Utente user = (Utente)request.getSession().getAttribute("user");
		         if(user!=null){
		        	
		      %>
	<jsp:include page="HeaderUserLogged.jsp"/>
	
	<% if(cart != null) { 
 			
			   
		%>
		
	<%
							String alert = (String) request.getSession().getAttribute("alert");
							if (alert != null) {
						%>

							<div style="margin-left: auto;margin-right: auto;" class="alert alert-danger" role="alert"><%=alert%></div>

						<%
							request.getSession().removeAttribute("alert");
						%>
						<%
							}
						%>

					

						
		


<div id="usernameToSend" style="display: none;"><%=user.getUsername() %></div>
<div class="container wrapper" id = "checkoutPage">    
            <div class="row cart-body">
                <form class="form-horizontal" role="form" id="payment-form" method="POST" action="ConcludiAcquistoControl" onsubmit="return validateAddress(this)">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    
                    
                    
                    <div class="panel panel-info">
	                	<div class="panel-heading"> Modalità di spedizione</div>
	                		<div class="panel-body">
	                			<div class="container">
	                        
	                				<div class="form-group">
                                		<div class="col-md-12">
                                                  
                                    <input type="radio" name="spedizione" value="9" onclick="checkRadioButton();"> Rapida (9 € - 3 gg.)<br>
									<input type="radio" name="spedizione" value="3" checked onclick="checkRadioButton();"> Standard (3 € - 7 gg.)<br>
                                	
                                </div>
	                                	
	                            	</div>
								</div>
	                         
	                        </div>
	                    </div>
                    
                    
                    <!--REVIEW ORDER-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Review Order <div class="pull-right"><small><a class="afix-1" href="ButtonCarrelloControl">Edit Cart</a></small></div>
                        </div>
                        <div class="panel-body">
                        
                        <% List<ItemOrder> prodcart = cart.getGamesInTheCart();
		 int iva = 22;	
		  ArrayList<ItemOrder> arrayComProduct = (ArrayList<ItemOrder>) request.getSession().getAttribute("arrayComProduct");
		  int i=1;
		   for(ItemOrder beancart: prodcart) {
			   
			   Immagine image = new Immagine();
				   for(ItemOrder x: arrayComProduct){
					   if(beancart.getGioco().getCode()==x.getGioco().getCode())
						  image= x.getImage();
					      
					}
			
				   float prezzo = beancart.getGioco().getPrice()+((beancart.getGioco().getPrice()*22)/100);
		                     prezzo= prezzo * beancart.getQuantità();
		                     prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));
		                     %>
                        
                        
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img class="img-responsive" src="<%=image.getName()%>" />
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="col-xs-12"><%=beancart.getGioco().getName()%></div>
                                    <div class="col-xs-12"><small>Quantity:<span><%= beancart.getQuantità() %></span></small></div>
                                </div>
                                <div class="col-sm-3 col-xs-3 text-right">
                                    <h6><%=prezzo %> €</h6>
                                </div>
                            </div>
                            <div class="form-group"><hr /></div>
                            
                            
                  <%i++;} %>          
                            
         
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <strong>Subtotal</strong>
                                    <div class="pull-right"><span id="cartPrice"><%= cart.getTotale() %></span><span> €</span></div>
                                </div>
                                <div class="col-xs-12">
                                    <small>Shipping</small>
                                    <div class="pull-right" ><span id="shippingCost"> </span> <span>€</span></div>
                                </div>
                            </div>
                            <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <strong>Order Total</strong>
                                    <div class="pull-right"><span id="totalPrice"></span> <span> €</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-info">
	                	<div class="panel-heading"> Conferma Acquisto</div>
	                		<div class="panel-body">
	                			<div class="container">
	                        
	                				<div class="form-group">
                                		<div class="col-md-12">
                                            <button type="submit" id="confermaAcquisto" class=" btn btn-success">Conferma</button>      
                                    	
                                	
                                </div>
	                                	
	                            	</div>
								</div>
	                         
	                        </div>
	                    </div>
                    
                    <!--REVIEW ORDER END-->
                </div>
                <%}%>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                    <!--SHIPPING METHOD-->
                    <div class="panel panel-info">
                    <div class="panel-heading">Address</div>
                        <div class="panel-body">
                        
                        <div class="form-group">
                                <div class="col-md-12">
                                    <%if (user.getIndirizzoSpedizione()!=null){ %>                    
                                    <input type="checkbox" id="addressCheck" name="group1" value="currentAddress" onclick="showAddAddress()"> Usa il tuo indirizzo corrente<br>
                                	<%} %>
                                </div>
                            </div>
                            
    <script type="text/javascript">
    function showAddAddress() {
        if (document.getElementById('addressCheck').checked) {
            document.getElementById('newAddress').style.display='none';
            document.getElementById('existingAddress').style.display='block';
           	addressCorrect = true;
       	 	cityCorrect = true;
        } else {
        	document.getElementById('existingAddress').style.display='none';
        	document.getElementById('newAddress').style.display='block';
        	addressCorrect = false;
       	 	cityCorrect = false;
        }
    }
    </script>
                            
                            
                        <div id="existingAddress" style="display: none;">
                        <%if (user.getIndirizzoSpedizione()!=null){ %>                    
                        	<h4>Indirizzo: <%=user.getIndirizzoSpedizione() %></h4>
                        <%} %>
                        </div>    
                        
                        <div id="newAddress">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>Shipping Address</h4>
                                </div>
                            </div>
                            
                            <!-- <div class="form-group">
                                <div class="col-md-12"><strong>Country:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="country" value="" />
                                </div>
                            </div> -->
                            
                            <!-- <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>First Name:</strong>
                                    <input type="text" name="first_name" class="form-control" value="" />
                                </div>
                                <div class="span1"></div>
                                <div class="col-md-6 col-xs-12">
                                    <strong>Last Name:</strong>
                                    <input type="text" name="last_name" class="form-control" value="" />
                                </div>
                            </div> -->
                            
                            <div class="form-group">
                                <div class="col-md-12"><strong>Address:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="address" id="address" class="form-control" value="" required />
                                    <p id="address-error" class="error"></p>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-12"><strong>City:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="city" id="city"class="form-control" value="" required />
                                    <p id="city-error" class="error"></p>
                                </div>
                            </div>
                            
                            <!-- <div class="form-group">
                                <div class="col-md-12"><strong>State:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="state" class="form-control" value="" />
                                </div>
                            </div> -->
                            
                            <!-- <div class="form-group">
                                <div class="col-md-12"><strong>Zip / Postal Code:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="zip_code" class="form-control" value="" />
                                </div>
                            </div> -->
                            
                            <!-- <div class="form-group">
                                <div class="col-md-12"><strong>Phone Number:</strong></div>
                                <div class="col-md-12"><input type="text" name="phone_number" class="form-control" value="" /></div>
                            </div> -->
                            
                            <!-- <div class="form-group">
                                <div class="col-md-12"><strong>Email Address:</strong></div>
                                <div class="col-md-12"><input type="text" name="email_address" class="form-control" value="" /></div>
                            </div> -->
                            
                        </div>   
                            
                            
                        </div>
                    </div>
                    <!--SHIPPING METHOD END-->
                    <!--CREDIT CART PAYMENT-->
                    <div class="panel panel-info">
                        <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                        <div class="panel-body">
                        <div class="container">
                        
                        <div class="form-group" id="checkboxWrapper">
                                <div class="col-md-12">                        
                                    <input type="checkbox" id="cardCheck" name="group2" value="currentCard" onclick="showAddCard()"> Usa la tua carta salvata<br>
                                </div>
                            </div>
                        
    <div class="row">
        <!-- You can make it whatever width you want. I'm making it full width
             on <= small devices and 4/12 page width on >= medium devices -->
        <div class="col-xs-12 col-md-4">
        
        
        
        	<div id="existingCard" style="display: none;">
        		        		<h4></h4>
        	
        	</div>    
            <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box" id="newCard" >
            
           
            <script type="text/javascript">
    function showAddCard() {
        if (document.getElementById('cardCheck').checked) {
        	
            document.getElementById('newCard').style.display='none'; 
            document.getElementById('existingCard').style.display='block';
            
            var searchField = $("#usernameToSend").html();
			var xhttp = new XMLHttpRequest();
		    xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
						var result = xhttp.responseText;
						/* alert(result); */
						var r = eval('('+ result + ')');
					    if (result != "null") {
					    	document.getElementById('existingCard').innerHTML = "Numero Carta : "+r.numero;
						}
					    else{
					    	document.getElementById('checkboxWrapper').style.display='none';
					    	document.getElementById('existingCard').innerHTML = "Non hai nessuna carta, aggiungine una. ";
					    	document.getElementById('newCard').style.display='block'; 
					    }
				}
			};

			xhttp.open("POST","OttieniCartaDiCreditoControl", true);
			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
			xhttp.setRequestHeader("connection", "close");
			xhttp.send("username="+ searchField);
            
            
            
            
        } else {
        	
        	document.getElementById('existingCard').style.display='none';
        	 document.getElementById('newCard').style.display='block'; 
        	
        	
        }
    }
    </script>
    
                <div class="panel-heading display-table">
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >Payment Details</h3>
                        <div class="display-td" >                            
                            <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                        </div>
                    </div>                    
                </div>
                <div class="panel-body"  >
                    
                    
                    
                    <div >
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="cardNumber">CARD NUMBER</label>
                                    <div class="input-group">
                                        <input 
                                            type="tel"
                                            class="form-control"
                                            name="cardNumber"
                                            placeholder="Valid Card Number"
                                            autocomplete="cc-number"
                                            required autofocus 
                                        />
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                    <input 
                                        type="tel" 
                                        class="form-control" 
                                        name="cardExpiry"
                                        placeholder="MM / YY"
                                        autocomplete="cc-exp"
                                        required 
                                    />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">CV CODE</label>
                                    <input 
                                        type="tel" 
                                        class="form-control"
                                        name="cardCVC"
                                        placeholder="CVC"
                                        autocomplete="cc-csc"
                                        required
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <button class="subscribe btn btn-success btn-lg btn-block" type="button">Verifica</button>
                            </div>
                        </div>
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            <!-- CREDIT CARD FORM ENDS HERE -->
            
            
        </div>
        
    </div>
</div>
                         
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT END-->
                </div>
                
                
            </form>
            <div class="row cart-footer">
        
            </div>
    </div>
  </div>  
    <%}%>
    <jsp:include page="Footer.jsp" />
    
    <script type="text/javascript">
	var $form = $('#payment-form');
	var address = $form.find('[name=address]').val();
    var city = $form.find('[name=city]').val();
    
	checkRadioButton();
	/* $form.find('.subscribe').on('click', payWithStripe); */
	
	$form.find('.subscribe').on('click', checkCreditCard);
	
	 function checkCreditCard(e) {
	    e.preventDefault();
	
	    if (!validator.form()) {
	        return;
	    }
	
	    /* Visual feedback */
	    $form.find('.subscribe').html('Validating <i class="fa fa-spinner fa-pulse"></i>').prop('disabled', true);
		
	    
	    var expiry = $form.find('[name=cardExpiry]').val();
	    var ccNumber = $form.find('[name=cardNumber]').val().replace(/\s/g,'');
	    var cvc = $form.find('[name=cardCVC]').val();
	    var username = $("#usernameToSend").html();
	  
	    
	    var http = new XMLHttpRequest();
	    var url = 'AggiungiCartaDiCreditoControl';
	    var params = 'username='+username+'&cardNumber='+ccNumber+'&cardExpiry='+expiry+'&CVC='+cvc+'';
	    http.open('POST', url, true);

	    //Send the proper header information along with the request
	    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

	    http.onreadystatechange = function() {//Call a function when the state changes.
	        if(http.readyState == 4) {
	        	var result = http.responseText;
				var r = eval('('+ result + ')');
				 /* alert(r.risposta);  */
				if(r.risposta==="esistente"){
					$form.find('.payment-errors').text('Carta già presente');
                    $form.find('.payment-errors').closest('.row').show(); 
                    $form.find('.subscribe').html('Verifica').prop('disabled', false);
				}
				else if (r.risposta==="OK") {
					
					$form.find('.subscribe').html('Carta Aggiunta').prop('disabled', true);
					$form.find('.payment-errors').text('');
                    $form.find('.payment-errors').closest('.row').show();
				}
	            showAddCard(); 
	        }
	    }
	    http.send(params);
	 }
	 
	
	 
	/* If you're using Stripe for payments */
	function payWithStripe(e) {
	    e.preventDefault();
	    
	    /* Abort if invalid form data */
	    if (!validator.form()) {
	        return;
	    }
	
	    /* Visual feedback */
	    $form.find('.subscribe').html('Validating <i class="fa fa-spinner fa-pulse"></i>').prop('disabled', true);
	
	    var PublishableKey = 'pk_test_7NApeuepunrnVEOeq7zDGK8Y'; // Replace with your API publishable key
	    Stripe.setPublishableKey(PublishableKey);
	    
	    /* Create token */
	    var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
	    var ccData = {
	        number: $form.find('[name=cardNumber]').val().replace(/\s/g,''),
	        cvc: $form.find('[name=cardCVC]').val(),
	        exp_month: expiry.month, 
	        exp_year: expiry.year
	    };
	    
	    Stripe.card.createToken(ccData, function stripeResponseHandler(status, response) {
	        if (response.error) {
	            /* Visual feedback */
	            $form.find('.subscribe').html('Try again').prop('disabled', false);
	            /* Show Stripe errors on the form */
	            $form.find('.payment-errors').text(response.error.message);
	            $form.find('.payment-errors').closest('.row').show();
	        } else {
	            /* Visual feedback */
	            $form.find('.subscribe').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
	            /* Hide Stripe errors on the form */
	            $form.find('.payment-errors').closest('.row').hide();
	            $form.find('.payment-errors').text("");
	            // response contains id and card, which contains additional card details            
	            console.log(response.id);
	            console.log(response.card);
	            var token = response.id;
	            // AJAX - you would send 'token' to your server here.
	            $.post('/account/stripe_card_token', {
	                    token: token
	                })
	                // Assign handlers immediately after making the request,
	                .done(function(data, textStatus, jqXHR) {
	                    $form.find('.subscribe').html('Payment successful <i class="fa fa-check"></i>');
	                })
	                .fail(function(jqXHR, textStatus, errorThrown) {
	                    $form.find('.subscribe').html('There was a problem').removeClass('success').addClass('error');
	                    /* Show Stripe errors on the form */
	                    $form.find('.payment-errors').text('Try refreshing the page and trying again.');
	                    $form.find('.payment-errors').closest('.row').show();
	                });
	        }
	    });
	}
	/* Fancy restrictive input formatting via jQuery.payment library*/
	$('input[name=cardNumber]').payment('formatCardNumber');
	$('input[name=cardCVC]').payment('formatCardCVC');
	$('input[name=cardExpiry').payment('formatCardExpiry');
	
	/* Form validation using Stripe client-side validation helpers */
	jQuery.validator.addMethod("cardNumber", function(value, element) {
	    return this.optional(element) || Stripe.card.validateCardNumber(value);
	}, "Please specify a valid credit card number.");
	
	jQuery.validator.addMethod("cardExpiry", function(value, element) {    
	    /* Parsing month/year uses jQuery.payment library */
	    value = $.payment.cardExpiryVal(value);
	    return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
	}, "Invalid expiration date.");
	
	jQuery.validator.addMethod("cardCVC", function(value, element) {
	    return this.optional(element) || Stripe.card.validateCVC(value);
	}, "Invalid CVC.");
	
	validator = $form.validate({
	    rules: {
	        cardNumber: {
	            required: true,
	            cardNumber: true            
	        },
	        cardExpiry: {
	            required: true,
	            cardExpiry: true
	        },
	        cardCVC: {
	            required: true,
	            cardCVC: true
	        }
	    },
	    highlight: function(element) {
	        $(element).closest('.form-control').removeClass('success').addClass('error');
	    },
	    unhighlight: function(element) {
	        $(element).closest('.form-control').removeClass('error').addClass('success');
	    },
	    errorPlacement: function(error, element) {
	        $(element).closest('.form-group').append(error);
	    }
	});
	
	paymentFormReady = function() {
	    if ($form.find('[name=cardNumber]').hasClass("success") &&
	        $form.find('[name=cardExpiry]').hasClass("success") &&
	        $form.find('[name=cardCVC]').val().length > 1) {
	        return true;
	    } else {
	        return false;
	    }
	}
	
	$form.find('.subscribe').prop('disabled', true);
	var readyInterval = setInterval(function() {
	    if (paymentFormReady()) {
	        $form.find('.subscribe').prop('disabled', false);
	        clearInterval(readyInterval);
	    }
	}, 250);
	
	
	function checkRadioButton() {
		var radios = document.getElementsByName('spedizione');
	
		for (var i = 0, length = radios.length; i < length; i++)
		{
		 if (radios[i].checked)
		 {
		  // do whatever you want with the checked radio
		  
		 	document.getElementById('shippingCost').innerHTML = radios[i].value;	
		  	totalPrice(radios[i].value);
		  // only one radio can be logically checked, don't check the rest
		  break;
		 }
		}
	}	
	
	function totalPrice(shippingCost) {
		var price = document.getElementById('cartPrice').innerHTML;
		
		totalPriceValue = Number(shippingCost) + Number(price);
		
		document.getElementById('totalPrice').innerHTML = totalPriceValue.toFixed(2);
	
	}	
	
	
	
	 var addressCorrect = false;
	 var cityCorrect = false;
	
	    /* Funzioni di validazione campi*/	 
		 
	
			
	function addressValidator(address)
	{
		var ind= /^(([A-Z])([a-z]+)(\s?))+(\d+)$/;
		if(address.value.match(ind)) 
		{ 
			$("#address").css({"border-color":"#00fd00"});
			$("#address-error").text("");
			return true;
		}
		else
		{ 
			$("#address").css({"border-color":"red"});
			$("#address-error").text("Formato dell' indirizzo scorretto. Es: 'Via Roma 24'");
			return false;
		}
				    	
	}
			
			function cityValidator(city)
			{
				var cityReg= /^(([A-Z])([a-z]+)(\s?))+$/;
				if(city.value.match(cityReg)) 
				{ 
					$("#city").css({"border-color":"#00fd00"});
					$("#city-error").text("");
				    return true;
				}
				else
				{ 
					$("#city").css({"border-color":"red"});
				   $("#city-error").text("Formato Città errato");
					
				     return false;
				}
				    	
			}
			
		
		/* Funzione chiamata al submit */
		 function validateAddress(form){
			  

				if(!addressCorrect)
				return false;
				
				if(!cityCorrect)
			    return false;
				
				return true;
		    }
		  
		
		 $("#address").change(function(){
			 addressCorrect = addressValidator(this);
			 
		     });
		 
		 $("#city").change(function(){
			 cityCorrect = cityValidator(this);
			 
		     });
		
		 

</script>
    
    
    
    
</body>
</html>