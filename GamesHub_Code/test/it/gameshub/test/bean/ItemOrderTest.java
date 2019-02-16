package it.gameshub.test.bean;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.ItemOrder;

public class ItemOrderTest {

	protected ItemOrder item;
	protected Gioco gioco, gioco1;
	protected Immagine image, image1;

	@Before
	public void setUp() throws Exception {
		gioco = new Gioco(124, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);
		image = new Immagine("F://aaaa", 124);
		item = new ItemOrder(gioco, image, 5);
	}

	@Test
	public void testSetGioco() {
		gioco1 = new Gioco(187, 6, 25, 2017, "PES 2018", "PS3", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaRe", "sport", (float) 19.99);
		item.setGioco(gioco1);
		assertEquals(gioco1, item.getGioco());
	}

	@Test
	public void testGetImage() {
		assertEquals(image, item.getImage());
	}

	@Test
	public void testSetImage() {
		image1 = new Immagine("F://aaaa", 124);
		item.setImage(image1);
		assertEquals(image1, item.getImage());
	}

	@Test
	public void testGetGioco() {
		assertEquals(gioco, item.getGioco());
	}

	@Test
	public void testAddQuantità() {
		int qty = item.getQuantità() + 1;
		item.setQuantità(qty);
		assertEquals(qty, item.getQuantità());
	}

	@Test
	public void testAddQuantitàInt() {
		int qty = item.getQuantità() + 12;
		item.setQuantità(qty);
		assertEquals(qty, item.getQuantità());
	}

	@Test
	public void testSetQuantità() {
		item.setQuantità(12);
		assertEquals(12, item.getQuantità());
	}

	@Test
	public void testGetQuantità() {
		assertEquals(5, item.getQuantità());
	}

}
