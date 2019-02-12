package it.gameshub.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import it.gameshub.bean.Utente;
import it.gameshub.model.UtenteModel;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModel model;

	static {

		model = new UtenteModel();

	}

	public LoginControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int option = 0;
		Boolean isGestoreCatalogo = null;
		Boolean isGestoreOrdini = null;
		String username = request.getParameter("userid");
		String password = request.getParameter("passid");
		password = DigestUtils.md5Hex(password);
//		System.out.println(password);
		try {
			// controllo se c'è un utente con l'username passato come parametro
			if (model.isAnUser(username)) {
				Utente user = model.getUser(username);
				if (user.isVerificato()) {
//					System.out.println(user.getPin());
					if (user.getPin().equals(password)) { // Se la password è corretta
						// Essendo che nome e password coincidono salvo l'utente nella sessione
						request.getSession().setAttribute("user", user);
						if (user.getTipo().equals("Gestore catalogo")) {
							isGestoreCatalogo = true;
							request.getSession().setAttribute("isGestoreCatalogo", isGestoreCatalogo);
							option = 1;
						} else if (user.getTipo().equals("Gestore ordini")) {
							isGestoreOrdini = true;
							request.getSession().setAttribute("isGestoreOrdini", isGestoreOrdini);
							option = 2;
						} else {
							isGestoreCatalogo = false;
							isGestoreOrdini = false;
							request.getSession().setAttribute("isGestoreCatalogo", isGestoreCatalogo);
							request.getSession().setAttribute("isGestoreOrdini", isGestoreOrdini);
							option = 3; // Vado alla home page per l'utente normale
						}
					}
					// Altrimenti se la password è errata
					else {
						String alert = "Password Errata ";
						request.getSession().setAttribute("alert", alert);
						option = 4;
					}
				}else {
					String alert = "Verifica prima la tua e-mail ";
					request.getSession().setAttribute("alert", alert);
					option = 4;
				}
			}
			/*
			 * Se l'userName passato non corrisponde con nessun utente nel DB allora
			 * l'utente non è registrato
			 */
			else if (!(model.isAnUser(username))) {
				String alert = "Utente non registrato ";
				request.getSession().setAttribute("alert", alert);
				option = 4;
			}
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}

		System.out.println(option);
		if (option == 1) { // caso in cui l'utente è un Gestore catalogo
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreCatalogo.jsp");
			dispatcher.forward(request, response);
		} else if (option == 2) { // caso in cui l'utente è un Gestore ordini
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreOrdini.jsp");
			dispatcher.forward(request, response);
		} else if (option == 3) { // caso in cui l'utente è registrato ma non è un gestore
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
			dispatcher.forward(request, response);
		} else if (option == 4) { // caso in cui l'utente non è registrato oppure la password è errata
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginForm.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
