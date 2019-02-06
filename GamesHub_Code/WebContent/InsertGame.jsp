<% 
Boolean isGestoreCatalogo = (Boolean) request.getSession().getAttribute("isGestoreCatalogo");

if(isGestoreCatalogo == null || isGestoreCatalogo==false){
	   String alert ="Non autorizzato ad accedere all'area protetta!";
    request.getSession().setAttribute("alert",alert);
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
	dispatcher.forward(request, response);
	return;
} %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	  <link rel="stylesheet" href="css/stile.css" >
	  <link rel="icon" href="img/website/favicon.png">
	<title>Inserimento Prodotto</title>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
     <jsp:include page="HeaderGestoreCatalogo.jsp"/>
     
  
	<div class ="containerInsertForm">
	  <div class="intes">
		<h2 class="display-6">Inserimento Prodotti</h2>
	
		</div>
		
	<form action="InserimentoGiocoControl" method="post">
	<!-- hidden vuol dire che non è mostrato, setta attribute action nella sessione uguale ad insert -->
	
	<div class="form-row">
   <div class="form-group col-md-4">
     <label for="inputSerial">Serial Number</label>
     <input type="text" class="form-control" name="inputSerial" placeholder="Serial Number" required>
   </div>
 </div>

 
		
 <div class="form-row">
   <div class="form-group col-md-4">
     <label for="inputNome">Nome Gioco</label>
     <input type="text" class="form-control" name="inputNome" placeholder="Nome" required>
   </div>
   </div>


    <div class="form-row"> 
   <div class="form-group col-md-2">
     <label for="inputPrezzo">Prezzo €</label>
     <input type="text" class="form-control" name="inputPrezzo" placeholder="Prezzo" required>
   </div>



   <div class="form-group col-md-2">
     <label for="inputQuantità">Quantità</label>
     <input type="number" class="form-control" name="inputQuantity" min= 1 max=100 required >
   </div>

 <div class="form-group col-md-2">
     <label for="inputPegi">Pegi</label>
     <select name="inputPegi" class="form-control" required>
       <option selected>Pegi...</option>
       <option>3</option>
       <option>7</option>
       <option>12</option>
       <option>16</option>
       <option>18</option>
     </select>
   </div>
   
 
</div>


<div class="form-row">
  <div class="form-group col-md-4">
    <label for="inputVideo">LinkVideo</label>
    <input type="text" class="form-control" name="inputVideo" required>
  </div>

 <div class="form-group col-md-2">
   <label for="inputAnno">Anno</label>
   <input type="text" class="form-control" name="inputAnno" required>
 </div>

</div>



<div class="form-row">
   <div class="form-group col-md-4">
     <label for="inputGenere">Genere</label>
     <select name="inputGenere" class="form-control" required>
       <option selected>Genere...</option>
       <option>Picchiaduro</option>
       <option>Azione</option>
       <option>Strategia</option>
       <option>Sport</option>
       <option>Simulazione</option>
       <option>RPG</option>
     </select>
   </div>

   <div class="form-group col-md-4">
     <label for="inputPiattaforma">Piattaforma</label>
     <select name="inputPiattaforma" class="form-control" required>
       <option selected>Piattaforma...</option>
       <option>PS4</option>
       <option>PS3</option>
       <option>XBOX ONE</option>
       <option>PC</option>
       <option>NINTENDO SWITCH</option>
     </select>
   </div>
  </div>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputDescrizione">Descrizione</label>
      <input type="text" class="form-control" name="inputDescrizione" required >
    </div>
    
   
  </div>


  
 <button type="submit" class="btn btn-primary">Inserisci</button>
		<!-- Quando premiamo submit vengono passati questi parametri -->
	</form>
	</div>
	
</body>
</html>