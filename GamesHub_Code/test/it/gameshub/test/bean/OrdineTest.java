package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.Date;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;

public class OrdineTest {
	
protected Ordine ordine;
	
	@Before
	public void setUp(){
		Date data = new Date(1974 - 1900, 2 - 1, 1);
        ordine = new Ordine(124,(float) 124.70,3,data,"Luca88","Accettato","AAA11BB","Via Roma 25, Napoli");
    }
	

	@Test
	public void testGetSpedizione() {
		assertEquals(3, ordine.getSpedizione());
	}

	@Test
	public void testSetSpedizione() {
		ordine.setSpedizione(9);
		assertEquals(9, ordine.getSpedizione());
	}

	@Test
	public void testGetIndirizzo() {
		assertEquals("Via Roma 25, Napoli", ordine.getIndirizzo());
	}

	@Test
	public void testSetIndirizzo() {
		ordine.setIndirizzo("Via Amerigo 13, Venezia");
		assertEquals("Via Amerigo 13, Venezia", ordine.getIndirizzo());
	}

	@Test
	public void testGetTrackingId() {
		assertEquals("AAA11BB", ordine.getTrackingId());
	}

	@Test
	public void testSetTrackingId() {
		ordine.setTrackingId("BBB22CC");
		assertEquals("BBB22CC", ordine.getTrackingId());
	}

	@Test
	public void testGetStato() {
		assertEquals("Accettato", ordine.getStato());
	}

	@Test
	public void testSetStato() {
		ordine.setStato("In preparazione");
		assertEquals("In preparazione", ordine.getStato());
	}

	@Test
	public void testGetUtente() {
		assertEquals("Luca88", ordine.getUtente());
	}

	@Test
	public void testSetUtente() {
		ordine.setUtente("Marco96");
		assertEquals("Marco96", ordine.getUtente());
	}

	@Test
	public void testGetIdOrdine() {
		assertEquals(124, ordine.getIdOrdine());
	}

	@Test
	public void testSetIdOrdine() {
		ordine.setIdOrdine(7851);
		assertEquals(7851, ordine.getIdOrdine());
	}

	@Test
	public void testGetImporto() {
		assertEquals(124.70, ordine.getImporto(),0.1);
	}

	
	@Test
	public void testSetImporto() {
		ordine.setImporto((float) 29.99);
		assertEquals(29.99, ordine.getImporto(),0.1);
	}

	@Test
	public void testGetDataOrdine() {
		Date x = new Date(1974 - 1900, 2 - 1, 1);
		assertEquals(x,ordine.getDataOrdine());
		
	}

	@Test
	public void testSetDataOrdine() {
		Date x = new Date(1974 - 1900, 7 - 1, 21);
		ordine.setDataOrdine(x);;
		assertEquals(x,ordine.getDataOrdine());
	}

}
