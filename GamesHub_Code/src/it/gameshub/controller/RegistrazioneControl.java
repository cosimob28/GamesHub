package it.gameshub.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import it.gameshub.bean.Utente;
import it.gameshub.model.UtenteModel;

@WebServlet("/RegistrazioneControl")
public class RegistrazioneControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModel model;

	static {

		model = new UtenteModel();

	}

	public RegistrazioneControl() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* Acquisisco i dati immessi dall'utente prima di inviare l'email di conferma */
		Utente nuovoUtente = new Utente();

		String nome = request.getParameter("inputName");
		nuovoUtente.setNome(nome);

		String cognome = request.getParameter("inputCognome");
		nuovoUtente.setCognome(cognome);

		String data = request.getParameter("data");
		String anno = data.substring(0, 4);
		int year = Integer.parseInt(anno);
		String mese = data.substring(5, 7);
		int mounth = Integer.parseInt(mese);
		String giorno = data.substring(8);
		int day = Integer.parseInt(giorno);
		Date dataNascita = new Date(year - 1900, mounth - 1, day);
		nuovoUtente.setDataDiNascita(dataNascita);

		String sesso = request.getParameter("inputSesso");
		nuovoUtente.setSesso(sesso);

		String userName = request.getParameter("UserName");
		nuovoUtente.setUsername(userName);

		String email = request.getParameter("email");
		nuovoUtente.setEmail(email);

		String phone = request.getParameter("phone");
		nuovoUtente.setTelefono(phone);

		String cf = request.getParameter("cf");
		nuovoUtente.setCodiceFiscale(cf);

		String indirizzo = request.getParameter("indirizzo");
		nuovoUtente.setIndirizzoSpedizione(indirizzo);

		String password = request.getParameter("password");
		String newPword = DigestUtils.md5Hex(password);

		String myHash;
		Random random = new Random();
		random.nextInt(999999);
		myHash = DigestUtils.md5Hex("" + random);
		nuovoUtente.setPin(newPword);
		nuovoUtente.setMyHash(myHash);

		request.getSession().removeAttribute("E-mail");
		request.getSession().setAttribute("E-mail", email);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SendEmailConfirm.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
