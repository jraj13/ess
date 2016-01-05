package com.ess.common.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ess.util.GetConnection;

public class GettingEmpployeeId {
	
	
		public ArrayList<String> getEmpid(){
		
			ArrayList<String> emp_info=new ArrayList<String>();
					
		Connection con=null;
		
		String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where STATUS='Active'";
		
		try
		{
			 con = GetConnection.getConnection();
				Statement st = con.createStatement();

				ResultSet rs = st.executeQuery(RegQry);

		     while(rs.next())
		     {
		          String name = rs.getString("emp_id");
		          emp_info.add(name);
		
		     }
		}catch(Exception e)
		{    System.out.println(e);
		}

		 System.out.println(emp_info);
		return emp_info;
	}
	
	
	
	
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
