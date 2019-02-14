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
import it.gameshub.bean.Carta;
import it.gameshub.bean.Composizione;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.CartaModel;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.OrdineModel;

@WebServlet("/ConcludiAcquistoControl")
public class ConcludiAcquistoControl extends HttpServlet {

	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;
	static GiocoModel giocoModel;
	static CartaModel cartaModel;
	static {

		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
		giocoModel = new GiocoModel();
		cartaModel = new CartaModel();
	}

	public ConcludiAcquistoControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Utente user = (Utente) request.getSession().getAttribute("user");
		Collection<Composizione> listaComp = null;
		float totale = 0;
		int spedizione = 0;
		List<ItemOrder> prodcart = null;
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		Ordine ordine = new Ordine();
		try {
			if (cart != null) {

				if (!cart.isEmpty()) {

					prodcart = cart.getGamesInTheCart();
					/* Calcolo il totale */
					for (ItemOrder beancart : prodcart) {

						totale += beancart.getGioco().getPrice() * beancart.getQuantità();
					}
					totale = totale + ((totale * 22) / 100);
					totale = (float) (Math.ceil(totale * Math.pow(10, 2)) / Math.pow(10, 2));
					String spedizioneS = request.getParameter("spedizione");
					spedizione = Integer.parseInt(spedizioneS);
					ordine.setSpedizione(spedizione);
					totale += spedizione;

					/* Controllo se il saldo è sufficiente */
					Carta carta = cartaModel.getCarta(user.getUsername());
					if (carta.getSaldo() >= totale) {

						/* Sottraggo il totale dalla carta */
						cartaModel.doUpdate(carta.getSaldo() - totale, carta.getNumeroCarta());

						for (ItemOrder beancart : prodcart) {
							/* fa il totale dei prodotti acquistati */
							// Moltiplica il prezzo del prodotto per la sua quantità
							int qty = beancart.getGioco().getQuantity() - beancart.getQuantità();
							/* Aggiorna la quantità disponibile del gioco */
							giocoModel.updateQuantity(beancart.getGioco().getCode(), qty);
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

						// salva l'ordine nel DB
						ordineModel.addOrdine(ordine);
						ordine.setIdOrdine(ordineModel.doMaxIdOrder());

						/*
						 * Dopo aver salvato l'ordine nel DB creiamo e salviamo la composizione
						 * dell'ordine
						 */

						Collection<Immagine> images = (Collection<Immagine>) request.getSession()
								.getAttribute("ImageList");
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

							composizioneModel.addComposizione(comp);

						}

						// listaComp conterrà tutte le composizioni di un ordine
						listaComp = composizioneModel.searchComposizione(ordine.getIdOrdine());
						request.getSession().setAttribute("listaComp", listaComp);
						// Svuoto il carrello
						cart.svuotaCarrello();
						request.getSession().setAttribute("cart", cart);

						request.getSession().setAttribute("products", giocoModel.doRetrieveAll());

						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AcquistoCompletato.jsp");
						dispatcher.forward(request, response);
					} else {
						request.getSession().setAttribute("alert", "Saldo insufficiente");
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CheckoutPage.jsp");
						dispatcher.forward(request, response);
					}
				}
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
