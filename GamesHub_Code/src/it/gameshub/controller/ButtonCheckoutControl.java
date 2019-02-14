package it.gameshub.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Carrello;

@WebServlet("/ButtonCheckoutControl")
public class ButtonCheckoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ButtonCheckoutControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CheckoutPage.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
