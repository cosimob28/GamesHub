<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Utente"%>
<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Contattaci</title>
	
	
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">		
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">




	<style>
		/*Font-awesome integration*/
	@import url("css/fontawesome-all.css");
	/*Google font integration*/
	@import url('https://fonts.googleapis.com/css?family=Roboto');
	
	#contact{
	    background-color:#f1f1f1;
	    font-family: 'Roboto', sans-serif;
	}
	
	#contact .well{
	    margin-top:30px;
	    border-radius:0;
	}
	
	#contact .form-control{
	    border-radius: 0;
	    border:2px solid #1e1e1e;
	}
	
	#contact button{
	    border-radius:0;
	    border:2px solid #1e1e1e;
	}
	
	#contact .row{
	    margin-bottom:30px;
	}
	
	@media (max-width: 768px) { 
	    #contact iframe {
	        margin-bottom: 15px;
	    }
	    
	}
	
	#map {
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
	<section id="contact">
  <div class="container">
    <div class="well well-sm">
      <h3><strong>Dove Siamo</strong></h3>
    </div>
	
	<div class="row">
	  <div class="col-md-7" id="map">
        
      	<iframe width="500" height="400" frameborder="0" src="https://www.bing.com/maps/embed?h=400&w=500&cp=40.77462833968869~14.787971132264275&lvl=16&typ=d&sty=h&src=SHELL&FORM=MBEDV8" scrolling="no"></iframe>
     	
      </div>

      <div class="col-md-5">
          <h4><strong>Contattaci</strong></h4>
        <form action="mailto:GamesHub@gmail.com?Subject=Hello">
          <div class="form-group">
            <input type="text" class="form-control" name="" value="" placeholder="Nome">
          </div>
          <div class="form-group">
            <input type="email" class="form-control" name="" value="" placeholder="E-mail">
          </div>
          <div class="form-group">
            <input type="tel" class="form-control" name="" value="" placeholder="Telefono">
          </div>
          <div class="form-group">
            <textarea class="form-control" name="" rows="3" placeholder="Messaggio"></textarea>
          </div>
          <button class="btn btn-default" type="submit" name="button">
              <i class="fa fa-paper-plane-o" aria-hidden="true"></i> Invia
          </button>
        </form>
      </div>
    </div>
  </div>
</section>
<jsp:include page="Footer.jsp"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script> 
</body>
</html>