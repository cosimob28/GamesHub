package it.gameshub.bean;

import java.sql.Date;

public class Carta {

	private String numeroCarta, utente;
	private String cvv;
	private String scadenza;
	private long saldo;

	public Carta(String numeroCarta, String cvv, String scadenza,long saldo,String utente) {
		this.numeroCarta = numeroCarta;
		this.cvv = cvv;
		this.scadenza = scadenza;
		this.utente = utente;
		this.saldo = saldo;
	}
	
	public Carta() {
		// TODO Auto-generated constructor stub
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public String getNumeroCarta() {
		return numeroCarta;
	}

	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}

	

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public long getSaldo() {
		return saldo;
	}

	public void setSaldo(long saldo) {
		this.saldo = saldo;
	}

	public String getScadenza() {
		return scadenza;
	}

	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}
}
