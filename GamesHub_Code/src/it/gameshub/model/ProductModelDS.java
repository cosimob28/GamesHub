package it.gameshub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductModelDS {

	private static DataSource ds;
 
//	static {
//		try { 
//			//Contesto iniziale JNDI
//			Context initCtx = new InitialContext();
//			Context envCtx = (Context) initCtx.lookup("java:comp/env");
//			
//            //Look up del data source
//			ds = (DataSource) envCtx.lookup("jdbc/gameshub");
//
//		} catch (NamingException e) {
//			System.out.println("Error:" + e.getMessage());
//		}
//	}

	private static final String TABLE_NAME = "Gioco";

	
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità,Iva) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			 //Si ottiene una connessione da utilizzare come 
			 //una normale connessione JDBC
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1,product.getCode());
			preparedStatement.setString(2,product.getName());
			preparedStatement.setFloat(3,product.getPrice());  //modificare con setNumeric o setDouble
			preparedStatement.setInt(4,product.getPegi());
			preparedStatement.setString(5,product.getGenere());
			preparedStatement.setString(6,product.getDescription());
			preparedStatement.setInt(7,product.getAnno());
			preparedStatement.setString(8,product.getPiattaforma());
			preparedStatement.setString(9,product.getVideo());
			preparedStatement.setInt(10,product.getQuantity());
			preparedStatement.setInt(11,product.getIva());

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

	
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE SerialNumber = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("SerialNumber"));
				bean.setName(rs.getString("Nome"));
				bean.setPrice(rs.getFloat("Prezzo"));
				bean.setPegi(rs.getInt("Pegi"));
				
				bean.setGenere(rs.getString("Genere"));
				bean.setDescription(rs.getString("Descrizione"));
				bean.setAnno(rs.getInt("Anno"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setVideo(rs.getString("Video"));
				bean.setQuantity(rs.getInt("Quantità"));
				bean.setIva(rs.getInt("Iva"));
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

	
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE SerialNumber = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

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


	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT *  FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("SerialNumber"));
				bean.setName(rs.getString("Nome"));
				bean.setPrice(rs.getFloat("Prezzo"));
				bean.setPegi(rs.getInt("Pegi"));
				bean.setGenere(rs.getString("Genere"));
				bean.setDescription(rs.getString("Descrizione"));
				bean.setAnno(rs.getInt("Anno"));
				bean.setPiattaforma(rs.getString("Piattaforma"));
				bean.setVideo(rs.getString("Video"));
				bean.setQuantity(rs.getInt("Quantità"));
				bean.setIva(rs.getInt("Iva"));
				products.add(bean);
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
		return products;
	}
	
	
	//Effettua l'update della quantità del gioco con SerialNumber = code 
	public synchronized void doUpdate(int code,int quantità) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + ProductModelDS.TABLE_NAME +" set Quantità = ? "+" WHERE SerialNumber = ? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1,quantità);
			preparedStatement.setInt(2, code);

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


	
 public void doUpdate(int code, String video, String descrizione, float prezzo,int qty) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + ProductModelDS.TABLE_NAME +" set Quantità = ?, Video= ?, Descrizione= ?, Prezzo= ? "+" WHERE SerialNumber = ? ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1,qty);
			preparedStatement.setString(2,video);
			preparedStatement.setString(3,descrizione);
			preparedStatement.setFloat(4,prezzo);
			
			preparedStatement.setInt(5,code);

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





public void updateIva(int iva) throws SQLException {
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	int result = 0;

	String deleteSQL = "update " + ProductModelDS.TABLE_NAME +" set Iva= ? ";

	try {
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(deleteSQL);
		preparedStatement.setInt(1,iva);
		
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