
package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class SalaryStructure {

	//public  String generate() throws SQLException {
		public static ArrayList<String> Breakup() throws SQLException {
			ArrayList<String> bank_array = new ArrayList<String>();

		// int ctc=Integer.parseInt(request.getParameter("ctc"));
			
			
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			int ctc =Integer.parseInt(request.getParameter("ctc").trim());
			
			int basic_per =Integer.parseInt(request.getParameter("basic_per").trim());
			
			System.out.println("basic per.."+basic_per);
			
			
		//int ctc = 160000;
		String total_data=null;
		Connection con = null;
		CallableStatement stmt = null;
		String sql_slarybreakup;
		String basic_month =" ";
		String hra_month = " ";
		String lta_month = " ";
		String medical_month = " ";

		String spa_month = " ";
		String gross_tot_month =" ";
		//String gross_month = 0.0;
		String pf_month = " ";

		String gratuty_month =" ";
		String esi_month = " ";
		String tot_ded_month =" ";
		String gross_tot = " ";

		String basic_year = " ";
		String hra_year = " ";
		String lta_year = " ";
		String medical_year = " ";

		String spa_year = " ";;
		String gross_tot_year = " ";
		String pf_year = " ";
		String gratuty_year = " ";
		String esi_year = " ";;

		String tot_ded_year = " ";
		String gross_ded_year =" ";
		String month_ctc = " ";
		
		String month_conveyance = " ";
		String year_conveyance = " ";
		
		
		try {
			con = GetConnection.getConnection();
			// /23
			sql_slarybreakup = "{call SALARY_BREAKUP_STATEMENT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			stmt = con.prepareCall(sql_slarybreakup);
			stmt.setInt(1, ctc);
			stmt.setInt(2, basic_per);
			

			stmt.registerOutParameter(3, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(4, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(5, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(6, java.sql.Types.DOUBLE);

			stmt.registerOutParameter(7, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(8, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(9, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(10, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(11, java.sql.Types.DOUBLE);

			stmt.registerOutParameter(12, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(13, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(14, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(15, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(16, java.sql.Types.DOUBLE);

			stmt.registerOutParameter(17, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(18, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(19, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(20, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(21, java.sql.Types.DOUBLE);

			stmt.registerOutParameter(22, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(23, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(24, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(25, java.sql.Types.DOUBLE);
			
			stmt.registerOutParameter(26, java.sql.Types.DOUBLE);
			stmt.registerOutParameter(27, java.sql.Types.DOUBLE);

			stmt.executeUpdate();
			basic_month = stmt.getString(3);
			System.out.println(basic_month);
			 hra_month = stmt.getString(4);
			 
			 System.out.println(hra_month);
			lta_month = stmt.getString(5);
			medical_month = stmt.getString(6);

			spa_month = stmt.getString(7);
			gross_tot_month = stmt.getString(8);
			pf_month = stmt.getString(9);
			gratuty_month = stmt.getString(10);
			esi_month = stmt.getString(11);

			gross_tot = stmt.getString(12);
			tot_ded_month = stmt.getString(13);

			basic_year = stmt.getString(14);
			hra_year = stmt.getString(15);
			lta_year = stmt.getString(16);
			medical_year = stmt.getString(17);

			spa_year = stmt.getString(18);
			gross_tot_year = stmt.getString(19);
			pf_year = stmt.getString(20);
			gratuty_year = stmt.getString(21);
			esi_year = stmt.getString(22);

			tot_ded_year = stmt.getString(23);
			gross_ded_year =stmt.getString(24);
			month_ctc=stmt.getString(25);
			
			 month_conveyance = stmt.getString(26);
			 year_conveyance = stmt.getString(27);
			
			total_data = basic_month + "^" + hra_month + "^" + lta_month + "^" +
					 medical_month + "^" + spa_month + "^" + gross_tot_month + "^" +
					 pf_month + "^" + gratuty_month + "^" + esi_month + "^" + gross_tot+ "^" +
					 tot_ded_month
					 
					 + "^" + basic_year + "^" + hra_year+
			  "^" + lta_year + "^" + medical_year+"^"+spa_year+"^"+gross_tot_year+"^"+pf_year+"^"+gratuty_year+"^"+esi_year+"^"+tot_ded_year+"^"+gross_ded_year+"^"+ctc+"^"+month_ctc+ "^" +
			  month_conveyance + "^" + year_conveyance;

			System.out.println("final String..." + total_data);
			
			bank_array.add(total_data);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			con.close();
			stmt.close();
		}
		return bank_array;
	}
public static void main(String[] args) throws SQLException
{
	Breakup();
	//System.out.println("final String in main method..." + hai);
}
}