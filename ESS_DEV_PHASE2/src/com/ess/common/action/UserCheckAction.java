package com.ess.common.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ess.util.GetConnection;

public class UserCheckAction {

	
	
	public boolean isUserNameAndPasswordVAlid(String username,String passsword)
	{
		/*this.username=username;
		this.password=passsword;*/
		boolean result=false;
		 Connection conn = null;
		 ResultSet rst = null;
		
		 String checklogin="select emp_id,emp_mailid from NCSS_EMP_MASTER_INFO where emp_id=? and emp_mailid=?";
		try{
			conn = GetConnection.getConnection();
			PreparedStatement ps=conn.prepareStatement(checklogin);
			ps.setString(1, username);
			ps.setString(2, passsword);
			
			
			
		rst=ps.executeQuery();
		if(rst.next() && rst.getString(1)!=null && rst.getString(2)!=null){
			System.out.println("already exist");
			
			 return true;
		}
		}catch(Exception e){
			
			System.out.println("problem in checking input values");
			e.printStackTrace();
			return false;
		}
	
		return result;
	}
	
	
	
}
