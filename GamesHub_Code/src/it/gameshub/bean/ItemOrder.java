package it.gameshub.bean;

import it.gameshub.bean.Immagine;

import java.util.Comparator;

import it.gameshub.bean.Gioco;
//import java.util.Comparator;

//Questa classe rappresenta un ordine temporaneo 
public class ItemOrder {

	private Gioco gioco;
	private Immagine image;
	private int quantità;

	public ItemOrder() {
		this.gioco = null;
		this.image = null;
	}

	public ItemOrder(Gioco gioco) {
		this.gioco = gioco;
		quantità = 1;
	}

	public void setGioco(Gioco game) {
		this.gioco = game;
	}

	public Immagine getImage() {
		return image;
	}

	public void setImage(Immagine image) {
		this.image = image;
	}

	public Gioco getGioco() {
		return gioco;
	}

	public void addQuantità() {
		quantità++;
	}

	public void addQuantità(int x) {
		quantità = quantità + x;
	}

	public void setQuantità(int x) {
		quantità = x;
	}

	public int getQuantità() {

		return quantità;
	}

	/*
	 * Comparator per ordinare la lista dei prodotti in ordine di prezzo
	 */
	public static Comparator<ItemOrder> PriceComparator = new Comparator<ItemOrder>() {

		public int compare(ItemOrder o1, ItemOrder o2) {
			double ItemPrice1 = o1.getGioco().getPrice();
			double ItemPrice2 = o2.getGioco().getPrice();

			// ascending order
			double tot = ItemPrice1 - ItemPrice2;
			int totInt = (int) tot;
			return totInt;

			// descending order
			// return (int) (ItemPrice2-ItemPrice1);
		}
	};

	/* Comparator per ordinare la lista dei prodotti per anno */
	public static Comparator<ItemOrder> YearComparator = new Comparator<ItemOrder>() {

		public int compare(ItemOrder o1, ItemOrder o2) {

			int ItemYear1 = o1.getGioco().getAnno();
			int ItemYear2 = o2.getGioco().getAnno();

			/* For ascending order */
			// return ItemYear1-ItemYear2;

			/* For descending order */
			return ItemYear2 - ItemYear1;
		}
	};

	public static Comparator<ItemOrder> NameComparator = new Comparator<ItemOrder>() {

		public int compare(ItemOrder o1, ItemOrder o2) {
			String ItemName1 = o1.getGioco().getName();
			String ItemName2 = o2.getGioco().getName();

			// ascending order
			return ItemName1.compareTo(ItemName2);

			// descending order
			// return ItemName2.compareTo(ItemName1);
		}
	};

}
