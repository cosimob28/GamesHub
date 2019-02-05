package it.gameshub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Carrello;


@WebServlet("/UpdateCartQuantityControl")
public class UpdateCartQuantityControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateCartQuantityControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		float price = 0;
		float totale = 0;
		String idPrezzo = "";
		String codice = request.getParameter("code");
		int code = Integer.parseInt(codice);
		String avviso = "false";
		int qty = 1;
		String quantità = request.getParameter("quantita"); // se nullo genera eccezione
		if (quantità.isEmpty()) {
			qty = 1;
		} else {
			qty = Integer.parseInt(quantità);
			if (qty < 1) {
				qty = 1;
				avviso = "Quantità inferiore a 1";
			}

			Carrello cart = (Carrello) request.getSession().getAttribute("cart");
			ArrayList<ItemOrder> list = (ArrayList<ItemOrder>) cart.getGamesInTheCart();

			for (ItemOrder x : list) {
				if (code == x.getGioco().getCode()) {

					// se qty è maggiore della quantità disponibile di quel prodotto allora qty lo
					// si pone uguale alla quantità massima
					if (x.getGioco().getQuantity() < qty) {
						qty = x.getGioco().getQuantity();
						avviso = "Quantità non disponibile";
					}
					x.setQuantità(qty);
					price = x.getQuantità() * x.getGioco().getPrice();
					break;
				}
			}
			price = price + ((price * 22) / 100);
			price = (float) (Math.ceil(price * Math.pow(10, 2)) / Math.pow(10, 2));
			cart.setGames(list);
			request.getSession().setAttribute("cart", cart);

			totale = cart.getTotale();
			idPrezzo = "prezzo" + code;

		}
		String json = "{'code':'" + code + "','idPrezzo':'" + idPrezzo + "','price':'" + price + "','totale':'" + totale
				+ "','quantity':'" + qty + "','avviso':'" + avviso + "'}";
		response.getWriter().print(json);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
