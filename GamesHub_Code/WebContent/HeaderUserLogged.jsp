
<!DOCTYPE html>
<html>

<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Utente"%>
<head>
	<link href="css/nav.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>

	<% Utente user = (Utente)request.getSession().getAttribute("user");%>
	

	
<header id="myHeaderUserLogged">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="ButtonHomeControl"><img src="img/website/logoBianco.png" width="130px"/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="ButtonHomeControl">Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Giochi</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li class="dropdown-submenu">
						<a class="test dropdown-item dropdown-toggle" tabindex="-1" id="genereDropdown" href="#">Genere</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="CatalogControl?genere=RPG">RPG</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Picchiaduro">Picchiaduro</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Avventura">Avventura</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Sport">Sport</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Simulazione">Simulazione</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Strategia">Strategia</a></li>
								<li><a class="dropdown-item" href="CatalogControl?genere=Azione">Azione</a></li>
							</ul>
						 </li>
						<li class="dropdown-submenu">
						<a class="test dropdown-item dropdown-toggle" tabindex="-1" id="piattaformaDropdown" href="#">Piattaforma</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="CatalogControl?platform=PC">PC <span
										class="fas fa-laptop"></span></a></li>
								<li><a class="dropdown-item" href="CatalogControl?platform=XboxOne">XBOX <span
										class="fab fa-xbox"></span></a></li>
								<li><a class="dropdown-item" href="CatalogControl?platform=PS3">PS3 <span
										class="fab fa-playstation"></span></a></li>
								<li><a class="dropdown-item" href="CatalogControl?platform=PS4">PS4 <span
										class="fab fa-playstation"></span></a></li>
								<li><a class="dropdown-item" href="CatalogControl?platform=Nintendo switch">Switch <span
										class="fab fa-nintendo-switch"></span></a></li>

							</ul></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="ButtonChiSiamoControl">Chi siamo</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="ButtonContattaciControl">Contattaci</a>
				</li>
			</ul>
			<form class="navbar-form navbar-left" action="CercaGiocoUtenteControl" method="post">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search" name="search">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>



			<ul class="nav navbar-nav  navbar-right">
				<li class="nav-item dropdown">
				<a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Ciao, <%=user.getNome()%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="ButtonLogoutControl"><span
							class="fa fa-sign-out-alt"></span> Sign Out</a>
						
							<a class="dropdown-item" href="ButtonAreaPersonaleControl"><span
							class="fa fa-user-circle"></span> I miei dati</a>
                          
					</div></li>
				<li class="nav-item"><a class="nav-link" href="ButtonCarrelloControl"><span
						class="fa fa-shopping-basket"></span> Carrello</a></li>
				<li class="nav-item"><a class="nav-link" href="ButtonMieiOrdiniControl"><span
						class="fa fa-file-alt"></span> I Tuoi Ordini</a></li>
			</ul> 
		</div>
	</nav>
</header>
</body>
</html>
