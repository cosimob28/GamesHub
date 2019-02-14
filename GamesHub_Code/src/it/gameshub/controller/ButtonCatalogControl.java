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
import it.gameshub.utility.CreateArrayComProduct;


@WebServlet("/ButtonCatalogControl")
public class ButtonCatalogControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel giocoModel;
	static ImmagineModel immagineModel;

	static {

		immagineModel = new ImmagineModel();
		giocoModel = new GiocoModel();
	}
	
    public ButtonCatalogControl() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		Collection<Gioco> products = null;
		Collection<Immagine> images = null;
		
		try {
			/* setta l'attributo products che conterrà tutti i giochi contenuti nel DB */
			request.getSession().setAttribute("products", giocoModel.doRetrieveAll());
			/*
			 * setta l'attributo ImageList che conterrà tutte le immagini dei giochi
			 * contenuti nel DB
			 */
			request.getSession().setAttribute("ImageList", immagineModel.doRetrieveAll());

		}
		catch(Exception e){
			System.out.println("Error:" + e.getMessage());
		}
			images = (Collection<Immagine>) request.getSession().getAttribute("ImageList");
			products = (Collection<Gioco>) request.getSession().getAttribute("products");
			Iterator<Gioco> iter = products.iterator();
			ArrayList<Gioco> listaGiochi = new ArrayList<Gioco>();
			Gioco gioco;
			
           while (iter.hasNext()) {
           gioco = iter.next();
          listaGiochi.add(gioco);
         }
	
		
		request.setAttribute("listaGiochi", listaGiochi);

	    CreateArrayComProduct temp = new CreateArrayComProduct();
	    request.getSession().setAttribute("arrayComProduct", temp.createArray(images, products));
		
		RequestDispatcher dispatcher = (RequestDispatcher) getServletContext().getRequestDispatcher("/Catalog.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
