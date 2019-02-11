<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Utente user = (Utente) request.getSession().getAttribute("user");
	if (user == null) {
		String alert = "Effettua il login ";
		request.getSession().setAttribute("alert", alert);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
		dispatcher.forward(request, response);
		return;
	}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.gameshub.bean.Utente"%>

<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">


<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/StilePaginaUtente.css">
<link rel="stylesheet" href="css/fontawesome-all.css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link rel="icon" href="img/website/favicon.png">
<title>Area Personale</title>


<style>
.field-icon {
	float: right;
	margin-left: -25px;
	margin-top: -25px;
	margin-right: 5px;
	position: relative;
	z-index: 2;
}
</style>

</head>

<body>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- NAVBAR -->
	<jsp:include page="HeaderUserLogged.jsp" />

	<div class="intestazione">
		<h1 class="display-5">Profilo personale</h1>

		<hr></hr>
	</div>
	
	<div class="containerPaginaUtente">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th scope="col"><div class="panel-heading">
								<h3 class="panel-title">User :</h3>
								<br>
							</div></th>
						<th scope="col">
							<div class="panel-heading">
								<h3 class="panel-title">
									<%=user.getUsername()%></h3>
								<br>
							</div>
						</th>


					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="50%">Nome:</td>
						<td width="50%"><%=user.getNome()%></td>
					</tr>
					<tr>
						<td>Cognome:</td>
						<td><%=user.getCognome()%></td>
					</tr>
					<tr>
						<td>Data di Nascita:</td>
						<td><%=user.getDataDiNascita()%></td>
					</tr>
					
					<tr>
						<td>Sesso:</td>
						<td><%=user.getSesso()%></td>
					</tr>
					<tr>
						<td>Codice Fiscale:</td>
						<td><%=user.getCodiceFiscale()%></td>
					</tr>
					<tr>
						<td>Indirizzo:</td>
						<td><%=user.getIndirizzoSpedizione()%></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><a href="mailto:"<%=user.getEmail()%>"><%=user.getEmail()%></a></td>
					</tr>
					<tr>
						<td>Telefono</td>
						<td><%=user.getTelefono()%></td>
					</tr>
					<tr>
					<%-- <tr>
						<td>Password</td>
						<td><input id="password-field" type="password"
							class="form-control" name="password" value="<%=user.getPin()%>" disabled></input><span
							toggle="#password-field"
							class="fa fa-fw fa-eye field-icon toggle-password"></span></td>
					</tr> --%>
					<tr>

						<td colspan="2" align="center"><a
							class="btn btn-outline-warning"
							href="ButtonModificaDatiAreaPersonaleControl" id="a">
								Modifica dati </a></td>
					</tr>
				</tbody>

			</table>

		</div>

	</div>

	<jsp:include page="Footer.jsp" />

<!-- Script per mostrare e nascondere la password -->
	<script>
		$(".toggle-password").click(function() {

			$(this).toggleClass("fa-eye fa-eye-slash");
			var input = $($(this).attr("toggle"));
			if (input.attr("type") == "password") {
				input.attr("type", "text");
			} else {
				input.attr("type", "password");
			}
		});
	</script>

</body>
</html>