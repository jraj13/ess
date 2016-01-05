
package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ess.util.GetConnection;

public class GetaxId {

	
	public static String max() throws SQLException
	{
		
		Connection con = null;
		ResultSet rs=null;
		String s_no=null;
		String max_sql="select max(count) as maximum from ess_expense_entry";
		try{
			con = GetConnection.getConnection();
			Statement st=con.createStatement();
			 rs=st.executeQuery(max_sql);
			 if(rs.next()){
				s_no=rs.getString("maximum");
				 System.out.println(s_no);
			 }
		}catch(Exception e){
			
			System.out.println("proble in getting max id");
		}
		finally{
			con.close();
		}
		return s_no;
	}
	
	public static void main(String[] args) throws SQLException {
		String it=GetaxId.max();
		System.out.println(it);
	}
}
