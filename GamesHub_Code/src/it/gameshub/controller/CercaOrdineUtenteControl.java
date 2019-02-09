package it.gameshub.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.ItemComp;
import it.gameshub.bean.ItemOrder;

@WebServlet("/CercaOrdineUtenteControl")
public class CercaOrdineUtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CercaOrdineUtenteControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<ItemComp> composizioneOrdini = (Collection<ItemComp>) request.getSession().getAttribute("composizioneOrdini");
		Collection<ItemComp> searchList = new LinkedList<ItemComp>();
		String search = request.getParameter("search");
		if (search != null && composizioneOrdini != null && !search.equals("")) {

			Collection<Composizione> listCompos = null;
			Iterator<?> c = composizioneOrdini.iterator();
			boolean flag;
			while (c.hasNext()) {
				flag = false;
				ItemComp b = (ItemComp) c.next();
				listCompos = b.getCompOrdine();
				Iterator<?> c1 = listCompos.iterator();
				Composizione comp = new Composizione();
				while (c1.hasNext() && flag == false) {
					Composizione cp = (Composizione) c1.next();
					if ((cp.getNomeGioco().indexOf(search)) != -1) {
						searchList.add(b);
						flag = true;
					}
				}
			}

		}
		request.getSession().setAttribute("searchResult", searchList);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SearchResultOrdineUtente.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
