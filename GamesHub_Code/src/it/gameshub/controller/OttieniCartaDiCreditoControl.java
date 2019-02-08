package it.gameshub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gameshub.bean.Carta;
import it.gameshub.model.CartaModel;
import it.gameshub.model.GiocoModel;

/**
 * Servlet implementation class OttieniCartaDiCreditoControl
 */
@WebServlet("/OttieniCartaDiCreditoControl")
public class OttieniCartaDiCreditoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CartaModel cartaModel;

	static {

		cartaModel = new CartaModel();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OttieniCartaDiCreditoControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String user = (String) request.getParameter("username");
		
		Carta x = null;
		String json=null;
		
			try {
				if(cartaModel.existCarta(user)) {
					System.out.println("TROVATA");
					x = cartaModel.getCarta(user);
					System.out.println(x);
					json = "{\"numero\":" + "\"" + x.getNumeroCarta() + "\"" + ",\"cvv\":" + "\"" + x.getCvv() + "\""+ ",\"scadenza\":" + "\"" + x.getScadenza() + "\""+ ",\"saldo\":" + "\"" + x.getSaldo() + "\""
							+ "}";
					}
				else {
					System.out.println("NESSUNA CARTA");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		response.getWriter().print(json);
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
