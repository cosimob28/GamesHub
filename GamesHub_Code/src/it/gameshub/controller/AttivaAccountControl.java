package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.model.UtenteModel;

@WebServlet("/AttivaAccountControl")
public class AttivaAccountControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModel model;

	static {

		model = new UtenteModel();

	}

	public AttivaAccountControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("key1");
		String hash = request.getParameter("key2");
		
		try {
			if (model.activateUser(email, hash) == true) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
				dispatcher.forward(request, response);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
