<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.ess.common.action.Attendance_card_configuration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 style="color: green">Employee Attendance Card Configuration</h2>
		<hr>
<%
System.out.println("inserting_att_card_details");

String full_mail_id=request.getParameter("full_id").trim();
String short_id=request.getParameter("short_id").trim();

Attendance_card_configuration att_config=new Attendance_card_configuration();
String final_result=att_config.insert_card_details(full_mail_id, short_id);

out.println(final_result);

%>
</body>
</html>