package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Carrello;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.OrdineModel;

@WebServlet("/ConcludiAcquistoControl")
public class ConcludiAcquistoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;

	static {

		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
	}

	public ConcludiAcquistoControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente user = (Utente) request.getSession().getAttribute("user");
		/*
		 * String inputNome = request.getParameter("city"); Enumeration<String> x =
		 * request.getParameterNames();
		 * 
		 * while(x.hasMoreElements()) { String f = x.nextElement();
		 * System.out.println(f); }
		 */
		float totale = 0;
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		Ordine ordine = new Ordine();
		if (cart != null) {
			System.out.println("OK1");
			if (!cart.isEmpty()) {
				System.out.println("OK2");
				/* il carrello è una lista di itemOrder */
				/*
				 * itemOrder è una classe utilizzata per rappresentare un ordine temporaneo(cioè
				 * non ancora acquistato)
				 */
				List<ItemOrder> prodcart = cart.getGamesInTheCart();
				for (ItemOrder beancart : prodcart) {
					/* fa il totale dei prodotti acquistati */
					// Moltiplica il prezzo del prodotto per la sua quantità
					System.out.println("OK3");
					totale += beancart.getGioco().getPrice() * beancart.getQuantità();
					System.out.println(beancart.getGioco().getName());
					System.out.println(totale);
				}
			}
		}
		totale = totale + ((totale * 22) / 100);
		totale = (float) (Math.ceil(totale * Math.pow(10, 2)) / Math.pow(10, 2));
		ordine.setDataOrdine(new java.sql.Date(System.currentTimeMillis()));
		ordine.setImporto(totale);
		ordine.setUtente(user.getUsername());
		try {
			// salva l'ordine nel DB
			ordineModel.addOrdine(ordine);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		request.getSession().removeAttribute("cart");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
