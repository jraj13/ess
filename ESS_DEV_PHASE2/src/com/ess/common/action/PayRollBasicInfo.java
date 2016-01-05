package com.ess.common.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class PayRollBasicInfo {

	
	public static ArrayList<String> getPayrollInfo() throws SQLException {
		ArrayList<String> payroll_array = new ArrayList<String>();
	/*	Map<String,Object> session = ActionContext.getContext().getSession();
		//String id = (String) session.get("empid");
		System.out.println("id..."+id);*/
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid").trim();
		String month = request.getParameter("month").trim();
		String year = request.getParameter("year");
		Connection con = null;
		CallableStatement callableStatement = null;
 
		String emppayroll=null;
		
		String getPayroll = "{call RUNPAYROLL(?,?,?,?,?,?,?,?,?,?,?,?)}";
 
		try {
			
			System.out.println("inside try====="+getPayroll);
			con=GetConnection.getConnection();
			callableStatement = con.prepareCall(getPayroll);
			
			callableStatement.setString(1,empid);
			callableStatement.setString(2,month);
			callableStatement.setString(3,year);
			
			callableStatement.registerOutParameter(4, java.sql.Types.VARCHAR);
			callableStatement.registerOutParameter(5, java.sql.Types.VARCHAR);
			
			callableStatement.registerOutParameter(6, java.sql.Types.NUMERIC);
			callableStatement.registerOutParameter(7, java.sql.Types.NUMERIC);
			callableStatement.registerOutParameter(8, java.sql.Types.NUMERIC);
			callableStatement.registerOutParameter(9, java.sql.Types.NUMERIC);
			callableStatement.registerOutParameter(10, java.sql.Types.NUMERIC);
			
			callableStatement.registerOutParameter(11, java.sql.Types.VARCHAR);
			callableStatement.registerOutParameter(12, java.sql.Types.VARCHAR);
			
			callableStatement.executeUpdate();
			String f_name = callableStatement.getString(4);
			String l_name = callableStatement.getString(5);
			
			int tot_days=callableStatement.getInt(6);
			int eff_days=callableStatement.getInt(7);
			int att_days=callableStatement.getInt(8);
			int leave_days=callableStatement.getInt(9);
			int lop_days=callableStatement.getInt(10);
			
			String bank_name=callableStatement.getString(11);
			String bank_no=callableStatement.getString(12);
			
			System.out.println("f_name"+f_name);
			System.out.println("l_name"+l_name);
			
			System.out.println("tot_days"+tot_days);
			System.out.println("eff_days"+eff_days);
			System.out.println("att_days"+att_days);
			System.out.println("leave_days"+leave_days);
			System.out.println("lop_days"+lop_days);

			 emppayroll = empid + "^" + month
					+ "^" + year + "^" + f_name + "^"
					+ l_name + "^" + tot_days + "^"
					+ eff_days + "^" + att_days+"^"+leave_days+"^"+lop_days+"^"+bank_name+"^"+bank_no;

			 payroll_array.add(emppayroll);
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} finally {
 
			if (callableStatement != null) {
				try {
					callableStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
 
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
 
		}
		
		return payroll_array;
	}
	
	
	
/* for bank information  */
	
	public static ArrayList<String> getEmpBankInfo() throws SQLException {
		ArrayList<String> bank_array = new ArrayList<String>();
		
		String finalResponse="";
	
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid");
		
		String getBankInfoQry="SELECT * FROM NCSS_EMP_MASTER_INFO WHERE STATUS='Active' AND EMP_ID='"+empid+"'";
		
		Connection con = GetConnection.getConnection();
		System.out.println("connection"+con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;
	try{
		rst = stmt.executeQuery(getBankInfoQry);

		String empId = "";
		String empFname = "";
		String empLname = "";
		Date joiningDate;
		Date empDob;
		String empDesig = "";
		String empEmail = "";
		String repManager = "";
		String empCtc = "";
		String panNo="";

		if (rst.next()) {

			empId = rst.getString("EMP_ID");
			empFname = rst.getString("EMP_FNAME");
			empLname = rst.getString("EMP_LNAME");
			if(empLname==null)
			{
				empLname="";
			}
			joiningDate = rst.getDate("EMP_JOINING_DATE");
			empDob = rst.getDate("EMP_DOB");
			empDesig = rst.getString("EMP_DESIG");
			empEmail = rst.getString("EMP_MAILID");
			repManager = rst.getString("EMP_RM");
			empCtc = rst.getString("EMP_CTC");
			panNo=rst.getString("PAN");
		

			finalResponse = empId + "^" + empFname + "^" + empLname + "^"
					+ joiningDate + "^" + empDob + "^" + empDesig + "^"
					+ empEmail + "^" + repManager + "^" + empCtc  + "^" + panNo ;

			System.out.println("final result=============" + finalResponse);
 
			bank_array.add(finalResponse);
		}
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} finally {
			con.close();
		}
		
		return bank_array;
	}

	
	public static ArrayList<String> getEmpBankInfoUpdate() throws SQLException {
		ArrayList<String> bank_array = new ArrayList<String>();
		
		String finalResponse="";
	
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid");
		
		String getBankInfoQry="SELECT * FROM BANKINFO WHERE  EMP_ID='"+empid+"'";
		
		Connection con = GetConnection.getConnection();
		System.out.println("connection"+con);
		Statement stmt = con.createStatement();
		ResultSet rst = null;
	try{
		rst = stmt.executeQuery(getBankInfoQry);
		
		String DEPT = "";
		String LOC = "";
		String BANK_NAME = "";
		String ACC_NO;
		String PF_NO;

		if (rst.next()) {

			DEPT = rst.getString("DEPARTMENT");
			LOC = rst.getString("LOCATION");
			BANK_NAME = rst.getString("BANK_NAME");
			ACC_NO = rst.getString("ACC_NO");
			PF_NO = rst.getString("PF_NO");
			

			finalResponse = DEPT + "^" + LOC + "^" + BANK_NAME + "^"
					+ ACC_NO + "^" + PF_NO  ;

			System.out.println("final result=============" + finalResponse);
 
			bank_array.add(finalResponse);
		}
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} finally {
			con.close();
		}
		
		return bank_array;
	}
	
	
	public int restric_payslip(String employee_Id,String month_in,String Year_in) throws SQLException
	{
		Connection con_res=null;
		Statement st_res=null;
		ResultSet rs_res=null;
		int tot_value=0;
	String sql_uery="SELECT count(*) FROM PAYSLIP_TAB  WHERE to_char(DATE_TIME, 'MON')='"+month_in+"' and to_char(DATE_TIME,'YYYY')='"+Year_in+"' and EMPID='"+employee_Id+"'";
		try{
			con_res=GetConnection.getConnection();
			st_res=con_res.createStatement();
			rs_res=st_res.executeQuery(sql_uery);
			
		while(rs_res.next())
		{
			tot_value=rs_res.getInt(1);
		}
		}
		catch (Exception e) {
		System.out.println("The problem exist in checking in payslip condition");
		}
		
		finally{
			rs_res.close();
			st_res.close();
			con_res.close();
		}
		return tot_value;
	}
	
	/* restriction for tax projection statement inside admin controller  */
	public int restric_taxprojection(String employee_Id,String month_in,String Year_in) throws SQLException
	{
		System.out.println("entering in checing tax projction");
		Connection con_res=null;
		Statement st_res=null;
		ResultSet rs_res=null;
		int tot_value=0;
	String sql_uery="select count(*) from INCOMETAX   WHERE to_char(DATE_TIME, 'MON')='"+month_in+"' and to_char(DATE_TIME,'YYYY')='"+Year_in+"' and EMPID='"+employee_Id+"'";
	System.out.println("the query is"+sql_uery);
		try{
			con_res=GetConnection.getConnection();
			st_res=con_res.createStatement();
			rs_res=st_res.executeQuery(sql_uery);
			
		while(rs_res.next())
		{
			tot_value=rs_res.getInt(1);
			System.out.println("the count value is"+tot_value);
		}
		}
	
		catch (Exception e) {
		System.out.println("The problem exist in checking in tax projection");
		}
		
		finally{
			rs_res.close();
			st_res.close();
			con_res.close();
		}
		return tot_value;
	}
	
	public static void main(String[] args) throws SQLException {
		PayRollBasicInfo.getPayrollInfo();
	}
}
