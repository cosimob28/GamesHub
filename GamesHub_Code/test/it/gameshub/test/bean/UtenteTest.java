package it.gameshub.test.bean;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.apache.catalina.User;
import org.junit.Before;
import org.junit.Test;

import it.gameshub.bean.Utente;
import junit.framework.TestCase;

public class UtenteTest{

	protected Utente utente;
	
	@Before
	public void setUp(){
		Date data = new Date(1974 - 1900, 2 - 1, 1);
        utente = new Utente("Paolo1974","Paolo74","Paolo","Rossi","RSSPLA74A05H501I","paolo.rossi@gmail.com","Via Grumento 24, Roma","3332211222","M","cliente","prova",false,data);
    }
	
	@Test
	public void testIsVerificato() {
		assertEquals(false, utente.isVerificato());
	}
	
	@Test
	public void testSetVerificato() {
		utente.setVerificato(true);
		assertEquals(true, utente.isVerificato());
	}
	
	
	
	@Test
	public void testGetMyHash() {
		assertEquals("prova", utente.getMyHash());
	}

	@Test
	public void testSetMyHash() {
		utente.setMyHash("prova2");
		assertEquals("prova2", utente.getMyHash());
	}

	@Test
	public void testGetTipo() {
		assertEquals("cliente", utente.getTipo());
	}

	@Test
	public void testSetTipo() {
		utente.setTipo("gestore ordini");
		assertEquals("gestore ordini", utente.getTipo());
	}

	@Test
	public void testGetUsername() {
		assertEquals("Paolo1974", utente.getUsername());
	}

	@Test
	public void testSetUsername() {
		utente.setUsername("Pippo97");
		assertEquals("Pippo97", utente.getUsername());
	}

	@Test
	public void testGetPin() {
		assertEquals("Paolo74", utente.getPin());
	}

	@Test
	public void testSetPin() {
		utente.setPin("Password21");
		assertEquals("Password21", utente.getPin());
	}

	@Test
	public void testGetNome() {
		assertEquals("Paolo", utente.getNome());
	}

	@Test
	public void testSetNome() {
		utente.setNome("Rocco");
		assertEquals("Rocco", utente.getNome());
	}

	@Test
	public void testGetCognome() {
		assertEquals("Rossi", utente.getCognome());
	}

	@Test
	public void testSetCognome() {
		utente.setCognome("Verdi");
		assertEquals("Verdi", utente.getCognome());	
	}

	@Test
	public void testGetCodiceFiscale() {
		assertEquals("RSSPLA74A05H501I", utente.getCodiceFiscale());
	}

	@Test
	public void testSetCodiceFiscale() {
		utente.setCodiceFiscale("RSSPLA74A05H501Y");
		assertEquals("RSSPLA74A05H501Y", utente.getCodiceFiscale());
	}

	@Test
	public void testGetEmail() {
		assertEquals("paolo.rossi@gmail.com", utente.getEmail());
	}

	@Test
	public void testSetEmail() {
		utente.setEmail("luca.verdi@live.it");
		assertEquals("luca.verdi@live.it", utente.getEmail());
	}

	@Test
	public void testGetIndirizzoSpedizione() {
		assertEquals("Via Grumento 24, Roma", utente.getIndirizzoSpedizione());
	}

	@Test
	public void testSetIndirizzoSpedizione() {
		utente.setIndirizzoSpedizione("Via Ripetta 32, Anzi");
		assertEquals("Via Ripetta 32, Anzi", utente.getIndirizzoSpedizione());
	}

	@Test
	public void testGetTelefono() {
		assertEquals("3332211222", utente.getTelefono());
	}

	@Test
	public void testSetTelefono() {
		utente.setTelefono("3333333333");
		assertEquals("3333333333", utente.getTelefono());
	}

	@Test
	public void testGetDataDiNascita() {
		Date x = new Date(1974 - 1900, 2 - 1, 1);
		assertEquals(x,utente.getDataDiNascita());
	}

	@Test
	public void testSetDataDiNascita() {
		Date x = new Date(1974 - 1900, 7 - 1, 21);
		utente.setDataDiNascita(x);
		assertEquals(x,utente.getDataDiNascita());
	}

	@Test
	public void testGetSesso() {
		assertEquals("M", utente.getSesso());
	}

	@Test
	public void testSetSesso() {
		utente.setSesso("F");
		assertEquals("F", utente.getSesso());
	}

}
