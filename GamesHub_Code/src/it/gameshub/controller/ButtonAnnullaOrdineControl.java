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

import it.gameshub.bean.Composizione;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.ItemComp;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.OrdineModel;

@WebServlet("/ButtonAnnullaOrdineControl")
public class ButtonAnnullaOrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;
	static GiocoModel giocoModel;
	static {

		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
		giocoModel = new GiocoModel();
	}

	public ButtonAnnullaOrdineControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente user = (Utente) request.getSession().getAttribute("user");
		try {

			int id = Integer.parseInt(request.getParameter("id"));
			Ordine ordine = ordineModel.getOrder(id);

			Collection<Composizione> compOrdine = composizioneModel.searchComposizione(ordine.getIdOrdine());
			Iterator<?> it = compOrdine.iterator();
			while (it.hasNext()) {
				Composizione x = (Composizione) it.next();
				Gioco y = giocoModel.getGioco(x.getGioco());
				int qty = y.getQuantity() + x.getQuantità();
				giocoModel.updateQuantity(y.getCode(), qty);

			}
			/* Elimino la composizione dell'ordine dal DB */
			composizioneModel.deleteComposizione(ordine.getIdOrdine());
			/* Elimino l'ordine dal DB */
			ordineModel.deleteOrdine(id);

			Collection<Ordine> ordiniUtente = ordineModel.getListaOrdiniUtente(user);
			request.getSession().setAttribute("ordiniUtente", ordiniUtente);

			ArrayList<ItemComp> composizioneOrdini = new ArrayList<ItemComp>();

			if (ordiniUtente != null && ordiniUtente.size() != 0) {

				it = ordiniUtente.iterator();
				while (it.hasNext()) {
					Ordine x = (Ordine) it.next();
					ItemComp y = new ItemComp();
					 compOrdine = composizioneModel.searchComposizione(x.getIdOrdine());
					y.setCompOrdine(compOrdine);
					y.setOrdine(x);
					composizioneOrdini.add(y);
				}
			}
			request.getSession().setAttribute("composizioneOrdini", composizioneOrdini);
		} catch (NumberFormatException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		try {
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
