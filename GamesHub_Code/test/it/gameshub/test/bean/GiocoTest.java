package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.Date;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Gioco;
import it.gameshub.bean.Ordine;

public class GiocoTest {

	protected Gioco gioco;

	@Before
	public void setUp() {

		gioco = new Gioco(124, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);
	}

	@Test
	public void testGetCode() {
		assertEquals(124,gioco.getCode());
	}

	@Test
	public void testSetCode() {
		gioco.setCode(15788);
		assertEquals(15788,gioco.getCode());
	}

	@Test
	public void testGetName() {
		assertEquals("F1 2018",gioco.getName());
	}

	@Test
	public void testSetName() {
		gioco.setName("PES 2018");
		assertEquals("PES 2018",gioco.getName());
	}

	@Test
	public void testGetDescription() {
		assertEquals("OKOKOKOKOKOKOKOKOK",gioco.getDescription());
	}

	@Test
	public void testSetDescription() {
		gioco.setDescription("Nuovo gioco pes 2018");
		assertEquals("Nuovo gioco pes 2018",gioco.getDescription());
	}

	@Test
	public void testGetPrice() {
		assertEquals(39.99,gioco.getPrice(),0.1);
	}

	@Test
	public void testSetPrice() {
		gioco.setPrice((float)29.99);
		assertEquals(29.99,gioco.getPrice(),0.1);
	}

	@Test
	public void testGetQuantity() {
		assertEquals(30,gioco.getQuantity());
	}

	@Test
	public void testSetQuantity() {
		gioco.setQuantity(25);
		assertEquals(25,gioco.getQuantity());
	}

	@Test
	public void testGetPiattaforma() {
		assertEquals("PS4",gioco.getPiattaforma());
	}

	@Test
	public void testSetPiattaforma() {	
		gioco.setPiattaforma("PS3");
		assertEquals("PS3",gioco.getPiattaforma());
	}

	@Test
	public void testGetAnno() {
		assertEquals(2018,gioco.getAnno());
	}

	@Test
	public void testSetAnno() {
		gioco.setAnno(2017);
		assertEquals(2017,gioco.getAnno());
	}

	@Test
	public void testGetVideo() {
		assertEquals("https://www.youtube.com/watch?v=gLcJtkaIaYI",gioco.getVideo());
	}

	@Test
	public void testSetVideo() {
		gioco.setVideo("https://www.youtube.com/watch?v=gLcJtkaIaRe");
		assertEquals("https://www.youtube.com/watch?v=gLcJtkaIaRe",gioco.getVideo());
	}

	@Test
	public void testGetGenere() {
		assertEquals("sport",gioco.getGenere());
	}

	@Test
	public void testSetGenere() {
		gioco.setGenere("corse");
		assertEquals("corse",gioco.getGenere());
	}

	@Test
	public void testGetPegi() {
		assertEquals(12,gioco.getPegi());
	}

	@Test
	public void testSetPegi() {
		gioco.setPegi(3);
		assertEquals(3,gioco.getPegi());
	}

}
