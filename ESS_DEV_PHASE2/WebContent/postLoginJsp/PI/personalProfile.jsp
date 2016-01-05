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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<%
	String empPersonalInfo=EmployeeDetailsPersonal.getPersonalInfo();
System.out.println("empPersonalInfo from jsp===="+empPersonalInfo);

String empPersonalInfoAry[]=empPersonalInfo.split("\\^");

String empId = empPersonalInfoAry[0];
System.out.println("empid======"+empId);
String empFname =empPersonalInfoAry[1];
String empLname =empPersonalInfoAry[2];
String joiningDate=empPersonalInfoAry[3];
String empDob = empPersonalInfoAry[4];
String empDesig = empPersonalInfoAry[5];
String empEmail =empPersonalInfoAry[6];
String repManager = empPersonalInfoAry[7];
String empCtc = empPersonalInfoAry[8];
%>

 <table  align="center" width="55%">

<tr >
<td><b>EMP ID</b></td> <td><%=empId %></td></tr>
<tr><td><b>FIRST NAME</b></td><td><%=empFname %></td></tr>
<tr><td><b>LAST NAME</b></td><td><%=empLname %></td></tr>
<tr><td><b>JOINING DATE</b></td><td><%=joiningDate %></td></tr>
<tr><td><b>DOB </b></td><td><%=empDob %></td></tr>
<tr><td><b>DESIGNATION</b></td><td><%=empDesig %></td></tr>
<tr><td ><b>EMAIL</b></td><td width="375"><%=empEmail %></td></tr>
<tr><td><b>REPORTING MANAGER</b></td> <td width="350"><%=repManager %></td></tr>
<tr><td><b>CTC</b></td><td><%=empCtc %></td></tr>


</table>


</body>
</html>