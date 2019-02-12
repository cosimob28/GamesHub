package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Ordine;
import it.gameshub.model.OrdineModel;


@WebServlet("/CercaGestioneOrdiniControl")
public class CercaGestioneOrdiniControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CercaGestioneOrdiniControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idOrdine = request.getParameter("idOrdine");
		String annoOrdine= request.getParameter("annoOrdine");
		String statoOrdine= request.getParameter("statoOrdine");
		
	    OrdineModel model = new OrdineModel();
	    
	    System.out.println(idOrdine + " " + annoOrdine + " " + statoOrdine);
	    
	    Collection<Ordine> listaOrdini = null;
	    try {
		listaOrdini =	model.getListaOrdini(idOrdine, annoOrdine, statoOrdine);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    request.setAttribute("listaOrdini", listaOrdini);
	    RequestDispatcher dispatcher = (RequestDispatcher) getServletContext().getRequestDispatcher("/HomeGestoreOrdini.jsp");
		dispatcher.forward(request, response);
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
