package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
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

public class VisualizzaHomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;
	static ImmagineModel immagineModel;

	static {

		immagineModel = new ImmagineModel();
		giocoModel = new GiocoModel();
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

		try {
			/* setta l'attributo products che conterrà tutti i giochi contenuti nel DB */
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
			
			 /*setta l'attributo ImageList che conterrà tutte le immagini dei giochi contenuti nel DB*/
			request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll());
			
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
