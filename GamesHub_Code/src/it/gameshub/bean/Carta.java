package it.gameshub.bean;

import java.sql.Date;

public class Carta {

	private String numeroCarta, utente;
	private String cvv;
	private String scadenza;
	private float saldo;
	
	/**
	 * Costruttore di Carta
	 */
	public Carta(String numeroCarta, String cvv, String scadenza,float saldo,String utente) {
		this.numeroCarta = numeroCarta;
		this.cvv = cvv;
		this.scadenza = scadenza;
		this.utente = utente;
		this.saldo = saldo;
	}

	
	/**
	 * Costruttore di Carta
	 */
	public Carta() {
		
	}

	/**
	 * @return String Username dell'utente
	 */
	public String getUtente() {
		return utente;
	}

	/**
	 * Setta l'username dell'utente che utilizza la carta
	 * 
	 * @param String utente L'username dell'utente
	 */
	public void setUtente(String utente) {
		this.utente = utente;
	}

	/**
	 * @return String Il numero della carta
	 */
	public String getNumeroCarta() {
		return numeroCarta;
	}

	/**
	 * Setta il numero della carta
	 * 
	 * @param String numeroCarta Il numero della carta
	 */
	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
	}

	
	/**
	 * @return String Il CVV della carta
	 */
	public String getCvv() {
		return cvv;
	}

	/**
	 * Setta il cvv della carta
	 * 
	 * @param String cvv Il CVV della carta
	 */
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	/**
	 * @return long Il saldo della carta
	 */
	public float getSaldo() {
		return saldo;
	}
	
	/**
	 * Setta il saldo della carta
	 * 
	 * @param long saldo Il saldo della carta
	 */
	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}

	/**
	 * @return String La scadenza della carta
	 */
	public String getScadenza() {
		return scadenza;
	}

	/**
	 * Setta la scandenza della carta
	 * 
	 * @param String scadenza La scadenza della carta
	 */
	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}
}
