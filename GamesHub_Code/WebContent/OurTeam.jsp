<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.gameshub.model.*, it.gameshub.bean.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Chi Siamo</title>
	
	
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">		
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
	
	<style type="text/css">

	@import url('css/fontawesome-all.css');
	#team {
	    background: #eee !important;
	}
	
	.btn-primary:hover,
	.btn-primary:focus {
	    background-color: #108d6f;
	    border-color: #108d6f;
	    box-shadow: none;
	    outline: none;
	}
	
	.btn-primary {
	    color: #fff;
	    background-color: #007b5e;
	    border-color: #007b5e;
	}
	
	section {
	    padding: 60px 0;
	}
	
	section .section-title {
	    text-align: center;
	    color: #007b5e;
	    margin-bottom: 50px;
	    text-transform: uppercase;
	}
	
	#team .card {
	    border: none;
	    background: #ffffff;
	}
	
	.image-flip:hover .backside,
	.image-flip.hover .backside {
	    -webkit-transform: rotateY(0deg);
	    -moz-transform: rotateY(0deg);
	    -o-transform: rotateY(0deg);
	    -ms-transform: rotateY(0deg);
	    transform: rotateY(0deg);
	    border-radius: .25rem;
	}
	
	.image-flip:hover .frontside,
	.image-flip.hover .frontside {
	    -webkit-transform: rotateY(180deg);
	    -moz-transform: rotateY(180deg);
	    -o-transform: rotateY(180deg);
	    transform: rotateY(180deg);
	}
	
	.mainflip {
	    -webkit-transition: 1s;
	    -webkit-transform-style: preserve-3d;
	    -ms-transition: 1s;
	    -moz-transition: 1s;
	    -moz-transform: perspective(1000px);
	    -moz-transform-style: preserve-3d;
	    -ms-transform-style: preserve-3d;
	    transition: 1s;
	    transform-style: preserve-3d;
	    position: relative;
	}
	
	.frontside {
	    position: relative;
	    -webkit-transform: rotateY(0deg);
	    -ms-transform: rotateY(0deg);
	    z-index: 2;
	    margin-bottom: 30px;
	}
	
	.backside {
	    position: absolute;
	    top: 0;
	    left: 0;
	    background: white;
	    -webkit-transform: rotateY(-180deg);
	    -moz-transform: rotateY(-180deg);
	    -o-transform: rotateY(-180deg);
	    -ms-transform: rotateY(-180deg);
	    transform: rotateY(-180deg);
	    -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	    -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	    box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	}
	
	.frontside,
	.backside {
	    -webkit-backface-visibility: hidden;
	    -moz-backface-visibility: hidden;
	    -ms-backface-visibility: hidden;
	    backface-visibility: hidden;
	    -webkit-transition: 1s;
	    -webkit-transform-style: preserve-3d;
	    -moz-transition: 1s;
	    -moz-transform-style: preserve-3d;
	    -o-transition: 1s;
	    -o-transform-style: preserve-3d;
	    -ms-transition: 1s;
	    -ms-transform-style: preserve-3d;
	    transition: 1s;
	    transform-style: preserve-3d;
	}
	
	.frontside .card,
	.backside .card {
	    min-height: 312px;
	}
	
	.backside .card a {
	    font-size: 18px;
	    color: #007b5e !important;
	}
	
	.frontside .card .card-title,
	.backside .card .card-title {
	    color: #007b5e !important;
	}
	
	.frontside .card .card-body img {
	    width: 120px;
	    height: 120px;
	    border-radius: 50%;
	}
	
	
	</style>
	
	
</head>
<body>
	<%   Utente user = (Utente) request.getSession().getAttribute("user");
		         if(user!=null){
		      %>
	<jsp:include page="HeaderUserLogged.jsp"/>
	<%} else { %>
	<jsp:include page="Header.jsp"/>
	<%} %>

<!-- Team -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">IL NOSTRO TEAM</h5>
        <div class="row">
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="img/website/Michele.png" alt="card image"></p>
                                    <h4 class="card-title">Michele Castellaneta</h4>
                                    <p class="card-text">Founder & Developer of GAMESHUB</p>
                                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Michele Castellaneta</h4>
                                    <p class="card-text">Nato sotto il segno dello Scorpione nel 1997.<br>Uno dei Fondatori e Sviluppatori di GamesHub.<br>Skills: JAVA,HTML,CSS,C,SQL</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.facebook.com/whyareyouwatchingme">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://twitter.com/avaibleuser">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.instagram.com/michelecastellaneta_">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://plus.google.com/u/0/105502625060227477428">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="img/website/Domenico.png" alt="card image"></p>
                                    <h4 class="card-title">Domenico Trotta</h4>
                                    <p class="card-text">Founder & Developer of GAMESHUB</p>
                                    <a href="" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Domenico Trotta</h4>
                                    <p class="card-text">E'nato il 17/07/1997 a Polla in provincia di Salerno. Ha partecipato allo sviluppo di questo sito e si occupa della sua gestione come amministratore.</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.facebook.com/domenico.trotta.9">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" >
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" >
                                                <i class="fab fa-skype"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://www.instagram.com/_domenicotrotta_/">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="img/website/Cosimo.png" alt="card image"></p>
                                    <h4 class="card-title">Cosimo Bacco</h4>
                                    <p class="card-text">Founder & Developer of GAMESHUB</p>
                                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">Cosimo Bacco</h4>
                                    <p class="card-text">Nato a Battipaglia. Ha partecipato allo sviluppo di questo sito e si occupa della sua gestione come amministratore.</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-skype"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fab fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ./Team member -->
        

        </div>
    </div>
</section>
<jsp:include page="Footer.jsp"/>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/custom.js"></script> 
<!-- Team -->
</body>
</html>