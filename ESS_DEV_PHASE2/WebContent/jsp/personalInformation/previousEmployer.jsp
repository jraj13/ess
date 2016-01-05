<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
String prevOrgDetails=EmployeeDetails.getPreviousEmpInfo();

String empPersonalInfoAry[]=prevOrgDetails.split("\\^");

String empId = empPersonalInfoAry[0];
String totalExp = empPersonalInfoAry[1];
String org1Name = empPersonalInfoAry[2];
String org1Exp = empPersonalInfoAry[3];
String org1RefName = empPersonalInfoAry[4];
String org1RefMail = empPersonalInfoAry[5];
String org1RefPhone = empPersonalInfoAry[6];
String org2Name = empPersonalInfoAry[7];
String org2Exp = empPersonalInfoAry[8];
String org2RefName = empPersonalInfoAry[9];
String org2RefMail = empPersonalInfoAry[10];
String org3Name = empPersonalInfoAry[11];
String org3Exp = empPersonalInfoAry[12];
String org3RefName = empPersonalInfoAry[13];
String org3RefMail = empPersonalInfoAry[14];
%>

 <table border="1" align="center" >

 <tr><td><b>EMP ID</b></td> <td><%=empId %></td></tr>
 <tr><td><b>Total Experience</b></td> <td><%=totalExp %></td></tr> 
<tr><td><b>Organization1</b></td><td><%=org1Name %></td></tr>
<tr><td><b>Organization1 Experience</b></td><td><%=org1Exp %></td></tr>
<tr><td><b>Organization1 Reference Name </b></td><td><%=org1RefName %></td></tr>
<tr><td><b>Organization1 Reference Mail</b></td><td><%=org1RefMail %></td></tr>
<tr><td><b>Organization1 Reference Phone</b></td><td><%=org1RefPhone %></td></tr>
<tr><td><b>Organization2 </b></td><td><%=org2Name %></td></tr>
<tr><td><b>Organization2 Experience</b></td><td><%=org2Exp %></td></tr>
<tr><td><b>Organization2 Reference Name</b></td><td><%=org2RefName %></td></tr>
<tr><td><b>Organization1 Reference Mail</b></td><td><%=org2RefMail %></td></tr>
<tr><td><b>Organization2</b></td><td><%=org3Name %></td></tr>

<tr><td><b>Organization2 Experience</b></td><td><%=org3Exp %></td></tr>
<tr><td><b>Organization1 Reference Name</b></td><td><%=org3RefName %></td></tr>

<tr><td><b>Organization1 Reference Mail</b></td><td><%=org3RefMail %></td></tr>





</table>


</body>
</html>