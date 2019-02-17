package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Utente;
import it.gameshub.model.CartaModel;
import it.gameshub.model.UtenteModel;

public class CartaModelTest {

	private CartaModel cartaModel = null;
	private UtenteModel utenteModel = null;
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}

	

	@Test
	public void testGetCarta() throws SQLException {
		
		cartaModel = new CartaModel();
		
		ArrayList<Carta> carte = initialize();
		Carta x = carte.get(0);
		
		Carta y = cartaModel.getCarta(x.getUtente());
		
		assertEquals(x.getCvv(), y.getCvv());
		assertEquals(x.getNumeroCarta(), y.getNumeroCarta());
		assertEquals(x.getSaldo(), y.getSaldo(),0.1);
		assertEquals(x.getScadenza(), y.getScadenza());
		assertEquals(x.getUtente(), y.getUtente());
	}
	
	@Test
	public void testExistCarta() throws SQLException {
		cartaModel = new CartaModel();
		ArrayList<Carta> carte = initialize();
		Carta x = carte.get(0);
		assertTrue(cartaModel.existCarta(x.getUtente()));
		assertFalse(cartaModel.existCarta("ciccio"));
		
	}
	
	@Test
	public void testAddCarta() throws SQLException {
		cartaModel = new CartaModel();
		utenteModel = new UtenteModel();
		
		Date data3 = new Date(1979 - 1900, 7 - 1, 6);
        Utente utente3 = new Utente("user3", "pin3", "nome3", "cognome3", "CF3", "email3", "indirizzo3", "telefono3", "sesso3", "cliente", "myHash3",false,data3);
        utenteModel.saveUser(utente3);
        
        Carta x = new Carta("123412341234", "1324", "03042029", (float) 432.43, "user3");
		cartaModel.addCarta(x);
		assertTrue(cartaModel.existCarta("user3"));
		Carta y = cartaModel.getCarta("user3");
		assertEquals(x.getCvv(), y.getCvv());
		assertEquals(x.getNumeroCarta(), y.getNumeroCarta());
		assertEquals(x.getSaldo(), y.getSaldo(),0.1);
		assertEquals(x.getScadenza(), y.getScadenza());
		assertEquals(x.getUtente(), y.getUtente());
		
	}
	
	@Test
	public void testDeleteCarta() throws SQLException {
		cartaModel = new CartaModel();
		
		ArrayList<Carta> carte = initialize();
		Carta x = carte.get(0);
		cartaModel.deleteCarta(x.getUtente());
		assertFalse(cartaModel.existCarta(x.getUtente()));
		
		
	}

	
	
	@Test
	public void testDoUpdate() throws SQLException {
		cartaModel = new CartaModel();
		ArrayList<Carta> carte = initialize();
		Carta x = carte.get(0);
		cartaModel.doUpdate((float) 1234.12, x.getNumeroCarta());
		Carta y = cartaModel.getCarta(x.getUtente());
		assertEquals((float)1234.12, y.getSaldo(),0.1);
		
	}

	private ArrayList<Carta> initialize() throws SQLException{
		
		cartaModel = new CartaModel();
		utenteModel = new UtenteModel();
		Utente utente1,utente2;
		Carta carta1,carta2;
		
		PreparedStatement x = getConnection().prepareStatement("DELETE FROM carta");
		x.executeUpdate();
		PreparedStatement y = getConnection().prepareStatement("DELETE FROM utente");
		y.executeUpdate();
		
		
		ArrayList<Carta> carte = new ArrayList<Carta>();
		ArrayList<Utente> utenti = new ArrayList<Utente>();
        Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",false,data1);
        utente2 = new Utente("user2", "pin2", "nome2", "cognome2", "CF2", "email2", "indirizzo2", "telefono2", "sesso2", "cliente", "myHash2",false,data2);
		utenteModel.saveUser(utente1);
		utenteModel.saveUser(utente2);
        
        carta1 = new Carta("4242424242424242","4030","02042020",(float)500.45,"user1");
        carta2 = new Carta("5555555555554444","1212","03082022",(float)1020.45,"user2");
        
        cartaModel.addCarta(carta1);
        cartaModel.addCarta(carta2);
        
        carte.add(carta1);
        carte.add(carta2);
        
        return carte;
    }
}
