package it.gameshub.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Carrello;
import it.gameshub.bean.Gioco;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.ImmagineModel;
import it.gameshub.model.OrdineModel;

public class VisualizzaHomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;
	static OrdineModel ordineModel;
	static ImmagineModel immagineModel;

	static {

		immagineModel = new ImmagineModel();
		giocoModel = new GiocoModel();
		ordineModel= new OrdineModel();
		}

	public VisualizzaHomeControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* setta il carrello nella sessione */
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		//Calendar cal = Calendar.getInstance();
		//System.out.println(cal.getTime().getDate());
		System.out.println( new java.sql.Date(System.currentTimeMillis()));
		try {
			/* setta l'attributo products che conterrà tutti i giochi contenuti nel DB */
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
			
			 /*setta l'attributo ImageList che conterrà tutte le immagini dei giochi contenuti nel DB*/
			request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll());
			
			/* setta l'attributo ordini che conterrà tutti gli ordini contenuti nel DB */
			request.getSession().setAttribute("ordini", ordineModel.getListaOrdini());
			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());

		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
