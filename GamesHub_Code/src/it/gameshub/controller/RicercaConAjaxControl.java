package it.gameshub.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Gioco;

@WebServlet("/RicercaConAjaxControl")
public class RicercaConAjaxControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RicercaConAjaxControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String searchField = request.getParameter("searchField");
		if (!searchField.isEmpty() || !searchField.equals("")) {
			Collection<Gioco> prodotti = (Collection<Gioco>) request.getSession().getAttribute("products");
			ArrayList<Gioco> matchProduct = new ArrayList<Gioco>();
			Iterator<?> c = prodotti.iterator();
			while (c.hasNext()) {
				Gioco game = (Gioco) c.next();
				if ((game.getName().indexOf(searchField)) != -1) {
					matchProduct.add(game);
				}
			}

			String json = null;
			if ((matchProduct.size()) != 0) {
				json = "[";
				for (Gioco game : matchProduct) {
					json += "{\"name\":" + "\"" + game.getName() + "\"" + ",\"id\":" + "\"" + game.getCode() + "\""
							+ "},";
				}
				json = json.substring(0, json.length() - 1);
				json += "]";

			}

			response.getWriter().print(json);
		} else {
			response.getWriter().print("null");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
