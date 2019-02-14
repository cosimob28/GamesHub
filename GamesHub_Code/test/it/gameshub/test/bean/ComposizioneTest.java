package it.gameshub.test.bean;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Composizione;

public class ComposizioneTest {

	Composizione comp;
	@Before
	public void setUp() throws Exception {
		comp = new Composizione((float) 500.21, 43, 5, 1, "PES 18", "pes.png"); 
	}

	@Test
	public void testGetNomeGioco() {
		assertEquals("PES 18", comp.getNomeGioco());
	}

	@Test
	public void testSetNomeGioco() {
		comp.setNomeGioco("FIFA 19");
		assertEquals("FIFA 19", comp.getNomeGioco());
	}

	@Test
	public void testGetImmagine() {
		assertEquals("pes.png", comp.getImmagine());
	}

	@Test
	public void testSetImmagine() {
		comp.setImmagine("fifa.png");
		assertEquals("fifa.png", comp.getImmagine());
	}

	@Test
	public void testGetCosto() {
		assertEquals((float) 500.21,comp.getCosto(),0.1);
	}

	@Test
	public void testSetCosto() {
		comp.setCosto((float) 1020.43);
		assertEquals((float) 1020.43,comp.getCosto(),0.1);
	}

	@Test
	public void testGetOrdine() {
		assertEquals(43,comp.getOrdine());
	}

	@Test
	public void testSetOrdine() {
		comp.setOrdine(88);
		assertEquals(88,comp.getOrdine());
	}

	@Test
	public void testGetQuantità() {
		assertEquals(5,comp.getQuantità());
	}

	@Test
	public void testSetQuantità() {
		comp.setQuantità(21);
		assertEquals(21,comp.getQuantità());
	}

	@Test
	public void testGetGioco() {
		assertEquals(1,comp.getGioco());
	}

	@Test
	public void testSetGioco() {
		comp.setGioco(13);
		assertEquals(13,comp.getGioco());
	}

}
