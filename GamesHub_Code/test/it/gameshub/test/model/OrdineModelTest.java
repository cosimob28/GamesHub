package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.ItemComp;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.Manager;
import it.gameshub.model.OrdineModel;
import it.gameshub.model.UtenteModel;

public class OrdineModelTest {
	protected Connection connection;
	protected OrdineModel ordineModel;
	protected UtenteModel utenteModel;

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	


	
	@Test
	public void testGetListaOrdini() throws SQLException {
		ArrayList<Ordine> ordini = initialize();
		ordineModel = new OrdineModel();
		Collection<Ordine> testingCollection = ordineModel.getListaOrdini();
		
		assertEquals(ordini.size(), testingCollection.size());
		Iterator<Ordine> it = testingCollection.iterator();
		for (int i=0;i<ordini.size();i++) {
			Ordine x = ordini.get(i);
			Ordine y = it.next();
			assertEquals(x.getDataOrdine(),y.getDataOrdine());
			assertEquals(x.getIdOrdine(),y.getIdOrdine());
			assertEquals(x.getImporto(),y.getImporto(),0.1);
			assertEquals(x.getIndirizzo(),y.getIndirizzo());
			assertEquals(x.getSpedizione(),y.getSpedizione());
			assertEquals(x.getStato(),y.getStato());
			assertEquals(x.getTrackingId(),y.getTrackingId());
			assertEquals(x.getUtente(),y.getUtente());
		}
		
	}
	
	
	@Test
	public void testGetOrder() throws SQLException {
		
		ordineModel = new OrdineModel();
		ArrayList<Ordine> ordini;
		ordini = initialize();
		
		Ordine x = ordini.get(0);
		
		Ordine y = ordineModel.getOrder(1);
		assertEquals(x.getIdOrdine(), y.getIdOrdine());
		assertEquals(x.getSpedizione(), y.getSpedizione());
		assertEquals(x.getImporto(), y.getImporto(), 0.1);
		assertEquals(x.getDataOrdine(), y.getDataOrdine());
		assertEquals(x.getUtente(), y.getUtente());
		assertEquals(x.getStato(), y.getStato());
		assertEquals(x.getTrackingId(),y.getTrackingId());
		assertEquals(x.getIndirizzo(), y.getIndirizzo());

		
	}
	
	@Test
	public void testAddOrdine() throws SQLException {
		ordineModel = new OrdineModel();
		Date data = new Date(2019 - 1900, 2 - 1, 20);
		Ordine ordine2 = new Ordine(4, (float) 690.23, 9, data, "user1", "Accettato", "Via Lupo 54, Roma");
		ordineModel.addOrdine(ordine2);
		
		assertEquals(4,ordineModel.getListaOrdini().size());
		Ordine order = ordineModel.getOrder(ordine2.getIdOrdine());
		assertEquals(ordine2.getIdOrdine(), order.getIdOrdine());
		assertEquals(ordine2.getSpedizione(), order.getSpedizione());
		assertEquals(ordine2.getImporto(), order.getImporto(), 0.1);
		assertEquals(ordine2.getDataOrdine(), order.getDataOrdine());
		assertEquals(ordine2.getUtente(), order.getUtente());
		assertEquals(ordine2.getStato(), order.getStato());
		assertEquals(ordine2.getTrackingId(), order.getTrackingId());
		assertEquals(ordine2.getIndirizzo(), order.getIndirizzo());

	}

	
	@Test
	public void testGetListaOrdiniUtente() throws SQLException {
		ArrayList<Ordine> ordini = initialize();
		ordineModel = new OrdineModel();
		
		Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        Utente utenteExisting = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",false,data1);
        Utente utenteNotExisting = new Utente("user3", "pin3", "nome3", "cognome3", "CF3", "email3", "indirizzo3", "telefono3", "sesso3", "cliente", "myHash3",false,data2);
		
		Collection<Ordine> testingCollectionExisting = ordineModel.getListaOrdiniUtente(utenteExisting);
		assertEquals(2,testingCollectionExisting.size());
		
		Collection<Ordine> testingCollectionNotExisting = ordineModel.getListaOrdiniUtente(utenteNotExisting);
		assertEquals(0,testingCollectionNotExisting.size());
		
		ArrayList<Ordine> ordiniUtente = new ArrayList<Ordine>();
		
		for(Ordine x : ordini) {
			if(x.getUtente().equals("user1")) {
				ordiniUtente.add(x);
			}
		}
		
		assertEquals(ordiniUtente.size(),testingCollectionExisting.size());
		
		Iterator<Ordine> it = testingCollectionExisting.iterator();
		for (int i=0;i<ordiniUtente.size();i++) {
			Ordine x = ordiniUtente.get(i);
			Ordine y = it.next();
			assertEquals(x.getDataOrdine(),y.getDataOrdine());
			assertEquals(x.getIdOrdine(),y.getIdOrdine());
			assertEquals(x.getImporto(),y.getImporto(),0.1);
			assertEquals(x.getIndirizzo(),y.getIndirizzo());
			assertEquals(x.getSpedizione(),y.getSpedizione());
			assertEquals(x.getStato(),y.getStato());
			assertEquals(x.getTrackingId(),y.getTrackingId());
			assertEquals(x.getUtente(),y.getUtente());
		}
		
	}

	
	
	@Test
	public void  testGetListaOrdiniThreeParameters() throws SQLException {
		
		Collection<Ordine> testingCollection;
		ArrayList<Ordine> ordini = initialize();
		ordineModel = new OrdineModel();
		
		Ordine x = ordini.get(0);
		String id = x.getIdOrdine()+"";
		
		testingCollection = ordineModel.getListaOrdini(id, null, null);
		assertEquals(1, testingCollection.size());
		
		String anno = "2018";
		
		testingCollection = ordineModel.getListaOrdini(null, anno, null);
		assertEquals(2, testingCollection.size());
		
		testingCollection = ordineModel.getListaOrdini(null, null, "Spedito");
		assertEquals(1, testingCollection.size());
		
		testingCollection = ordineModel.getListaOrdini("3", anno, "Accettato");
		assertEquals(1, testingCollection.size());
		
		testingCollection = ordineModel.getListaOrdini("3", anno, "Spedito");
		assertEquals(0, testingCollection.size());
		
		
		
		
	}
	


	@Test
	public void testDeleteOrdine() throws SQLException {
		ordineModel = new OrdineModel();
		
		ArrayList<Ordine> ordini;
		ordini = initialize();
		
		ordineModel.deleteOrdine(1);
		assertEquals(2,ordineModel.getListaOrdini().size());
	}

	

	@Test
	public void testChangeOrderState() throws SQLException {
		ordineModel = new OrdineModel();
		ArrayList<Ordine> ordini;
		ordini = initialize();
		Ordine x = ordini.get(0);
		ordineModel.changeOrderState(x.getIdOrdine(), "Consegnato");
		Ordine y = ordineModel.getOrder(x.getIdOrdine());
		assertEquals("Consegnato",y.getStato());
	}

	@Test
	public void testAddTrackingId() throws SQLException {
		ordineModel = new OrdineModel();
		ArrayList<Ordine> ordini;
		ordini = initialize();
		Ordine x = ordini.get(0);
		ordineModel.addTrackingId(x.getIdOrdine(), "EEE12AD");
		Ordine y = ordineModel.getOrder(x.getIdOrdine());
		assertEquals("EEE12AD",y.getTrackingId());
	}

	@Test
	public void testDoMaxIdOrder() throws SQLException {
		ordineModel = new OrdineModel();
		assertEquals(3,ordineModel.doMaxIdOrder());  //ERRORE PREVISTO
	}

	@Test
	public void testIsAnOrder() throws SQLException {
		ordineModel = new OrdineModel();
		ArrayList<Ordine> ordini;
		ordini = initialize();
		Ordine x = ordini.get(0);
		assertTrue(ordineModel.isAnOrder(x.getIdOrdine()));
		assertFalse(ordineModel.isAnOrder(4));
	}
	
	private ArrayList<Ordine> initialize() throws SQLException {

		Utente utente1,utente2;
		
		PreparedStatement x = getConnection().prepareStatement("DELETE FROM utente");
		x.executeUpdate();
		PreparedStatement z = getConnection().prepareStatement("DELETE FROM carta");
		z.executeUpdate();
		PreparedStatement y = getConnection().prepareStatement("DELETE FROM ordine");
		y.executeUpdate();
		PreparedStatement resetCounter = getConnection().prepareStatement("ALTER TABLE ordine AUTO_INCREMENT = 1");
		resetCounter.executeUpdate();
		
		
		
		
		utenteModel = new UtenteModel();      
        Date data1 = new Date(1997 - 1900, 5 - 1, 20);
        Date data2 = new Date(1979 - 1900, 7 - 1, 6);
        utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1", "cliente", "myHash1",false,data1);
        utente2 = new Utente("user2", "pin2", "nome2", "cognome2", "CF2", "email2", "indirizzo2", "telefono2", "sesso2", "cliente", "myHash2",false,data2);
        utenteModel.saveUser(utente1);
		utenteModel.saveUser(utente2);
		
		ordineModel = new OrdineModel();
		Date data3 = new Date(2017 - 1900, 2 - 1, 1);
		Date data4 = new Date(2018 - 1900, 2 - 1, 1);
		Ordine ordine = new Ordine(1, (float) 178.00, 3, data3, "user1", "Spedito","Via Pendino 85, Fisciano");
		Ordine ordine1 = new Ordine(2, (float) 124.70, 3, data4, "user1", "Accettato", "Via Roma 25, Napoli");
		Ordine ordine2 = new Ordine(3, (float) 400.12, 9, data4, "user2", "Accettato", "Via Venezia 25, Bari");
		
		
		
		ArrayList<Ordine> listaOrdini = new ArrayList<Ordine>();
		ordineModel.addOrdine(ordine);
		ordineModel.addOrdine(ordine1);
		ordineModel.addOrdine(ordine2);
		
		listaOrdini.add(ordine);
		listaOrdini.add(ordine1);
		listaOrdini.add(ordine2);
		
		return listaOrdini;
	}


}
