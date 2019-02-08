package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Gioco;
import it.gameshub.model.CartaModel;

@WebServlet("/AggiungiCartaDiCreditoControl")
public class AggiungiCartaDiCreditoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CartaModel cartaModel;

	static {

		cartaModel = new CartaModel();
	}
	public AggiungiCartaDiCreditoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String cardNumber,cardExpiry,username,CVC;
		String risposta=null;
		
		cardNumber = request.getParameter("cardNumber");
		cardExpiry = request.getParameter("cardExpiry");
		CVC = request.getParameter("CVC");
		cardExpiry = cardExpiry.replace(" / ", "");
		username = request.getParameter("username");
		
		long saldo = ThreadLocalRandom.current().nextLong(1000, 5000);
		System.out.println(username+cardExpiry+cardNumber+CVC);
		Carta x = new Carta(cardNumber, CVC, cardExpiry, saldo,username);
		
		try {
			if(cartaModel.existCarta(username))
				cartaModel.deleteCarta(username);
			
			cartaModel.addCarta(x);
			risposta ="OK";
		} 
		catch (MySQLIntegrityConstraintViolationException e) {
			// TODO: handle exception
			risposta ="esistente";
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			risposta="eccezione";
		}
		risposta = "{\"risposta\":" + "\"" + risposta + "\"" + "}";
		response.getWriter().print(risposta);
//		String searchField = request.getParameter("searchField");
//		if (!searchField.isEmpty() || !searchField.equals("")) {
//			Collection<Gioco> prodotti = (Collection<Gioco>) request.getSession().getAttribute("products");
//			ArrayList<Gioco> matchProduct = new ArrayList<Gioco>();
//			Iterator<?> c = prodotti.iterator();
//			while (c.hasNext()) {
//				Gioco game = (Gioco) c.next();
//				if ((game.getName().indexOf(searchField)) != -1) {
//					matchProduct.add(game);
//				}
//			}
//
//			String json = null;
//			if ((matchProduct.size()) != 0) {
//				json = "[";
//				for (Gioco game : matchProduct) {
//					json += "{\"name\":" + "\"" + game.getName() + "\"" + ",\"id\":" + "\"" + game.getCode() + "\""
//							+ "},";
//				}
//				json = json.substring(0, json.length() - 1);
//				json += "]";
//
//			}
//
//			response.getWriter().print(json);
//		} else {
//			response.getWriter().print("null");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

