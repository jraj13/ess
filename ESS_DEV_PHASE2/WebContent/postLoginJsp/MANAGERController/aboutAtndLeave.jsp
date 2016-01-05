<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h4>About Attendance/Leave page</h4>
<br><br>



<div id="leaveOverview">
	<table align="center">
		<tr style="background-color: #40E0D0">

			<th>Approve</th> 
			 <th>Reject</th> 
			
			<th>Name</th>
			<th>Type of Leave</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Next Processor</th>
			<th>Status</th>
			<th>Leave Days</th>
			<th>Note</th>
			<th>EMP ID</th>
		
		</tr>
		<%
			ArrayList<String> leaveOV = AttendanceDetails.getLeaveOverviewDataForMgr();
			if (leaveOV.size() > 0) {
				for (int i = 0; i < leaveOV.size(); i++) {

					String employeedata = leaveOV.get(i).toString();

					
					String empDataAry[] = employeedata.split("\\^");
					String empfname = empDataAry[0];
					String emplname = empDataAry[1];
					String typeOfLeave=empDataAry[2];
					String startDate = empDataAry[3];
					String endDate = empDataAry[4];
					String nextProcessor = empDataAry[5];
					String used = empDataAry[6];
					String status = empDataAry[7];
					String mailid = empDataAry[8]; 
					String sid = empDataAry[9]; 
					String note=empDataAry[10];
					String rtm=empDataAry[11];
					
					
		%>
		<tr align="center">
			
				 <!-- onclick="window.open('ATND/LeaveoverviewEdit.jsp','mywindow','width=500,height=400,toolbar=no,resizable=yes');" -->
				 
          <td style="background-color: #4682B4"><input type="radio" name="approved"   onclick="confirm_Approval('<%=sid%>');" /></td>  
           <td style="background-color: #4682B4"><input type="radio" name="approved"   onclick="confirm_Reject('<%=sid%>');" /></td>     
        <%--  <td style="background-color: #4682B4"><input type="radio" name="radio1"   onclick="confirm_deletion('<%=sid%>');" /></td>   --%>
         
         

			<!--  <td><input type="radio" id="delBtn" onclick="openPage(id)" /></td> -->
		
			<%-- <td><input type="hidden" id="sid" value="<%=sid%>" readonly="readonly" ></td>
			<td><input type="text" id="tol" size="10" value="<%=typeOfLeave%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="sd" size="10" value="<%=startDate%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="ed" size="10" value="<%=endDate%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="np" size="10" value="<%=nextProcessor%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="ss" size="10" value="<%=status%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="used" size="10" value="<%=used%>" readonly="readonly" style="background-color: white;color:black"></td>
			 --%>
			 
			<td><%=empfname%>&nbsp;<%=emplname %></td>
			<td><%=typeOfLeave%></td>
			 <td><%=startDate%></td>
			<td><%=endDate%></td>
			
			<td><%=rtm%></td>
			<td><%=status%></td>
			<td><%=used%></td>
			
			<td><%=note%></td>
			<td><%=mailid%></td>
		</tr>
		<%
			}
			}else {
		%>
							
							<tr>
								<td colspan="11">No Records</td>
							</tr>

							<%
								}
							%>


	</table>
</div>

</body>
</html>