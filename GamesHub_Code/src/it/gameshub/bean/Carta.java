package it.gameshub.bean;

import java.sql.Date;

public class Carta {

	private String numeroCarta, paese, utente;
	private int cvv;
	private String scadenza;
	private long saldo;

	public Carta(String numeroCarta, int cvv, String scadenza, String paese,long saldo) {
		this.numeroCarta = numeroCarta;
		this.cvv = cvv;
		this.scadenza = scadenza;
		this.paese = paese;
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

	public String getPaese() {
		return paese;
	}

	public void setPaese(String paese) {
		this.paese = paese;
	}

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
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
