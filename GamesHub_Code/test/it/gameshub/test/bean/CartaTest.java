package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.Date;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Utente;

public class CartaTest {
	
	Carta carta;
	
	@Before
	public void setUp(){
		carta = new Carta("4242424242424242", "3234", "01022020",(float)316.43, "Paolo1974");
    }
	
	
	
	@Test
	public void testGetUtente() {
		assertEquals("Paolo1974",carta.getUtente());
	}

	@Test
	public void testSetUtente() {
		carta.setUtente("Giorgio21");
		assertEquals("Giorgio21",carta.getUtente());
	}

	@Test
	public void testGetNumeroCarta() {
		assertEquals("4242424242424242",carta.getNumeroCarta());
	}

	@Test
	public void testSetNumeroCarta() {
		carta.setNumeroCarta("5555555555554444");
		assertEquals("5555555555554444",carta.getNumeroCarta());
	}

	@Test
	public void testGetCvv() {
		assertEquals("3234",carta.getCvv());
	}

	@Test
	public void testSetCvv() {
		carta.setCvv("1111");
		assertEquals("1111",carta.getCvv());
	}

	@Test
	public void testGetSaldo() {
		assertEquals(316.43, carta.getSaldo(), 0.1);
	}

	@Test
	public void testSetSaldo() {
		carta.setSaldo((float)400.31);
		assertEquals(400.31, carta.getSaldo(), 0.1);
	}

	@Test
	public void testGetScadenza() {
		assertEquals("01022020",carta.getScadenza());
	}

	@Test
	public void testSetScadenza() {
		carta.setScadenza("01012024");
		assertEquals("01012024",carta.getScadenza());
	}

}
