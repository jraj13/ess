package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ess.util.GetConnection;

public class OldEmployee {
	
	

	
	public static ArrayList<String> payslip() throws SQLException {
		ArrayList<String> payslipInfo = new ArrayList<String>();
		
		
		String pay="select NAME,DESIGNATION,DEPARTMENT,LOCATION,PAN_NO,PF_NO,DOJ,BANKNAME,ACCNO,WOKK_DAYS,MONTH_DAYS,LOP,BASIC,HRA,CONVAY,LTA,MEDICAL,SPECIAL,PF,ESI,GRATUTY,TOTAL,EMPID,TOTAL_EAR,TOTAL_DED from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='AUG' and to_char(DATE_TIME,'YYYY')='2015' and empid='CSSE150045'";
				 
		//select * from PAYSLIP_TAB WHERE to_char(DATE_TIME, 'MON')='AUG' and to_char(DATE_TIME,'YY')='15';
		String empDetails = null;
		
	    
	    ResultSet rst = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(pay);
			

			String EMPID = "";
			String NAME = "";
			String DESIGNATION = "";
			String DEPARTMENT = "";
			String LOCATION = "";
			
			
			String PAN_NO = "";
			String PF_NO = "";
			String DOJ = "";
			String BANKNAME = "";
			String ACCNO = "";
			
			String WOKK_DAYS = "";
			String MONTH_DAYS = "";
			String LOP = "";
			String BASIC = "";
			String HRA = "";
			
			String CONVAY = "";
			String LTA = "";
			String MEDICAL = "";
			String SPECIAL = "";
			String PF = "";
			
			String ESI = "";
			String GRATUTY = "";
			String TOTAL = "";
			String TOTAL_EAR = "";
			String TOTAL_DED = "";
			
			
			
			
			if (rst.next()) {

				EMPID = rst.getString("EMPID");
				NAME = rst.getString("NAME");
				DESIGNATION = rst.getString("DESIGNATION");
				DEPARTMENT = rst.getString("DEPARTMENT");
				LOCATION = rst.getString("LOCATION");
				
				PAN_NO = rst.getString("PAN_NO");
				PF_NO = rst.getString("PF_NO");
				DOJ = rst.getString("DOJ");
				BANKNAME = rst.getString("BANKNAME");
				ACCNO = rst.getString("ACCNO");
				
				
				WOKK_DAYS = rst.getString("WOKK_DAYS");
				MONTH_DAYS = rst.getString("MONTH_DAYS");
				LOP = rst.getString("LOP");
				BASIC = rst.getString("BASIC");
				HRA = rst.getString("HRA");
				
				
				
				
				CONVAY = rst.getString("CONVAY");
				LTA = rst.getString("LTA");
				MEDICAL = rst.getString("MEDICAL");
				SPECIAL = rst.getString("SPECIAL");
				PF = rst.getString("PF");
				
				ESI = rst.getString("ESI");
				GRATUTY = rst.getString("GRATUTY");
				
				TOTAL_EAR = rst.getString("TOTAL_EAR");
				TOTAL_DED = rst.getString("TOTAL_DED");
				TOTAL = rst.getString("TOTAL");
				
				empDetails = EMPID + "^" + NAME + "^" + DESIGNATION + "^"+ DEPARTMENT+"^"+LOCATION+"^"+
				
				PAN_NO + "^" + PF_NO + "^" + DOJ + "^"+ BANKNAME+"^"+ACCNO+"^"+
				
WOKK_DAYS + "^" + MONTH_DAYS + "^" + LOP + "^"+ BASIC+"^"+HRA+"^"+
				
CONVAY + "^" + LTA + "^" + MEDICAL + "^"+ SPECIAL+"^"+PF+"^"+
				
ESI + "^" + GRATUTY + "^" + TOTAL_EAR + "^"+ TOTAL_DED+"^"+TOTAL;
				
				payslipInfo.add(empDetails);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    
		System.out.println(empDetails);
		return payslipInfo;
	}

public static void main(String args[]){

	try {
		payslip();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}