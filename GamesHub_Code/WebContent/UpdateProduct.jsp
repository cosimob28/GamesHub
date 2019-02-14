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
	
	<style>
	.error{
	color:red;
	}
	
	</style>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
     <jsp:include page="HeaderGestoreCatalogo.jsp"/>
     
 <form action="ModificaGiocoControl" method="post" onsubmit="return validate(this)">
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
      <td><input type="text" class="form-control" name="inputPrezzo" id="inputPrezzo" placeholder="<%=ProdottoDaModificare.getPrice()%> €"><p id="inputPrezzoError" class="error"></p></td>
    </tr>
    
    
    
    <tr>
      <td>Link Video  </td>
      <td><input type="text" class="form-control" name="inputVideo" id="inputVideo" placeholder="<%=ProdottoDaModificare.getVideo()%>" ><p id="inputVideoError" class="error"></p></td>
    </tr>
   
    
    <tr>
      <td>Quantità </td>
      <td><input type="number" class="form-control" name="inputQuantity" id="inputQuantity" min= 1 max=100  placeholder="<%=ProdottoDaModificare.getQuantity()%>"   ><p id="inputQuantityError" class="error"></p></td>
    </tr>
    
     
     <tr>
      <td>Descrizione </td>
      <td><textarea rows="1" cols="1" class="form-control" name="inputDescrizione" id="inputDescrizione">
      <%=ProdottoDaModificare.getDescription()%></textarea><p id="inputDescrizioneError" class="error"></p></td>
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
	<script type="text/javascript">



var prezzoCorrect = true;
var quantityCorrect = true;
var videoCorrect = true;
var descrizioneCorrect = true;


function ValidatePrezzo(InputPrezzo)
{
	
   var PrezzoFormat = /^(?!(0)+(.?)(0)+)([0-9]+)((\.?)([0-9]{2}))?$/;
   if(InputPrezzo.value.match(PrezzoFormat))
   {
	   $("#inputPrezzo").css({"border-color":"#00fd00"});
	   $("#inputPrezzoError").text("");
     return true;
   }
   else
   {
	   $("#inputPrezzo").css({"border-color":"red"});
      $("#inputPrezzoError").text("Formato Prezzo non corretto.");
      return false;
   }
}

function ValidateQuantity(InputQuantity)
{
	
   var QuantityFormat = /^([0-9])+$/;
   if(InputQuantity.value.match(QuantityFormat))
   {
	   
	   $("#inputQuantity").css({"border-color":"#00fd00"});
	   $("#inputQuantityError").text("");
     return true;
   }
   else
   {
	  
	   $("#inputQuantity").css({"border-color":"red"});
      $("#inputQuantityError").text("Formato Quantità non corretto.");
      return false;
   }
}

function ValidateVideo(InputVideo)
{
   var VideoFormat = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
   if(InputVideo.value.match(VideoFormat))
   {
	   $("#inputVideo").css({"border-color":"#00fd00"});
	   $("#inputVideoError").text("");
     return true;
   }
   else
   {
	   $("#inputVideo").css({"border-color":"red"});
      $("#inputVideoError").text("Formato Video non corretto.");
      return false;
   }
}

function ValidateDescrizione(InputDescrizione)
{
   var DescrizioneFormat = /^([\w\W])+$/;
   if(InputDescrizione.value.match(DescrizioneFormat))
   {
	   $("#inputDescrizione").css({"border-color":"#00fd00"});
	   $("#inputDescrizioneError").text("");
     return true;
   }
   else
   {
	   $("#inputDescrizione").css({"border-color":"red"});
      $("#inputDescrizioneError").text("Formato Descrizione non corretto.");
      return false;
   }
}




$("#inputPrezzo").change(function(){
	
	 prezzoCorrect = ValidatePrezzo(this);
   });

$("#inputQuantity").change(function(){
	
	 quantityCorrect = ValidateQuantity(this);
   });
   
$("#inputVideo").change(function(){
	
	 videoCorrect = ValidateVideo(this);
  });

  
$("#inputDescrizione").change(function(){
	
	 descrizioneCorrect = ValidateDescrizione(this);
 });
    
function validate(form){
	  
	
	
	if(!prezzoCorrect)
		return false;
	
	if(!quantityCorrect)
		return false;
	
	if(!videoCorrect)
		return false;
	

	
	if(!descrizioneCorrect)
		return false;
}
</script>	
</body>
</html>