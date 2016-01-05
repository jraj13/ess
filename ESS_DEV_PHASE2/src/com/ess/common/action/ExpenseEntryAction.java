package com.ess.common.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ess.util.GetConnection;
import com.opensymphony.xwork2.ActionContext;

public class ExpenseEntryAction {

	public static String getLeaveDaysPaternity1() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");
		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='CHILDREN EDUCATION EXPENSES'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl1==" + result);
		}
		return result;
	}

	public static String getLeaveDaysPaternity2() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl2==" + result);
		}
		return result;
	}

	public static String getLeaveDaysPaternity3() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='CHILDREN HOSTEL EXPENSE'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl3==" + result);
		}
		return result;
	}

	public static String getLeaveDaysPaternity4() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='MEDICAL EXPENSES'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl4==" + result);
		}
		return result;
	}

	public static String getLeaveDaysPaternity5() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='OWA EXPENSES'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl5==" + result);
		}
		return result;
	}

	public static String getLeaveDaysPaternity6() throws SQLException {

		Connection con = GetConnection.getConnection();
		Statement st = con.createStatement();

		Map<String,Object> session = ActionContext.getContext().getSession();
		String id = (String) session.get("empid");

		String timeAccountQuery = "SELECT SUM(EXP_AMOUNT) from ESS_EXPENSE_ENTRY where EMP_ID='"
				+ id + "' and CLAIM_TYPE='OWA MAINTENANCE **'";
		ResultSet rs = st.executeQuery(timeAccountQuery);
		String result = "";
		while (rs.next()) {
			result = rs.getString(1);
			System.out.println("pl6==" + result);
		}
		return result;
	}

	/* FUEL AND MAINTANANCE */
	
	/*	public static String getExpenseEntryFM1() throws SQLException {
	
	System.out.println("come in eereprot ");

	Connection con = GetConnection.getConnection();
	Statement st = con.createStatement();

	Map session = ActionContext.getContext().getSession();
	String id = (String) session.get("empid");

	DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
	Date date = new Date();
	String dateinStr=dateFormat.format(date);
	//System.out.println("date===="+dateinStr);
	
	String[] str=dateinStr.split("/");
	//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
	String year=str[2];
	String month=str[1].toUpperCase();
	
String empQRY1 = "SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='APR' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES' ";

System.out.println("expenseentry empQRY1......"+empQRY1);

ResultSet rs1 = null;

 rs1 = st.executeQuery(empQRY1);
	
	String expamount1 = "";
	
	while (rs1.next()) {
		expamount1 =rs1.getString(1);
		if(expamount1==null)
		{
			expamount1="0";
		}
		System.out.println("expamount1==" + expamount1);
	}
	return expamount1;
}

public static String getExpenseEntryFM2() throws SQLException {
	
	System.out.println("come in eereprot ");

	Connection con = GetConnection.getConnection();
	Statement st = con.createStatement();

	Map session = ActionContext.getContext().getSession();
	String id = (String) session.get("empid");

	DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
	Date date = new Date();
	String dateinStr=dateFormat.format(date);
	//System.out.println("date===="+dateinStr);
	
	String[] str=dateinStr.split("/");
	//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
	String year=str[2];
	String month=str[1].toUpperCase();

String empQRY2="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='MAY' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY2......"+empQRY2);

ResultSet rs2 = null;

 rs2 = st.executeQuery(empQRY2);
	
	String expamount2 = "";
	
	while (rs2.next()) {
		expamount2 =rs2.getString(1);
		if(expamount2==null)
		{
			expamount2="0";
		}
		System.out.println("expamount2==" + expamount2);
	}
	return expamount2;
}

public static String getExpenseEntryFM3() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
//System.out.println("date===="+dateinStr);

String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY3 = "SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='JUN' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES' ";
System.out.println("expenseentry empQRY3......"+empQRY3);

ResultSet rs3 = null;

rs3 = st.executeQuery(empQRY3);

String expamount3= "";

while (rs3.next()) {
	expamount3 =rs3.getString(1);
	if(expamount3==null)
	{
		expamount3="0";
	}
	System.out.println("expamount3==" + expamount3);
}
return expamount3;
}

*/
public static String getExpenseEntryFM4() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
//System.out.println("date===="+dateinStr);

String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY4="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='JUL' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY4......"+empQRY4);

ResultSet rs4 = null;

rs4 = st.executeQuery(empQRY4);

String expamount4= "";

while (rs4.next()) {
	expamount4 =rs4.getString(1);
	if(expamount4==null)
	{
		expamount4="0";
	}
	System.out.println("expamount4==" + expamount4);
}
return expamount4;
}

public static String getExpenseEntryFM5() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
//System.out.println("date===="+dateinStr);

String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY5="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='AUG' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY5......"+empQRY5);


ResultSet rs5 = null;

rs5 = st.executeQuery(empQRY5);
String expamount5= "";


while (rs5.next()) {
	expamount5 =rs5.getString(1);

	
	if(expamount5==null  )
	{
		expamount5="0";
	}

	System.out.println("expamount5==" + expamount5);
}
return expamount5;
}


public static String getExpenseEntryFM6() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();


String empQRY6 = "SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='SEP' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES' ";
System.out.println("expenseentry empQRY6......"+empQRY6);

ResultSet rs6 = null;

rs6 = st.executeQuery(empQRY6);
String expamount6= "";

while (rs6.next()) {
	expamount6 =rs6.getString(1);
	if(expamount6==null)
	{
		expamount6="0";
	}
	System.out.println("expamount6==" + expamount6);
}
return expamount6;
}

/*
public static String getExpenseEntryFM7() throws SQLException {

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY7="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='OCT' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY7......"+empQRY7);

ResultSet rs7 = null;
rs7 = st.executeQuery(empQRY7);

String expamount7= "";

while (rs7.next()) {
	expamount7 =rs7.getString(1);
	if(expamount7==null)
	{
		expamount7="0";
	}
	System.out.println("expamount7==" + expamount7);
}
return expamount7;
}

public static String getExpenseEntryFM8() throws SQLException {

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY8="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='NOV' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY8......"+empQRY8);

ResultSet rs8 = null;

rs8 = st.executeQuery(empQRY8);
String expamount8= "";

while (rs8.next()) {
	expamount8 =rs8.getString(1);
	if(expamount8==null)
	{
		expamount8="0";
	}
	System.out.println("expamount8==" + expamount8);
}
return expamount8;
}

public static String getExpenseEntryFM9() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY9 = "SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='DEC' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES' ";

System.out.println("expenseentry empQRY9......"+empQRY9);

ResultSet rs9 = null;

rs9 = st.executeQuery(empQRY9);
String expamount9= "";

while (rs9.next()) {
	expamount9 =rs9.getString(1);
	if(expamount9==null)
	{
		expamount9="0";
	}
	System.out.println("expamount9==" + expamount9);
}
return expamount9;
}*/

public static String getExpenseEntryFM10() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();
String empQRY10="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='JAN' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";

System.out.println("expenseentry empQRY10......"+empQRY10);

ResultSet rs10 = null;

rs10 = st.executeQuery(empQRY10);
String expamount10= "";

while (rs10.next()) {
	expamount10 =rs10.getString(1);
	if(expamount10==null)
	{
		expamount10="0";
	}
	System.out.println("expamount10==" + expamount10);
}
return expamount10;
}

/*public static String getExpenseEntryFM11() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();

String empQRY11="SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='FEB' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES'";
System.out.println("expenseentry empQRY11......"+empQRY11);

ResultSet rs11 = null;

rs11 = st.executeQuery(empQRY11);
String expamount11= "";

while (rs11.next()) {
	expamount11 =rs11.getString(1);
	if(expamount11==null)
	{
		expamount11="0";
	}
	System.out.println("expamount11==" + expamount11);
}
return expamount11;
}

public static String getExpenseEntryFM12() throws SQLException {

System.out.println("come in eereprot ");

Connection con = GetConnection.getConnection();
Statement st = con.createStatement();

Map session = ActionContext.getContext().getSession();
String id = (String) session.get("empid");

DateFormat dateFormat = new SimpleDateFormat("DD/MMM/YYYY");
Date date = new Date();
String dateinStr=dateFormat.format(date);
String[] str=dateinStr.split("/");
//System.out.println("str0========="+str[2]+"month====="+str[1].toUpperCase());
String year=str[2];
String month=str[1].toUpperCase();


String empQRY12 = "SELECT SUM(EXP_AMOUNT) FROM ESS_EXPENSE_ENTRY  WHERE to_char(BILL_DATE, 'MON')='MAR' and to_char(BILL_DATE,'YYYY')='"+year+"' AND EMP_ID='"+id+"' AND CLAIM_TYPE='FUEL AND MAINTENANCE EXPENSES' ";
System.out.println("expenseentry empQRY12......"+empQRY12);

ResultSet rs12 = null;

rs12 = st.executeQuery(empQRY12);
String expamount12= "";
while (rs12.next()) {
	expamount12 =rs12.getString(1);
	if(expamount12==null)
	{
		expamount12="0";
	}
	System.out.println("expamount12==" + expamount12);
}
return expamount12;
}
*/

	
	
	/* END FUEL AND MAINTANANCE */
	
/* check elegibility for fuel and maintainence */





	
	
	
	
	
	
	public static void main(String[] args) throws SQLException {

		ExpenseEntryAction.getLeaveDaysPaternity1();

	}
}
