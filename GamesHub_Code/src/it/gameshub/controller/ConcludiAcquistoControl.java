package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Carrello;
import it.gameshub.bean.Composizione;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
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

		float totale = 0;
		List<ItemOrder> prodcart = null;
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		Ordine ordine = new Ordine();
		if (cart != null) {

			if (!cart.isEmpty()) {

				/* il carrello è una lista di itemOrder */
				/*
				 * itemOrder è una classe utilizzata per rappresentare un ordine temporaneo(cioè
				 * non ancora acquistato)
				 */
				prodcart = cart.getGamesInTheCart();
				for (ItemOrder beancart : prodcart) {
					/* fa il totale dei prodotti acquistati */
					// Moltiplica il prezzo del prodotto per la sua quantità

					totale += beancart.getGioco().getPrice() * beancart.getQuantità();
					System.out.println(beancart.getGioco().getName());
					System.out.println(totale);
				}
				totale = totale + ((totale * 22) / 100);
				totale = (float) (Math.ceil(totale * Math.pow(10, 2)) / Math.pow(10, 2));
				String spedizione = request.getParameter("spedizione");
				totale += Integer.parseInt(spedizione);

			}
		}
		if (request.getParameter("group1") != null) {
			if (request.getParameter("group1").equals("currentAddress")) {
				ordine.setIndirizzo(user.getIndirizzoSpedizione());
			}
		} else {
			String addr = (String) request.getParameter("address");
			String città = (String) request.getParameter("city");
			ordine.setIndirizzo(addr + ", " + città);
		}
		ordine.setDataOrdine(new java.sql.Date(System.currentTimeMillis()));
		ordine.setImporto(totale);
		ordine.setUtente(user.getUsername());
		try {
			// salva l'ordine nel DB
			ordineModel.addOrdine(ordine);
			ordine.setIdOrdine(ordineModel.doMaxIdOrder());
		} catch (SQLException e) {

			e.printStackTrace();
		}

		/*
		 * Dopo aver salvato l'ordine nel DB creiamo e salviamo la composizione
		 * dell'ordine
		 */
		Collection<Composizione> listaComp = null;
		Collection<Immagine> images = (Collection<Immagine>) request.getSession().getAttribute("ImageList");
		// Crea composizione
		Composizione comp = new Composizione();

		for (ItemOrder beancart : prodcart) {
			comp.setCosto((beancart.getGioco().getPrice() * beancart.getQuantità())/* +iva */);
			comp.setQuantità(beancart.getQuantità());
			comp.setOrdine(ordine.getIdOrdine());
			comp.setGioco(beancart.getGioco().getCode());
			comp.setNomeGioco(beancart.getGioco().getName());
			Iterator<?> it = images.iterator();
			Immagine image = null;
			boolean trovato = false;
			while (it.hasNext() && trovato == false) {
				image = (Immagine) it.next();
				if (image.getGame() == beancart.getGioco().getCode()) {
					comp.setImmagine(image.getName());
					trovato = true;
				}

			}
			try {
				composizioneModel.addComposizione(comp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			// listaComp conterrà tutte le composizioni di un ordine
			listaComp = composizioneModel.searchComposizione(ordine.getIdOrdine());
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("listaComp", listaComp);
		// Svuoto il carrello
		cart.svuotaCarrello();
		request.getSession().setAttribute("cart", cart);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
