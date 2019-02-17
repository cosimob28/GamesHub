package it.gameshub.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Gioco;

//Questa classe rappresenta un carrello. Il carrello rappresenta una List di ItemOrder
public class Carrello {
	private List<ItemOrder> products;

	/**
	 * Costruttore di Carrello
	 */
	public Carrello() {
		products = new ArrayList<ItemOrder>();
	}

	/**
	 * Costruttore di Carrello
	 */
	public Carrello(ArrayList<ItemOrder> products) {
		this.products = products;
	}

	/**
	 * Aggiunge un prodotto al Carrello
	 * 
	 * @param ItemOrder ordine L'ItemOrder da aggiungere al carrello
	 */
	public void addProduct(ItemOrder ordine) throws SQLException {
		int trovato = 0;
		if (products.size() == 0)
			products.add(ordine);

		else {

			for (int i = 0; i < products.size(); i++) {
				String nome = (products.get(i)).getGioco().getName();
				if (nome.equals(ordine.getGioco().getName())) {
					products.get(i).addQuantità();
					trovato = 1;
				}

			}
			if (trovato == 0)
				products.add(ordine);
		}

	}

	/**
	 * Elimina un prodotto dal carrello
	 * 
	 * @param Gioco gioco Il gioco da eliminare nel carrello.
	 * 
	 */
	public void deleteGameInTheCart(Gioco gioco) throws SQLException {
		for (ItemOrder prod : products) {
			if (prod.getGioco().getCode() == gioco.getCode()) {
				products.remove(prod);
				break;
			}
		}
	}

	/**
	 * Restituisce tutti gli ItemOrder presenti nel carrello
	 * 
	 * @return List<ItemOrder> La lista di ItemOrder presenti nel carrello.
	 */
	public List<ItemOrder> getGamesInTheCart() {
		if (products.size() == 0)
			return null;
		else
			return products;
	}
	
	
	/**
	 * Inserisce un insieme di ItemOrder nel carrello
	 * 
	 * @param ArrayList<ItemOrder> list La lista di ItemOrder da inserire.
	 * 
	 */
	public void setGames(ArrayList<ItemOrder> list) {
		this.products = list;
	}

	
	/**
	 * Cerca un prodotto nel carrello
	 * 
	 * @param String seriaNumber Il serialNumber del gioco da ricercare nel carrello
	 * 
	 * @return ItemOrder L'itemOrder che contiene il gioco cercato.
	 */
	public ItemOrder searchItemOrder(String serialNumber) {
		int sNumber = Integer.parseInt(serialNumber);
		for (ItemOrder prod : products) {
			if (prod.getGioco().getCode() == sNumber) {
				return prod;
			}
		}
		return null;
	}

	/**
	 * Verifica se il carrello è vuoto
	 * 
	 * @return boolean True se è vuoto False altrimenti.
	 * 
	 */
	public boolean isEmpty() {
		if (products.size() == 0)
			return true;
		else
			return false;
	}

	/**
	 * Svuota il carrello
	 * 
	 */
	public void svuotaCarrello() {
		products = new ArrayList<ItemOrder>();
	}

	/**
	 * Calcola il totale dei prezzi dei giochi presenti nel carrello
	 * 
	 * @return float Il totale dei prezzi.
	 * 
	 */
	public float getTotale() {
		double imponibile = 0;
		for (ItemOrder prod : products) {
			imponibile += prod.getQuantità() * prod.getGioco().getPrice();
		}
		float totale = (float) (imponibile + ((22 * imponibile) / 100));
		return (float) (Math.ceil(totale * Math.pow(10, 2)) / Math.pow(10, 2));
	}

}
