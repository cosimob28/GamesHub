package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Carrello;
import it.gameshub.model.GiocoModel;

@WebServlet("/ButtonEliminaDalCarrelloControl")
public class ButtonEliminaDalCarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel model;

	static {

		model = new GiocoModel();

	}

	public ButtonEliminaDalCarrelloControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		// Si prende il parametro id dalla richiesta
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			cart.deleteGameInTheCart(model.getGioco(id));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
