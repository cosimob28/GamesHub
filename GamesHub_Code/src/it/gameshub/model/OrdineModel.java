package it.gameshub.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
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

	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	/**
	 * Inserisce un ordine
	 * 
	 * @param Ordine ordine L'oggetto Ordine da aggiungere
	 */
	public synchronized void addOrdine(Ordine ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineModel.TABLE_NAME
				+ " (Importo,Spedizione,DataOrdine,Stato,Indirizzo,Utente) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setFloat(1, ordine.getImporto());
			preparedStatement.setInt(2, ordine.getSpedizione());
			preparedStatement.setDate(3, ordine.getDataOrdine());
			preparedStatement.setString(4, ordine.getStato());
			preparedStatement.setString(5, ordine.getIndirizzo());
			preparedStatement.setString(6, ordine.getUtente());
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
	 * Preleva tutti gli ordini effettuati da un utente
	 * 
	 * @param Utente user L'utente che ha effettuato gli ordini
	 * 
	 * @return Collection<Gioco> Tutti i giochi salvati
	 */
	public synchronized Collection<Ordine> getListaOrdiniUtente(Utente user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Ordine> ordiniCliente = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE Utente = ?";

		try {
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user.getUsername());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Ordine bean = new Ordine();

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setSpedizione(rs.getInt("Spedizione"));
				bean.setStato(rs.getString("Stato"));
				bean.setIndirizzo(rs.getString("Indirizzo"));
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

	/**
	 * Preleva tutti gli ordini effettuati dai clienti
	 * 
	 * @return Collection<Ordine> Tutti gli ordini effettuati
	 */
	public synchronized Collection<Ordine> getListaOrdini() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Ordine> ordiniClienti = new LinkedList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME;

		try {
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Ordine bean = new Ordine();

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setSpedizione(rs.getInt("Spedizione"));
				bean.setStato(rs.getString("Stato"));
				bean.setIndirizzo(rs.getString("Indirizzo"));
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

	
public synchronized Collection<Ordine> getListaOrdini(String idOrdine, String annoOrdine, String statoOrdine) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<Ordine> ordiniClienti = new LinkedList<Ordine>();
		
		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE ";
		
		boolean done=false;
		
		if(idOrdine !=null) { selectSQL+= "idOrdine LIKE '%" + idOrdine + "%' "; 
		                      done=true;}
		if(annoOrdine!=null && !annoOrdine.equalsIgnoreCase("Anno")) {
			if(done==true) selectSQL += " and ";
			selectSQL+= "YEAR(dataOrdine) >= " + annoOrdine + " ";
					};
		if(statoOrdine!=null && !statoOrdine.equalsIgnoreCase("Stato")) { 
			if(done==true) selectSQL += " and ";
			selectSQL+= "stato = '" + statoOrdine + "' ";
			}
		selectSQL+=" ;";
		

		try {
			//connection = Manager.getConnection();
			connection = getConnection();
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
	
	
	
	
	/**
	 * Elimina ordine
	 * 
	 * @param int idOrdine Il codice dell'ordine da eliminare
	 * 
	 * @return boolean True se l'ordine è stato eliminato False altrimenti
	 */
	public boolean deleteOrdine(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + OrdineModel.TABLE_NAME + " WHERE IdOrdine = ?";

		try {
			//connection = Manager.getConnection();
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

	/**
	 * Restituisce un ordine 
	 * 
	 * @param int idOrdine Il codice dell'ordine da prelevare
	 * 
	 * @return Ordine L'ordine prelevato
	 */
	public Ordine getOrder(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE IdOrdine = ? ";
		try {
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setIdOrdine(rs.getInt("IdOrdine"));
				bean.setImporto(rs.getFloat("Importo"));
				bean.setSpedizione(rs.getInt("Spedizione"));
				bean.setStato(rs.getString("Stato"));
				bean.setIndirizzo(rs.getString("Indirizzo"));
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

	/**
	 * Cambia lo stato di un ordine
	 * 
	 * @param int idOrdine Il codice dell'ordine
	 * @param String stato Lo stato dell'ordine
	 */
	public void changeOrderState(int idOrdine, String stato) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + OrdineModel.TABLE_NAME  + "  set Stato = ? " + " WHERE IdOrdine = ? ";

		try {
			// connection = ds.getConnection();
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, stato);
			preparedStatement.setInt(2, idOrdine);

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
	/**
	 * Aggiunge il TrackingId a un ordine
	 * 
	 * @param int idOrdine Il codice dell'ordine
	 * @param String trackingId Il trackingId da inserire
	 */
	public void addTrackingId(int idOrdine, String trackingId) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + OrdineModel.TABLE_NAME + " set TrackingId = ? " + " WHERE IdOrdine="+ idOrdine ;

		try {
			// connection = ds.getConnection();
			//connection = Manager.getConnection();
			connection = getConnection();
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
	
	/**
	 * Prelevare l'id dell'ultimo ordine effettuato
	 * 
	 * @return int L'id dell'ultimo ordine effettuato
	 */
	public int doMaxIdOrder() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int maxIdOrder = 0;

		String selectSQL = "SELECT max(IdOrdine) as max FROM " + OrdineModel.TABLE_NAME;

		try {
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				maxIdOrder = rs.getInt("max");

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

		return maxIdOrder;

	}
	
	/**
	 * Controlla se esiste un ordine con id uguale all'intero passato come parametro
	 * 
	 * @param int idOrdine Un id da verificare
	 * 
	 * @return boolean True se esiste un ordine con quell'id False altrimenti
	 */
	public boolean isAnOrder(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		boolean v;
		String selectSQL = "SELECT *  FROM " + OrdineModel.TABLE_NAME + " WHERE IdOrdine = ? ";
		try {
		
			//connection = Manager.getConnection();
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idOrdine);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next())
				v = true;
			else
				v = false;

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return v;
	}



}
