package it.gameshub.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import it.gameshub.bean.Carta;
import it.gameshub.bean.Ordine;

public class CartaModel {
	private static DataSource ds;

	private static final String TABLE_NAME = "Carta";

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	
	/**
	 * Inserisce una carta
	 * 
	 * @param Carta
	 *            carta L'oggetto Carta da aggiungere
	 */
	public synchronized void addCarta(Carta carta) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + CartaModel.TABLE_NAME
				+ " (NumeroCarta,Cvv,Scadenza,Saldo,Utente) VALUES (?, ?, ?, ?, ?)";
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, carta.getNumeroCarta());
			preparedStatement.setString(2, carta.getCvv());
			preparedStatement.setString(3, carta.getScadenza());
			preparedStatement.setFloat(4, carta.getSaldo());
			preparedStatement.setString(5, carta.getUtente());

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
	 * Restituisce la carta dell'utente
	 * 
	 * @param String
	 *            username L'username dell'utente al quale la carta è associata
	 * 
	 * @return Carta La carta associata all'utente
	 */
	public Carta getCarta(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Carta bean = new Carta();
		String selectSQL = "SELECT * FROM " + CartaModel.TABLE_NAME + " WHERE Utente = ?";
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setNumeroCarta(rs.getString("NumeroCarta"));
				bean.setCvv(rs.getString("Cvv"));
				bean.setScadenza(rs.getString("Scadenza"));
				bean.setUtente(rs.getString("Utente"));
				bean.setSaldo(rs.getFloat("Saldo"));

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

	/**
	 * Elimina la carta
	 * 
	 * @param String user L'username dell'utente della carta da eliminare
	 * 
	 * @return boolean True se la carta è stata eliminata False altrimenti
	 */
	public synchronized boolean deleteCarta(String user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + CartaModel.TABLE_NAME + " WHERE Utente = ?";

		try {
			// connection = ds.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, user);

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

	/**
	 * Verifica se esiste una carta
	 * 
	 * @param String
	 *            username L'username dell'utente al quale la carta è associata
	 * 
	 * @return boolean True se la carta esiste False altrimenti
	 */
	public boolean existCarta(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String selectSQL = "SELECT * FROM " + CartaModel.TABLE_NAME + " WHERE Utente = ?";
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.first())
				return true;
			else
				return false;

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
	 * Aggiorna il saldo della carta
	 * 
	 * @param long saldo Il nuovo saldo della carta
	 * @param String numeroCarta Il numero della carta
	 * 
	 */
	public void doUpdate(float saldo,String numeroCarta) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + CartaModel.TABLE_NAME + " set Saldo = ? " + " WHERE NumeroCarta = ? ";

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setFloat(1, saldo);
			preparedStatement.setString(2, numeroCarta);
	
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

	}

}
