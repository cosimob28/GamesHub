<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.model.GiocoModel,it.gameshub.bean.Carrello,it.gameshub.bean.Utente,it.gameshub.bean.Immagine,it.gameshub.bean.ItemOrder"%>

<% 
	Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
	Gioco product = (Gioco) request.getAttribute("product");
	
	Carrello cart = (Carrello) request.getSession().getAttribute("cart");
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/stile.css" >
	 <link rel="stylesheet" href="css/fontawesome-all.css" > 
	 <link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">		
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
	<title>Carrello</title>
	
	<style>
	.nav-item {
     padding-left: 0; 
    }
    .container{
    	margin-top:0;
    }
	</style>
	
</head>

<body> 
	<%   Utente user = (Utente)request.getSession().getAttribute("user");
		         if(user!=null){
		        	
		      %>
	<jsp:include page="HeaderUserLogged.jsp"/>
	<%} else { %>
	<jsp:include page="Header.jsp"/>
	<%} %>
	
	
	
		<% if(cart != null) { %>
		<!--  ogni riga del carrello contiene un prodotto, iteriamo l'array per scorrere 
		i vari prodotti del carrello e inserirli nella tabella -->
		
		
		<% if(!cart.isEmpty()) {%>
		
			<div class="container" style="margin-top:10px;margin-bottom:10px;text-align: -webkit-center">
            	<h1 class="display-4">Il tuo carrello di GamesHub</h1>
            </div>
            
			<div class="container mb-4">
        <div class="row">
        <div class="col-12">
		
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Prodotto</th>
                            <th scope="col" class="text-center">Quantità</th>
                            <th scope="col" class="text-right">Prezzo</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    
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
			   
		%>
		
		<tr> 
		<!-- tr per ogni riga -->
		<!-- td colonna -->
		
		<!-- Ogni volta che si preme update order per un prodotto si aggiorna la quantità ordinata -->
		 <% String x = request.getParameter("num");
		 if(x!=null){
		      int num = Integer.parseInt(x);
		 
		      String id = request.getParameter("itemID");
		      if(id!=null){
		           int iD = Integer.parseInt(id);
		           ItemOrder order = cart.searchItemOrder(id);//Cerca l'itemOrder al quale andrà aggiornata la quantità tra gli ordini del carrello
		           order.setQuantità(num);
		      }
		 }  
		  %>
		                 <tr>
		                <!-- Calcolare iva e aggiungerla al prezzo -->
		                     <%float prezzo = beancart.getGioco().getPrice()+((beancart.getGioco().getPrice()*22)/100);
		                     prezzo= prezzo * beancart.getQuantità();
		                     prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));
		                     %>
                            <td><img src="<%=image.getName()%>" width="110" height="90" class="rounded border border-dark"> </td>
        
                            <td><%=beancart.getGioco().getName()%></td>
          
                            <td><input class="form-control qty" type="number" value=<%= beancart.getQuantità() %> min="1" max="<%=beancart.getGioco().getQuantity()%>" id="<%=beancart.getGioco().getCode()%>"/><p id ="demo"></p></td>
                            <td class="text-right" id="prezzo<%=beancart.getGioco().getCode() %>"><%=prezzo %> €</td>
                         
                            <td class="text-right"><button type="button" class="btn btn-danger" onclick="location.href='product?action=deleteC&id=<%=beancart.getGioco().getCode()%>';" >Rimuovi  <span class="fa fa-trash-alt"></span></button> </td>
                            
                        </tr>
		
		<%i++;} %> 
		                 <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Totale</td>
                            <td class="text-right" id="totale"><%=cart.getTotale() %> €</td>
                        </tr>
                  
                       <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="text-right">Iva inclusa </td>
                        
	   </tbody>
         </table><br>
                   </div>
        </div>
      
        <div class="col mb-2">
            <%
             if(user!=null){ %> <!-- Se l'utente ha effettuato il login il tasto acquista è disponibile  -->
               
                <button type="button" class="btn btn-success" id="acq">
                            Checkout  <span class="fa fa-caret-right"></span>
                        </button>
                        
                        <%} else{%><!-- Altrimenti non si visualizza acquista ma 'procedi con l'acquisto' che rimanda l'utente al login/registrazione -->
		  <button type="button" class="btn btn-success" id="ProAcq" onclick="location.href='ButtonLoginControl';">Procedi con l'acquisto <span class="fa fa-sign-in-alt"></span></button>
	<%} %>
	 <button type="button" class="btn btn-default" id="home" onclick="location.href='ButtonHomeControl';">
                             <span class="fa fa-shopping-cart"></span> Continue Shopping  </button>
            <% }%>
            
            
            
              <!-- Caso in cui il carrello è vuoto -->
            <% if(cart.isEmpty()) {%>
          
            <div class="jumbotron jumbotron-fluid">
             <div class="cart-image-container">
            <img alt="Empty cart image" src="img/website/empty-cart.png" title="Empty cart image">
              </div>
            <div class="container">
            <h1 class="display-4">Il tuo carrello di GamesHub</h1>
            <p class="lead">Su GamesHub puoi trovare un sacco di offerte imperdibili e i giochi più recenti.</p>
            <hr class="my-4">
            <p>Inizia a fare shopping e cerca il pulsante "Aggiungi al carrello".</p>
             
            <button type="button" class="btn btn-default" id="home" onclick="location.href='ButtonHomeControl';">
                             <span class="fa fa-shopping-cart"></span> Continue Shopping  </button>
            </div>
           </div>
          
          <%} }%>
           
        </div>
                            
    </div>
</div>	
	
		<jsp:include page="Footer.jsp"/>

		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
	<script src ="UpdateCart.js" ></script> 
	<script type="text/javascript" src="js/jquery.min.js"></script>
	
	<!-- Script utilizzato per ritornare alla home e aprire una nuova finestra con la fattura quando si acquista -->
	<script>
	$(document).ready(function(){
	    $("#acq").click(function(event){
	    	event.preventDefault(); // evita che venga aperto il link dell'href
	    	window.open('product?action=acquista','_blank','height=window.height() width=window.width()');
	    	setTimeout(function(){
	    		$('#home')[0].click();
	    									
	    	},1000);
	    		 
	    	
	    });
	    
	    $(".qty").on("keyup click change mousemove",function (e){
	    	var codice= $(this).attr('id');
	    	var qty = $(this).val();
	    	var prezzo = ($("#prezzo" + codice).text());
	    	var action="updateQty";
	    	var xhttp = new XMLHttpRequest();
  			xhttp.onreadystatechange = function() {
   			if (xhttp.readyState == 4) {
      			var result = xhttp.responseText;
      			var r = eval('('+result+')');
      			$("#totale").text(r.totale+" €");
      			$("#"+r.idPrezzo).text(r.price+" €");
      			if(r.avviso!="false"){
      				$("#"+r.code).css({"border-color":"red"});
      				$("#"+r.code).val(r.quantity);		
      			}
      			else{
      				$("#"+r.code).css({"border-color":"#e6e6e6 "});
      			}				
    		}
  		};
  			xhttp.open("POST", "update", true);
  			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
  			xhttp.setRequestHeader("connection","close");
  			xhttp.send("code="+codice+"&quantita="+qty+"&price="+prezzo+"&action="+action);	
	    		
	    	});
	    	
	    });
	</script>
	
	
	

			
</body>
</html>