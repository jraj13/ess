<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
</head>
<body>
<br>
<%
	String panInfo=EmployeeDetailsPersonal.getPanInfo();


String empPersonalInfoAry[]=panInfo.split("\\^");

String empId = empPersonalInfoAry[0];
String pan = empPersonalInfoAry[1];
String passportNum =empPersonalInfoAry[2];
String uid = empPersonalInfoAry[3];
String visaInfo = empPersonalInfoAry[4];
String adharNum =empPersonalInfoAry[5];
%>

 <table align="left" >

<%-- <tr><td><b>EMP ID</b></td> <td><%=empId %></td></tr> --%>
<tr><td><b>PAN</b></td><td><%=pan %></td></tr>
<tr><td><b>Passport Number</b></td><td><%=passportNum %></td></tr>
<tr><td><b>UID</b></td><td><%=uid %></td></tr>
<%-- <tr><td><b>Visa Info </b></td><td><%=visaInfo %></td></tr> --%>
<%-- <tr><td><b>Adhar Number</b></td><td><%=adharNum %></td></tr> --%>


</table>

</body>
</html>