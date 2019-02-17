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
import it.gameshub.bean.Gioco;
import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;
import it.gameshub.model.ComposizioneModel;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.OrdineModel;
import it.gameshub.model.UtenteModel;

public class ComposizioneModelTest {

	protected ComposizioneModel model;
	protected GiocoModel giocoModel;
	private UtenteModel utenteModel;
	protected OrdineModel ordineModel;

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}

	@Test
	public void testAddComposizione() throws SQLException {
		ArrayList<Composizione> comp;
		comp = initialize();
		model.addComposizione(new Composizione((float) 500.21, 1, 5, 5, "F1 18", "pes.png"));
		assertEquals(2, model.searchComposizione(comp.get(0).getOrdine()).size());

	}

	@Test
	public void testSearchComposizione() throws SQLException {
		ArrayList<Composizione> comp;
		comp = initialize();
		Collection<Composizione> listComp = model.searchComposizione(comp.get(0).getOrdine());
		Iterator<Composizione> it = listComp.iterator();
		for (int i=0;i<comp.size();i++) {
			Composizione x = comp.get(i);
			Composizione y = it.next();
			assertEquals(x.getCosto(),y.getCosto(),0.1);
			assertEquals(x.getGioco(), y.getGioco());
			assertEquals(x.getImmagine(), y.getImmagine());
			assertEquals(x.getNomeGioco(), y.getNomeGioco());
			assertEquals(x.getOrdine(), y.getOrdine());
			assertEquals(x.getQuantità(), y.getQuantità());
			
		}
	}

	@Test
	public void testDeleteComposizione() throws SQLException {
		ArrayList<Composizione> comp;
		comp = initialize();
		model.deleteComposizione(comp.get(0).getOrdine());
		assertEquals(0, model.searchComposizione(comp.get(0).getOrdine()).size());
	}

	private ArrayList<Composizione> initialize() throws SQLException {
		Gioco gioco, gioco1;
		Utente utente1;
		Composizione comp, comp1;

		PreparedStatement x = getConnection().prepareStatement("DELETE FROM composizione");
		x.executeUpdate();

		x = getConnection().prepareStatement("DELETE FROM gioco");
		x.executeUpdate();

		x = getConnection().prepareStatement("DELETE FROM ordine");
		x.executeUpdate();

		x = getConnection().prepareStatement("DELETE FROM utente");
		x.executeUpdate();

		ArrayList<Composizione> listaComp = new ArrayList<Composizione>();

		utenteModel = new UtenteModel();
		Date data1 = new Date(1997 - 1900, 5 - 1, 20);

		utente1 = new Utente("user1", "pin1", "nome1", "cognome1", "CF1", "email1", "indirizzo1", "telefono1", "sesso1",
				"cliente", "myHash1", false, data1);

		utenteModel.saveUser(utente1);

		PreparedStatement resetCounter = getConnection().prepareStatement("ALTER TABLE ordine AUTO_INCREMENT = 1");
		resetCounter.executeUpdate();
		ordineModel = new OrdineModel();
		Ordine ordine = new Ordine(5, (float) 178.00, 3, data1, "user1", "Accettato", "Via Pendino 85, Fisciano");
		ordineModel.addOrdine(ordine);

		model = new ComposizioneModel();
		comp = new Composizione((float) 500.21, 1, 5, 5, "F1 18", "pes.png");
		giocoModel = new GiocoModel();
		gioco = new Gioco(5, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);

		giocoModel.saveGame(gioco);

		model.addComposizione(comp);

		listaComp.add(comp);

		return listaComp;
	}

}
