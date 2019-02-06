package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Gioco;
import it.gameshub.model.GiocoModel;

@WebServlet("/ModificaGiocoControl")
public class ModificaGiocoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;

	static {

		giocoModel = new GiocoModel();
	}

	public ModificaGiocoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Gioco ProdottoDaModificare = (Gioco) request.getSession().getAttribute("ProdottoDaModificare");

		String inputVideo = request.getParameter("inputVideo");
		if (inputVideo != null && !inputVideo.equals(""))
			ProdottoDaModificare.setVideo(inputVideo);

		String inputDescrizione = request.getParameter("inputDescrizione");
		if (inputDescrizione != null && !inputDescrizione.equals(""))
			ProdottoDaModificare.setDescription(inputDescrizione);

		String prezzo = request.getParameter("inputPrezzo");
		float inputPrezzo = 0;
		if (prezzo != null && !prezzo.equals("")) {
			inputPrezzo = Float.parseFloat(prezzo);
			ProdottoDaModificare.setPrice(inputPrezzo);
		}

		String quantity = request.getParameter("inputQuantity");
		int inputQuantità = 0;
		if (quantity != null && !quantity.equals("")) {
			inputQuantità = Integer.parseInt(quantity);
			ProdottoDaModificare.setQuantity(inputQuantità);
		}

		try {
			giocoModel.updateGame(ProdottoDaModificare.getCode(), ProdottoDaModificare.getVideo(),
					ProdottoDaModificare.getDescription(), ProdottoDaModificare.getPrice(),
					ProdottoDaModificare.getQuantity());
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// A modifica completata elimino il prodotto dalla sessione e ritorno al catalogo
		request.getSession().removeAttribute("ProdottoDaModificare");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreCatalogo.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
