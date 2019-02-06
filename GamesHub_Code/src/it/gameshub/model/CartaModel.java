package it.gameshub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Ordine;

public class CartaModel {
	private static DataSource ds;

	private static final String TABLE_NAME = "Carta";

	public synchronized void addCarta(Carta carta) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + CartaModel.TABLE_NAME
				+ " (NumeroCarta,Cvv,Scadenza,Paese,Saldo,Utente) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, carta.getNumeroCarta());
			preparedStatement.setInt(2, carta.getCvv());
			preparedStatement.setString(3, carta.getScadenza());
			preparedStatement.setString(4, carta.getPaese());
			preparedStatement.setLong(5, carta.getSaldo());
			preparedStatement.setString(6, carta.getUtente());

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

	public Carta getCarta(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Carta bean = new Carta();
		String selectSQL = "SELECT * FROM " + CartaModel.TABLE_NAME + " WHERE Utente = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setNumeroCarta(rs.getString("NumeroCarta"));
				bean.setCvv(rs.getInt("Cvv"));
				bean.setScadenza(rs.getString("Scadenza"));
				bean.setPaese(rs.getString("Paese"));
				bean.setUtente(rs.getString("Utente"));
				bean.setSaldo(rs.getLong("Saldo"));

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

		return bean;
	}

}
