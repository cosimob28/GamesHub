package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Gioco;
import it.gameshub.model.GiocoModel;
@WebServlet("/ConcludiAcquistoControl")
public class ConcludiAcquistoControl extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	static GiocoModel model;
	
	static {
		
			model = new GiocoModel();

	}
	
	public ConcludiAcquistoControl() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputNome = request.getParameter("city");
		Enumeration<String> x = request.getParameterNames();
		
		while(x.hasMoreElements()) {
			String f = x.nextElement();
			System.out.println(f);
		}
		
		
//		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomeGestoreCatalogo.jsp");
//		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
	
	
}
