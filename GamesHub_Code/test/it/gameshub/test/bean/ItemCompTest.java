package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.ItemComp;
import it.gameshub.bean.Ordine;

public class ItemCompTest {

	protected ItemComp itemComp;
	protected Ordine ordine, ordine1;
	protected Composizione comp, comp1;
	ArrayList<Composizione> listaComp, listaComp1;

	@Before
	public void setUp() {
		Date data = new Date(1974 - 1900, 2 - 1, 1);
		listaComp = new ArrayList<Composizione>();
		comp = new Composizione((float) 500.21, 43, 5, 1, "PES 18", "pes.png");
		listaComp.add(comp);
		ordine = new Ordine(124, (float) 124.70, 3, data, "Luca88", "Accettato", "AAA11BB", "Via Roma 25, Napoli");
		itemComp = new ItemComp(ordine, listaComp);
	}

	@Test
	public void testGetOrdine() {
		assertEquals(ordine, itemComp.getOrdine());
	}

	@Test
	public void testSetOrdine() {
		Date data = new Date(1977 - 1900, 2 - 1, 1);
		ordine1 = new Ordine(713, (float) 187.87, 3, data, "Luca88", "Accettato", "EED55GG", "Via Genova 85, Genova");
		itemComp.setOrdine(ordine1);
		assertEquals(ordine1, itemComp.getOrdine());
	}

	@Test
	public void testGetCompOrdine() {
		assertEquals(listaComp, itemComp.getCompOrdine());
	}

	@Test
	public void testSetCompOrdine() {
		listaComp1 = new ArrayList<Composizione>();
		comp1 = new Composizione((float) 452.00, 52, 4, 1, "F1 2018", "f1.png");
		listaComp.add(comp1);
		itemComp.setCompOrdine(listaComp1);
		assertEquals(listaComp1, itemComp.getCompOrdine());

	}

}
