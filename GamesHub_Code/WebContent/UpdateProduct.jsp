<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Gioco ProdottoDaModificare = (Gioco) request.getSession().getAttribute("ProdottoDaModificare"); 
Boolean isGestoreCatalogo = (Boolean) request.getSession().getAttribute("isGestoreCatalogo");

if(isGestoreCatalogo == null || isGestoreCatalogo==false){
	   String alert ="Non autorizzato ad accedere all'area protetta!";
    request.getSession().setAttribute("alert",alert);
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
	dispatcher.forward(request, response);
	return;
       } %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	  <link rel="stylesheet" href="css/stile.css" >
	  <link rel="icon" href="img/website/favicon.png">
	<title>Modifica Prodotto</title>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
     <jsp:include page="HeaderGestoreCatalogo.jsp"/>
     
 <form action="product?action=modificaProdotto&modifica=si" method="post">
 <div class ="containerModifica">
 <div class="table-responsive"> 
<table class="table table-hover">
   <thead class="thead-dark">
    <tr>
      <th scope="col">Dettagli Prodotto</th>
      <th scope="col"></th>
      
    </tr>
  </thead>
  <tbody>

  <tr>
      <td>Serial Number</td>
      <td><%=ProdottoDaModificare.getCode()%></td>   
    </tr>
    
    <tr>
      <td>Nome prodotto</td>
      <td><%=ProdottoDaModificare.getName()%></td>
      
    </tr>
    
    <tr>
      <td>PEGI </td>
      <td><%=ProdottoDaModificare.getPegi()%></td>
    </tr>
    
    <tr>
      <td>Genere  </td>
      <td><%=ProdottoDaModificare.getGenere()%></td>
    </tr>
    
    <tr>
      <td>Anno </td>
      <td><%=ProdottoDaModificare.getAnno()%></td> 
    </tr>
    
    <tr>
      <td>Piattaforma </td>
      <td><%=ProdottoDaModificare.getPiattaforma()%></td>
    </tr>
    
    <tr>
      <td>Prezzo </td>
      <td><input type="text" class="form-control" name="inputPrezzo" placeholder="<%=ProdottoDaModificare.getPrice()%> €"></td>
    </tr>
    
    <tr>
      <td>Link Video  </td>
      <td><input type="text" class="form-control" name="inputVideo" placeholder="<%=ProdottoDaModificare.getVideo()%>" ></td>
    </tr>
    
    <tr>
      <td>Quantità </td>
      <td><input type="number" class="form-control" name="inputQuantity" min= 1 max=100  placeholder="<%=ProdottoDaModificare.getQuantity()%>"   ></td>
    </tr>
    
     <tr>
      <td>Descrizione </td>
      <td><textarea rows="1" cols="1" class="form-control" name="inputDescrizione">
      <%=ProdottoDaModificare.getDescription()%></textarea></td>
    </tr>
    
     <tr>
      <td></td>
     <td><button type="submit" class="btn btn-primary">Modifica</button></td>
    </tr>
    
  </tbody>
</table>
</div>
</div>
	</form>
	
</body>
</html>