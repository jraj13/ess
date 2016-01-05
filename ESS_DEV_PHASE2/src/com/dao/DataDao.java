package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dao.GetConnection;

public class DataDao {
	private Connection connection;

	public DataDao() throws Exception {
		//connection = DBUtility.getConnection();
	}

	public ArrayList<String> getFrameWork(String frameWork) {
		System.out.println("inside getFrameWork method");
		ArrayList<String> list = new ArrayList<String>();
		PreparedStatement ps = null;
		String data;
		try {
			
		 connection = GetConnection.getConnection();
			System.out.println("connection.."+connection);
			
			ps = connection
					.prepareStatement("SELECT * FROM NCSS_EMP_MASTER_INFO  WHERE EMP_FNAME  LIKE ?");
			System.out.println("Qry.."+ps);
			ps.setString(1, frameWork + "%");
			ResultSet rs = ps.executeQuery();
			System.out.println("Qry.."+ps);
			System.out.println("rs.."+rs);
			
			while (rs.next()) {
				System.out.println("inside rs.next");
				data = rs.getString("EMP_FNAME");
				System.out.println("data.."+data);
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}
