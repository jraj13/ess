package com.ess.common.eseparation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.ess.util.GetConnection;

public class E_sep_HR_Overview {

	 public ArrayList<String> hr_overview_esep() throws SQLException{
		 System.out.println("come in hr_overview java ");
		ArrayList<String> hr_overview=new ArrayList<String>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String hr_overview_sql="select EMP_ID,SEQUENCE_NO,CREATION_DATE,HR_RELIEVING_DATE from E_SEPARATION_EMP where EMP_APPROVEL='Initiate' and HR_APPROVE='Inprocess'";
		//select EMP_ID,SEQUENCE_NO,CREATION_DATE,HR_RELIEVING_DATE from E_SEPARATION_EMP where EMP_APPROVEL='Initiate' and HR_APPROVE='Inprocess';
		System.out.println(hr_overview_sql);
		String emp_id=null;
		String seq_no=null;
		Date creation_date;
		Date hr_releaving_date;
		try
		{
			con=GetConnection.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(hr_overview_sql);
			while(rs.next())
			{
				emp_id=rs.getString("EMP_ID");
				seq_no=rs.getString("SEQUENCE_NO");
				creation_date=rs.getDate("CREATION_DATE");
				hr_releaving_date=rs.getDate("HR_RELIEVING_DATE");
				
				String final_data=emp_id+"^"+seq_no+"^"+creation_date+"^"+hr_releaving_date;
				hr_overview.add(final_data);
				
				System.out.println("final result is"+hr_overview);
			}
			
		}catch(Exception e)
		{
			System.out.println("Problem in geeting data in e-separation hr level");
			e.printStackTrace();
		}
		return hr_overview;
		
	}
	
	
}
