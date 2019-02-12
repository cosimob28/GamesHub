<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>GamesHub Connect | Accedi a GamesHub</title>


<link rel="stylesheet" type="text/css" href="css/site4.min.css" />


<style type="text/css">
body {
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	min-height: 100%;
}

#extern {
	background: inherit;
	max-width: 770px;
	height: 580px;
	margin: 0 auto;
	top: 50px;
	position: relative;
	overflow: hidden;
}

#extern:before {
	content: "";
	background: inherit;
	position: absolute;
	left: -25px;
	right: 0;
	top: -25px;
	bottom: 0;
	box-shadow: inset 0 0 0 3000px rgba(255, 255, 255, 0.3);
	filter: blur(10px);
}

label {
	color: black;
}

.error{
	color:red;
}

</style>


</head>
<body>
	<div id="extern">
		<div class="container" id="login">
			<a href="ButtonHomeControl">
				<div class="logo"></div>
			</a>


			<div class="row">
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12"></div>
				<div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
					<h2>Accedi a GamesHub</h2>
					<br>
					<form ACTION="LoginControl" name="loginForm" id="login-form" onsubmit="return validate(this)"
						role="form" autocomplete="off" 
						method="post">

						<%
							String alert = (String) request.getSession().getAttribute("alert");
							if (alert != null) {
						%>

						<div class="alert alert-danger" role="alert"><%=alert%></div>

						<%
							request.getSession().removeAttribute("alert");
						%>
						<%
							}
						%>

						<div class="form-group">
							<label for="AuthUser">Username:</label> <input id="AuthUser"
								name="userid" type="text" class="form-control" data-val="true"
								data-val-required='Username richiesto.' required /> <span
								id="UserError"></span>
							<!-- spazio per scrivere in caso di user non valido -->
						<p id="AuthUserError" class="error">
	
						</div>
						<div class="form-group">
							<label for="AuthPassword">Password:</label> <input
								id="AuthPassword" name="passid" type="password"
								class="form-control" data-val="true"
								data-val-required='Password richiesta.' required />

						</div>



						<div class="form-group"></div>
						<div class="form-group clearfix">
							<button type="SUBMIT" class="btn btn-primary" id="LogInButton"
								name="LogInButton">ACCEDI</button>

						</div>

						<div class="checkbox" id="AdminDiv">
							<label class="qtip2"
								title="Spuntando questa casella, entrerai nella pagina amministratore.">
								<input name="Amministratore" id="Amministratore" type="checkbox"
								value=1 /> Accedi come Amministratore
							</label>
						</div>





					</form>





					<div class="clearfix">
						<a id="CreateAccountButtonLogin" href="ButtonRegistrazioneControl"
							class="btn btn-primary btn-block">CREA UN ACCOUNT</a>

					</div>
				</div>
				<div class="col-md-3 col-lg-3 col-sm-3 col-xs-12"></div>
			</div>

		</div>
	</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">

var userCorrect = false;

function ValidateUser(AuthUser)
{
   var userFormat = /^\S*$/;
   if(AuthUser.value.match(userFormat))
   {
	   $("#AuthUser").css({"border-color":"#00fd00"});
	   $("#AuthUserError").text("");
     return true;
   }
   else
   {
	   $("#AuthUser").css({"border-color":"red"});
      $("#AuthUserError").text("Il nome utente non può contenere spazi.");
      return false;
   }
}

$("#AuthUser").change(function(){
	 userCorrect = ValidateUser(this);
    });
    
function validate(form){
	  
	if(!userCorrect)
	return false;
}
</script>
</body>
</html>


