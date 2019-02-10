<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.model.GiocoModel,it.gameshub.bean.Utente,it.gameshub.bean.Immagine,it.gameshub.bean.ItemOrder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% ArrayList<Gioco> listaGiochi = (ArrayList<Gioco>) request.getAttribute("listaGiochi");
%>


<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	<link rel="stylesheet" href="css/StileCatalogoAdmin.css" >
	<link rel="icon" href="img/website/favicon.png">
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	
	<title> Catalogo </title>
	
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
    <script src ="js/bootstrap.min.js"></script>
    
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


<div class=" main-section" id="productContainer" >

<br><br><h2>Catalogo</h2><br>
	

<div class="catalogo">
	<div class ="container">
	<table class="table table-hover">
 <thead class="table-hover thead-dark">
    <tr>
     

      <th scope="col"></th>
      <th scope="col">Prodotto</th>
      <th scope="col">Piattaforma</th>
      <th scope="col">Prezzo</th>
      <th scope="col">   Azioni</th>
     
    </tr>
  </thead>
  <tbody>
    <%
				for(int i=0 ; i< listaGiochi.size() ; i++){
					Gioco bean = (Gioco) listaGiochi.get(i);
		%>
		<tr>
			<form action="ButtonVisualizzaPaginaProdottoControl" method="POST" >
  <td><img src= "img/games/<%=bean.getName()%>/1.jpg" width="110px" height="110px" class="rounded border border-dark"></td>  
			<td><button type="submit" class="nameLink btn btn-light" name="id" value="<%=bean.getCode()%>"><%=bean.getName()%></button>
			<br/>

</form>
			
			<%if(bean.getQuantity()>0) {%>
				<span class="disponibile">Disponibile</span>
		    <%}else{ %>
		        <span class="nondisponibile">Esaurito</span>
		    <%} %>
			
			
			<br/>
		    <br/>
			<span class="pegi">PEGI : Età consigliata <%=bean.getPegi() %> e oltre</span>
			<br/>
			<span class="data">Data di uscita:  <%=bean.getAnno() %> </span>
		
			</td>
			<td><img src="img/website/platform/<%=bean.getPiattaforma()%>.png" width="50px" height="50px"></td>
			<td><span class="prezzo"><%=bean.getPrice()%> &#8364</span></td>
		<%if(bean.getQuantity()>0) {%>
		<form action="ButtonAggiungiAlCarrelloControl" method="POST" >
				<td><button type="submit" name="id" class="btn btn-danger" value="<%=bean.getCode()%>" id="a" > Aggiungi al carrello </button></form>
		<%}else{ %>
		        <td><a class="btn btn-secondary disabled" href="" id="a" disabled> Non disponibile </a>
		<%} %>
		</tr>
		<%
				
			}%>      
  </tbody>
</table>
</div>
</div>
</div>

<jsp:include page="Footer.jsp" />
<script src="js/custom.js"></script> 
</body>

</html>