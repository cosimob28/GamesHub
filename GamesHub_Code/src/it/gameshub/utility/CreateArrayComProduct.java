package it.gameshub.utility;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import it.gameshub.bean.Gioco;
import it.gameshub.bean.Immagine;
import it.gameshub.bean.ItemOrder;

public class CreateArrayComProduct {

	public CreateArrayComProduct() {

	}

	public ArrayList<ItemOrder> createArray(Collection<Immagine> immagini, Collection<Gioco> giochi) {
		ArrayList<ItemOrder> arrayComProduct = new ArrayList<ItemOrder>();
		Collection<Gioco> products = giochi;
		Collection<Immagine> images = immagini;

		/* Creazione arrayComProduct */
		int iva = 0;
		if (products != null && products.size() != 0) {

			Iterator<?> it = products.iterator();
			while (it.hasNext()) {

				ItemOrder prodotto = new ItemOrder();
				Gioco game = (Gioco) it.next();

				prodotto.setGioco(game);
				if (iva == 0) // iva = prodotto.getGioco().getIva();
					iva = 22;
				boolean hasImage = false;

				if (images != null && images.size() != 0) {
					Iterator<?> iti = images.iterator();

					while (iti.hasNext() && hasImage == false) {

						Immagine image = (Immagine) iti.next();

						if (image.getGame() == game.getCode()) {
							if (image.getName().equals("img/games/" + game.getName() + "/1.jpg")) {
								hasImage = true;

								prodotto.setImage(image);
								break;
							}
						}
					}
				}
				if (!hasImage) {
					Immagine image = new Immagine();
					image.setGame(game.getCode());
					image.setName("img/website/error.png");

					prodotto.setImage(image);
				}

				arrayComProduct.add(prodotto);
			}
		}
		return arrayComProduct;
	}

}
