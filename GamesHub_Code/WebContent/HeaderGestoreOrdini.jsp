<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
   
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Utente"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>
          <% Utente user = (Utente)request.getSession().getAttribute("user");%>
          <!--NAVBAR-->
   <div class="fixed-top"> <!-- La navbar si sposta scorrendo la pagina rimanendo sempre al top -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="ButtonHomepageGestoreOrdiniControl"><img src="img/website/logoBianco.png" width="130px"/></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="ButtonHomepageGestoreOrdiniControl">Home <span class="sr-only"></span></a>
          </li>
        
        
           
        </ul>
       
         
          
			<ul class="nav navbar-nav  navbar-right">
				<li class="nav-item dropdown">
				<a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Ciao, <%=user.getNome()%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="ButtonLogoutControl"><span
							class="fa fa-sign-out-alt"></span> Sign Out</a>
						
                          
					</div></li>
				
			</ul> 
       
      </div>
    </nav>
   </div>
    