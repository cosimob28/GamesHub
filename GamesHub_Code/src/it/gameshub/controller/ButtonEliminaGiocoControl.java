package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.model.GiocoModel;
import it.gameshub.model.ImmagineModel;

@WebServlet("/ButtonEliminaGiocoControl")
public class ButtonEliminaGiocoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;

	static {

		giocoModel = new GiocoModel();
	}

	public ButtonEliminaGiocoControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String parametro = request.getParameter("id");
		if (parametro != null && !(parametro.equals(""))) {
			int id = Integer.parseInt(parametro);
			try {
				giocoModel.deleteGame(id);
				request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreCatalogo.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
