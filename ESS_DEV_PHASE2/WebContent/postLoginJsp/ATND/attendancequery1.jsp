<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ess.common.action.AttendanceDetails"%>

<%@ page import="java.lang.*,java.util.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<div id="atndtable" style="height: 150px;margin-top:100px">
	
					
						
							<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>Attendance Query</I></h2>

						
								<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%>
							Today Date : <input type="text" value="<%=df.format(new java.util.Date())%>" readonly="readonly" style="background-color: white;color:black; width:9.5%;height:18%" /> 
							<br/>
							
							Month : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="monthList" id="month" style="background-color: white;color:black;height:18%">
									<option value="none selected">select month</option>
									<option value="JAN">JAN</option>
									<option value="FEB">FEB</option>
									<option value="MAR">MAR</option>
									<option value="APR">APR</option>
									<option value="MAY">MAY</option>
									<option value="JUN">JUN</option>
									<option value="JUL">JUL</option>
									<option value="AUG">AUG</option>
									<option value="SEP">SEP</option>
									<option value="OCT">OCT</option>
									<option value="NOV">NOV</option>
									<option value="DEC">DEC</option>
							</select>
								<% String var1=df.format(new java.util.Date());
								String[] date=var1.split("/");
								//out.println("year======="+date[2]);
								
								%>
							Year:<input type="text" id="year" size="3"   name="year" value="<%=date[2] %>"  readonly="readonly" style="background-color: white;color:black; width:5%;height:18%" >
						<br/>	<br/>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Display" id="qryBtn" onclick="openPage(id)"></input></td>
						
	</div>
	<br>

<div id="qrySuccess">
<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">Attendance Status</h2>

<table style="width:80%" align="left">
							<tr style="background-color: #40E0D0">
								<th>IN DATE</th>
								<th>SCHEDULE SHIFT</th>
								<th>CLOCK IN</th>
								<th>CLOCK OUT</th>
								<th>ATTENDANCE STATUS</th>
								<th>LEAVE STATUS</th>
								
							</tr>
							<%
								ArrayList<String> leareq = AttendanceDetails.getAttendanceQueryCurrentMonth();
								if (leareq.size() > 0) {
									for (int i = 0; i < leareq.size(); i++) {
										String req = leareq.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										
									 String type_of_leave = reqarr[0];
										String start_date = reqarr[1];
										String end_date = reqarr[2];
										String start_time = reqarr[3];
										String end_time = reqarr[4];
										String employee_name = reqarr[5];
										
										
							%>
							<tr align="center">
								<td><%=type_of_leave%></td>
								<td><%=start_date%></td>
								<td><%=end_date%></td>
								<td><%=start_time%></td>
								<td><%=end_time%></td>
								<td><%=employee_name%></td>
								
							</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="11">No Records</td>
							</tr>

							<%
								}
							%>
						</table>
<%-- <table style="width:80%" align="left">
							<tr style="background-color: #40E0D0">
								<th>IN DATE</th>
								<th>SCHEDULE SHIFT</th>
								<th>CLOCK IN</th>
								<th>CLOCK OUT</th>
								<th>ATTENDANCE STATUS</th>
								<th>LEAVE STATUS</th>
								<th>INTIME STATUS</th>
								<th>OUTTIME STATUS</th>
								
							</tr>
							<%
								ArrayList<String> leareq = AttendanceDetails.getAttendanceQueryCurrentMonth();
								if (leareq.size() > 0) {
									for (int i = 0; i < leareq.size(); i++) {
										String req = leareq.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										
									 String in_date = reqarr[0];
										String schedule_shift = reqarr[1];
										String clock_in = reqarr[2];
										String clock_out = reqarr[3];
										String attendance_status = reqarr[4];
										String leave_status = reqarr[5];
										String intime_status=reqarr[6];
										String outtime_status=reqarr[7];
										
										
							%>
							<tr align="center">
								<td><%=in_date%></td>
								<td><%=schedule_shift%></td>
								<td><%=clock_in%></td>
								<td><%=clock_out%></td>
								<td><%=attendance_status%></td>
								<td><%=leave_status%></td>
								<td><%=intime_status %></td>
								<td><%=outtime_status %></td>
							</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="11">No Records</td>
							</tr>

							<%
								}
							%>
						</table>
 --%>

</div>


</body>
</html>