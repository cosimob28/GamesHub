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

@WebServlet("/InserimentoGiocoControl")
public class InserimentoGiocoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static GiocoModel giocoModel;

	static {

		giocoModel = new GiocoModel();
	}

	public InserimentoGiocoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int inputSerial = Integer.parseInt(request.getParameter("inputSerial"));
		String inputNome = request.getParameter("inputNome");
		String inputGenere = request.getParameter("inputGenere");
		String inputVideo = request.getParameter("inputVideo");
		String inputDescrizione = request.getParameter("inputDescrizione");
		String inputPiattaforma = request.getParameter("inputPiattaforma");
		String prezzo = request.getParameter("inputPrezzo");
		String iva = request.getParameter("inputIva");
		float inputPrezzo = Float.parseFloat(prezzo);
		String quantity = request.getParameter("inputQuantity");
		int inputQuantità = Integer.parseInt(quantity);
		String pegi = request.getParameter("inputPegi");
		int inputPegi = Integer.parseInt(pegi);
		String anno = request.getParameter("inputAnno");
		int inputAnno = Integer.parseInt(anno);

		Gioco bean = new Gioco();
		bean.setCode(inputSerial);
		bean.setName(inputNome);
		bean.setDescription(inputDescrizione);
		bean.setPrice(inputPrezzo);
		bean.setPegi(inputPegi);
		bean.setVideo(inputVideo);
		bean.setAnno(inputAnno);
		bean.setQuantity(inputQuantità);
		bean.setGenere(inputGenere);
		bean.setPiattaforma(inputPiattaforma);

		try {
			giocoModel.saveGame(bean);
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreCatalogo.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
