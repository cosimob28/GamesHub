package it.gameshub.bean;

import java.util.Collection;
import java.util.Iterator;

public class ItemComp {
	private Ordine ordine;
	private Collection<Composizione> compOrdine;
	private int iva;

	public ItemComp() {
		ordine = null;
		compOrdine = null;
		iva = 0;
	}

	public ItemComp(Ordine ordine, Collection<Composizione> compOrdine) {
		this.ordine = ordine;
		this.compOrdine = compOrdine;

	}

	public Ordine getOrdine() {
		return ordine;
	}

	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}

	public Collection<Composizione> getCompOrdine() {
		return compOrdine;
	}

	public void setCompOrdine(Collection<Composizione> compOrdine) {
		this.compOrdine = compOrdine;

	}

}
