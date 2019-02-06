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


@WebServlet("/CatalogControl")
public class CatalogControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CatalogControl() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String genere = (String)request.getParameter("genere");
		String platform = (String)request.getParameter("platform");
		
		System.out.println("OKOK");
		Collection<Gioco> products = (Collection<Gioco>) request.getSession().getAttribute("products");
		Iterator<Gioco> iter = products.iterator();
		ArrayList<Gioco> listaGiochi = new ArrayList<Gioco>();
		Gioco gioco ;
		
		while(iter.hasNext()){
			
			gioco = iter.next();
			
			
			if(genere!=null){
				if(gioco.getGenere().equalsIgnoreCase(genere)){
					listaGiochi.add(gioco);
				}
			}
			else{
				if(gioco.getPiattaforma().equalsIgnoreCase(platform)){
					listaGiochi.add(gioco);
				}
			}
			
		}
		
		request.setAttribute("listaGiochi", listaGiochi);
		 
		
        RequestDispatcher dispatcher = (RequestDispatcher) getServletContext().getRequestDispatcher("/Catalog.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
