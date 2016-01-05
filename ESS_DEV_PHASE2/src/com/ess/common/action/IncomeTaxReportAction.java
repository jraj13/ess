package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class IncomeTaxReportAction {

	public static ArrayList<String> getIncomeTaxReportInfo() throws SQLException {
		ArrayList<String> basicInfo = new ArrayList<String>();
	System.out.println("getIncomeTaxReportInfo");
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid").trim().toUpperCase();

		System.out.println("id from login=========="+empid);
		
		String sql = "select EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIG,PAN,GENDER,EMP_JOINING_DATE,EMP_DOB from NCSS_EMP_MASTER_INFO where EMP_ID='"+empid+"'";
		String empDetails = null;
		
	    
	    ResultSet rst = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(sql);

			String empId ="";
			String empFname ="";
			String empLname="";
			String empDesig = "";
			String panno="";
			Date doj;
			Date dob;
			String gender="";
			
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				empDesig = rst.getString("EMP_DESIG");
				panno = rst.getString("PAN");
				doj=rst.getDate("EMP_JOINING_DATE");
				dob=rst.getDate("EMP_DOB");
				gender=rst.getString("GENDER");
				
				empDetails = empId + "^" + empFname + "^" +  empLname + "^" + empDesig + "^"+ panno + "^"+ doj + "^"+ dob + "^"+ gender;
				basicInfo.add(empDetails);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
		System.out.println(empDetails);
		return basicInfo;
	}
	
	
	
	/* form payslip details  */
	
	
	public static ArrayList<String> getIncomeTaxReportInfo2() throws SQLException {
		ArrayList<String> basicInfo = new ArrayList<String>();
	System.out.println("getIncomeTaxReportInfo");
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid").trim().toUpperCase();

		System.out.println("id from login=========="+empid);
		/*		
		String sql = "select * from PAYSLIPINFO where EMP_ID='"+empid+"'";
		String empDetails = null;
		
	    
	    ResultSet rst = null;
	    
	    try {
			Connection con = GetConnection.getConnection();
			Statement stmt = con.createStatement();

			rst = stmt.executeQuery(sql);

			String empId ="";
			String empFname ="";
			String empLname="";
			String empDesig = "";
			String panno="";
			Date doj;
			Date dob;
			String gender="";
			
			if (rst.next()) {

				empId = rst.getString("EMP_ID");
				empFname = rst.getString("EMP_FNAME");
				empLname = rst.getString("EMP_LNAME");
				empDesig = rst.getString("EMP_DESIG");
				panno = rst.getString("PAN");
				doj=rst.getDate("EMP_JOINING_DATE");
				dob=rst.getDate("EMP_DOB");
				gender=rst.getString("GENDER");
				
				empDetails = empId + "^" + empFname + "^" +  empLname + "^" + empDesig + "^"+ panno + "^"+ doj + "^"+ dob + "^"+ gender;
				basicInfo.add(empDetails);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
		System.out.println(empDetails);
		return basicInfo;
	}*/
	
	/*Calendar aCalendar = Calendar.getInstance();
	aCalendar.set(Calendar.DATE, 1);
	aCalendar.add(Calendar.DAY_OF_MONTH, -1);
	Date lastDateOfPreviousMonth = (Date) aCalendar.getTime();
	
	System.out.println("last day of month"+lastDateOfPreviousMonth);
	aCalendar.set(Calendar.DATE, 1);
	Date firstDateOfPreviousMonth = (Date) aCalendar.getTime();
	
	
	String[] date11=lastDateOfPreviousMonth.toString().split(" ");
	System.out.println("day=="+date11[0]);
	System.out.println("month=="+date11[1].toUpperCase());
	System.out.println("lastday=="+date11[2]);
	System.out.println("year=="+date11[5]);
	*/
	
/*String pay="select NAME,DESIGNATION,DEPARTMENT,LOCATION,PAN_NO,PF_NO,DOJ,BANKNAME,ACCNO,WOKK_DAYS,MONTH_DAYS,LOP,BASIC,HRA,CONVAY,LTA,MEDICAL,SPECIAL,PF,ESI,GRATUTY,TOTAL,EMPID,TOTAL_EAR,TOTAL_DED,DATE_TIME from PAYSLIP_TAB where to_char(DATE_TIME, 'MON')='"+date11[1].toUpperCase()+"' and to_char(DATE_TIME,'YYYY')='"+date11[5]+"' and empid='"+id+"'";*/

		String pay="select NAME,DESIGNATION,DEPARTMENT,LOCATION,PAN_NO,PF_NO,DOJ,BANKNAME,ACCNO,WOKK_DAYS,MONTH_DAYS,LOP,BASIC,HRA,CONVAY,LTA,MEDICAL,SPECIAL,PF,ESI,GRATUTY,TOTAL,EMPID,TOTAL_EAR,TOTAL_DED,DATE_TIME from PAYSLIP_TAB where  empid='"+empid+"'";
		
		
//select * from PAYSLIP_TAB WHERE to_char(DATE_TIME, 'MON')='AUG' and to_char(DATE_TIME,'YY')='15';
String empDetails = null;


ResultSet rst = null;

try {
	System.out.println("inside try");
	Connection con = GetConnection.getConnection();
	System.out.println("PayslipAction con..." +con);
	Statement stmt = con.createStatement();
	System.out.println("PayslipActionv QRY..."+pay);
	rst = stmt.executeQuery(pay);
	

	String EMPID = "";
	String NAME = "";
	String DESIGNATION = "";
	String DEPARTMENT = "";
	String LOCATION = "";
	
	
	String PAN_NO = "";
	String PF_NO = "";
	Date DOJ;
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
	
	String monthYear="JUL-2015";
	
	Date monthdate;
	String inWords="";
	
	
	
	if (rst.next()) {

		EMPID = rst.getString("EMPID");
		NAME = rst.getString("NAME");
		DESIGNATION = rst.getString("DESIGNATION");
		DEPARTMENT = rst.getString("DEPARTMENT");
		LOCATION = rst.getString("LOCATION");
		
		PAN_NO = rst.getString("PAN_NO");
		PF_NO = rst.getString("PF_NO");
		DOJ = rst.getDate("DOJ");
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
		System.out.println("total is"+TOTAL);
		
		float tot_payslip=(Float.parseFloat(TOTAL));
		
		int total_out = (int) Math.floor(tot_payslip);
			
		System.out.println("total is after applying ceil"+total_out);
		
		String to_pass=String.valueOf(total_out);
		
		
		monthdate=rst.getDate("DATE_TIME");
		
		 inWords =ConvertRupeesintoWords.NumberToWord(to_pass);
		System.out.println("inWords..."+inWords);
		
		//String inWords= NumberToWord(number_str) ;
		empDetails = EMPID + "^" + NAME + "^" + DESIGNATION + "^"+ DEPARTMENT+"^"+LOCATION+"^"+
		
		PAN_NO + "^" + PF_NO + "^" + DOJ + "^"+ BANKNAME+"^"+ACCNO+"^"+
		
WOKK_DAYS + "^" + MONTH_DAYS + "^" + LOP + "^"+ BASIC+"^"+HRA+"^"+
		
CONVAY + "^" + LTA + "^" + MEDICAL + "^"+ SPECIAL+"^"+PF+"^"+
		
ESI + "^" + GRATUTY + "^" + TOTAL_EAR + "^"+ TOTAL_DED+"^"+TOTAL +"^"+ monthdate +"^"+ inWords;
		
		basicInfo.add(empDetails);
	}
	
} catch (Exception e) {
	e.printStackTrace();
}


System.out.println(empDetails);
return basicInfo;
}

	
	/* from INCOME TAX table */
	@SuppressWarnings("unchecked")
	public static ArrayList getIncomeTaxReportInfo3() throws SQLException {
		ArrayList taxInfo = new ArrayList();
	System.out.println("getIncomeTaxReportInfo3");
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String empid=request.getParameter("empid").trim().toUpperCase();

		System.out.println("id from login=========="+empid);
	
		//String pay="select BASIC_SALARY_ACT,BASIC_SALARY_PRO from INCOMETAX where  empid='"+empid+"'";
		String pay="select * from INCOMETAX where  empid='"+empid+"'";
		
//select * from PAYSLIP_TAB WHERE to_char(DATE_TIME, 'MON')='AUG' and to_char(DATE_TIME,'YY')='15';
String empDetails = null;

ResultSet rstd = null;
Connection con1 =null;

float BASIC_SALARY_ACT=0.0f; 
float BASIC_SALARY_PRO=0.0f;
float BASIC_SALARY_TOT=0.0f;
float HRA_ACT=0.0f;
float HRA_PRO=0.0f;
float HRA_TOT=0.0f;
float SA_ACT=0.0f;
float SA_PRO=0.0f;
float SA_TOT=0.0f;
float PLI_ACT=0.0f;
float PLI_PRO=0.0f;
float PLI_TOT=0.0f;
float EARNINGS_TOTAL=0.0f;

float CHOICEPAY=0.0f;
float CHOICEPAY_TOTAL=0.0f; 
float GROSS_EARNINGS=0.0f;
float PER_TOTAL=0.0f;
float GROSS_SALARY=0.0f;
float INCOME_PREVIOUS=0.0f;
float GROSS_PREVIOUS=0.0f;
float STD_DEDUCTION=0.0f;
float PRO_TAX=0.0f;
float PRO_TAX_PREVIOUS=0.0f;
float DED_TOTAL=0.0f;
float INCOME_CHARGABLE=0.0f;
float INCOME_OTHER=0.0f;

float PARENT_GROSS=0.0f;
float PARENT_QUAL=0.0f;
float PARENT_DED=0.0f; 
float SEC_GROSS=0.0f;
float SEC_QUAL=0.0f;
float SEC_DED=0.0f;
float TOT_GROSS=0.0f;
float TOT_QUAL=0.0f;
float TOT_DED=0.0f;
float MAX_QUAL=0.0f;
float TOTAL_TAXABLE=0.0f;
float TAX_CREDIT=0.0f;
float TAX_PAYABLE=0.0f;

float SURCHARGE_ON_TAX=0.0f;
float HIGHER_EDU=0.0f;
float TOTALTAX=0.0f;
float TAX_CURRENT_YEAR=0.0f; 
float REBATE=0.0f;
float TAX_PREVIOUS_YEAR=0.0f;
float BALANCE_TAX=0.0f;
String ACTUL="";
String PROJECTION="";
String DATE_TIME="";
String EMPID1="";
float UNDER80D =0.0f;

/*	
String monthYear="JUL-2015";
Date monthdate;
String inWords="";*/
try {
	System.out.println("inside try");
	 con1 = GetConnection.getConnection();
	System.out.println("Incometax- con..." +con1);
	Statement stmt = con1.createStatement();
	System.out.println("Incometax QRY..."+pay);
	rstd = stmt.executeQuery(pay);
	
	if(rstd.next()) {
		
		BASIC_SALARY_ACT = rstd.getFloat("BASIC_SALARY_ACT");
		System.out.println("BASIC_SALARY_ACT.."+BASIC_SALARY_ACT);
		BASIC_SALARY_PRO = rstd.getFloat("BASIC_SALARY_PRO");
		
		
		BASIC_SALARY_TOT = rstd.getFloat("BASIC_SALARY_TOT");
		HRA_ACT = rstd.getFloat("HRA_ACT");
		HRA_PRO = rstd.getFloat("HRA_PRO");
		HRA_TOT = rstd.getFloat("HRA_TOT");
		SA_ACT = rstd.getFloat("SA_ACT");
		SA_PRO = rstd.getFloat("SA_PRO");
		SA_TOT = rstd.getFloat("SA_TOT");
		PLI_ACT = rstd.getFloat("PLI_ACT");
		PLI_PRO = rstd.getFloat("PLI_PRO");
		PLI_TOT = rstd.getFloat("PLI_TOT");
		EARNINGS_TOTAL = rstd.getFloat("EARNINGS_TOTAL");
		
		CHOICEPAY = rstd.getFloat("CHOICEPAY");
		CHOICEPAY_TOTAL = rstd.getFloat("CHOICEPAY_TOTAL");
		GROSS_EARNINGS = rstd.getFloat("GROSS_EARNINGS");
		PER_TOTAL = rstd.getFloat("PER_TOTAL");
		GROSS_SALARY = rstd.getFloat("GROSS_SALARY");
		INCOME_PREVIOUS = rstd.getFloat("INCOME_PREVIOUS");
		GROSS_PREVIOUS = rstd.getFloat("GROSS_PREVIOUS");
		STD_DEDUCTION = rstd.getFloat("STD_DEDUCTION");
		PRO_TAX = rstd.getFloat("PRO_TAX");
		PRO_TAX_PREVIOUS = rstd.getFloat("PRO_TAX_PREVIOUS");
		DED_TOTAL = rstd.getFloat("DED_TOTAL");
		INCOME_CHARGABLE = rstd.getFloat("INCOME_CHARGABLE");
		INCOME_OTHER = rstd.getFloat("INCOME_OTHER");
		
		PARENT_GROSS = rstd.getFloat("PARENT_GROSS");
		PARENT_QUAL = rstd.getFloat("PARENT_QUAL");
		PARENT_DED = rstd.getFloat("PARENT_DED");
		SEC_GROSS = rstd.getFloat("SEC_GROSS");
		SEC_QUAL = rstd.getFloat("SEC_QUAL");
		SEC_DED = rstd.getFloat("SEC_DED");
		TOT_GROSS = rstd.getFloat("TOT_GROSS");
		TOT_QUAL = rstd.getFloat("TOT_QUAL");
		TOT_DED = rstd.getFloat("TOT_DED");
		MAX_QUAL = rstd.getFloat("MAX_QUAL");
		TOTAL_TAXABLE = rstd.getFloat("TOTAL_TAXABLE");
		TAX_CREDIT = rstd.getFloat("TAX_CREDIT");
		TAX_PAYABLE = rstd.getFloat("TAX_PAYABLE");
		
		SURCHARGE_ON_TAX = rstd.getFloat("SURCHARGE_ON_TAX");
		HIGHER_EDU = rstd.getFloat("HIGHER_EDU");
		TOTALTAX = rstd.getFloat("TOTALTAX");
		TAX_CURRENT_YEAR = rstd.getFloat("TAX_CURRENT_YEAR");
		REBATE = rstd.getFloat("REBATE");
		TAX_PREVIOUS_YEAR = rstd.getFloat("TAX_PREVIOUS_YEAR");
		BALANCE_TAX = rstd.getFloat("BALANCE_TAX");
		ACTUL = rstd.getString("ACTUL");
		PROJECTION = rstd.getString("PROJECTION");
		DATE_TIME = rstd.getString("DATE_TIME");
		EMPID1 = rstd.getString("EMPID");
		UNDER80D = rstd.getFloat("UNDER80D");
		
		
		empDetails = BASIC_SALARY_ACT + "^" + BASIC_SALARY_PRO + "^" + BASIC_SALARY_TOT + "^"+ HRA_ACT+"^"+HRA_PRO+"^"+
				HRA_TOT + "^" + SA_ACT + "^" + SA_PRO + "^"+ SA_TOT+"^"+PLI_ACT+"^"+
				PLI_PRO + "^" + PLI_TOT + "^" + EARNINGS_TOTAL + "^"+
				
				CHOICEPAY+"^"+CHOICEPAY_TOTAL+"^"+GROSS_EARNINGS + "^" + PER_TOTAL + "^" + GROSS_SALARY + "^"+ INCOME_PREVIOUS+"^"+GROSS_PREVIOUS+"^"+
				STD_DEDUCTION + "^" + PRO_TAX + "^" +PRO_TAX_PREVIOUS + "^" +  DED_TOTAL + "^"+ INCOME_CHARGABLE+"^"+INCOME_OTHER 
					+"^"+ 
			
				PARENT_GROSS+"^"+PARENT_QUAL+"^"+PARENT_DED + "^" + SEC_GROSS + "^" + SEC_QUAL + "^"+ SEC_DED+"^"+TOT_GROSS+"^"+
				TOT_QUAL + "^" + TOT_DED + "^" + MAX_QUAL + "^"+ TOTAL_TAXABLE+"^"+TAX_CREDIT+"^"+TAX_PAYABLE +"^"+ 
		
				SURCHARGE_ON_TAX+"^"+HIGHER_EDU+"^"+TOTALTAX + "^" + TAX_CURRENT_YEAR + "^" + REBATE + "^"+ TAX_PREVIOUS_YEAR+"^"+BALANCE_TAX+"^"+
				ACTUL + "^" + PROJECTION + "^" + DATE_TIME + "^"+ EMPID1+"^"+UNDER80D ;
		
		taxInfo.add(empDetails);
	}
	
} catch (Exception e) {
	e.printStackTrace();
}


System.out.println(empDetails);
return taxInfo;
}
	
	
	
	public static void main(String[] args) throws SQLException
	{
		IncomeTaxReportAction.getIncomeTaxReportInfo3();
		
	}
}
