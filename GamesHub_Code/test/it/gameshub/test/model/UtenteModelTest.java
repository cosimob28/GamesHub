package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.naming.InitialContext;


import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import it.gameshub.bean.Utente;
import it.gameshub.model.Manager;
import it.gameshub.model.UtenteModel;

public class UtenteModelTest{

	private Connection jdbcConnection;
	
	private UtenteModel utenteModel = null;
	
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}


	
	@Test
	public void testGetAllUsers() throws SQLException {
		
		utenteModel = new UtenteModel();
		ArrayList<Utente> utenti;
		utenti = initialize();
		
		Collection<Utente> testingCollection = utenteModel.getAllUsers(null);
		
		assertEquals(utenti.size(), testingCollection.size());
		Iterator<Utente> it = testingCollection.iterator();
		for (int i=0;i<utenti.size();i++) {
			Utente x = utenti.get(i);
			Utente y = it.next();
			assertEquals(x.getCodiceFiscale(), y.getCodiceFiscale());
			assertEquals(x.getCognome(), y.getCognome());
			assertEquals(x.getDataDiNascita(), y.getDataDiNascita());
			assertEquals(x.getEmail(), y.getEmail());
			assertEquals(x.getIndirizzoSpedizione(), y.getIndirizzoSpedizione());
			assertEquals(x.getMyHash(), y.getMyHash());
			assertEquals(x.getNome(), y.getNome());
			assertEquals(x.getPin(), y.getPin());
			assertEquals(x.getSesso(), y.getSesso());
			assertEquals(x.getTelefono(), y.getTelefono());
			assertEquals(x.getTipo(), y.getTipo());
			assertEquals(x.getUsername(), y.getUsername());			
			assertEquals(x.isVerificato(), y.isVerificato());
			

		}
		
		
		
	}
	
	
	
	@Test
	public void testDeleteUser() throws Exception {
	
		ArrayList<Utente> utenti;
		utenti = initialize();
		utenteModel.deleteUser(utenti.get(0).getUsername());
		assertEquals(1,  utenteModel.getAllUsers(null).size());
	}

	@Test
	public void testGetUser() throws SQLException {
		ArrayList<Utente> utenti;
		utenti = initialize();
		
		Utente x = utenti.get(0);
		Utente y = utenteModel.getUser(x.getUsername());
		
		assertEquals(x.getCodiceFiscale(), y.getCodiceFiscale());
		assertEquals(x.getCognome(), y.getCognome());
		assertEquals(x.getDataDiNascita(), y.getDataDiNascita());
		assertEquals(x.getEmail(), y.getEmail());
		assertEquals(x.getIndirizzoSpedizione(), y.getIndirizzoSpedizione());
		assertEquals(x.getMyHash(), y.getMyHash());
		assertEquals(x.getNome(), y.getNome());
		assertEquals(x.getPin(), y.getPin());
		assertEquals(x.getSesso(), y.getSesso());
		assertEquals(x.getTelefono(), y.getTelefono());
		assertEquals(x.getTipo(), y.getTipo());
		assertEquals(x.getUsername(), y.getUsername());			
		assertEquals(x.isVerificato(), y.isVerificato());
		
	}

	@Test
	public void testSaveUser() throws SQLException {
		initialize();
		utenteModel = new UtenteModel();
		Date data1 = new Date(2000 - 1900, 5 - 1, 20);
		Utente utente3 = new Utente("user3", "pin3", "nome3", "cognome3", "CF3", "email3", "indirizzo3", "telefono3", "sesso3", "cliente", "myHash3",false,data1);
		utenteModel.saveUser(utente3);
		assertEquals(3, utenteModel.getAllUsers(null).size());
	
	}

	@Test
	public void testIsAnUser() throws SQLException {
		
		ArrayList<Utente> utenti;
		utenti = initialize();
		
		assertTrue(utenteModel.isAnUser(utenti.get(0).getUsername()));
		assertFalse(utenteModel.isAnUser("ciccio"));
		
	}

	@Test
	public void testActivateUser() throws SQLException {
		ArrayList<Utente> utenti;
		utenti = initialize();
		Utente x = utenti.get(0);
		
		boolean status = utenteModel.activateUser(x.getEmail(), x.getMyHash());
		assertTrue(status);
		
		Utente y = utenteModel.getUser(x.getUsername());
		assertTrue(y.isVerificato());
	}

	@Test
	public void testDoUpdate() throws SQLException {
		
		ArrayList<Utente> utenti;
		utenti = initialize();
		Utente x = utenti.get(0);
		
		utenteModel.doUpdate(x.getUsername(), "Ciccio87", "1234567897", "Via Calogero Nicastro 21, Palermo");
		
		Utente y = utenteModel.getUser(x.getUsername());
		assertEquals("Ciccio87", y.getPin());
		assertEquals("1234567897", y.getTelefono());
		assertEquals("Via Calogero Nicastro 21, Palermo", y.getIndirizzoSpedizione());
		
		
	}

	
	
	
	private ArrayList<Utente> initialize() throws SQLException{
		Utente utente1,utente2;
		
		PreparedStatement y = getConnection().prepareStatement("DELETE FROM carta");
		y.executeUpdate();
		PreparedStatement x = getConnection().prepareStatement("DELETE FROM utente");
		x.executeUpdate();
		
		
		ArrayList<Utente> utenti = new ArrayList<Utente>();
		utenteModel = new UtenteModel();      
        Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",false,data1);
        utente2 = new Utente("user2", "pin2", "nome2", "cognome2", "CF2", "email2", "indirizzo2", "telefono2", "sesso2", "cliente", "myHash2",false,data2);
        utenteModel.saveUser(utente1);
		utenteModel.saveUser(utente2);
        
       
        utenti.add(utente1);
        utenti.add(utente2);
        
        return utenti;
    }
	
	
}
