<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>

<%@ page import="com.ess.common.action.RegularizationAction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("in regularization page");

String reg_type=request.getParameter("regularization_type").trim();

String input_date=request.getParameter("input_date").trim();


SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
Date date11 = format1.parse(input_date);
Object startDate=format2.format(date11);

String note_reg=request.getParameter("note_reg").trim();

String manager=request.getParameter("Reporting_Manager").trim();

RegularizationAction regularization=new RegularizationAction();

String reg_result=regularization.SaveRegularizationDetails(reg_type,startDate,note_reg,manager);
out.println(reg_result);

%>
</body>
</html>