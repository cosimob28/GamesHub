package it.gameshub.bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.gameshub.bean.ItemOrder;
import it.gameshub.bean.Gioco;

//Questa classe rappresenta un carrello. Il carrello rappresenta una List di ItemOrder
public class Carrello {
	private List<ItemOrder> products;

	public Carrello() {
		products = new ArrayList<ItemOrder>();
	}

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

	public void deleteGameInTheCart(Gioco gioco) throws SQLException {
		for (ItemOrder prod : products) {
			if (prod.getGioco().getCode() == gioco.getCode()) {
				products.remove(prod);
				break;
			}
		}
	}

	public List<ItemOrder> getGamesInTheCart() {
		if (products.size() == 0)
			return null;
		else
			return products;
	}

	public void setGames(ArrayList<ItemOrder> list) {
		this.products = list;
	}

	// vecchio cercaOrdine
	public ItemOrder searchItemOrder(String serialNumber) {
		int sNumber = Integer.parseInt(serialNumber);
		for (ItemOrder prod : products) {
			if (prod.getGioco().getCode() == sNumber) {
				return prod;
			}
		}
		return null;
	}

	public boolean isEmpty() {
		if (products.size() == 0)
			return true;
		else
			return false;
	}

	public float getTotale() {
		double imponibile = 0;
		for (ItemOrder prod : products) {
			imponibile += prod.getQuantità() * prod.getGioco().getPrice();
		}
		float totale = (float) (imponibile + ((22 * imponibile) / 100));
		return (float) (Math.ceil(totale * Math.pow(10, 2)) / Math.pow(10, 2));
	}

}
