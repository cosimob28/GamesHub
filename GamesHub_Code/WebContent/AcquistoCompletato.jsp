<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.model.GiocoModel,it.gameshub.bean.Carrello,it.gameshub.bean.Utente,it.gameshub.bean.Immagine,it.gameshub.bean.ItemOrder"%>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
   
	 <link rel="stylesheet" href="css/fontawesome-all.css" > 
	 <link href="css/site.css" rel="stylesheet" type="text/css">	
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
	<title>Acquisto Completato</title>
	
	
</head>

<body> 
	<%   Utente user = (Utente)request.getSession().getAttribute("user");
		         if(user!=null){
		        	
		      %>
	<jsp:include page="HeaderUserLogged.jsp"/>
	<%} else { %>
	<jsp:include page="Header.jsp"/>
	<%} %>
	
	
	
         
      
            <div class="jumbotron jumbotron-fluid">
           
            <div class="container">
            <h1 class="display-4">Grazie, il tuo ordine è stato completato.</h1>
            <p class="lead">Su GamesHub puoi trovare un sacco di offerte imperdibili e i giochi più recenti.</p>
            <hr class="my-4">
            <p>Continua a fare shopping e cerca il pulsante "Aggiungi al carrello".</p>
             
            <button type="button" class="btn btn-default" id="home" onclick="location.href='ButtonHomeControl';">
                             <span class="fa fa-shopping-cart"></span> Continue Shopping  </button>
            </div>
           </div>
          
    
           

	
		<jsp:include page="Footer.jsp"/>

		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	

	
	

			
</body>
</html>