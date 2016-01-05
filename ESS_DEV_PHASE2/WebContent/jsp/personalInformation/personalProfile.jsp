<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetails"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


String empPersonalInfo=EmployeeDetails.getPersonalInfo();
System.out.println("empPersonalInfo===="+empPersonalInfo);

String empPersonalInfoAry[]=empPersonalInfo.split("\\^");

String empId = empPersonalInfoAry[0];
String empFname =empPersonalInfoAry[1];
String empLname =empPersonalInfoAry[2];
String joiningDate=empPersonalInfoAry[3];
String empDob = empPersonalInfoAry[4];
String empDesig = empPersonalInfoAry[5];
String empEmail =empPersonalInfoAry[6];
String repManager = empPersonalInfoAry[7];
String empCtc = empPersonalInfoAry[8];

%>

 <table border="2" align="center" >

<tr><td><b>EMP ID</b></td> <td><%=empId %></td></tr>
<tr><td><b>FIRST NAME</b></td><td><%=empFname %></td></tr>
<tr><td><b>LAST NAME</b></td><td><%=empLname %></td></tr>
<tr><td><b>JOINING DATE</b></td><td><%=joiningDate %></td></tr>
<tr><td><b>DOB </b></td><td><%=empDob %></td></tr>
<tr><td><b>DESIGNATION</b></td><td><%=empDesig %></td></tr>
<tr><td><b>EMAIL</b></td><td><%=empEmail %></td></tr>
<tr><td><b>REPORTING MANAGER</b></td><td><%=repManager %></td></tr>
<tr><td><b>CTC</b></td><td><%=empCtc %></td></tr>


</table>


</body>
</html> --%>