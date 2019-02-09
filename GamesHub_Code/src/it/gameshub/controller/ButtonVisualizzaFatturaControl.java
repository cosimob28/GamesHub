package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.Ordine;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.OrdineModel;

@WebServlet("/ButtonVisualizzaFatturaControl")
public class ButtonVisualizzaFatturaControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel ordineModel;
	static ComposizioneModel composizioneModel;

	static {

		ordineModel = new OrdineModel();
		composizioneModel = new ComposizioneModel();
	}

	public ButtonVisualizzaFatturaControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String parametro = request.getParameter("id");
			int idOrdine = Integer.parseInt(parametro);
			int maxOrdine = ordineModel.doMaxIdOrder();
			if ((idOrdine <= maxOrdine) && (idOrdine >= 1)) { // controllo se l'idOrdine esiste nel DB
				Ordine ordine = ordineModel.getOrder(idOrdine);
				request.getSession().setAttribute("ordine", ordine);
				Collection<Composizione> listaComp = composizioneModel.searchComposizione(ordine.getIdOrdine());
				request.getSession().setAttribute("listaComp", listaComp);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Fattura.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
				dispatcher.forward(request, response);

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
