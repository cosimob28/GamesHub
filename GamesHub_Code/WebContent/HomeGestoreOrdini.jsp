<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*, it.gameshub.bean.*"%>

<%

    Collection<?> ordini = (Collection<?>) request.getAttribute("listaOrdini");
    if(ordini==null){ ordini = (Collection<?>) request.getSession().getAttribute("ordini"); }
	Boolean isGestoreCatalogo = (Boolean) request.getSession().getAttribute("isGestoreCatalogo");
	       %>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	<link rel="stylesheet" href="css/StileCatalogoAdmin.css" >
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	<title> Lista ordini </title>
	<style>
	
	.error{
	color:red;
	}
	
	
	.form-control{
	width: 50px;
	}
	
	input[type=text] {
  width: 70%;
  padding: 2px 5px;
  margin: 1px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.span{
color: #3d3d29;
font-weight: bold;
font-size: 17px;

}


.spanDate {
font-size: 14px;
font-style: oblique;
}
	
	
	
	/* The container must be positioned relative: */
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
	
	</style>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
    <jsp:include page="HeaderGestoreOrdini.jsp"/>
    
    <!-- codice search -->
    
 
    <%if (ordini != null && ordini.size() != 0) { %>
	<br><br><br><h2>Ordini</h2><br>
	
	
	

<div class="catalogo">
	<div class ="container">
	


<form ACTION="CercaGestioneOrdiniControl" name="cercaOrdiniForm" id="cercaOrdiniForm" method="post"class="form-inline" onsubmit="return validateSearch(this)">
  
    <div class="form-group mx-sm-3 mb-2 fa-lg">
    <span></span> <i class="fas fa-search"></i> &nbsp; &nbsp;
    <input name="idOrdine" type="text" class="form-control" id="inputSearch" placeholder="Cerca ID..">
  </div>
  
<div class="form-group mx-sm-3 mb-2">
<i class="fas fa-table fa-lg"></i> &nbsp; &nbsp; 
    <select name="annoOrdine" class="form-control" id="annoOrdine">
      <option >Anno</option>
      <%
      for(int i=19; i>10; i--){ %>
      <option ><%="20" + i %></option>
      <%} %>
    </select>
    </div>
  
  
  <div class="form-group mx-sm-3 mb-2">
    <select name="statoOrdine" class="form-control" id="statoOrdine">
      <option >Stato</option>
      <option>Accettato</option>
      <option>In preparazione</option>
      <option>Spedito</option>
      <option>Consegnato</option>
    </select>
    </div>
  

  <button type="submit" class="btn btn-success mb-2">Ricerca</button>
</form>
<p id="inputSearchError" class="error"></p>
<br/>
	
	
	
	
	
	
	
	
	 <div class="table-responsive"> 
	<table class="table table-hover">
 <thead class="thead-light">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Importo</th>
      <th scope="col">Data</th>
      <th scope="col">Stato</th>
      <th scope="col">Utente</th>
      <th scope="col">TrackingID</th>
      <th scope="col">Azioni</th>
     
     
    </tr>
  </thead>
  <tbody>
    <%
    			int counter=0;
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					Ordine bean = (Ordine) it.next();
		%>
		<tr>
			<td><span class="span"><%=bean.getIdOrdine()%> </span></td>
			<td><span class="spanImporto"><%=bean.getImporto()%> &#8364</span></td>  
			<td><span class="spanDate"> <%=bean.getDataOrdine()%></span></td>
			<td>
			
<form action="ButtonSalvaModificheGestoreOrdiniControl" name="salvaModificheForm" id="salvaModificheForm" method="post" onsubmit="return validate(this)">			
    <select name="cambiaStatoOrdine" class="custom-select" >
    <option><%=bean.getStato()%></option>
     <%
     String[] listaStati = {"Accettato", "Spedito", "In preparazione" , "Consegnato"};
     
     for(int i=0; i<4; i++){
    	 if(!bean.getStato().equalsIgnoreCase(listaStati[i])){
 %>
     <option><%=listaStati[i]%></option>
  
      
      <%} 
      }%>
    </select>
    
			</td>
			
			<td><%=bean.getUtente()%></td>
			
			<td>
			<% if(bean.getTrackingId()==null || bean.getTrackingId().equalsIgnoreCase(" ")){%>
			
            <input type="text" id="trackingID<%=counter%>" class="track" name="trackingID" value="<%=bean.getTrackingId()%>" placeholder="">
            <%}else {%>
             <input type="text" id="trackingID<%=counter%>" class="track" name="trackingID" value="<%=bean.getTrackingId()%>" placeholder="Inserisci Tracking ID">
            <%} %>
            <p id="trackingID<%=counter%>Error" class="error"></p>
		    </td>
		   <input type="hidden" name="idOrdine" value="<%=bean.getIdOrdine()%>" />
			
				<td><button type="submit" class="btn btn-outline-success" id="a" >Salva modifiche </button></td>
		

		</tr>
</form>		
	

		<%
		counter++;
				}
			}%>     
			
		
  </tbody>
</table>

</div>
</div>
</div>

			
<% if(ordini==null || ordini.size()==0){ %>
           <div class="jumbotron jumbotron-fluid">
            <div class="container">
          
             <h1 class="display-4">Nessun ordine</h1>
              <a class="btn btn-outline-success" href="HomeGestoreOrdini.jsp" > Vai all'homepage </a>
             </div>
             </div>
             <% } %>
   
   
 <script type="text/javascript">
 

 var trackingIDCorrect = false;
 var inputSearchCorrect = true;

 function ValidateTrackingID(trackingID)
 {
 	
    var trackingIDFormat = /^([A-Z]){3}([0-9]){2}([A-Z]){2}$/;
    var name = trackingID.id;
    
    if(trackingID.value.match(trackingIDFormat))
    {
 	   $("#"+name).css({"border-color":"#00fd00"});
 	   $("#"+name+"Error").text("");
      return true;
    }
    else
    {
 	   $("#"+name).css({"border-color":"red"});
       $("#"+name+"Error").text("Il tracking ID deve essere del formato AAA11BB.");
       return false;
    }
 }

 function ValidateInputSearch(inputSearch)
 {
 	
    var inputSearchFormat = /^([0-9]){0,6}$/;
   
    
    if(inputSearch.value.match(inputSearchFormat))
    {
 	   $("#inputSearch").css({"border-color":"#00fd00"});
 	   $("#inputSearchError").text("");
      return true;
    }
    else
    {
 	   $("#inputSearch").css({"border-color":"red"});
       $("#inputSearchError").text("L'id dell'ordine è un numero (max 6 cifre)");
       return false;
    }
 }
 

 $(".track").change(function(){	 
	 trackingIDCorrect = ValidateTrackingID(this);
    });
 
 $("#inputSearch").change(function(){	 
	 inputSearchCorrect = ValidateInputSearch(this);
    });

 
     
 function validate(form){
 	  
 	if(!trackingIDCorrect)
 		return false;
 }
 
 function validateSearch(form){
	  
	 	if(!inputSearchCorrect)
	 		return false;
	 }
 
 </script>  
</body>
</html>