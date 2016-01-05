<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "com.ess.common.eseparation.Eseparation_Basic_Info"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("withdrawstatus.jsp");
String empid=request.getParameter("empid").trim();

Eseparation_Basic_Info esep=new Eseparation_Basic_Info();
String withdraw_result=esep.withdraw_status(empid);
System.out.println(withdraw_result);
out.println("<font color=green>");
out.println(withdraw_result);
out.println("</font>");
%>
</body>
</html>