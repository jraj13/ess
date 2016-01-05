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
String empQualification=EmployeeDetails.getQualificationInfo();


String empPersonalInfoAry[]=empQualification.split("\\^");

String empId = empPersonalInfoAry[0];
String empQual1 = empPersonalInfoAry[1];
String empQual1Perc = empPersonalInfoAry[2];
String empQual1passout =empPersonalInfoAry[3];
String empQual2 = empPersonalInfoAry[4];
String empQual2Perc =empPersonalInfoAry[5];
String empQual2passout =empPersonalInfoAry[6];
String empQual3 = empPersonalInfoAry[7];
String empQual3Perc = empPersonalInfoAry[8];
String empQual3passout = empPersonalInfoAry[9];
String cert1 = empPersonalInfoAry[10];
String cert2 = empPersonalInfoAry[11];
String cert3 = empPersonalInfoAry[12];

%>

 <table border="2" align="center" >

 <tr><td><b>EMP ID</b></td> <td><%=empId %></td></tr> 
<tr><td><b>Qualification1</b></td><td><%=empQual1 %></td></tr>
<tr><td><b>%</b></td><td><%=empQual1Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual1passout %></td></tr>
<tr><td><b>Qualification1 </b></td><td><%=empQual2 %></td></tr>
<tr><td><b>%</b></td><td><%=empQual2Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual2passout %></td></tr>
<tr><td><b>Qualification3</b></td><td><%=empQual3 %></td></tr>
<tr><td><b>%</b></td><td><%=empQual3Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual3passout %></td></tr>
<tr><td><b>Certificate1</b></td><td><%=cert1 %></td></tr>

<tr><td><b>Certificate2</b></td><td><%=cert2 %></td></tr>
<tr><td><b>Certificate3</b></td><td><%=cert3 %></td></tr>



</table>




</body>
</html>