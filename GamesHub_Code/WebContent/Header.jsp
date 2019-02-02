<head>
<link href="css/nav.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Barra di navigazione -->
	<header id="myHeaderUser">	
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<!-- Logo -->
		<a class="navbar-brand" href="product?action=home"><img src="img/website/logoBianco.png" width="130px"/></a>
		<!-- Bottone visualizzato per barra responsive -->
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="product?action=home">Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Giochi</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li class="dropdown-submenu">
							
							<a class="test dropdown-item dropdown-toggle" tabindex="-1" id="genereDropdown" href="#">Genere</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="ResultList.jsp?genre=RPG">RPG</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Picchiaduro">Picchiaduro</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Avventura">Avventura</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Sport">Sport</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Simulazione">Simulazione</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Strategia">Strategia</a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?genre=Azione">Azione</a></li>
							</ul>
						 </li>
						<li class="dropdown-submenu">
						<a class="test dropdown-item dropdown-toggle" tabindex="-1" id="piattaformaDropdown" href="#">Piattaforma</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="ResultList.jsp?platform=PC">PC <span
										class="fas fa-laptop"></span></a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?platform=XboxOne">XBOX <span
										class="fab fa-xbox"></span></a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?platform=PS3">PS3 <span
										class="fab fa-playstation"></span></a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?platform=PS4">PS4 <span
										class="fab fa-playstation"></span></a></li>
								<li><a class="dropdown-item" href="ResultList.jsp?platform=Nintendo switch">Switch <span
										class="fab fa-nintendo-switch"></span></a></li>

							</ul></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="OurTeam.jsp">Chi siamo</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contattaci</a>
				</li>
			</ul>
			<form class="navbar-form navbar-left" action="ResultList.jsp" method="post">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search" name="searchQuery">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>



			<ul class="nav navbar-nav  navbar-right">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Accedi </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="user?azione=registrazioneView"><span
							class="fa fa-user-plus"></span> Sign Up</a>
							 <a class="dropdown-item"
							href="Login.jsp"><span class="fa fa-user"></span> Login</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="product?action=carrello"><span
						class="fa fa-shopping-basket"></span> Carrello</a></li>
						
				
						
			</ul>
		</div>
	</nav>
	</header>
</body>
