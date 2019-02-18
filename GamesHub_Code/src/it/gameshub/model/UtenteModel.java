package it.gameshub.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.gameshub.bean.Utente;

public class UtenteModel {
	private static DataSource ds;

	private static final String TABLE_NAME = "Utente";
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gameshub?useSSL=false", "root", "root");
	}
	

	/**
	 * Inserisce un utente
	 * 
	 * @param Utente user L'oggetto Utente da aggiungere
	 */
	public void saveUser(Utente user) throws SQLException {
		Connection connection = null;

		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UtenteModel.TABLE_NAME
				+ " (Username,Pin,Nome, Cognome,DataNascita,codiceFiscale,Telefono,Email,IndirizzoSpedizione,Sesso,Tipo,HashText,DataInvioMail)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
		
			connection = getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPin());
			preparedStatement.setString(3, user.getNome());
			preparedStatement.setString(4, user.getCognome());
			preparedStatement.setDate(5, user.getDataDiNascita());
			preparedStatement.setString(6, user.getCodiceFiscale());
			preparedStatement.setString(7, user.getTelefono());
			preparedStatement.setString(8, user.getEmail());
			preparedStatement.setString(9, user.getIndirizzoSpedizione());
			preparedStatement.setString(10, user.getSesso());
			preparedStatement.setString(11, user.getTipo());
			preparedStatement.setString(12, user.getMyHash());
			preparedStatement.setDate(13, new java.sql.Date(System.currentTimeMillis()));

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
	 * Elimina utente
	 * 
	 * @param String username L'username dell'utente da eliminare
	 * 
	 * @return boolean True se l'utente è stato eliminato False altrimenti
	 */
	public boolean deleteUser(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + UtenteModel.TABLE_NAME + " WHERE Username = ?";

		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

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
	 * Restituisce un utente
	 * 
	 * @param String username L'username dell'utente da prelevare
	 * 
	 * @return Utente L'utente prelevato
	 */
	public Utente getUser(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Utente bean = new Utente();

		String selectSQL = "SELECT * FROM " + UtenteModel.TABLE_NAME + " WHERE Username = ? ";

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setUsername(rs.getString("Username"));
				bean.setPin(rs.getString("Pin"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setDataDiNascita(rs.getDate("DataNascita"));
				bean.setCodiceFiscale(rs.getString("codiceFiscale"));
				bean.setTelefono(rs.getString("Telefono"));
				bean.setEmail(rs.getString("Email"));
				bean.setIndirizzoSpedizione(rs.getString("IndirizzoSpedizione"));
				bean.setSesso(rs.getString("Sesso"));
				bean.setTipo(rs.getString("Tipo"));
				bean.setVerificato(rs.getBoolean("Verificato"));
				bean.setMyHash(rs.getString("HashText"));

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
	 * Preleva tutti gli utenti
	 * 
	 * @return Collection<Utente> Tutti gli utenti salvati
	 */
	public Collection<Utente> getAllUsers(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Utente> users = new LinkedList<Utente>();

		String selectSQL = "SELECT *  FROM " + UtenteModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Utente bean = new Utente();

				bean.setUsername(rs.getString("Username"));
				bean.setPin(rs.getString("Pin"));
				bean.setNome(rs.getString("Nome"));
				bean.setCognome(rs.getString("Cognome"));
				bean.setDataDiNascita(rs.getDate("DataNascita"));
				bean.setCodiceFiscale(rs.getString("codiceFiscale"));
				bean.setTelefono(rs.getString("Telefono"));
				bean.setEmail(rs.getString("Email"));
				bean.setIndirizzoSpedizione(rs.getString("IndirizzoSpedizione"));
				bean.setSesso(rs.getString("Sesso"));
				bean.setTipo(rs.getString("Tipo"));
				bean.setMyHash(rs.getString("HashText"));
				bean.setVerificato(rs.getBoolean("Verificato"));
				users.add(bean);
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
		return users;

	}

	/**
	 * Controlla se esiste un utente con username uguale alla stringa passata come parametro
	 * 
	 * @param String username Un username da verificare
	 * 
	 * @return boolean True se esiste un utente con quell'username False altrimenti
	 */
	public boolean isAnUser(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		boolean v;
		String selectSQL = "SELECT *  FROM " + UtenteModel.TABLE_NAME + " WHERE Username = ? ";
		try {
		
			connection = getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);
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

	
	/**
	 * Permette di completare la registrazione di un utente 
	 * 
	 * @param String mail L'email dell'utente
	 * @param String hash Un codice associato all'utente
	 * 
	 * @return boolean True se l'utente è stato attivato False altrimenti
	 */
	public boolean activateUser(String email, String hash) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement1 = null;
		boolean v = false;
		String selectSQL = "SELECT * FROM " + UtenteModel.TABLE_NAME
				+ " WHERE Email = ? and HashText = ? and Verificato = ? ";
		try {

			connection = getConnection();

			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, hash);
			preparedStatement.setInt(3, 0);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {

				String selectSQL1 = "update " + UtenteModel.TABLE_NAME + " set Verificato = ? "
						+ " WHERE  Email = ? and HashText = ? ";
				preparedStatement1 = connection.prepareStatement(selectSQL1);
				preparedStatement1.setInt(1, 1);
				preparedStatement1.setString(2, email);
				preparedStatement1.setString(3, hash);

				int i = preparedStatement1.executeUpdate();
				
				if (i == 1) {
					v = true;
				} else {
					v = false;
				}
			}

		} finally {
			try {
				if (preparedStatement != null && preparedStatement1 != null) {
					preparedStatement.close();
					preparedStatement1.close();
				}
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return v;
	}
	
	/**
	 * Aggiorna alcune informazioni di un utente
	 * 
	 * @param String username L'username dell'utente
	 * @param String password La password dell'utente
	 * @param String telefono Il numero di telefono dell'utente
	 * @param String indirizzo L'indirizzo dell'utente
	 * 
	 */
	public void doUpdate(String username, String password, String telefono, String indirizzo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + UtenteModel.TABLE_NAME
				+ " set Telefono = ?, IndirizzoSpedizione = ?, Pin = ? " + " WHERE Username = ? ";

		try {
			
			connection = getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, telefono);
			preparedStatement.setString(2, indirizzo);
			preparedStatement.setString(3, password);
			preparedStatement.setString(4, username);

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