<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Utente,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder,it.gameshub.bean.Immagine,it.gameshub.bean.Composizione,it.gameshub.bean.Ordine,it.gameshub.bean.ItemComp"%>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<link rel="stylesheet" href="css/fontawesome-all.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/site.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">

<title>Invio E-mail di verifica</title>
</head>
<body>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

<!-- NAVBAR -->
    <jsp:include page="Header.jsp"/>
    
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h2 class="display-4">E-mail di verifica inviata a <%=request.getSession().getAttribute("E-mail")%></h2>


			<p class="lead">Conferma la tua e-mail entro 24H</p>
			<hr class="my-2">
			<p>Per verificare l'e-mail ti basterà semplicemente cliccare sul link presente nell' e-mail.</p>

			<button type="button" class="btn btn-default" id="home"
				onclick="location.href='ButtonHomeControl';">
				<span class="fa fa-cart-plus"></span> Torna alla Home
			</button>


		</div>
	</div>
	<jsp:include page="Footer.jsp"/>
	

</body>
</html>