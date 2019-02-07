package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Utente;
import it.gameshub.model.UtenteModel;

@WebServlet("/ModificaDatiAreaPersonaleControl")
public class ModificaDatiAreaPersonaleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UtenteModel model;

	static {

		model = new UtenteModel();
	}

	public ModificaDatiAreaPersonaleControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente user = (Utente) request.getSession().getAttribute("user");
		
		String telefono = request.getParameter("inputTelefono");
		if (telefono != null && !telefono.equals(""))
			user.setTelefono(telefono);

		String indirizzo = request.getParameter("inputIndirizzo");
		if ( indirizzo!= null && !indirizzo.equals(""))
			user.setIndirizzoSpedizione(indirizzo);

		String password = request.getParameter("password");
		if (password != null && !password.equals("")) {
			user.setPin(password);
		}


		try {
			model.doUpdate(user.getUsername(),user.getPin(),user.getTelefono(),user.getIndirizzoSpedizione());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("user",user);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
