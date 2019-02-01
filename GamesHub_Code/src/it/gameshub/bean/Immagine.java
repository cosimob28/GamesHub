package it.gameshub.bean;

import java.io.Serializable;

public class Immagine implements Serializable {
	private static final long serialVersionUID = 1L;

	private String name;
	private int game;

	public Immagine() {
		name = "";
		game = -1;
	}

	public Immagine(String name, int game) {
		this.name = name;
		this.game = game;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGame() {
		return game;
	}

	public void setGame(int game) {
		this.game = game;
	}

	public boolean equals(Object x) {
		if (x instanceof Immagine) {
			Immagine im = (Immagine) x;
			if ((im.getGame() == this.game) && (im.getName().equalsIgnoreCase(this.name))) {
				return true;
			}
		}
		return false;

	}

	public String toString() {
		return this.getGame() + this.getName();
	}
}
