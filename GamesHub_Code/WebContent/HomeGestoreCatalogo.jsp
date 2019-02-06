<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
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
	<link rel="stylesheet" href="css/StileCatalogoAdmin.css" >
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<title> Catalogo </title>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>
    
    <jsp:include page="HeaderGestoreCatalogo.jsp"/>
    
    <!-- codice search -->
    
       <%  String search= request.getParameter("search"); 
           if(search!=null && products!= null)
           {
        	   ArrayList<Gioco> searchList = new ArrayList<Gioco>();
                Iterator<?> it = products.iterator();
				while (it.hasNext()) 
				{
					  Gioco x = (Gioco) it.next();
					if((x.getName().indexOf(search))!=-1){  /*Ricerca per nome*/
					     searchList.add(x);
					}else if (((""+x.getCode()).indexOf(search))!=-1){ /*Ricerca per serialNumber*/
						searchList.add(x);
					}else if ((x.getPiattaforma().indexOf(search))!=-1){ /*Ricerca per piattaforma*/
						searchList.add(x);
					}
					
				}
				 products= searchList;
	        
            } 

%>
    <%if (products != null && products.size() != 0) { %>
	<br><br><br><h2>Prodotti in magazzino</h2><br>

<div class="catalogo">
	<div class ="container">
	<table class="table table-hover">
 <thead class="thead-light">
    <tr>
      <th scope="col">SerialNumber</th>
      <th scope="col"></th>
      <th scope="col">Prodotto</th>
      <th scope="col">Piattaforma</th>
      <th scope="col">Pezzi disponibili</th>
      <th scope="col">   Azioni</th>
     
    </tr>
  </thead>
  <tbody>
    <%
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Gioco bean = (Gioco) it.next();
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><img src= "img/games/<%=bean.getName()%>/1.jpg" width="115px" height="90px" class="rounded border border-dark"></td>  
			<td><%=bean.getName()%></td>
			<td><%=bean.getPiattaforma()%></td>
			<td><%=bean.getQuantity()%></td>
			
				<td><a class="btn btn-outline-warning" href="ButtonModificaGiocoControl?id=<%=bean.getCode()%>" id="a" > Modifica </a>
				<a class="btn btn-outline-danger" data-toggle="modal" data-target="#example" href=""  id="a" > Elimina </a></td>
		</tr>
		
		<!-- Modal -->
<div class="modal fade" id="example" tabindex="1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Conferma </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Sei sicuro di voler eliminare il gioco dal catalogo ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
        <a class="btn btn-primary" href="ButtonEliminaGiocoControl?id=<%=bean.getCode()%>"> Salva </a>
      </div>
    </div>
  </div>
</div>
		<%
				}
			}%>      
  </tbody>
</table>

</div>
</div>

			
<% if(products==null || products.size()==0){ %>
           <div class="jumbotron jumbotron-fluid">
            <div class="container">
            <%if(search!=null){ %>
            <h1 class="display-4">Risultati della ricerca</h1>
             <p class="lead">Nessun risultato trovato. Esegui un'altra ricerca.</p>
             <p class="lead">Puoi ricercare un prodotto per nome,serialNumber oppure piattaforma</p>
             <%} else{%>
             <h1 class="display-4">Nessun prodotto in magazzino</h1>
              <p class="lead">Inizia ad inserire i prodotti.</p>
              <a class="btn btn-outline-success" href="ButtonInserisciGiocoControl" > Vai all'inserimento </a>
             </div>
             </div>
             <%} }%>

</body>
</html>