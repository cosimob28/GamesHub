package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.motif.MotifDesktopIconUI;

import it.gameshub.model.OrdineModel;

/**
 * Servlet implementation class ButtonSalvaModificheGestoreOrdiniControl
 */
@WebServlet("/ButtonSalvaModificheGestoreOrdiniControl")
public class ButtonSalvaModificheGestoreOrdiniControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ButtonSalvaModificheGestoreOrdiniControl() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		int id= Integer.parseInt(request.getParameter("idOrdine"));
		String trackingID= request.getParameter("trackingID");
	    String statoOrdine=request.getParameter("cambiaStatoOrdine");
	    
	    System.out.println(id + " " + trackingID + " " + statoOrdine);
	    
	    OrdineModel model = new OrdineModel();
	    
	    if(trackingID!=null){
	    	try {
				model.addTrackingId(id, trackingID);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	    }
	    if(statoOrdine!=null){
	    	try {
				model.changeOrderState(id, statoOrdine);
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
	    }
	    
	    /* setta l'attributo ordini che conterrà tutti gli ordini contenuti nel DB */
		try {
			request.getSession().setAttribute("ordini", model.getListaOrdini());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreOrdini.jsp");
		dispatcher.forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
