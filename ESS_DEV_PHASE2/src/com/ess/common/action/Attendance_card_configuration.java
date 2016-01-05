package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ess.util.GetConnection;

public class Attendance_card_configuration {

	//fetching the emp number who ever not configure yet
	
	public ArrayList<String> getEmployee_id() throws SQLException
	{
		ArrayList<String> array_emp_id=new ArrayList<String>();
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String fetching_emp_id_configuration="select emp_id from NCSS_EMP_MASTER_INFO where emp_id not in(select FULLID from EMP_MASTER_BIO)";
		
		String emp_id=null;
		
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(fetching_emp_id_configuration);
			while(rs.next())
			{
				emp_id=rs.getString(1);
				
				String final_data=emp_id;
				array_emp_id.add(final_data);
				
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting emp id  related to attendance");
			e.printStackTrace();
		}
		finally{
			rs.close();
			st.close();
			con.close();
		}
		
		return array_emp_id;
		
	}
	
	
	
	public String insert_card_details(String full_mail_id,String short_id) throws SQLException
	{
		
		Connection con=null;
		Statement st=null;
		int rs=0;
		
		Connection con_atten = null;
		CallableStatement cstmt_atten = null;
		
		String insert_emp_id_configuration="insert into EMP_MASTER_BIO(EMPID,FULLID) values('"+short_id+"','"+full_mail_id+"')";
		
		String attendance_insert_procedure="{call SpecificEmpid_Date(?,?,?)}";	
		
		String final_msg="";
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeUpdate(insert_emp_id_configuration);
			if(rs>0)
			{
				//calling procedure
				
				con_atten = GetConnection.getConnection();

				cstmt_atten = con_atten.prepareCall(attendance_insert_procedure);
				
				cstmt_atten.setDate(1, getCurrentDate());
				cstmt_atten.setString(2, short_id);
				cstmt_atten.setString(3, full_mail_id);
				cstmt_atten.executeUpdate();
				final_msg="Successfully Registered";
			}
			
		}catch(Exception e)
		{
			final_msg="Sorry Try Again with Unique Card Number" ;
			System.out.println("Problem inserting biometric data id and  attendance");
			e.printStackTrace();
		}
		finally{
			st.close();
			con.close();
		}
		
		
		return final_msg;
		
	}
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
}
