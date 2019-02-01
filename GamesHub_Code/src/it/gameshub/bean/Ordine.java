package it.gameshub.bean;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ordine {

	private int idOrdine;
	private float importo;
	private Date dataOrdine;
	private String utente, stato;

	public Ordine() {
		/* setto la data odierna nel formato sql */
		GregorianCalendar gc = new GregorianCalendar();
		int giorno = gc.get(Calendar.DAY_OF_MONTH);
		int mese = gc.get(Calendar.MONTH);
		int anno = gc.get(Calendar.YEAR);
		dataOrdine = new Date(anno - 1900, mese, giorno);
		stato = "confermato";  // Lo stato iniziale dell'ordine è confermato.

	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public int getIdOrdine() {
		return idOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}

	public float getImporto() {
		return importo;
	}

	public void setImporto(float importo) {
		this.importo = importo;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

}
