package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Utente;
import it.gameshub.model.UtenteModel;

@WebServlet("/EmailControl")
public class EmailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UtenteModel model;

	static {

		model = new UtenteModel();

	}

	public EmailControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String avviso = "false";
		String email = request.getParameter("email");
		if (email.equals("") || email == null)
			avviso = "vuoto";
		
		else if (email.matches(".*\\s+.*")) // Espressione per controllare la presenza di spazi
			avviso = "spazio";

		Collection<Utente> users = null;
		try {
			users = (Collection<Utente>) model.getAllUsers(null);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		Iterator<?> it = users.iterator();
		while (it.hasNext() && !avviso.equals("vuoto")) {
			Utente x = (Utente) it.next();
			if (email.equals(x.getEmail())) {
				avviso = "true";
				break;
			}
		}
		String json = "{'avviso':'" + avviso + "'}";
		response.getWriter().print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
