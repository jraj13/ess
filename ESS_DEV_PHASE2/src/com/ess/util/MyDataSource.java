     package com.ess.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import oracle.jdbc.pool.OracleDataSource;

public class MyDataSource {

	private static DataSource instance = null;

	protected MyDataSource() {

	}

	public static DataSource getInstance() {
		if (instance == null) {
			instance = getDataSource();
		}
		return instance;
	}

	private static DataSource getDataSource() {
		Properties properties = new Properties();
		OracleDataSource dataSource = null;
		InputStream in = null;
		try {
			
			in = MyDataSource.class.getResourceAsStream("/ApplicationResources.properties");
			properties.load(in);
			dataSource = new OracleDataSource();
			System.out.println("Connection Url Is:"+properties.getProperty("ORACLE_DB_URL"));
			dataSource.setURL(properties.getProperty("ORACLE_DB_URL"));
			dataSource.setUser(properties.getProperty("ORACLE_DB_USERNAME"));
			dataSource.setPassword(properties.getProperty("ORACLE_DB_PASSWORD"));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (Exception e) {

				}
			}
		}
		return dataSource;
	}

	public static void close(PreparedStatement preparedStatement,
			Connection connection) {

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
			}
		}
	}

	public static void close(ResultSet resultSet,
			PreparedStatement preparedStatement, Connection connection) {

		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
			}
		}
	}

}


