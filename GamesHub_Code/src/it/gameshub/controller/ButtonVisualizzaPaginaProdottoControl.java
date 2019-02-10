package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.ImmagineModel;

@WebServlet("/ButtonVisualizzaPaginaProdottoControl")
public class ButtonVisualizzaPaginaProdottoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;
	static ImmagineModel immagineModel;

	static {
		immagineModel = new ImmagineModel();
		giocoModel = new GiocoModel();
	}

	public ButtonVisualizzaPaginaProdottoControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String myString = (String) request.getParameter("id");
		request.setAttribute("id", myString);
		try {
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
			request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductPage.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}