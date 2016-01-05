 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
	width
	="100";
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body marginheight="100px">

<%
String name="";
String filename="";
String uName="";
uName = (String) session.getAttribute("empid");
System.out.println("login id in form16"+uName);

 filename="Form16/"+uName+".pdf";
		
%>
<a href="<%=filename%>" target="_new"  style="float:left;"><font color="#0000FF">Click Here to View Form 16</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=filename%>" target="_new" download="<%=filename%>" ><font color="#0000FF">Download Form 16</font></a>

<br>
<center>
<img src="postLoginJsp/images/form16img.png"  width="99%" height="45%" align="left" />
</center>
 
</body>
</html>