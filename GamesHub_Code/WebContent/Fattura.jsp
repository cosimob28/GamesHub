
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Utente, it.gameshub.bean.ItemOrder,it.gameshub.bean.Ordine,it.gameshub.bean.Composizione"%>

<% Collection<Composizione> listaComp = (Collection<Composizione>) request.getSession().getAttribute("listaComp"); 
Collection<Gioco> products = (Collection<Gioco>) request.getSession().getAttribute("products");
Ordine order = (Ordine) request.getSession().getAttribute("ordine");
Utente user = (Utente)request.getSession().getAttribute("user");


/* PARTE NUOVA */
boolean authUser = order.getUtente().equals(user.getUsername()); //controlla se l'ordine è dell'utente loggato

if(!authUser){
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
	   	dispatcher.forward(request, response);
	   	return;
}

/* FINE PARTE NUOVA */

%>
		 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name ="viewport" content = "width=device-width,initial-scale=1.0">
	<link rel="stylesheet" href="css/Fattura.css" type="text/css">
	<link rel="icon" href="img/website/favicon.png">
   <TITLE>Fattura</TITLE>
 </HEAD>
<BODY BGCOLOR="#FDF5E6">
<H1 ALIGN="CENTER">Fattura</H1>



  <header class="clearfix">
      <div id="logo">
        <img src="img/website/logoNero.png">
      </div>
      <h1>Fattura del <%=order.getDataOrdine()%></h1>
      <div id="company" class="clearfix">
        <div>GamesHub</div>
        <div>45 via Giovanni Paolo II,<br /> SA 84084, IT</div>
        <div>0975 251262</div>
        <div>Gameshub2019@gmail.com</div>
      </div>
      <div id="project">
        <div><span>CLIENTE</span><%=user.getNome()%> <%=user.getCognome() %></div>
        <div><span>INDIRIZZO</span><%=order.getIndirizzo()%></div>
        <div><span>EMAIL</span> <a href="mailto:<%=user.getEmail()%>"><%=user.getEmail()%></a></div>
        <div><span>TELEFONO</span> <%=user.getTelefono()%></div>
         <div><span>C.F</span><%=user.getCodiceFiscale()%></div>
      </div>
    </header>
   
    <main>
    <div style="margin-top:100px;"></div>
    
      <table>
        <thead>
          <tr>
            <th class="service">PRODOTTO</th>
            <th class="desc">DESCRIZIONE</th>
            <th class="unit">PREZZO UNITARIO</th>
            <th class="qty">QUANTITA'</th>
            <th class="total">TOTALE</th>
          </tr>
        </thead>
        
        
        <tbody>
      <%
      int iva=0;
      float total=0;
      for(Composizione comp: listaComp) {
    	  if(iva==0) iva= 22;
       %>
          <tr>
            <td class="service"><%=comp.getNomeGioco()%></td>
            <td class="desc">Gioco per console/pc</td>
            <%float prezzoUnitario=comp.getCosto()/comp.getQuantità();
            System.out.println(prezzoUnitario);
            prezzoUnitario = (float) (Math.ceil(prezzoUnitario*Math.pow(10,2))/Math.pow(10,2));
            System.out.println(prezzoUnitario);
            %>
            <td class="unit">€<%=prezzoUnitario%></td>
            <td class="qty"><%=comp.getQuantità() %></td>
            <td class="total">€<%=comp.getCosto() %></td>
          </tr>
          <%total += (comp.getCosto());
          %>
       <%} %> 
          <tr>
            <td colspan="4">IMPONIBILE</td>
             <% total = (float) (Math.ceil(total*Math.pow(10,2))/Math.pow(10,2));%>
            <td class="total">€<%=total%></td>
          </tr> 
          <tr>
            <td colspan="4">SPEDIZIONE</td>
             <% int spedizione = order.getSpedizione();%>
            <td class="total">€<%=spedizione%></td>
          </tr> 
          <tr>
            <td colspan="4">IVA <%=iva%>%</td>
              <%float totIva=(total*iva)/100; 
               totIva = (float) (Math.ceil(totIva*Math.pow(10,2))/Math.pow(10,2));%><!-- Per arrotondare a due cifre decimali -->
            <td class="total">€<%=totIva%></td>
          </tr>
          <tr>
            <td colspan="4" class="grand total">TOTALE FINALE</td>
            
            <td class="TOTALE">€ <%=order.getImporto()%></td>
          </tr>
        </tbody>
      </table>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">Grazie per aver acquistato su GamesHub</div>
      </div>
     </main> 
    <footer>
     La fattura è stata creata da un computer ed è valida senza firma e sigillo.
    </footer>
</body>


<!-- Rimuove sia ordine che listaComposizione dalla sessione (usati per creare la fattura) -->
 <%request.getSession().removeAttribute("ordine");
   request.getSession().removeAttribute("listaComp"); %>
 

</html>