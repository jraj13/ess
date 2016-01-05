<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.ess.common.action.HelpDeskAction" %>
    
     <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int sno=Integer.parseInt(request.getParameter("sno"));
String helpdeskcat=request.getParameter("helpdeskcat");
String status=request.getParameter("status");
System.out.println("status.."+status);
String remarks=request.getParameter("remarks");
String mailid=request.getParameter("mailid");


/* 
java.sql.Date dt1 = new java.sql.Date(System.currentTimeMillis());
String dt1Text = dt1.toString();
System.out.println("Current Date : " + dt1Text);

	 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate=simpleDateFormat.parse(dt1Text);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
	    Object current_date=outputDateFormat.format(tempDate);
			 System.out.println(" current_date.."+current_date);  */
			 
	 
	 
HelpDeskAction obj=new HelpDeskAction();

String result=obj.helpdesk_reviewUpdate(sno, helpdeskcat, status, remarks, mailid);
System.out.println("result.."+result);

if(result.equalsIgnoreCase("Help desk review updated"))
{
	out.println("<font color='green'>");
	out.println(result);
	out.println("<font color='green'>");
}
else{
	out.println("<font color='red'>");
	out.println(result);
	out.println("<font color='red'>");
}
%>
</body>
</html>