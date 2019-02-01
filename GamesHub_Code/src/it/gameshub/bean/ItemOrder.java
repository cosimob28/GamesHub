package it.gameshub.bean;

import it.gameshub.bean.Immagine;
import it.gameshub.bean.Gioco;
//import java.util.Comparator;

//Questa classe rappresenta un ordine temporaneo 
public class ItemOrder {

	private Gioco gioco;
	private Immagine image;
	private int quantit�;

	public ItemOrder() {
		this.gioco = null;
		this.image = null;
	}

	public ItemOrder(Gioco gioco) {
		this.gioco = gioco;
		quantit� = 1;
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

	public void addQuantit�() {
		quantit�++;
	}

	public void addQuantit�(int x) {
		quantit� = quantit� + x;
	}

	public void setQuantit�(int x) {
		quantit� = x;
	}

	public int getQuantit�() {

		return quantit�;
	}

	// /*Comparator per ordinare la lista dei prodotti in ordine di prezzo
	// */
	// public static Comparator<ItemOrder> PriceComparator = new
	// Comparator<ItemOrder>() {
	//
	// public int compare(ItemOrder o1,ItemOrder o2){double
	// ItemPrice1=o1.getProductBean().getPrice();double
	// ItemPrice2=o2.getProductBean().getPrice();
	//
	// // ascending order
	// double tot=ItemPrice1-ItemPrice2;int totInt=(int)tot;return totInt;
	//
	// // descending order
	// // return (int) (ItemPrice2-ItemPrice1);
	// }};
	//
	// /* Comparator per ordinare la lista dei prodotti per anno */
	// public static Comparator<ItemOrder> YearComparator = new
	// Comparator<ItemOrder>() {
	//
	// public int compare(ItemOrder o1,ItemOrder o2){
	//
	// int ItemYear1=o1.getProductBean().getAnno();int
	// ItemYear2=o2.getProductBean().getAnno();
	//
	// /* For ascending order */
	// // return ItemYear1-ItemYear2;
	//
	// /* For descending order */
	// return ItemYear2-ItemYear1;}};
	//
	// public static Comparator<ItemOrder> NameComparator = new
	// Comparator<ItemOrder>() {
	//
	// public int compare(ItemOrder o1, ItemOrder o2) {
	// String ItemName1 = o1.getProductBean().getName();
	// String ItemName2 = o2.getProductBean().getName();
	//
	// //ascending order
	// return ItemName1.compareTo(ItemName2);
	//
	// //descending order
	// //return ItemName2.compareTo(ItemName1);
	// }};*/

}
