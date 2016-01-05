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
	System.out.println("come into empdata update");
	String empid=request.getParameter("empid").trim();
	System.out.println("empid.."+empid);
	
	String empfn=request.getParameter("empfn").trim();
	String empln=request.getParameter("empln").trim();
	String doj=request.getParameter("doj");
	
	 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate=simpleDateFormat.parse(doj);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
	    Object doj1=outputDateFormat.format(tempDate);
	    System.out.println("doj1.."+doj1);
	
	String dob=request.getParameter("dob");
	
	 SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate1=simpleDateFormat1.parse(dob);
	    SimpleDateFormat outputDateFormat1= new SimpleDateFormat("dd/MMM/YYYY");           
	    Object dob1=outputDateFormat1.format(tempDate1);
	    System.out.println("dob1.."+dob1);
	
	String design=request.getParameter("design").trim();
	String mailid=request.getParameter("mailid").trim();	
	String rtm=request.getParameter("rtm").trim();
	String ctc=request.getParameter("ctc").trim();
	String status=request.getParameter("status").trim();
	String remarks=request.getParameter("remarks").trim();
	
	
	
	
	Connection con = GetConnection.getConnection();
	Statement stmt = con.createStatement();

String editQRY="UPDATE NCSS_EMP_MASTER_INFO SET EMP_FNAME='"+empfn+"',EMP_LNAME='"+empln+"',EMP_JOINING_DATE='"+doj1+"',EMP_DOB='"+dob1+"',EMP_DESIG='"+design+"',EMP_MAILID='"+mailid+"',EMP_RM='"+rtm+"',EMP_CTC='"+ctc+"',STATUS='"+status+"',REMARKS='"+remarks+"' WHERE EMP_ID='"+empid+"'";
System.out.println("editQRY for admin .."+editQRY);

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
