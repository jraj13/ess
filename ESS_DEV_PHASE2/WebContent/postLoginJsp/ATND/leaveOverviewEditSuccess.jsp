<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import=" java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ess.util.GetConnection"%>
<%

String message="";
try{
	
	String sid=request.getParameter("sid");
	System.out.println("sid.."+sid);
	
	String typeOfLeave=(String)request.getParameter("tol");
	
	String startDate1=(String)request.getParameter("sd");
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date tempDate=simpleDateFormat.parse(startDate1);
    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
    //System.out.println("Output date is = "+outputDateFormat.format(tempDate));
    Object startDate=outputDateFormat.format(tempDate);
    System.out.println("start date.."+startDate);
	
	
	String endDate1=(String)request.getParameter("ed");
	
    SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
    Date tempDate2=simpleDateFormat.parse(endDate1);
    SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");           
    //System.out.println("Output date is = "+outputDateFormat.format(tempDate));
    Object endDate=outputDateFormat.format(tempDate2);
    System.out.println("end date========="+endDate);
	
	String nextProcessor=(String)request.getParameter("np");
	String status=(String)request.getParameter("ss");
	String used=(String)request.getParameter("used");
	
	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();

String editQRY="UPDATE CALENDAR_LEAVE_APPLY_TEST SET TYPE_OF_LEAVE='"+typeOfLeave+"',START_DATE='"+startDate+"',END_DATE='"+endDate+"',NEXTPROCESSOR='"+nextProcessor+"',STATUS='"+status+"',ABSENCE_DAY='"+used+"' WHERE SID='"+sid+"'";
System.out.println("editQRY .."+editQRY);

	int rs=stmt.executeUpdate(editQRY);
	System.out.println("rs.."+rs);
	
	if(rs>0)
	{
		message="Updated successfully";
		 //response.sendRedirect("Leaveoverview.jsp"); 
		
	}
	else
	{
		message="Update failure";
	}
}catch(Exception ex){
	
	
	ex.printStackTrace();
	
}finally {
	out.println(message);
	

}



%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
