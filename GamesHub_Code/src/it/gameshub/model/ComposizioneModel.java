package it.gameshub.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.gameshub.bean.Composizione;
import it.gameshub.bean.Ordine;

public class ComposizioneModel {

	private static DataSource ds;

	private static final String TABLE_NAME = "Composizione";
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	
	/**
	 * Inserisce una composizione
	 * 
	 * @param Composizione comp L'oggetto Composizione da aggiungere
	 */
	public void addComposizione(Composizione comp) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ComposizioneModel.TABLE_NAME
				+ " (Costo,Quantità,Ordine,Gioco,NomeGioco,Immagine) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setFloat(1, comp.getCosto());
			preparedStatement.setInt(2, comp.getQuantità());
			preparedStatement.setInt(3, comp.getOrdine());
			preparedStatement.setInt(4, comp.getGioco());
			preparedStatement.setString(5, comp.getNomeGioco());
			preparedStatement.setString(6, comp.getImmagine());
			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

	}

	/**
	 * Restituisce le composizioni di un ordine
	 * 
	 * @param int idOdine L'id dell'ordine
	 * 
	 * @return Collection<Composizione> Tutte le composizioni di un ordine
	 */
	public Collection<Composizione> searchComposizione(int idOrdine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Composizione> composizioneOrdine = new LinkedList<Composizione>();

		String selectSQL = "SELECT * FROM " + ComposizioneModel.TABLE_NAME + " WHERE Ordine = ?";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Composizione bean = new Composizione();

				bean.setCosto(rs.getFloat("Costo"));
				bean.setQuantità(rs.getInt("Quantità"));
				bean.setOrdine(rs.getInt("Ordine"));
				bean.setGioco(rs.getInt("Gioco"));
				bean.setNomeGioco(rs.getString("NomeGioco"));
				bean.setImmagine(rs.getString("Immagine"));
				composizioneOrdine.add(bean);

			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return composizioneOrdine;
	}

	/**
	 * Elimina le composizioni di un ordine
	 * 
	 * @param int idOdine L'id dell'ordine
	 * @param int idOrdine L'id dell'ordine 
	 * 
	 * @return boolean True se le composizioni sono state eliminate False altrimenti
	 */
	public boolean deleteComposizione(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ComposizioneModel.TABLE_NAME + " WHERE Ordine = ?";

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idOrdine);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

}
