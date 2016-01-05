<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
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
<title>Public Holiday Calendar</title>
</head>
<body>
	
	<h3 style="background-color: #00CED1">Time Accounts Overview</h3>
	<br>
	<br>
	<table align="center">
		<tr style="background-color: #40E0D0">


			<th>Type of Leave</th>
			<th>Opening Balance</th>
			<th>Availed</th>
			<th>Pending with Approves</th>
			<th>Available Balance</th>

		</tr>
		<%
			ArrayList<String> leaveTA = AttendanceDetails.getLeavetimeAccounts();
			if (leaveTA.size() > 0) {
				for (int i = 0; i < leaveTA.size(); i++) {

					String employeedata = leaveTA.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");
					String typeOfLeave = empDataAry[0];
					String openingBalance = empDataAry[1];
					String availed = empDataAry[2];
					String pendingwthApproves = empDataAry[3];
					String availableBalance = empDataAry[4];
		%>
		<tr align="center">
			<td><%=typeOfLeave%></td>
			<td><%=openingBalance%></td>
			<td><%=availed%></td>
			<td><%=pendingwthApproves%></td>
			<td><%=availableBalance%></td>

		</tr>
		<%
			}
			}
		%>


	</table>

</body>
</html>