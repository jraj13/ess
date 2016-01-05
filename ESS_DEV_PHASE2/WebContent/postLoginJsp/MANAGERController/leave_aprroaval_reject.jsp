<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
    
    <%@page import="com.ess.common.util.LeaveMail" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




 <%

String message="";


try {
		String id =request.getParameter("sid"); 

			System.out.println("sid for approval leave...."+id);  
	
		String sts="Apporved";
		
		
		Connection con = GetConnection.getConnection();
		Statement stmt = con.createStatement();
	
		String RegQry="update CALENDAR_LEAVE_APPLY_TEST set STATUS='Apporved' where SID="+id+"";
		
		System.out.println("Approval query...."+RegQry);
		
		int rs=stmt.executeUpdate(RegQry);
		System.out.println("rs.."+rs);

		
			/* int rs = st.executeUpdate(); */
			if(rs>0)
			{
			
			message="successfully Approved Leave";
			
			LeaveMail mp=new LeaveMail();
			mp.executeMail_leave(id,sts);   
			
			
			}
			else
			{
				message="Update failure";
			}
		} catch (Exception ex) {
			
			System.out.println("Approved Leave=="+ex.getMessage());
		}
		finally{
			//out.println(message);
		}
		
	%>

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
		System.out.println("approve..page size.."+leaveOV.size());
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
								<td colspan="11">No Records Available</td>
							</tr>

							<%
								}
							%>


	</table>
	</div>
 

</body>
</html>