package it.gameshub.controller;

import java.io.IOException;
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

@WebServlet("/CercaGiocoUtenteControl")
public class CercaGiocoUtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CercaGiocoUtenteControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Gioco> searchList = new ArrayList<Gioco>();
		String search = (String) request.getParameter("search");

		if (!(search.equals("")) && search != null) {
			Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");

			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				Gioco x = (Gioco) it.next();
				if ((x.getName().indexOf(search)) != -1) { /* Ricerca per nome */
					searchList.add(x);
				} else if ((("" + x.getCode()).indexOf(search)) != -1) { /* Ricerca per serialNumber */
					searchList.add(x);
				} else if ((x.getPiattaforma().indexOf(search)) != -1) { /* Ricerca per piattaforma */
					searchList.add(x);
				}
				else if ((x.getGenere().indexOf(search)) != -1) { /* Ricerca per genere*/
					searchList.add(x);
				}
			}
		}
		request.setAttribute("searchResult", searchList);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SearchGiocoUtente.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
