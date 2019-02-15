package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import javax.naming.InitialContext;

import org.junit.Before;
import org.junit.Test;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import it.gameshub.bean.Utente;
import it.gameshub.model.Manager;
import it.gameshub.model.UtenteModel;

public class UtenteModelTest {


	
	protected UtenteModel utenteModel;
	protected Connection connection;
	
	@Before
	public void setUp() throws Exception {
		utenteModel = new UtenteModel();
		connection = Manager.getConnection();
	}


	@Test
	public void testDeleteUser() throws SQLException {
		ArrayList<Utente> utenti;
		utenti = initialize();
		
		utenteModel.saveUser(utenti.get(0));
		utenteModel.saveUser(utenti.get(1));
		
		utenteModel.deleteUser(utenti.get(0).getUsername());
		utenti = (ArrayList<Utente>) utenteModel.getAllUsers(null);
		assertEquals(1, utenti.size());
	}

//	@Test
//	public void testGetUser() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testGetAllUsers() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testIsAnUser() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testActivateUser() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testDoUpdate() {
//		fail("Not yet implemented");
//	}

	
	
	
	private ArrayList<Utente> initialize() throws SQLException{
		Utente utente1,utente2;
		PreparedStatement preparedStatement = null;
		ArrayList<Utente> utenti;
		preparedStatement = connection.prepareStatement("DELETE FROM utente;");
        if(preparedStatement.execute())
            System.out.println("database initialized successfully\n");
        else
        	System.out.println("error deleting records\n");
        
        Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",true,data1);
        utente2 = new Utente("user2", "pin1", "nome2", "cognome2", "CF2", "email2", "indirizzo2", "telefono2", "sesso2", "cliente", "myHash2",true,data2);
        utenti = new ArrayList<Utente>();
        utenti.add(utente1);
        utenti.add(utente2);
        
        return utenti;
    }
	
	
}
