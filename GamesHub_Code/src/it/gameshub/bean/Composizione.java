package it.gameshub.bean;

public class Composizione {
	private float costo;
	private int ordine, quantità, gioco;
	String nomeGioco, immagine;

	public Composizione() {

	}


	public Composizione(float costo, int ordine, int quantità, int gioco, String nomeGioco, String immagine) {
		super();
		this.costo = costo;
		this.ordine = ordine;
		this.quantità = quantità;
		this.gioco = gioco;
		this.nomeGioco = nomeGioco;
		this.immagine = immagine;
	}

	public String getNomeGioco() {
		return nomeGioco;
	}

	public void setNomeGioco(String nomeGioco) {
		this.nomeGioco = nomeGioco;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public float getCosto() {
		return costo;
	}

	public void setCosto(Float costo) {
		this.costo = costo;
	}

	public int getOrdine() {
		return ordine;
	}

	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}

	public int getGioco() {
		return gioco;
	}

	public void setGioco(int gioco) {
		this.gioco = gioco;
	}

}
