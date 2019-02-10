<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Gioco> searchResult = (ArrayList<Gioco>) request.getAttribute("searchResult");
%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder,it.gameshub.bean.Utente"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/StileCatalogoAdmin.css">
<link href="css/footer.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<title>Risultati ricerca</title>
<style>

	.table td, .table th {
    vertical-align: middle;
	}

	.pegi, .data{
	font-size: x-small;
	font-weight: bold;
	}
	
	.prezzo{
	font-size: small;
	font-weight: bold;
	
	}
	
	.nameLink{
	color: black;
	font-weight: bold;
	padding-left: 0;
    background: transparent;
    border: none;
	}
	
	.nameLink:hover {
	color: #2F4F4F;
	text-decoration: none;
	}
	
	.nondisponibile, .disponibile{
	font-size: x-small;
	color: green;
	font-weight: bold;
	}
	
	.nondisponibile{
	color: red;
	}
	</style>
	
</head>

<body>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<%
		Utente user = (Utente) request.getSession().getAttribute("user");
		if (user != null) {
	%>
	<jsp:include page="HeaderUserLogged.jsp" />
	<%
		} else {
	%>
	<jsp:include page="Header.jsp" />
	<%
		}
	%>

	<%
		if (searchResult != null && searchResult.size() != 0) {
	%>
	<br>
	<br>
	<br>
	<h2>Risultati ricerca</h2>
	<br>

	<div class="catalogo">
		<div class="container">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead class="table-hover thead-dark">
						<tr>
							<th scope="col"></th>
							<th scope="col">Prodotto</th>
							<th scope="col">Piattaforma</th>
							<th scope="col">Prezzo</th>
							<th scope="col">Azioni</th>

						</tr>
					</thead>
					<tbody>
						<%
							Iterator<?> it = searchResult.iterator();
								while (it.hasNext()) {
									Gioco bean = (Gioco) it.next();
						%>
						<tr>
							<form action="ButtonVisualizzaPaginaProdottoControl" method="POST" >
  <td><img src= "img/games/<%=bean.getName()%>/1.jpg" width="110px" height="110px" class="rounded border border-dark"></td>  
			<td><button type="submit" class="nameLink btn btn-light" name="id" value="<%=bean.getCode()%>"><%=bean.getName()%></button></form>
								<br /> <%
 	if (bean.getQuantity() > 0) {
 %> <span class="disponibile">Disponibile</span>
								<%
									} else {
								%> <span class="nondisponibile">Esaurito</span> <%
 	}
 %> <br />
								<br /> <span class="pegi">PEGI : Età consigliata <%=bean.getPegi()%>
									e oltre
							</span> <br /> <span class="data">Data di uscita: <%=bean.getAnno()%>
							</span></td>
							<td><img
								src="img/website/platform/<%=bean.getPiattaforma()%>.png"
								width="50px" height="50px"></td>
							<td><span class="prezzo"><%=bean.getPrice()%> &#8364</span></td>
							<%
								if (bean.getQuantity() > 0) {
							%>
							<td><form action="ButtonAggiungiAlCarrelloControl" method="POST" >
				<button type="submit" name="id" class="btn btn-danger" value="<%=bean.getCode()%>" id="a" > Aggiungi al carrello </button></form> <%
 	} else {
 %>
							<td><a class="btn btn-secondary disabled" href="" id="a"
								disabled> Non disponibile </a></td>
							<%
								}
							%>

						</tr>

						<%
							}
							}
						%>

					</tbody>
				</table>

			</div>
		</div>
	</div>



	<%
		if (searchResult == null || searchResult.size() == 0) {
	%>

	<div class="jumbotron jumbotron-fluid">

		<div class="container" style="margin-top: 50px;">
			<h1 class="display-4">Risultati della ricerca</h1>
			<p class="lead">Nessun risultato trovato. Esegui un'altra
				ricerca.</p>
			<p class="lead">Puoi ricercare un prodotto per nome, serial
				number, piattaforma oppure genere</p>
			<a class="btn btn-outline-success" href="ButtonHomeControl">
				Ritorna alla home </a>
			<%
				}
			%>

		</div>

	</div>
	<jsp:include page="Footer.jsp" />
<script src="js/custom.js"></script> 

</body>
</html>

