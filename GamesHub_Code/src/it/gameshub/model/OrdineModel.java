package it.gameshub.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.gameshub.bean.Ordine;
import it.gameshub.bean.Utente;

public class OrdineModel {
	private static DataSource ds;

	private static final String TABLE_NAME = "Ordine";

	// vecchio doSave
	public synchronized void addOrdine(Ordine ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineModel.TABLE_NAME + " (Importo,DataOrdine,Stato,Utente) VALUES (?, ?, ?, ?)";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setFloat(1, ordine.getImporto());
			preparedStatement.setDate(2, ordine.getDataOrdine());
			preparedStatement.setString(3, ordine.getStato());
			preparedStatement.setString(4, ordine.getUtente());
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

	// Restituisce tutti gli ordini di un utente
	// vecchio doRetrieveByKey
	public synchronized Collection<Ordine> getListaOrdiniUtente(Utente user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Ordine> ordiniCliente = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE Utente = ?";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user.getUsername());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Ordine bean = new Ordine();

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setStato(rs.getString("Stato"));
				bean.setTrackingId(rs.getString("TrackingId"));
				bean.setDataOrdine(rs.getDate("DataOrdine"));
				bean.setUtente(rs.getString("Utente"));
				ordiniCliente.add(bean);

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

		return ordiniCliente;
	}

	// Restituisce tutti gli ordini dei clienti
	public synchronized Collection<Ordine> getListaOrdini() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Ordine> ordiniClienti = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME;

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Ordine bean = new Ordine();

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setStato(rs.getString("Stato"));
				bean.setTrackingId(rs.getString("TrackingId"));
				bean.setDataOrdine(rs.getDate("DataOrdine"));
				bean.setUtente(rs.getString("Utente"));
				ordiniClienti.add(bean);

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

		return ordiniClienti;
	}

	public boolean deleteOrdine(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + OrdineModel.TABLE_NAME + " WHERE IdOrdine = '?'";

		try {
			connection = Manager.getConnection();
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

	public Ordine getOrder(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE IdOrdine = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setStato(rs.getString("Stato"));
				bean.setTrackingId(rs.getString("TrackingId"));
				bean.setDataOrdine(rs.getDate("DataOrdine"));
				bean.setUtente(rs.getString("Utente"));

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

	public void changeOrderState(int idOrdine, String stato) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + OrdineModel.TABLE_NAME + " set Stato = ?";

		try {
			// connection = ds.getConnection();
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, stato);

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

	public void addTrackingId(int idOrdine, String trackingId) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + OrdineModel.TABLE_NAME + " set TrackingId = ?";

		try {
			// connection = ds.getConnection();
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, trackingId);

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

	/*
	 * public int doMaxIdOrder() throws SQLException { Connection connection = null;
	 * PreparedStatement preparedStatement = null; int maxIdOrder = 0;
	 * 
	 * String selectSQL = "SELECT max(IdOrdine) as max FROM " +
	 * OrdineModel.TABLE_NAME;
	 * 
	 * try { connection = Manager.getConnection(); preparedStatement =
	 * connection.prepareStatement(selectSQL); ResultSet rs =
	 * preparedStatement.executeQuery();
	 * 
	 * if (rs.next()) { maxIdOrder= rs.getInt("max");
	 * 
	 * }
	 * 
	 * } finally { try { if (preparedStatement != null) preparedStatement.close(); }
	 * finally { if (connection != null) connection.close(); } }
	 * 
	 * return maxIdOrder;
	 * 
	 * }
	 */

	/*
	 * public int getNumOrderByYear(int anno) throws SQLException { Connection
	 * connection = null; PreparedStatement preparedStatement = null; int ris=0;
	 * Date inizioAnno = new Date(anno-1900,01-1,01); Date fineAnno = new
	 * Date(anno-1900,12-1,31);
	 * 
	 * String selectSQL = "SELECT COUNT(*) as count FROM " + OrdineModel.TABLE_NAME
	 * + " WHERE DataOrdine BETWEEN ? AND ? "; try { connection =
	 * ds.getConnection(); preparedStatement =
	 * connection.prepareStatement(selectSQL);
	 * preparedStatement.setDate(1,inizioAnno);
	 * preparedStatement.setDate(2,fineAnno); ResultSet rs =
	 * preparedStatement.executeQuery();
	 * 
	 * if(!rs.next()) ris=0; else ris= rs.getInt("count");
	 * 
	 * } finally { try { if (preparedStatement != null) preparedStatement.close(); }
	 * finally { if (connection != null) connection.close(); } } return ris; }
	 */

}
