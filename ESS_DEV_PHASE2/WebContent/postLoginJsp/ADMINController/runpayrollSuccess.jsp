<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import=" java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="com.ess.common.action.PayRollBasicInfo" %>

<%

String message="";

try{
	System.out.println("come into run payroll success page");
	
	
	String eff_days=request.getParameter("eff_days");
	System.out.println("eff_days..."+eff_days);
	
	String att_days=request.getParameter("att_days");
	System.out.println("att_days..."+att_days);
	
	String leave_days=request.getParameter("leave_days");
	System.out.println("leave_days..."+leave_days);
	
	String lop_days=request.getParameter("lop_days");
	System.out.println("lop_days..."+lop_days);
	
	
	
	
	String empid=request.getParameter("empid");
	System.out.println("empid..."+empid);
	
	String month=request.getParameter("month");
	System.out.println("month..."+month);
	
	
	String year=request.getParameter("year");
	System.out.println("year..."+year);
	
	String tot_days=request.getParameter("tot_days");
	System.out.println("tot_days..."+tot_days);
	
	
	String date1="01-"+month+"-"+year;
	System.out.println("date1..."+date1);
	
	int daysmnth=Integer.parseInt(tot_days);
	System.out.println("date1..."+date1);
	
	float effdays=Float.parseFloat(eff_days)+Float.parseFloat(leave_days);
	float lop=Float.parseFloat(lop_days);
	
	PayRollBasicInfo restric=new PayRollBasicInfo();
	
	int restric_value=restric.restric_payslip(empid, month, year);
	
	if(restric_value>=1)
	
	{
		message="Payslip is AllReady Exist for this Month.....";
	}
	
	else
	{
	Connection con = GetConnection.getConnection();

		CallableStatement callableStatement = null;
		
	String getDBUSERByUserIdSql = "{call PAYSLIP_NEW('"+empid+"','"+date1+"','"+effdays+"','"+daysmnth+"','"+lop+"')}";
	System.out.println("getDBUSERByUserIdSql..."+getDBUSERByUserIdSql);
		
		callableStatement = con.prepareCall(getDBUSERByUserIdSql);
		
		int rs=callableStatement.executeUpdate();
		
		/* int rs=stmt.executeUpdate(editQRY); */
		 if(rs>0)
		{
			message="Payslip is generated successfully";
		 	//response.sendRedirect("Leaveoverview.jsp"); 
		}
		else
		{
		message="Please Try again !";
		} 
		 
	}
	}catch(Exception ex){
	
	ex.printStackTrace();
	
	}finally {
	out.println(message);
}



%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
