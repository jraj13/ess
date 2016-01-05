package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GetConnection {
	

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
System.out.println("inside getconnection");
		Connection con=null;
		try {
			System.out.println("INSIDE TRY GETCONNECTION");
			 
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			//con = DriverManager.getConnection("jdbc:oracle:thin:192.168.2.84:1521:ORCL", "ESS_DEV","ESS_DEV");
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.2.25:1521:orcl", "ESS_DEV","ESS_DEV");
			System.out.println("connection from======"+con);
		} catch (Exception e) {

			System.out.println("Exception from Connection Page==="
					+ e.getMessage());
			// TODO: handle exception
		}

		return con;

	}
	
	/* FOR CLOSE CONNECTION   */
	
	public static void closeConnection(Connection paramConnection)
	   {
	     try {
	       if (paramConnection != null)
	       {
	         paramConnection.close();
	         paramConnection = null;
	       }
	     } catch (Exception localException) {
	       System.out.println("Exception while closing the connection" + localException);
	       localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(Statement paramStatement)
	   {
	     try
	     {
	       if (paramStatement != null)
	       {
	         paramStatement.close();
	         paramStatement = null;
	       }
	     } catch (Exception localException) {
	       System.out.println("Exception while closing the connection" + localException);
	      localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(ResultSet paramResultSet, Statement paramStatement)
	   {
	     try
	     {
	       if (paramResultSet != null)
	       {
	         paramResultSet.close();
	         paramResultSet = null;
	       }
	       if (paramStatement != null)
	       {
	         paramStatement.close();
	         paramStatement = null;
	       }
	     } catch (Exception localException) {
	       System.out.println("Exception while closing the connection" + localException);
	       localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(ResultSet paramResultSet, PreparedStatement paramPreparedStatement)
	   {
	     try
	     {
	       if (paramResultSet != null)
	       {
	        paramResultSet.close();
	        paramResultSet = null;
	       }
	      if (paramPreparedStatement != null)
	       {
	        paramPreparedStatement.close();
	        paramPreparedStatement = null;
	       }
	     } catch (Exception localException) {
	      System.out.println("Exception while closing the connection" + localException);
	      localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(PreparedStatement paramPreparedStatement)
	   {
	     try
	     {
	      if (paramPreparedStatement != null)
	       {
	       paramPreparedStatement.close();
	       paramPreparedStatement = null;
	       }
	     } catch (Exception localException) {
	     System.out.println("Exception while closing the connection" + localException);
	      localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(Connection paramConnection, ResultSet paramResultSet, Statement paramStatement)
	   {
	     try
	     {
	     if (paramResultSet != null)
	       {
	       paramResultSet.close();
	       paramResultSet = null;
	       }
	      if (paramStatement != null)
	       {
	       paramStatement.close();
	       paramStatement = null;
	       }
	       if (paramConnection != null)
	       {
	        paramConnection.close();
	         paramConnection = null;
	       }
	     } catch (Exception localException) {
	       System.out.println("Exception while closing the connection" + localException);
	       localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(Connection paramConnection, ResultSet paramResultSet, PreparedStatement paramPreparedStatement)
	   {
	     try
	     {
	      if (paramResultSet != null)
	       {
	         paramResultSet.close();
	        paramResultSet = null;
	       }
	       if (paramPreparedStatement != null)
	       {
	         paramPreparedStatement.close();
	         paramPreparedStatement = null;
	       }
	       if (paramConnection != null)
	       {
	        paramConnection.close();
	        paramConnection = null;
	       }
	     } catch (Exception localException) {
	      System.out.println("Exception while closing the connection" + localException);
	      localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(Connection paramConnection, PreparedStatement paramPreparedStatement)
	   {
	     try {
	       if (paramPreparedStatement != null)
	       {
	         paramPreparedStatement.close();
	        paramPreparedStatement = null;
	       }
	       if (paramConnection != null)
	       {
	       paramConnection.close();
	         paramConnection = null;
	       }
	     } catch (Exception localException) {
	       System.out.println("Exception while closing the connection" + localException);
	       localException.printStackTrace();
	     }
	   }
	 
	   public static void closeConnection(Connection paramConnection, Statement paramStatement)
	   {
	     try
	     {
	       if (paramStatement != null)
	       {
	         paramStatement.close();
	         paramStatement = null;
	       }
	       if (paramConnection != null)
	       {
	         paramConnection.close();
	         paramConnection = null;
	       }
	     } catch (Exception localException) {
	      System.out.println("Exception while closing the connection" + localException);
	      localException.printStackTrace();
	     }
	   }
	
	
	
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		
		
		Connection Con=GetConnection.getConnection();
		//System.out.println("connection from======"+Con);
	}
	

}
