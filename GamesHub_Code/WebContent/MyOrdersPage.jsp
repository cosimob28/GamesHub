<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    Collection<ItemComp> composizioneOrdini = (Collection<ItemComp>) request.getSession().getAttribute("composizioneOrdini");
    Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
    Utente user = (Utente)request.getSession().getAttribute("user");
    ArrayList<ItemOrder> arrayComProduct = (ArrayList<ItemOrder>) request.getSession().getAttribute("arrayComProduct");
    if(user==null){
    	   String alert ="Effettua il login";
           request.getSession().setAttribute("alert",alert);
    	   RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
		   dispatcher.forward(request, response);
		   return;
    } 
%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Utente,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder,it.gameshub.bean.Immagine,it.gameshub.bean.Composizione,it.gameshub.bean.Ordine,it.gameshub.bean.ItemComp"%>

<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">


 <title>I miei ordini</title>
  
    <link rel="stylesheet" href="css/styleOrderPage.css" >
	 <link rel="stylesheet" href="css/fontawesome-all.css" > 
	<link rel="stylesheet" href="css/bootstrap.min.css" >
  	<link href="css/site.css" rel="stylesheet" type="text/css">
	<link href="css/homepage.css" rel="stylesheet" type="text/css">	
	<link href="css/footer.css" rel="stylesheet" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
   
</head>

<body>
    <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>

    <!-- NAVBAR -->
    <jsp:include page="HeaderUserLogged.jsp"/>
    
    <%String titolo = "I miei ordini"; %>
    
     <!-- Codice search -->
   <% 
   String search= request.getParameter("search");
   if(search!=null && composizioneOrdini!= null){
	   
   titolo ="Risultati della ricerca";
   
  

   Collection<ItemComp> searchList =  new LinkedList<ItemComp>();
   Collection<Composizione> listCompos =null;
   Iterator<?> c = composizioneOrdini.iterator();
   boolean flag;
	while (c.hasNext()) 
	{
		flag= false;
		ItemComp b = (ItemComp) c.next();
		listCompos = b.getCompOrdine();
		Iterator<?> c1 = listCompos.iterator();
		Composizione comp= new Composizione();
		  while(c1.hasNext() && flag==false)
		  {
			  Composizione cp = (Composizione) c1.next();
			  if((cp.getNomeGioco().indexOf(search))!=-1){
				  searchList.add(b);
				   flag=true;
			  }
		  }
	}
	
	composizioneOrdini= searchList;
	
   
	} %> 
 
    
 <%if(composizioneOrdini!= null && composizioneOrdini.size()!=0){ %> 
 
	 <div class="intestazione">
		<h1 class="display-5"><%=titolo %></h1>
	
		<hr></hr>
	    <form class="form-inline my-2 my-lg-0" action="CercaOrdineUtenteControl" method="post" >
          <input class="form-control mr-sm-2" type="search" placeholder="Ricerca per titolo" aria-label="Search" name="search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
		</div>
	
		
		<% Iterator<?> it = composizioneOrdini.iterator();
		  Collection<Composizione> listComp =null;
		  ItemComp z=null;
		  while (it.hasNext()) {
			    z = (ItemComp) it.next();
		       Ordine ordine = z.getOrdine();
		        listComp = z.getCompOrdine();
                 
		  
 %>
    
	
	
	<div class= "orderContainer">
	
	<!--Tabella ordine-->
	<div class="table-responsive">
	<div class="tableColor">
<table class="table table-borderless ">
  <thead>
    <tr>
      <th scope="col">Ordine effettuato il:</th>
      <th scope="col">Totale</th>
      <th scope="col">Indirizzo:</th>
      <th scope="col">Ordine #</th>
       <th scope="col">Stato</th>
          <th scope="col">Tracking ID</th>
            </tr>
  </thead>
  <tbody>
  
    <tr>
      <td scope="row"><%=ordine.getDataOrdine() %></td>
      
      <td><%=ordine.getImporto()%> €</td>
      <td><%=ordine.getIndirizzo() %></td>
      <td><%=ordine.getIdOrdine()%></td>
       <td><%=ordine.getStato()%></td>
       <%if (ordine.getTrackingId()!=null){%>
        <td><%=ordine.getTrackingId()%></td>
        <%}else{ %>
         <td>Non ancora disponibile</td>
           <%}%>
    </tr>
   
    
  </tbody>
</table>
</div>
</div>

<!--Tabella prodotti dell'ordine-->
<div class="table-responsive">
<table class="table table-borderless">
  <thead>
    <tr>
      <th scope="col">Prodotti:</th>
      <th scope="col"></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
  
 <% Iterator<?> it1 = listComp.iterator();
  Composizione comp= new Composizione();
  while(it1.hasNext()){
     boolean trovato=false;
    comp = (Composizione) it1.next();
     int quantity=0;
	    	 for(ItemOrder x: arrayComProduct){
				   if(comp.getGioco()==x.getGioco().getCode()){
					   quantity=x.getGioco().getQuantity();
					  trovato=true;
				   }
	    	  }
	     
	   %>
    <tr>
      <td><img src="<%=comp.getImmagine()%>" width="110" height="90" class="rounded border border-dark"> </td>
      <td class="nome"><%=comp.getNomeGioco()%></td>
      <td></td>
      <%if (trovato==true && quantity!=0) {%>
       <form action="ButtonAggiungiAlCarrelloControl" method="POST" >
       <td style=" display: block;">
       <button type="submit" name="id" value="<%=comp.getGioco()%>" class="btn btn-warning addCart " >
                             <span class="fa fa-shopping-cart"></span> Compralo di nuovo </button></td> 
           </form>              
                             
      <%}else {%>
      <td><button class="btn  btn-danger " role="alert">Prodotto non disponibile! <span class="fa fa-exclamation-circle"></span></button></td>
       <% }%>
       <td></td>
    </tr>
    <% }%> 
    <tr>
      <td></td>
      <td></td>
      <td></td>
       <%if (!ordine.getStato().equals("confermato")) {%>
       <td><button type="button" class="btn btn-secondary ">
                             <span class="fa fa-trash-alt "></span> Annulla ordine </button></td>
      <td style=" display: block;"><button type="button" class="btn btn-primary " onclick="window.open('ButtonVisualizzaFatturaControl?id=<%=ordine.getIdOrdine()%>');">
                             <span class="fa fa-file-invoice-dollar"></span> Visualizza fattura </button></td>
                             <%}else{ %>
                             <form action="ButtonAnnullaOrdineControl" method="POST" >
                   <td><button type="submit" name="id"  class="btn btn-danger "  value="<%=ordine.getIdOrdine()%>">
                             <span class="fa fa-trash-alt "></span> Annulla ordine </button></td>
                             </form>
      <td style=" display: block;"><button type="button" class="btn btn-secondary ">
                             <span class="fa fa-file-invoice-dollar"></span> Visualizza fattura </button></td>           
      <%} %>
    </tr>
  </tbody>

</table>
</div>
</div>
<% } }  %>

<% if(composizioneOrdini==null || composizioneOrdini.size()==0){ %>
           <div class="jumbotron jumbotron-fluid">
            <div class="container">
            <h1 class="display-4"><%=titolo %></h1>
            <p class="lead">Non hai effettuato nessun ordine.</p>
            <hr class="my-4">
            <p>Inizia a fare shopping e cerca il pulsante "Aggiungi al carrello".</p>
             
            <button type="button" class="btn btn-default" id="home" onclick="location.href='ButtonHomeControl';">
                             <span class="fa fa-cart-plus"></span> Continue Shopping  </button>
           
             </div>
           </div>
<%} %>
	
	
	<jsp:include page="Footer.jsp"/>
	 <script>
        $(document).ready(function(){
        	
        	 $(".addCart").click(function(e){
 				var id= $(this).attr('id');
 				var xhttp = new XMLHttpRequest();

 				$.get("ButtonAggiungiAlCarrelloControl?id="+id, function() {
 					});
 					
 			});
        })          	       
     </script>    
        

</body>
</html>