package it.gameshub.test.model;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.Utente;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.ImmagineModel;

public class GiocoModelTest {

	protected GiocoModel model;

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}

	@Test
	public void testSaveGame() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		Gioco gioco2 = new Gioco(126, 12, 30, 2015, "Deus Ex", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIabc", "azione", (float) 19.99);
		model.saveGame(gioco2);
		Gioco x = gioco2;
		Gioco y = model.getGioco(gioco2.getCode());
		assertEquals(x.getCode(), y.getCode());
		assertEquals(x.getAnno(), y.getAnno());
		assertEquals(x.getDescription(), y.getDescription());
		assertEquals(x.getGenere(), y.getGenere());
		assertEquals(x.getName(), y.getName());
		assertEquals(x.getPegi(), y.getPegi());
		assertEquals(x.getPiattaforma(), y.getPiattaforma());
		assertEquals(x.getPrice(), y.getPrice(),0.1);
		assertEquals(x.getQuantity(), y.getQuantity());
		assertEquals(x.getVideo(), y.getVideo());
		
	}

	@Test
	public void testGetGioco() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		Gioco x = giochi.get(0);
		Gioco y = model.getGioco(giochi.get(0).getCode());
		assertEquals(x.getCode(), y.getCode());
		assertEquals(x.getAnno(), y.getAnno());
		assertEquals(x.getDescription(), y.getDescription());
		assertEquals(x.getGenere(), y.getGenere());
		assertEquals(x.getName(), y.getName());
		assertEquals(x.getPegi(), y.getPegi());
		assertEquals(x.getPiattaforma(), y.getPiattaforma());
		assertEquals(x.getPrice(), y.getPrice(),0.1);
		assertEquals(x.getQuantity(), y.getQuantity());
		assertEquals(x.getVideo(), y.getVideo());
		
	}

	@Test
	public void testDeleteGame() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		model.deleteGame(giochi.get(0).getCode());
		assertEquals(1, model.doRetrieveAll().size());
	}

	@Test
	public void testDoRetrieveAll() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		assertEquals(giochi.size(), model.doRetrieveAll().size());
		Collection<Gioco> testingCollection = model.doRetrieveAll();
		
		Iterator<Gioco> it = testingCollection.iterator();
		for (int i=0;i<giochi.size();i++) {
			Gioco x = giochi.get(i);
			Gioco y = it.next();
			assertEquals(x.getCode(), y.getCode());
			assertEquals(x.getAnno(), y.getAnno());
			assertEquals(x.getDescription(), y.getDescription());
			assertEquals(x.getGenere(), y.getGenere());
			assertEquals(x.getName(), y.getName());
			assertEquals(x.getPegi(), y.getPegi());
			assertEquals(x.getPiattaforma(), y.getPiattaforma());
			assertEquals(x.getPrice(), y.getPrice(),0.1);
			assertEquals(x.getQuantity(), y.getQuantity());
			assertEquals(x.getVideo(), y.getVideo());
		}
		
	}

	@Test
	public void testUpdateQuantity() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		model.updateQuantity(giochi.get(0).getCode(), 20);
		assertEquals(20, model.getGioco(giochi.get(0).getCode()).getQuantity());
		
	}

	@Test
	public void testUpdateGame() throws SQLException {
		ArrayList<Gioco> giochi;
		giochi = initialize();
		model.updateGame(giochi.get(0).getCode(), "BBBB", "AAAAA", (float) 19.25, 20);
		assertEquals(20, model.getGioco(giochi.get(0).getCode()).getQuantity());
		assertEquals(19.25, model.getGioco(giochi.get(0).getCode()).getPrice(),0.1);
		assertEquals("BBBB", model.getGioco(giochi.get(0).getCode()).getVideo());
		assertEquals("AAAAA", model.getGioco(giochi.get(0).getCode()).getDescription());
		
	}

	private ArrayList<Gioco> initialize() throws SQLException {
		Gioco gioco, gioco1;

		PreparedStatement x = getConnection().prepareStatement("DELETE FROM gioco");
		x.executeUpdate();
		
		x  = getConnection().prepareStatement("DELETE FROM immagine");
		x.executeUpdate();

		ArrayList<Gioco> giochi = new ArrayList<Gioco>();
		model = new GiocoModel();
		gioco = new Gioco(124, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);
		gioco1 = new Gioco(125, 18, 35, 2017, "F1 2017", "PS3", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaRe", "sport", (float) 19.99);
		model.saveGame(gioco);
		model.saveGame(gioco1);

		giochi.add(gioco);
		giochi.add(gioco1);

		return giochi;
	}

}
