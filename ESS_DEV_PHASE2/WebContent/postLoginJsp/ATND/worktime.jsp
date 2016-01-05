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
<title>Working Times</title>
</head>
<body>
	<br>
	<br>
	<table align="center">
		<tr>
			
			<th col width="10">S.NO</th>
			<th col width="130">Shifts</th>
			<th col width="130">Timings</th>
		</tr>
		<%
			ArrayList<String> shiftTiming = AttendanceDetails.getShifts();
			if (shiftTiming.size() > 0) {
				for (int i = 0; i < shiftTiming.size(); i++) {

					String employeedata = shiftTiming.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");
					String sid = empDataAry[0];
					String shiftName = empDataAry[1];
					String timings = empDataAry[2];
		%>
		<tr align="center">
			<td col width="10">
			<label for="sid"><%=sid%></label>
			<%-- <input type="hidden" size="1"  id="sid" value="<%=sid%>" readonly="readonly"/> --%></td>
			<td><%=shiftName%></td>
			<td><%=timings%></td>
		</tr>
		<%
			}
			}
		%>
		


	</table>

</body>
</html>