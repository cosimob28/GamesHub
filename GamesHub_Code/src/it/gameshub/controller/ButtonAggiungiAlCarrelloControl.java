package it.gameshub.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ButtonAggiungiAlCarrelloControl extends HttpServlet {

       
	
    public ButtonAggiungiAlCarrelloControl() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//Aggiungere la pagina d'inoltro della richiesta.
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
