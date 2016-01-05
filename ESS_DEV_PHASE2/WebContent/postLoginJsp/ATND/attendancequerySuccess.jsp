<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>

<%@ page import="com.ess.util.GetConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
/* table, th, td {
	border: 1px solid black;
	width
	="100";
} */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>attendance details</title>
</head>
<body>


	<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">Attendance Status</h2>
	<%-- 
	<%

String message="";
String month=request.getParameter("month");
String year=request.getParameter("year");
System.out.println(year+"====month 7 year....==="+month);


ResultSet rs=null;
String id=(String)session.getAttribute("empid");


String id1=id.substring(8);
		
//String empQRY = "select * from NCSS_ATTENDANCE_QUERY  WHERE to_char(IN_DATE, 'MON')='"+month+"' and to_char(IN_DATE,'YYYY')='"+year+"'";

String empQRY = "SELECT * FROM NCSS_TEMP_BKP_DUMP  WHERE to_char(DATE_TIME, 'MON')='"+month+"' and to_char(DATE_TIME,'YYYY')='"+year+"' and EMPID='"+id1+"' order by DATE_TIME ";
		
		System.out.println("sid...."+empQRY);
	
		try {

	
				Connection con = GetConnection.getConnection(); 

			Statement st = con.createStatement();
		
			 rs = st.executeQuery(empQRY);
	
		} catch (Exception ex) {
			
			System.out.println("record =="+ex.getMessage());

		}
		
	
	%> --%>
	
	<table style="width:80%" align="left">
							<tr style="background-color: #40E0D0">
								<th>DATE</th>
								<th>SCHEDULE SHIFT</th>
								<th>CLOCK IN</th>
								<th>CLOCK OUT</th>
								<th>ATTENDANCE STATUS</th>
								<th>LEAVE STATUS</th>
								<th>REGULARIZATION STATUS</th>
								
							</tr>
							<%
								ArrayList<String> leareq = AttendanceDetails.getAttendanceQuery();
								if (leareq.size() > 0) {
									for (int i = 0; i < leareq.size(); i++) {
										String req = leareq.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										
							/* 		 String type_of_leave = reqarr[0];
										String start_date = reqarr[1];
										String end_date = reqarr[2];
										String start_time = reqarr[3];
										String end_time = reqarr[4];
										String employee_name = reqarr[5]; */
										
										String atnd_date = reqarr[0];
										String shift = reqarr[1];
										String clock_in = reqarr[2];
										String clock_out = reqarr[3];
										String atnd_status = reqarr[4];
										String leave_status = reqarr[5];
										
										String in_time_status = reqarr[6];
										String out_time_status = reqarr[7];
										String reg_status=reqarr[8];
										
										
							%>
							<tr align="center">
								<td><%=atnd_date%></td>
								<td><%=shift%></td>
								<td><%=clock_in%></td>
								<td><%=clock_out%></td>
								<td><%=atnd_status%></td>
								<td><%=leave_status%></td>
								<td><%=reg_status%></td>
								
							</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="11">No Records Available</td>
							</tr>

							<%
								}
							%>
						</table>
</body>
</html>