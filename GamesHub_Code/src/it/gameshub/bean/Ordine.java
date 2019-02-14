package it.gameshub.bean;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ordine {

	private int idOrdine;
	private float importo;
	private int spedizione;
	private Date dataOrdine;
	private String utente, stato, trackingId, indirizzo;

	/**
	 * Costruttore di Ordine
	 */
	public Ordine() {
		/* setto la data odierna nel formato sql */
		GregorianCalendar gc = new GregorianCalendar();
		int giorno = gc.get(Calendar.DAY_OF_MONTH);
		int mese = gc.get(Calendar.MONTH);
		int anno = gc.get(Calendar.YEAR);
		dataOrdine = new Date(anno - 1900, mese, giorno);
		stato = "Accettato"; // Lo stato iniziale dell'ordine è 'Accettato'.
		trackingId = "";

	}

	/**
	 * Costruttore di Ordine
	 */
	public Ordine(int idOrdine, float importo, int spedizione, Date dataOrdine, String utente, String stato,
			String trackingId, String indirizzo) {
		this.idOrdine = idOrdine;
		this.importo = importo;
		this.spedizione = spedizione;
		this.dataOrdine = dataOrdine;
		this.utente = utente;
		this.stato = stato;
		this.trackingId = trackingId;
		this.indirizzo = indirizzo;
	}

	public int getSpedizione() {
		return spedizione;
	}

	public void setSpedizione(int spedizione) {
		this.spedizione = spedizione;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getTrackingId() {
		return trackingId;
	}

	public void setTrackingId(String trackingId) {
		this.trackingId = trackingId;
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
