<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Gioco> searchResult = (ArrayList<Gioco>) request.getAttribute("searchResult");
	Boolean isGestoreCatalogo = (Boolean) request.getSession().getAttribute("isGestoreCatalogo");

	if (isGestoreCatalogo == null || isGestoreCatalogo == false) {
		String alert = "Non autorizzato ad accedere all'area protetta!";
		request.getSession().setAttribute("alert", alert);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
		dispatcher.forward(request, response);
		return;
	}
%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/StileCatalogoAdmin.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<title>Risultati ricerca</title>
</head>

<body>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<jsp:include page="HeaderGestoreCatalogo.jsp" />

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
					<thead class="thead-light">
						<tr>
							<th scope="col">SerialNumber</th>
							<th scope="col"></th>
							<th scope="col">Prodotto</th>
							<th scope="col">Piattaforma</th>
							<th scope="col">Pezzi disponibili</th>
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
							<td><%=bean.getCode()%></td>
							<td><img src="img/games/<%=bean.getName()%>/1.jpg"
								width="115px" height="90px" class="rounded border border-dark"></td>
							<td><%=bean.getName()%></td>
							<td><%=bean.getPiattaforma()%></td>
							<td><%=bean.getQuantity()%></td>

							<td><a class="btn btn-outline-warning"
								href="ButtonModificaGiocoControl?id=<%=bean.getCode()%>" id="a">
									Modifica </a> <a class="btn btn-outline-danger"
								href="ButtonEliminaGiocoControl?id=<%=bean.getCode()%>" id="a">
									Elimina </a></td>

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
			<p class="lead">Puoi ricercare un prodotto per nome,serialNumber
				oppure piattaforma</p>
			<a class="btn btn-outline-success"
				href="ButtonHomeGestoreCatalogoControl"> Ritorna al catalogo </a>
			<%
				}
			%>

		</div>

	</div>


</body>
</html>