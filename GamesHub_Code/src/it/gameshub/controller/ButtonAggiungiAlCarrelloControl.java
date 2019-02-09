package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Carrello;
import it.gameshub.model.GiocoModel;

@WebServlet("/ButtonAggiungiAlCarrelloControl")
public class ButtonAggiungiAlCarrelloControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static GiocoModel model;

	static {

		model = new GiocoModel();

	}

	public ButtonAggiungiAlCarrelloControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Prelevo il carrello dalla sessione
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		// Si prende il parametro id dalla richiesta
		String id_gioco = (String) request.getParameter("id");
		if (!id_gioco.equals("") && id_gioco != null) {
			int id = Integer.parseInt(id_gioco);
			try {
				// aggiunge al carrello il gioco selezionato
				cart.addProduct(new ItemOrder(model.getGioco(id)));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
              
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
