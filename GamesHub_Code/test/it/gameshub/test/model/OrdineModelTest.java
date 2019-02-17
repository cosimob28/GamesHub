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

import it.gameshub.bean.Composizione;
import it.gameshub.bean.ItemComp;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.Manager;
import it.gameshub.model.OrdineModel;

public class OrdineModelTest {
	protected Connection connection;
	protected OrdineModel model;
	protected Ordine ordine, ordine1;

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	
	@Before
	public void setUp() throws SQLException {
		model = new OrdineModel();
		PreparedStatement x = getConnection().prepareStatement("DELETE FROM ordine");
		x.executeUpdate();
		
	}

	
/*	@Test
	public void testAddOrdine() throws SQLException {
		model = new OrdineModel();
		Date data = new Date(1958 - 1900, 2 - 1, 1);
		Ordine ordine2 = new Ordine(1, (float) 139.99, 3, data, "Luca1988", "Accettato", "Via DDD 12, Firenze");
		model.addOrdine(ordine2);
		Ordine order = model.getOrder(ordine2.getIdOrdine());
		assertEquals(ordine2.getIdOrdine(), order.getIdOrdine());
		assertEquals(ordine2.getSpedizione(), order.getSpedizione());
		assertEquals(ordine2.getImporto(), order.getImporto(), 0.1);
		assertEquals(ordine2.getDataOrdine(), order.getDataOrdine());
		assertEquals(ordine2.getUtente(), order.getUtente());
		assertEquals(ordine2.getStato(), order.getStato());
		assertEquals(ordine2.getTrackingId(), null);
		assertEquals(ordine2.getIndirizzo(), order.getIndirizzo());

	}

	@Test
	public void testGetListaOrdiniUtente() throws SQLException {
		ArrayList<Ordine> ordini; 
        ordini = initialize();
        

	}*/

	@Test
	public void testGetListaOrdini() {

	}

	@Test
	public void testGetListaOrdiniStringStringString() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteOrdine() throws SQLException {
		/*ArrayList<Ordine> ordini;
		ordini = initialize();*/
		Date data = new Date(1974 - 1900, 2 - 1, 1);
		Date data1 = new Date(1977 - 1900, 2 - 1, 1);
		Ordine ordine = new Ordine(2, (float) 178.00, 3, data1, "Luca1988", "Spedito",
				"Via Pendino 85, Fisciano");
		Ordine ordine1 = new Ordine(3, (float) 124.70, 3, data, "Luca1988", "Accettato", 
				"Via Roma 25, Napoli");
		
		model.addOrdine(ordine);
		model.addOrdine(ordine1);
		model.deleteOrdine(ordine.getIdOrdine());
		assertEquals(1,model.getListaOrdini().size());
	}

	@Test
	public void testGetOrder() throws SQLException {
		/*ArrayList<Ordine> ordini;
		ordini = initialize();*/
		Date data = new Date(1974 - 1900, 2 - 1, 1);
		Ordine ordine = new Ordine(1, (float) 178.00, 3, data, "Luca1988", "Accettato",
				"Via Pendino 85, Fisciano");
		//Ordine x = ordini.get(0);
		model.addOrdine(ordine);
		Ordine y = model.getOrder(ordine.getIdOrdine());
		assertEquals(ordine.getIdOrdine(), y.getIdOrdine());
		assertEquals(ordine.getSpedizione(), y.getSpedizione());
		assertEquals(ordine.getImporto(), y.getImporto(), 0.1);
		assertEquals(ordine.getDataOrdine(), y.getDataOrdine());
		assertEquals(ordine.getUtente(), y.getUtente());
		assertEquals(ordine.getStato(), y.getStato());
		assertEquals(ordine.getTrackingId(), null);
		assertEquals(ordine.getIndirizzo(), y.getIndirizzo());

		
	}

	@Test
	public void testChangeOrderState() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddTrackingId() {
		fail("Not yet implemented");
	}

	@Test
	public void testDoMaxIdOrder() {
		fail("Not yet implemented");
	}

	@Test
	public void testIsAnOrder() {
		fail("Not yet implemented");
	}
	
	private ArrayList<Ordine> initialize() throws SQLException {

		PreparedStatement x = getConnection().prepareStatement("DELETE FROM ordine");
		x.executeUpdate();
		model = new OrdineModel();
		Date data = new Date(1974 - 1900, 2 - 1, 1);
		Date data1 = new Date(1977 - 1900, 2 - 1, 1);
		Ordine ordine = new Ordine(1, (float) 178.00, 3, data1, "Luca1988", "Spedito",
				"Via Pendino 85, Fisciano");
		Ordine ordine1 = new Ordine(2, (float) 124.70, 3, data, "Luca1988", "Accettato", 
				"Via Roma 25, Napoli");
		ArrayList<Ordine> listaOrdini = new ArrayList<Ordine>();
		model.addOrdine(ordine);
		model.addOrdine(ordine1);

		listaOrdini.add(ordine);
		listaOrdini.add(ordine1);
		return listaOrdini;
	}


}
