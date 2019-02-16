package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Carrello;
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.ItemOrder;

public class CarrelloTest {
	protected ItemOrder item, item1;
	protected Gioco gioco, gioco1;
	protected Immagine image, image1;
	protected Carrello cart;
	protected ArrayList<ItemOrder> products,products1;

	@Before
	public void setUp() {
		products = new ArrayList<ItemOrder>();
		gioco = new Gioco(124, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);
		image = new Immagine("F://aaaa", 124);
		item = new ItemOrder(gioco, image, 5);
		products.add(item);
		cart = new Carrello(products);
	}

	@Test
	public void testAddProduct() throws SQLException{
		gioco1 = new Gioco(187, 6, 25, 2017, "PES 2018", "PS3", "OKOKOKOKOsKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaRe", "sport", (float) 19.99);
		image1 = new Immagine("F://aaaa", 124);
		item1 = new ItemOrder(gioco1, image1, 3);
		cart.addProduct(item1);
		products.add(item1);
		assertEquals(products, cart.getGamesInTheCart());
	}

	@Test
	public void testDeleteGameInTheCart() throws SQLException  {
		cart.deleteGameInTheCart(gioco);
		assertEquals(null, cart.getGamesInTheCart());
	}

	@Test
	public void testGetGamesInTheCart() {
		assertEquals(products, cart.getGamesInTheCart());
	}

	@Test
	public void testSetGames() {
		products1 = new ArrayList<ItemOrder>();
		gioco1 = new Gioco(187, 6, 25, 2017, "PES 2018", "PS3", "OKOKOKOKOsKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaRe", "sport", (float) 19.99);
		image1 = new Immagine("F://aaaa", 124);
		item1 = new ItemOrder(gioco1, image1, 3);
		products1.add(item1);
		cart.setGames(products1);
		assertEquals(products1, cart.getGamesInTheCart());
	}

	@Test
	public void testSearchItemOrder() {
		assertEquals(item, cart.searchItemOrder(""+item.getGioco().getCode()));
		gioco1 = new Gioco(187, 6, 25, 2017, "PES 2018", "PS3", "OKOKOKOKOsKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaRe", "sport", (float) 19.99);
		image1 = new Immagine("F://aaaa", 124);
		item1 = new ItemOrder(gioco1, image1, 3);
		assertEquals(null, cart.searchItemOrder(""+item1.getGioco().getCode()));
	}

	@Test
	public void testIsEmpty() throws SQLException {
		assertEquals(false, cart.isEmpty());
		cart.deleteGameInTheCart(gioco);
		assertEquals(true, cart.isEmpty());
	}

	@Test
	public void testSvuotaCarrello() {
           cart.svuotaCarrello();
           assertEquals(true, cart.isEmpty());  
	}

	@Test
	public void testGetTotale() {
		 assertEquals(243.94, cart.getTotale(),0.1);  
	}

}
