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

import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.Utente;
import it.gameshub.model.GiocoModel;
import it.gameshub.model.ImmagineModel;
import it.gameshub.model.UtenteModel;

public class ImmagineModelTest {

	protected ImmagineModel model;
	protected GiocoModel giocoModel;

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}

	@Test
	public void testSaveImage() throws SQLException {
		ArrayList<Immagine> images;
		images = initialize();
		Immagine image2 = new Immagine("F://wwwww", 1);
		model.saveImage(image2);
		assertEquals(image2, model.getImage(image2.getName()));
	}

	@Test
	public void testDeleteImage() throws SQLException {
		ArrayList<Immagine> images;
		images = initialize();
		model.deleteImage(images.get(0).getName());
		assertEquals(1, model.doRetrieveAll().size());

	}

	@Test
	public void testGetImage() throws SQLException {
		ArrayList<Immagine> images;
		images = initialize();
		assertEquals(images.get(0), model.getImage(images.get(0).getName()));

	}

	@Test
	public void testDoRetrieveAll() throws SQLException {
		ArrayList<Immagine> images;
		images = initialize();
		assertEquals(images, model.doRetrieveAll());
	}

	private ArrayList<Immagine> initialize() throws SQLException {
		Immagine image, image1;
		Gioco gioco;

		PreparedStatement x = getConnection().prepareStatement("DELETE FROM immagine");
		x.executeUpdate();
		x = getConnection().prepareStatement("DELETE FROM gioco");
		x.executeUpdate();

		ArrayList<Immagine> images = new ArrayList<Immagine>();
		model = new ImmagineModel();
		image = new Immagine("F://aaaa", 1);
		image1 = new Immagine("C://bbbb", 1);
		giocoModel = new GiocoModel();
		gioco = new Gioco(1, 12, 30, 2018, "F1 2018", "PS4", "OKOKOKOKOKOKOKOKOK",
				"https://www.youtube.com/watch?v=gLcJtkaIaYI", "sport", (float) 39.99);
		giocoModel.saveGame(gioco);
		model.saveImage(image);
		model.saveImage(image1);

		images.add(image1);
		images.add(image);

		return images;
	}

}
