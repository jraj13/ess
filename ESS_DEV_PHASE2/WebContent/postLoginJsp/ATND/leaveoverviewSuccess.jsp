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
<script type="text/javascript">
	/*Delete operation script*/

	/* function myFunction(id) {

		if (confirm("Are you sure to delete this record???")) {
			alert("id is=======" + id);
			window.location = "DeleteConformAction?sid=" + id;
			alert("succesfully deleted record:" + id);
		} else {
			return false;

		}
		return true;
	}
	/*Update operation script*/

	/* function myFunctionUpdate(sid) {

		if (confirm("Are you sure to update this record???")) {
			window.location = "UpdateRowSelection?sid=" + sid;

		} else {
			return false;

		}
		return true;
	}  */
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Public Holiday Calendar</title>
</head>
<body>
	<h3 style="background-color: #00CED1">Leave Overview</h3>
	<br>
	<br>
	<table align="center">
		<tr style="background-color: #40E0D0">

			<th>SID</th>
			<th>Type of Leave</th>
			<th>Start Date</th>
			<th>Start time</th>
			<th>End Date</th>
			<th>End Time</th>
			<th>Next Processor</th>
			<th>Status</th>
			<th>Used</th>
			
			<th>Cancel</th>
		</tr>
		<%
			ArrayList<String> leaveOV = AttendanceDetails.deleteLeaveOverview();
			if (leaveOV.size() > 0) {
				for (int i = 0; i < leaveOV.size(); i++) {

					String employeedata = leaveOV.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");
					String sid = empDataAry[0];
					String typeOfLeave = empDataAry[1];
					String startDate = empDataAry[2];
					String startTime = empDataAry[3];
					String endDate = empDataAry[4];
					String endTime = empDataAry[5];
					String nextProcessor = empDataAry[6];
					String status = empDataAry[7];
					String used = empDataAry[8];
		%>
		<tr align="center">
			<td><%=sid%></td>
			<td><%=typeOfLeave%></td>
			<td><%=startDate%></td>
			<td><%=startTime%></td>
			<td><%=endDate%></td>
			<td><%=endTime%></td>
			<td><%=nextProcessor%></td>
			<td><%=status%></td>
			<td><%=used%></td>
			<%-- <td><input type="button" method="updateExecute1" value="Edit"
				onclick="myFunctionUpdate('<%=sid%>');" /></td> --%>

			<td><input type="radio" id="delBtn" onclick="openPage(id)" /></td>

		</tr>
		<%
			}
			}
		%>


	</table>

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
			ArrayList<String> leaveTA = AttendanceDetails
					.getLeavetimeAccounts();
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