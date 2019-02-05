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
		Iterator<?> it = compOrdine.iterator();
		Composizione comp = null;
		if (iva == 0) {
			comp = (Composizione) it.next();
			setIva(22);
		}
	}

	public int getIva() {
		return iva;
	}

	public void setIva(int iva) {
		this.iva = iva;
	}

}
