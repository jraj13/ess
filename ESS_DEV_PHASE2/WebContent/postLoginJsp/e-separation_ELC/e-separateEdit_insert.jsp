<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ess.common.eseparation.Eseparation_Basic_Info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("e-separateEdit_insert.jsp");
String seqid=request.getParameter("seqid").trim();
String note=request.getParameter("note").trim();
Eseparation_Basic_Info basic_update=new Eseparation_Basic_Info();
String result_update=basic_update.update_note(seqid,note);
out.println("<font color=green>");
out.println(result_update);
out.println("</font>");
%>
</body>
</html>