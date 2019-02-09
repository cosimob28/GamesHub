<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, it.gameshub.model.*, it.gameshub.bean.*"%>
   
    <% 
    	String myString = (String) request.getParameter("id");
    	Integer idProd = Integer.parseInt(myString);
    
    
		Collection<Gioco> products = (Collection<Gioco>) request.getSession().getAttribute("products");
		Collection<Immagine> reqImages = (Collection<Immagine>) request.getSession().getAttribute("ImageList");
		
		Gioco game = null;
		
		for(Gioco x : products){
			if(x.getCode()==idProd){
				game = x;
			}
		}
		System.out.println(game.getDescription());
		
		ArrayList<Immagine> images = new ArrayList<Immagine>();
		int iva=22;
		if(game != null){
			
			boolean hasImage=false;
			if (reqImages != null && reqImages.size() != 0) {
				Iterator<?> iti = reqImages.iterator();
				
				while (iti.hasNext()) {
					
					Immagine image = (Immagine) iti.next();
					
					if(image.getGame() == game.getCode()) {
    					if(image.getName().equals("img/games/"+game.getName()+"/slider.jpg")){
    							continue;
    							}
    					else{
    						hasImage=true;
    						
    						 images.add(image);
    					}
    				}	
				} 
			} 
			if(!hasImage){
				Immagine image = new Immagine();
				image.setGame(game.getCode());
				image.setName("img/website/error.png");
				
				images.add(image);
			}
		}
		
		
		
		%> 
    
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
	<link href="css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">		
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
	
	<title><%=game.getName() %></title>
	<style>
		  .preview-thumbnail > li,  .menu-items > li{margin-right:25px;font-weight:lighter;cursor:pointer}
		 li.active{border-bottom:3px solid silver;} 
		
		.item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
		.menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0;margin-top:20px}
		.btn-success{width:100%;border-radius:0;}
		.section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;background:#f8f9f9}
		.title-price{margin-top:30px;margin-bottom:0;color:black}
		.title-attr{margin-top:0;margin-bottom:0;color:black;}
		.btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
		.btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}
		div.section > div {width:100%;display:inline-flex;}
		div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
		.attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
		 .attr.active,.attr2.active{ border:1px solid orange;} 
		.divs{display:none;}
		#details{display:block;}
		.links{}
		@media (max-width: 426px) {
		    .container {/* margin-top:0px !important; */}
		    .container > .row{padding:0 !important;}
		    .container > .row > .col-xs-12.col-sm-5{
		        padding-right:0 ;    
		    }
		    .container > .row > .col-xs-12.col-sm-9 > div > p{
		        padding-left:0 !important;
		        padding-right:0 !important;
		    }
		    .container > .row > .col-xs-12.col-sm-9 > div > ul{
		        padding-left:10px !important;
		        
		    }            
		    .section{width:184%;}
		    .menu-items{padding-left:0;}
		}
	
	

	
	
	
		
/*****************globals*************/
body {
  /* font-family: 'open sans'; */
  overflow-x: hidden; }

img {
  /* max-width: 100%; 
  max-width: 540px;
    max-height: 420px; */ 
  }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
  -ms-flex-positive: 1;
  flex-grow: 1; 
  max-height:fit-content;
  }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }
	
	
	
	
	
	#productPage{
		margin-top: 20px;
	    margin-bottom: 20px;
	    margin-left: auto;
	    margin-right: auto;
	}
	
	
	
	#video {
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
}
	iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
	
	@media screen and (max-width: 1024px) {
		#display{
			display: none;
		}
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
	
        <div class="container" id="productPage">
        	<div class="row">
              
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
					
						  <%
						  	for(int i=1;i<=images.size();i++){ %>
						  		<div class="tab-pane<%if(i==1){%> active <%} %>" id="pic-<%=i%>"><img src="<%=images.get(i-1).getName() %>" class="magnify" /></div>

						  <% } %>
						  <%String video = game.getVideo(); 
						  String youtubeID ="";
						  	if(video.length()-11>=0){
						  	 youtubeID = video.substring(video.length() - 11);
						 
						  }%>
						  <div class="tab-pane" id="video"><iframe width="560" height="315" src="//www.youtube.com/embed/<%=youtubeID %>?showinfo=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>
						</div>
						
						
							
						<ul class="preview-thumbnail nav nav-tabs">
						
						<%
						  	for(int i=1;i<=images.size();i++){ %>
						  		<li><a href="#pic-<%=i%>" data-toggle="tab"><img src="<%=images.get(i-1).getName() %>" /></a></li>
						  		
						  <% } %>
							<li><a href="#video" data-toggle="tab"><img src="https://img.youtube.com/vi/<%=youtubeID%>/hqdefault.jpg"/></a></li>
						</ul>
						
					</div>
					
                <div class="col-6" style="border:0px solid gray">
                
                	<!-- div per la visualizzazione dello zoom -->
                	<div id="display" ></div>
                
                
                
                    <!-- Nome del prodotto -->
                    <h3><%=game.getName() %></h3>    
        
                    <!-- Prezzo -->
                    <h6 class="title-price"><small>PREZZO</small></h6>
                    <%float prezzo = game.getPrice()+((game.getPrice()*iva)/100);
		                     prezzo = (float) (Math.ceil(prezzo*Math.pow(10,2))/Math.pow(10,2));%>
                    <h3 style="margin-top:0px;">€ <%=prezzo %></h3>
        
                    <!-- Dettagli specifici del prodotto -->
                    <div class="section">
                        <h6 class="title-attr" style="margin-top:15px;" ><small>PIATTAFORMA</small></h6>                    
                        <div>
                            
                            <img src="img/website/platform/<%=game.getPiattaforma()%>.png" width="60px" height="50px"/>
                        </div>
                    </div>
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>GENERE</small></h6>                    
                        <div>
                            
                             <%=game.getGenere() %>
                        </div>
                    </div>   
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr " ><small>PEGI</small></h6>                    
                        <div>

                             <img src="img/website/PEGI/<%=game.getPegi()%>.png" width="50px" height="50px" id="pegiHover"/>
                        </div>
                    </div>
                    <div class="section" style="padding-bottom:5px;">
                        <h6 class="title-attr"><small>ANNO</small></h6>                    
                        <div>
                            
                             <%=game.getAnno() %>
                        </div>
                    </div>
                    <div class="section" style="padding-bottom:20px;">
                        
                        
                        <h6 class="title-attr"><small>CODICE</small></h6>                    
                        <div>
                            <%=game.getCode() %>
                        </div>
                        
                    </div>                
        
                    <!-- Bottone Compra -->
                    <div class="section" style="padding-bottom:20px;">
                    <%if(game.getQuantity()==0){ %>
                       	<button class="btn btn-danger disabled"><span style="margin-right:20px" class="fas fa-shopping-cart" aria-hidden="true"></span> Non disponibile</button>
                    <%}else{ %>	
                    	<a class="btn btn-success addCart" href="ButtonAggiungiAlCarrelloControl?id=<%=game.getCode()%>"><span style="margin-right:20px" class="fas fa-shopping-cart" aria-hidden="true" ></span> Add To Cart</a>
                    <%} %>
                    </div>                                        
                </div>                              
        
                <div class="col-xs-9">
                    <ul class="menu-items">
                        <li class="active" ><a href="#details" class="links" id="link1">Dettagli del Prodotto</a></li>
                        <li><a href="#warranty" class="links" id="link2">Garanzia</a></li>
                        <li><a href="#vendor" class="links" id="link3">Venditore</a></li>
                        <li><a href="#shipping" class="links" id="link4">Dati di Spedizione</a></li>
                    </ul>
                    <div id="details" class="divs" style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <medium>
                         		<%=game.getDescription() %>
                        	</medium>
                        </p>   
                    </div>
                    
                    <div id="warranty" class="divs" style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            <p>Tutti i Prodotti acquistati tramite il sito www.GamesHub.it godono della garanzia legale di conformità ai sensi del Codice del Consumo e del Codice Civile, come applicabili.
                            Per ciascun Prodotto acquistato da un Cliente Consumatore, quest'ultimo beneficerà gratuitamente della garanzia legale di conformità (“Garanzia Legale”) prevista dagli articoli 128 e ss. del Codice del Consumo.La Garanzia Legale a carico del venditore si applica per i difetti di conformità che si manifestino entro 24 mesi dalla data di consegna del Prodotto e che siano denunciati dal consumatore entro i 2 mesi successivi dalla data della scoperta dei difetti stessi, in conformità all'art. 132 del Codice del Consumo.</p>
                            </small>
                        </p>
                    </div>
                    
                    <div id="vendor" class="divs" style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            <p>Prodotto venduto da GamesHub®<p>
                            </small>
                        </p>
                    </div>
                    
                    <div id="shipping" class="divs" style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            <p>
                            <%if (user!=null){ %>
                            	<%=user.getIndirizzoSpedizione()%>
                            <%} else {%>
							Non hai effettuato il login. Accedi per visualizzare questa informazione.	
							<%} %>                            
                            </p>	
                            </small>
                        </p>
                    </div>
                    
                </div>		
            </div>
        </div>        
	
	<jsp:include page="Footer.jsp"/>
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="js/jquery.magnifier.min.js"></script>
	<script type="text/javascript" src="js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script> 
    <script>
    $(document).ready(function(){
	        
	
	        $('ul.menu-items > li > a').click(function (e){
			   e.preventDefault();
			   var div_id = $('a.links').index($(this));
			   $("ul.menu-items > li").removeClass("active");
	           $(this).parent().addClass("active");
			   $('.divs').hide().eq(div_id).show();
			});
	        
	        $(".attr,.attr2").on("click",function(){
	            var clase = $(this).attr("class");
	
	            $("." + clase).removeClass("active");
	            $(this).addClass("active");
	        })
	
	        
	        
	        $('.magnify').magnifier({
	        	magnify:3, 
	        	region:{h:50, w:50}, 
	        	display:$('#display')
	        	});
	        
	        $("#pegiHover").hover(function (){
	        	    $(this).css("cursor", "context-menu");
	        	    $(this).animate({
	        	        width: "100px",
	        	        height: "100px"
	        	    }, 'slow');

	        	}, function() {
	        	    $(this).animate({
	        	        width: "50px",
	        	        height: "50px"
	        	    }, 'slow');

	        	});
	        	
	        	
	        
	        $(".addCart").click(function(e){
				var id= $(this).attr('id');
				var xhttp = new XMLHttpRequest();

				$.get("ButtonAggiungiAlCarrelloControl?id="+id, function() {
					});
				
	  			
			});
	        
	        
	        
	        
	    }) 
    </script>    
</body>
</html>
