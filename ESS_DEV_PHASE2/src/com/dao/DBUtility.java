package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility {
	private static Connection connection = null;

	public static Connection getConnection() throws Exception {
		if (connection != null)
			return connection;
		else {
			// Store the database URL in a string
		//	String serverName = "192.168.2.25";
		//	String portNumber = "1521";
		//	String sid = "orcl";
		//	String dbUrl = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
		//	System.out.println(dbUrl);
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// set the url, username and password for the databse
		//	connection = DriverManager.getConnection(dbUrl,"ESS_DEV","ESS_DEV");
			
			connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.25:1521:orcl", "ESS_DEV","ESS_DEV");
			
			
			return connection;
		}
	}
}