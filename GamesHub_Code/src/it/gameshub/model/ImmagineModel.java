package it.gameshub.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import it.gameshub.bean.Immagine;

public class ImmagineModel {
	private static DataSource ds;

	private static final String TABLE_NAME = "immagine";

	// Salva una immagine nel database
	public void saveImage(Immagine image) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ImmagineModel.TABLE_NAME + " (Nome,Gioco)" + " VALUES (?, ?)";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, image.getName());
			preparedStatement.setInt(2, image.getGame());

			preparedStatement.executeUpdate();

			connection.commit();
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

	// Elimina un immagine dal DB
	public boolean deleteImage(String path) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ImmagineModel.TABLE_NAME + " WHERE Nome = '?'";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, path);

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

	//vecchio doRetriveByKey
	public Immagine getImage(String path) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Immagine bean = new Immagine();

		String selectSQL = "SELECT * FROM " + ImmagineModel.TABLE_NAME + " WHERE Nome = '?' ";

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, path);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setName(rs.getString("Nome"));
				bean.setGame(rs.getInt("Gioco"));
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

	public Collection<Immagine> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Immagine> images = new LinkedList<Immagine>();

		String selectSQL = "SELECT *  FROM " + ImmagineModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = Manager.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Immagine bean = new Immagine();

				bean.setName(rs.getString("Nome"));
				bean.setGame(rs.getInt("Gioco"));

				images.add(bean);
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
		return images;

	}
}
