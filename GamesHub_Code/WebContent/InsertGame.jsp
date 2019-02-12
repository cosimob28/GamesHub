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
	
	<style type="text/css">
	
	.error{
	color: red;
	}
	
	
	</style>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
     <jsp:include page="HeaderGestoreCatalogo.jsp"/>
     
  
	<div class ="containerInsertForm">
	  <div class="intes">
		<h2 class="display-6">Inserimento Prodotti</h2>
	
		</div>
		
	<form action="InserimentoGiocoControl" method="post" onsubmit="return validate(this)">
	<!-- hidden vuol dire che non è mostrato, setta attribute action nella sessione uguale ad insert -->
	
	<div class="form-row">
   <div class="form-group col-md-4">
     <label for="inputSerial">Serial Number</label>
     <input type="text" class="form-control" name="inputSerial" id="inputSerial" placeholder="Serial Number" required>
   </div>
 </div>
 <p id="inputSerialError" class="error"></p>

 
		
 <div class="form-row">
   <div class="form-group col-md-4">
     <label for="inputNome">Nome Gioco</label>
     <input type="text" class="form-control" name="inputNome" id="inputNome" placeholder="Nome" required>
   </div>
   </div>
	<p id="inputNomeError" class="error"></p>

    <div class="form-row"> 
   <div class="form-group col-md-2">
     <label for="inputPrezzo">Prezzo €</label>
     <input type="text" class="form-control" name="inputPrezzo" id="inputPrezzo" placeholder="Prezzo" required>
   </div>
	<p id="inputPrezzoError" class="error"></p>


   <div class="form-group col-md-2">
     <label for="inputQuantità">Quantità</label>
     <input type="number" class="form-control" name="inputQuantity" id="inputQuantity" min= 1 max=100 required >
   </div>
	<p id="inputQuantityError" class="error"></p>
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
    <input type="text" class="form-control" name="inputVideo" id="inputVideo" required>
  </div>
  <p id="inputVideoError" class="error"></p>

 <div class="form-group col-md-2">
   <label for="inputAnno">Anno</label>
   <input type="text" class="form-control" name="inputAnno" id="inputAnno" required>
 </div>
<p id="inputAnnoError" class="error"></p>
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
      <input type="text" class="form-control" name="inputDescrizione" id="inputDescrizione" required >
    </div>
    
   
  </div>
<p id="inputDescrizioneError" class="error"></p>

  
 <button type="submit" class="btn btn-primary">Inserisci</button>
		<!-- Quando premiamo submit vengono passati questi parametri -->
	</form>
	</div>
	<script type="text/javascript">


var serialCorrect = false;
var nomeCorrect = false;
var prezzoCorrect = false;
var quantityCorrect = false;
var videoCorrect = false;
var annoCorrect = false;
var descrizioneCorrect = false;

function ValidateSerial(InputSerial)
{
   var SerialFormat = /^([0-9]){18}$/;
   if(InputSerial.value.match(SerialFormat))
   {
	 
	   $("#inputSerial").css({"border-color":"#00fd00"});
	   $("#inputSerialError").text("");
     return true;
   }
   else
   {
	   
	   $("#inputSerial").css({"border-color":"red"});
      $("#inputSerialError").text("Formato Serial Number non corretto.");
      return false;
   }
}

function ValidateNome(InputNome)
{
   var NomeFormat = /^([^/%£!|\\?^;,/<>](\s?))+$/;
   if(InputNome.value.match(NomeFormat))
   {
	   $("#inputNome").css({"border-color":"#00fd00"});
	   $("#inputNomeError").text("");
     return true;
   }
   else
   {
	   $("#inputNome").css({"border-color":"red"});
      $("#inputNomeError").text("Formato Nome non corretto.");
      return false;
   }
}

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

function ValidateAnno(InputAnno)
{
   var AnnoFormat = /^(?!0+)([0-9]){4}$/;
   if(InputAnno.value.match(AnnoFormat))
   {
	   $("#inputAnno").css({"border-color":"#00fd00"});
	   $("#inputAnnoError").text("");
     return true;
   }
   else
   {
	   $("#inputAnno").css({"border-color":"red"});
      $("#inputAnnoError").text("Formato Anno non corretto.");
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


$("#inputSerial").change(function(){
	
	 serialCorrect = ValidateSerial(this);
    });
    
$("#inputNome").change(function(){
	
	 nomeCorrect = ValidateNome(this);
   });

$("#inputPrezzo").change(function(){
	
	 prezzoCorrect = ValidatePrezzo(this);
   });

$("#inputQuantity").change(function(){
	
	 quantityCorrect = ValidateQuantity(this);
   });
   
$("#inputVideo").change(function(){
	
	 videoCorrect = ValidateVideo(this);
  });

$("#inputAnno").change(function(){
	
	 annoCorrect = ValidateAnno(this);
  });
  
$("#inputDescrizione").change(function(){
	
	 descrizioneCorrect = ValidateDescrizione(this);
 });
    
function validate(form){
	  
	if(!serialCorrect)
	return false;
	
	if(!nomeCorrect)
		return false;
	
	if(!prezzoCorrect)
		return false;
	
	if(!quantityCorrect)
		return false;
	
	if(!videoCorrect)
		return false;
	
	if(!annoCorrect)
		return false;
	
	if(!descrizioneCorrect)
		return false;
}
</script>
</body>
</html>