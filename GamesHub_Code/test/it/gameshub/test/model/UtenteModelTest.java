package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.util.ArrayList;

import javax.naming.InitialContext;

import org.dbunit.Assertion;
import org.dbunit.DBTestCase;
import org.dbunit.DatabaseTestCase;
import org.dbunit.DatabaseUnitException;
import org.dbunit.IDatabaseTester;
import org.dbunit.JdbcDatabaseTester;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.ant.Table;
import org.dbunit.database.AmbiguousTableNameException;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.database.QueryDataSet;
import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.SortedTable;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
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

public class UtenteModelTest extends DatabaseTestCase{

	private Connection jdbcConnection;
	private IDatabaseTester databaseTester;
	private FlatXmlDataSet loadedDataSet;
	private UtenteModel utenteModel;
	
	protected IDatabaseConnection getConnection() throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
		return new DatabaseConnection(jdbcConnection);
	}

	protected IDataSet getDataSet() throws Exception
    {
		
        return new FlatXmlDataSetBuilder().build(new FileInputStream("test/full.xml"));
    }
	
	@BeforeClass
	public void setUp() throws ClassNotFoundException {
		utenteModel = new UtenteModel();
		databaseTester = new JdbcDatabaseTester("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/gameshub?useSSL=false","root","root");
	}

	@Test
	public void testDeleteUser() throws Exception {
		IDatabaseConnection connection = databaseTester.getConnection();
		System.out.println(connection);
		InputStream dataStream = new FileInputStream("test/full.xml");
		
		IDataSet initialDataSet = new FlatXmlDataSet(dataStream);

		
		Date data1 = new Date(1997 - 1900, 5 - 1, 20);
		Utente x = new Utente("user","password","Admin","Admin","1990-01-10","ADM","0000000000","admin@gameshub.it","via Giovanni Paolo II, Fisciano","Uomo","Gestore catalogo",true,data1);
		utenteModel.saveUser(x);
		dataStream = new FileInputStream("test/snapshot.xml");
		ITable expectedUserTable = new FlatXmlDataSet(dataStream).getTable("utente");
		ITable actualTable = connection.createDataSet().getTable("utente");
		Assertion.assertEquals(new SortedTable(expectedUserTable), new SortedTable(actualTable));
		
		
//		ArrayList<Utente> utenti;
//		utenti = initialize();
		
//		utenteModel.saveUser(utenti.get(0));
//		utenteModel.saveUser(utenti.get(1));
//		
//		utenteModel.deleteUser(utenti.get(0).getUsername());
//		utenti = (ArrayList<Utente>) utenteModel.getAllUsers(null);
//		assertEquals(1, utenti.size());
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
		QueryDataSet queryDataSet = null;
		try {
			 queryDataSet = new QueryDataSet(getConnection());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<Utente> utenti;
		utenteModel = new UtenteModel();      
        Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",true,data1);
        utente2 = new Utente("user2", "pin1", "nome2", "cognome2", "CF2", "email2", "indirizzo2", "telefono2", "sesso2", "cliente", "myHash2",true,data2);
        
        try {
			queryDataSet.addTable("utente", "SELECT * FROM " + "utente");
//			Assertion.assertEquals(loadedDataSet, queryDataSet);
		} catch (DatabaseUnitException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}   
        
        Statement insertStatement = jdbcConnection.createStatement();
        insertStatement.execute("insert into utente values('asd23')");
        insertStatement.close();
       
        utenti = new ArrayList<Utente>();
        utenti.add(utente1);
        utenti.add(utente2);
        
        return utenti;
    }
	
	
}
