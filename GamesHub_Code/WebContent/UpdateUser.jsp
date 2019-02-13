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

.error{
color: red;
}
</style>
</head>

<body>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- NAVBAR -->
	<jsp:include page="HeaderUserLogged.jsp" />

	<div class="intestazione">
		<h1 class="display-5">Modifica profilo</h1>

		<hr></hr>
	</div>
	<form name="form" id="form" action="ModificaDatiAreaPersonaleControl"
		method="post" onsubmit="return validate(this)">
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
							<td>Nome:</td>
							<td><%=user.getNome()%></td>
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
							<td>Email</td>
							<td><%=user.getEmail()%></td>
						</tr>
						<tr>
							<td>Indirizzo:</td>
							<td><input type="text" class="form-control" id = "address"
								name="inputIndirizzo"
								value="<%=user.getIndirizzoSpedizione()%>">
								<p id="demo2" class="error"></p></td>
						</tr>

						<tr>
							<td>Telefono</td>
							<td><input type="text" class="form-control" id="phone"
								name="inputTelefono" value="<%=user.getTelefono()%>">
								<p id="demo3" class="error"></p>
							</td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input id="password-field" type="password" 
								class="form-control" name="password" value=""></input><span
								toggle="#password-field"
								class="fa fa-fw fa-eye field-icon toggle-password"></span>
								<p id="demo4" class="error"></p></td>
						</tr>
						<tr>
							<td align="center"><a class="btn btn-outline-primary"
								href="ButtonAreaPersonaleControl" id="a"> Ritorna all'area
									personale </a></td>
							<td align="center"><button type="submit"
									class="btn btn-outline-success">Salva modifiche</button></td>
						</tr>
					</tbody>

				</table>

			</div>

		</div>
	</form>
	<jsp:include page="Footer.jsp" />
	<script>
		var numberCorrect = true;
		var passwordCorrect = true;
		var addressCorrect = true;

		function passwordValidator(password) {
			var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{6,}$/;
			if (password.value.match(passw)) {
				$("#password-field").css({
					"border-color" : "#00fd00"
				});
				$("#demo4").text("");
				return true;
			} else {
				$("#password-field").css({
					"border-color" : "red"
				});
				$("#demo4")
						.text(
								"La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
				$("#demo4").css({
					'font-size' : '15px'
				});
				return false;
			}

		}
		
		function addressValidation(address) {
			var add = /^(([A-Z])([a-z]+)(\s))+(\d+)(,)(\s?)(([A-Z])([a-z]+)(\s?))+$/;
			
			if (address.value.match(add)) {
				$("#address").css({
					"border-color" : "#00fd00"
				});
				$("#demo2").text("");
				return true;
			} else {
				
				$("#address").css({
					"border-color" : "red"
				});
				$("#demo2")
						.text("L'indirizzo deve essere del formato es. 'Via Genova 24, Roma'");
				$("#demo2").css({
					'font-size' : '15px'
				});
				return false;
			}

		}
		

		$(".toggle-password").click(function() {

			$(this).toggleClass("fa-eye fa-eye-slash");
			var input = $($(this).attr("toggle"));
			if (input.attr("type") == "password") {
				input.attr("type", "text");
			} else {
				input.attr("type", "password");
			}
		});

		function phonenumber(inputtxt) {
			var phoneno = /^\+?([0-9]{3})\)?([0-9]{7})$/;
			if (inputtxt.value.match(phoneno)) {
				$("#phone").css({
					"border-color" : "#00fd00"
				});
				$("#demo3").text("");
				return true;
			} else {
				$("#phone").css({
					"border-color" : "red"
				});
				$("#demo3").text("Numero di telefono non valido!");
				return false;
			}
		}

		function validate(form) {
			if (!numberCorrect)
				return false;

			if (!passwordCorrect)
				return false;
			if(!addressCorrect)
				return false;
			return true;
		}

		$("#phone").change(function() {
			numberCorrect = phonenumber(this);

		});
		
		$("#address").change(function() {
			
			addressCorrect = addressValidation(this);
			

		});

		$("#password-field").change(function() {
			passwordCorrect = passwordValidator(this);
		});
	</script>
</body>
</html>