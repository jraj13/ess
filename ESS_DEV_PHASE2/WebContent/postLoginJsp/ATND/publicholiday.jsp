<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat" %>


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
	<%-- <%


String holidayInfo=AttendanceDetails.getPublicHolidays();


String empPersonalInfoAry[]=holidayInfo.split("\\^");


String sid = empPersonalInfoAry[0];
String dateOfHoliday = empPersonalInfoAry[1];
String weekday = empPersonalInfoAry[2];
String holidayName = empPersonalInfoAry[3];
%> --%>
<%
	DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
		Date date = new Date();
		String dateinStr = dateFormat.format(date);
		//System.out.println("date====" + dateinStr);

		String[] str = dateinStr.split("/");
		System.out.println("PUBLIC HOLIDAY str0=========" + str[2] + "month====="	+ str[1].toUpperCase());
		String year = str[2];
		String month = str[1].toUpperCase();
		
		 %>
	<table align="center">
		<caption style="background-color:#2F4F4F;color:white"><%=year %> Public Holidays in India</caption>
		<tr>
		
		
		
  
			<th col width="10">S.NO</th>
			<th col width="130">Date</th>
			<th col width="130">Week Day</th>
			<th col width="130">Holiday</th>
		</tr>


		<%
			ArrayList<String> pHolidaylist = AttendanceDetails.getPublicHolidays();
			if (pHolidaylist.size() > 0) {
				for (int i = 0; i < pHolidaylist.size(); i++) {

					String employeedata = pHolidaylist.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");

					String sid = empDataAry[0];
					String dateOfHoliday = empDataAry[1];
					String weekday = empDataAry[2];
					String holidayName = empDataAry[3];
		%>
		<td col width="10">
		<label for="sid">&nbsp;&nbsp;&nbsp;<%=sid%></label>
		<%-- <input type="text" size="1"  id="sid" value="<%=sid%>" readonly="readonly"/> --%></td>
		<td><%=dateOfHoliday%></td>
		<td><%=weekday%></td>
		<td><%=holidayName%></td>
		</tr>
		<%
			}
			}
		%>

		
	</table>

</body>
</html>