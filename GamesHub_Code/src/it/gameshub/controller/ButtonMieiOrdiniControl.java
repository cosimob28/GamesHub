package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.ItemComp;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.bean.Composizione;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.OrdineModel;

@WebServlet("/ButtonMieiOrdiniControl")
public class ButtonMieiOrdiniControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;

	static {

		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
	}

	public ButtonMieiOrdiniControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente user = (Utente) request.getSession().getAttribute("user");
		Collection<Ordine> ordiniUtente;
		try {
			// Prelevo dal DB tutti gli ordini effettuati dall'utente
			ordiniUtente = ordineModel.getListaOrdiniUtente(user);
			request.getSession().setAttribute("ordiniUtente", ordiniUtente);

			ArrayList<ItemComp> composizioneOrdini = new ArrayList<ItemComp>();

			if (ordiniUtente != null && ordiniUtente.size() != 0) {

				Iterator<?> it = ordiniUtente.iterator();
				while (it.hasNext()) {
					Ordine x = (Ordine) it.next();
					ItemComp y = new ItemComp();
					Collection<Composizione> compOrdine = composizioneModel.searchComposizione(x.getIdOrdine());
					y.setCompOrdine(compOrdine);
					y.setOrdine(x);
					composizioneOrdini.add(y);
				}
			}
			request.getSession().setAttribute("composizioneOrdini", composizioneOrdini);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MyOrdersPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
