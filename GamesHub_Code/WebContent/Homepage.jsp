<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.model.GiocoModel,it.gameshub.bean.Utente,it.gameshub.bean.Immagine,it.gameshub.bean.ItemOrder"%>

	<% 
		Collection<Gioco> products = (Collection<Gioco>) request.getSession().getAttribute("products");
		
		Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("ImageList");
		
		ArrayList<ItemOrder> arrayComProduct = new ArrayList<ItemOrder>();
		int iva = 0;
		if (products != null && products.size() != 0) {
			
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				
				ItemOrder prodotto = new ItemOrder();
				Gioco game = (Gioco) it.next();
				
	            prodotto.setGioco(game);
	            if(iva==0) //iva = prodotto.getGioco().getIva();
	            iva=22;
				boolean hasImage=false;
				
				if (images != null && images.size() != 0) {
					Iterator<?> iti = images.iterator();
					
					while (iti.hasNext() && hasImage==false) {
						
						Immagine image = (Immagine) iti.next();
						
						if(image.getGame() == game.getCode()) {
	    					if(image.getName().equals("img/games/"+game.getName()+"/1.jpg")){
	    						hasImage=true;
	    						
	    						 prodotto.setImage(image);
	    					break;
	    					}
	    				}	
					} 
				}
					if(!hasImage){
						Immagine image = new Immagine();
						image.setGame(game.getCode());
						image.setName("img/website/error.png");
						
						prodotto.setImage(image);
					} 
				
				arrayComProduct.add(prodotto);
			}  
		}
		request.getSession().setAttribute("arrayComProduct",arrayComProduct); 
		
		
		%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Homepage</title>
	
	
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">		
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">


	<style>
	
	a:not([href]):not([tabindex]):hover{
		color:inherit;
		cursor:default;
	}
	a:not([href]):not([tabindex]){
		color:white;
		
	}
	
			.autocomplete {
		  /*the container must be positioned relative:*/
		  position: relative;
		  display: inline-block;
		}
		input {
		  border: 1px solid transparent;
		  background-color: #f1f1f1;
		  padding: 10px;
		  font-size: 16px;
		}
		input[type=text] {
		  background-color: #f1f1f1;
		  width: 100%;
		}
		input[type=submit] {
		  background-color: DodgerBlue;
		  color: #fff;
		  cursor: pointer;
		}
		.autocomplete-items {
		  position: absolute;
		  border: 1px solid #d4d4d4;
		  border-bottom: none;
		  border-top: none;
		  z-index: 99;
		  border-color: transparent;
		  border-radius:4px;
		  /*position the autocomplete items to be the same width as the container:*/
		  top: 100%;
		  left: 0;
		  right: 0;
		}
		.autocomplete-items div {
		  padding: 10px;
		  cursor: pointer;
		  background-color: rgba(255, 255, 255, 0.90);
		  border-radius:4px;
		  border-bottom: 1px solid #d4d4d4; 
		}
		.autocomplete-items div > a{
			color: #000000;
    		font-weight: 500;
		}
		.autocomplete-items div > a:hover{
			    color: #000000ab;
    			text-decoration: none;
    			cursor: pointer;
		}
		.autocomplete-items div:hover {
		  /*when hovering an item:*/
		  background-color: #e9e9e9; 
		}
		.autocomplete-active {
		  /*when navigating through the items using the arrow keys:*/
		  background-color: DodgerBlue !important; 
		  color: #ffffff; 
		}
	
	/*css per il bottone top*/
	#myBtn {
  	background-color: rgba(52, 58, 64, 0.54);
    color: white;
    display: none;
    z-index: 999;
    position: fixed;
    right: 20px;
    bottom: 20px;
    width: 50px;
    height: 50px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
	a#myBtn {
	    font-weight: 600;
	    letter-spacing: 2px;
	    font-size: 12px;
	    text-transform: uppercase;
	    text-align: center;
	    line-height: 1.6;
	    padding-left: 2px;
	    padding-top: 4px;
	}	

	a#myBtn:hover{
		text-decoration: none;
	}	
		
	#myBtn:hover {
  		background-color: #343a40;
	}
	
	a#myBtn .arrow:before {
	    font-style: normal;
	    font-family: Font Awesome\ 5 Free;
	    font-weight: 600;
	    font-size: 18px;
	    line-height: 1;
	    speak: none;
	    -webkit-font-smoothing: antialiased;
	    content: "\f062";
	    display: block;
	    vertical-align: middle;
	    cursor: pointer;
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
	 
	
	
	<a href="#" id="myBtn" style="display: none;"><span class="arrow"></span>Top</a>
	<div id="carouselContainer">
	<!-- Carousel dei giochi più nuovi -->
	<div id="newestGame" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
		    <li data-target="#newestGame" data-slide-to="0" class="active"></li>
		    <li data-target="#newestGame" data-slide-to="1"></li>
		    <li data-target="#newestGame" data-slide-to="2"></li>
  		</ul>
  		<div class="title-container" id="newestGameContainer"><h1 class="carousel-title">NUOVI ARRIVI</h1></div>
  		<div class="carousel-inner">
  		
  	<%
  		Collections.sort(arrayComProduct, ItemOrder.YearComparator); //Ordina i giochi da quello più recente a quello meno recente
  		
  		for(int i=0;i<3;i++){
  			
  			ItemOrder x = arrayComProduct.get(i);
  			
  			
  			Gioco pr = x.getGioco();
  			
  			Immagine im = new Immagine("img/games/"+pr.getName()+"/slider.jpg",pr.getCode());
  			
  			 if(!images.contains(im))
  				im.setName("img/website/noImage.png"); 
  			
  			%>
  			
  			<div class="carousel-item <%if (i==0){ %>active<%}%>">
	  			<a href="ProductPage.jsp?id=<%=pr.getCode()%>"><img src='<%=im.getName()%>'></a>
	  			<div class="carousel-caption">
	        				
	        				<%float prezzo = pr.getPrice()+((pr.getPrice()*iva)/100);
		                    prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));%>
	        				<p class="sliderPrice"><%=prezzo%>€</p>
	      		</div>
	      	</div>	
  	<%	} %>	    			
  		</div>
  		<a class="carousel-control-prev" href="#newestGame" data-slide="prev">
    		<span class="carousel-control-prev-icon"></span>
  		</a>
  		<a class="carousel-control-next" href="#newestGame" data-slide="next">
    		<span class="carousel-control-next-icon"></span>
  		</a>
	</div>

<!-- Carousel giochi con prezzo più basso -->
	<div id="lowestPrice" class="carousel slide" data-ride="carousel">
  		<ul class="carousel-indicators">
		    <li data-target="#lowestPrice" data-slide-to="0" class="active"></li>
		    <li data-target="#lowestPrice" data-slide-to="1"></li>
		    <li data-target="#lowestPrice" data-slide-to="2"></li>
  		</ul>
  		<div class="title-container" id="lowestPriceContainer"><h1 class="carousel-title">I PREZZI PIU' BASSI</h1></div>
  		<div class="carousel-inner">
  	<%
  		Collections.sort(arrayComProduct, ItemOrder.PriceComparator);
  		for(int i=0;i<3;i++){
  			
  			ItemOrder x = arrayComProduct.get(i);
  		
  			Gioco pr = x.getGioco();
  		
  			Immagine im = new Immagine("img/games/"+pr.getName()+"/slider.jpg",pr.getCode());
  			if(!images.contains(im))
  				im=new Immagine("img/website/noImage.png",pr.getCode());
  			%>
  			
  			<div class="carousel-item <%if (i==0){ %>active<%}%>">
  			<a href="ProductPage.jsp?id=<%=pr.getCode()%>"><img src='<%=im.getName()%>'></a>
	  			
	  			
	  			<div class="carousel-caption">
	        				
	        				<%float prezzo = pr.getPrice()+((pr.getPrice()*iva)/100);
		                     prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));%>
	        				<p class="sliderPrice"><%=prezzo%>€</p>
	      		</div>
	      	</div>	
  	<%	} %>	    			
  		</div>
  		<a class="carousel-control-prev" href="#lowestPrice" data-slide="prev">
    		<span class="carousel-control-prev-icon"></span>
  		</a>
  		<a class="carousel-control-next" href="#lowestPrice" data-slide="next">
    		<span class="carousel-control-next-icon"></span>
  		</a>
	</div>
</div>






<!-- Barra di ricerca per i giochi -->
<div class="header" id="gameSearchBarContainer">
	<nav class="navbar navbar-expand-lg navbar-expand-sm navbar-expand-md  navbar-dark bg-dark" name="barraNavigazione" id="barraNavigazione">

		
			<div class="navbar-nav mr-auto col-lg-4 col-md-4 col-sm-6">
				<p class="nav-item" style="vertical-align: middle;margin: auto;color: #ced4da;">
				CATALOGO PRODOTTI
				</p>
						
			</div>
			
				<div class="input-group col-lg-3 col-md-4 col-sm-6">
				<div class="autocomplete">
					<input type="text" class="form-control" placeholder="Search" id="cercaGioco" >
				</div>
					
				</div>
		
				
			
	</nav>
</div>

<!-- Risultati ricerca immagini -->
<div class="container main-section" id="productContainer"> 
	<div class="row">
		<%
		Collections.sort(arrayComProduct, ItemOrder.NameComparator); //Ordina i prodotti per nome
		
			for(ItemOrder x: arrayComProduct){ 
			
			Gioco game = x.getGioco();
			Immagine image = x.getImage();%>
			<div class="col xl-auto col-lg-auto col-md-auto col-sm-auto col-xs-auto">
	      		<div class="product-card">	
		      		<div class=" product-front">	
						<div class="shadow"></div>
						<img src="<%=image.getName() %>" alt=""	width="335px" height="200px"/>
						<div class="image_overlay"></div>
						
						<%if(game.getQuantity()>0) {%>
			 			<div><a href="product?action=carrello" class="addToCart addCart" id="<%=game.getCode()%>">Add to Cart</a></div>
						<%}else{ %>
						<div><a  class="addToCart disabled">NON DISPONIBILE</a></div>
						<%} %>
						<div class="stats">        	
							<div class="stats-container">
							<%float prezzo = game.getPrice()+((game.getPrice()*iva)/100);
		                     prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));%>
								<span class="product_price"><%=prezzo%>€</span>
					    		<span class="product_name"><a class="productLink" href="ProductPage.jsp?id=<%=game.getCode()%>"><%=game.getName() %></a></span>
					    		<%String s=game.getDescription();%>    
					    		
					 			<div class="product-options">
								    <div class="row">
								        <div class="col">
								            <strong>GENERE</strong>
								            <span><%=game.getGenere() %></span>
								            <strong>PIATTAFORMA</strong>
								            <div class="piattaforma">
								                <div><span><img src="img/website/platform/<%=game.getPiattaforma()%>.png" width="50px" height="50px" ></span></div>
								                </div>
								            </div>
								        <div class="col">
								        	<strong>ANNO</strong>
								    		<span><%=game.getAnno()%></span>
								            <strong>PEGI</strong>
								            <div><span><img src="img/website/PEGI/<%=game.getPegi()%>.png" width="50px" height="50px" onerror="this.style.display='img/website/error.png'"/></span></div>
								        </div>    
								    </div>
								</div>
							</div>
			    		</div>
		    		</div>
	    		</div>
    		</div>
		<% 
		}%>	
	</div>
	</div>	
<!-- Footer -->	
		
		<jsp:include page="Footer.jsp"/>
		
<!-- Script -->	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script> 
	
	
	<script>
	$(document).ready(function(){
		
		$("#cercaGioco").keyup(function(e){
			var searchField = $("#cercaGioco").val();
			var xhttp = new XMLHttpRequest();
  			xhttp.onreadystatechange = function() {
   			if (xhttp.readyState == 4) {
      			var result = xhttp.responseText;
      			var r = eval('('+result+')');
      			$("#cercaGioco").next().remove();
      			if(r!="null"){
      				$("#cercaGioco").parent().append('<div id="cercaGiocoautocomplete-list" class="autocomplete-items"></div>');
      				
	      			for(var i=0;i<r.length;i++){
	      				$("#cercaGiocoautocomplete-list").append('<div><a href="ProductPage.jsp?id='+r[i].id+'">'+r[i].name+'</a></div>');
	      			}
      			}
    		}
  		};
  		
  			xhttp.open("POST", "googleSearch", true);
  			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
  			xhttp.setRequestHeader("connection","close");  
  			xhttp.send("action=matchProduct&searchField="+searchField);
			
		});
		
		
		$(".addCart").click(function(e){
			var id= $(this).attr('id');
			var xhttp = new XMLHttpRequest();
			$.get("update?action=addC&id="+id, function() {
				});
			
  			
		});
	
	});
	
	</script>
	
	
	<script>

	/*script per il botton top*/
// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	        document.getElementById("myBtn").style.display = "block";
	    } else {
	        document.getElementById("myBtn").style.display = "none";
	    }
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	    document.body.scrollTop = 0;
	    document.documentElement.scrollTop = 0;
	}

	</script>
</body>
</html>