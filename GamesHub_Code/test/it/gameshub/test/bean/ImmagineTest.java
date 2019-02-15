package it.gameshub.test.bean;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Immagine;

public class ImmagineTest {

	protected Immagine image,image1;

	@Before
	public void setUp() {
		image = new Immagine("F://aaaa", 124);
		image1 = new Immagine("F://aaaa", 124);
	}
	
	@Test
	public void testEqualsObject() {
		assertEquals(image1.getName(), image.getName());
		assertEquals(image1.getGame(), image.getGame());
		
		assertNotEquals(image.getName(),"eeeee");
		assertNotEquals(image.getGame(),475);
		
	}

	@Test
	public void testGetName() {
		assertEquals("F://aaaa", image.getName());
	}

	@Test
	public void testSetName() {
		image.setName("C://dddsada");
		assertEquals("C://dddsada", image.getName());
	}

	@Test
	public void testGetGame() {
		assertEquals(124, image.getGame());
	}

	@Test
	public void testSetGame() {
		image.setGame(12446);
		assertEquals(12446, image.getGame());
	}

	@Test
	public void testToString() {
		assertEquals(124+"F://aaaa", image.getGame()+image.getName());
	}

}
