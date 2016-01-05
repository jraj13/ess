package com.ess.common.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;




import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class CheckFuel_mailt {

	public  String checkFuel()
	{
		Connection conn=null;
		String msg=null;
		try {

			conn = GetConnection.getConnection();

			Map<String,Object> session = ActionContext.getContext().getSession();

			//Object id = session.get("loginid");
			Object id = session.get("empid");

			String fetchctc = "SELECT emp_ctc FROM NCSS_EMP_MASTER_INFO where emp_id='"+ id + "'";
			System.out.println(fetchctc);

			Statement pst = conn.createStatement();
			int ctc_emp=0;
			

			ResultSet rs = pst.executeQuery(fetchctc);

			if (rs.next()) {

				ctc_emp=Integer.parseInt(rs.getString("emp_ctc").trim());
				
				System.out.println("in ctc statement fuel and maintenece is"+ctc_emp);
			}
				if(ctc_emp<250000)
				{
					msg="YOU ARE NOT ELIGIBLE FOR OPTING FUEL AND MAINTENANCE";
				}
				/*else
				{
					msg="you are ------------------ Elegible for this";
				}*/
			
			
		}catch(Exception e)
			{
				e.printStackTrace();
			}
		
		System.out.println("message in fuel and maintenance is"+msg);
		return msg;
		
			
	
	}
	public static void main(String[] args) throws SQLException {
		
		CheckFuel_mailt ch=new CheckFuel_mailt();
		String tot_ct=ch.checkFuel();
		System.out.println("in fuel and maintenance"+tot_ct);
	}
		}
