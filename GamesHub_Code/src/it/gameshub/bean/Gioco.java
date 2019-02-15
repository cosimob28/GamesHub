package it.gameshub.bean;

import java.io.Serializable;

public class Gioco implements Serializable {

	private static final long serialVersionUID = 1L;

	private int code, pegi, quantity, anno;
	private String name, piattaforma, description, video, genere;
	float price;

	/**
	 * Costruttore di Gioco
	 */
	public Gioco() {
		code = -1;
		name = "";
		description = "";
		quantity = 0;
	}

	/**
	 * Costruttore di Gioco
	 */
	public Gioco(int code, int pegi, int quantity, int anno, String name, String piattaforma, String description,
			String video, String genere, float price) {
		this.code = code;
		this.anno = anno;
		this.description = description;
		this.genere = genere;
		this.quantity = quantity;
		this.name = name;
		this.pegi = pegi;
		this.piattaforma = piattaforma;
		this.video = video;
		this.price = price;

	}

	/**
	 * @return int Il serial number del Gioco
	 */
	public int getCode() {
		return code;
	}

	/**
	 * Setta il serial number del Gioco
	 * 
	 * @param int
	 *            code Il serial number del Gioco
	 */

	public void setCode(int code) {
		this.code = code;
	}

	/**
	 * @return string Il nome number del Gioco
	 */
	public String getName() {
		return name;
	}

	/**
	 * Setta il nome del Gioco
	 * 
	 * @param string
	 *            name Il nome number del Gioco
	 */

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return string La descrizione del Gioco
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Setta la descrizione del Gioco
	 * 
	 * @param string
	 *            description La descrizione del Gioco
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return float Il prezzo del Gioco
	 */
	public float getPrice() {
		return price;
	}

	/**
	 * Setta il prezzo del Gioco
	 * 
	 * @param float
	 *            price Il prezzo del Gioco
	 */
	public void setPrice(float price) {
		this.price = price;
	}

	/**
	 * @return int La quantità del Gioco
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * Setta la quantità del Gioco
	 * 
	 * @param int
	 *            quantity La quantità del Gioco
	 */

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return String La piattaforma del Gioco
	 */
	public String getPiattaforma() {
		return piattaforma;
	}

	/**
	 * Setta la piattaforma del Gioco
	 * 
	 * @param String
	 *            piattaforma La piattaforma del Gioco
	 */
	public void setPiattaforma(String piattaforma) {
		this.piattaforma = piattaforma;
	}

	/**
	 * @return int L'anno del Gioco
	 */
	public int getAnno() {
		return anno;
	}

	/**
	 * Setta l'anno del Gioco
	 * 
	 * @param int
	 *            anno L'anno del Gioco
	 */
	public void setAnno(int anno) {
		this.anno = anno;
	}

	/**
	 * @return String Il link al video del Gioco
	 */
	public String getVideo() {
		return video;
	}

	/**
	 * Setta il link del video del Gioco
	 * 
	 * @param String
	 *            video Il link del video del Gioco
	 */
	public void setVideo(String video) {
		this.video = video;
	}

	/**
	 * @return String Il genere del Gioco
	 */
	public String getGenere() {
		return genere;
	}

	/**
	 * Setta il genere del Gioco
	 * 
	 * @param String
	 *            genere Il genere del Gioco
	 */
	public void setGenere(String genere) {
		this.genere = genere;
	}

	/**
	 * @return int Il PEGI del Gioco
	 */
	public int getPegi() {
		return pegi;
	}

	/**
	 * Setta il PEGI del Gioco
	 * 
	 * @param int
	 *            pegi Il PEGI del Gioco
	 */
	public void setPegi(int pegi) {
		this.pegi = pegi;
	}

}
