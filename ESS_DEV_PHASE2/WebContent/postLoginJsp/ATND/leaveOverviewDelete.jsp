<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../cssmenu/styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="../cssmenu/script.js"></script>
<style>
table, th, td {
	border: 1px solid black;
	;
}
</style>
<script type="text/javascript">

	
		function child_open(atndId)
		{
			alert('am in openFormEdit========'+atndId);
			//var atndId=atndId;
			
			var sid =atndId;
			/* var sid = $('#sid').val(); */
			alert('am in openFormEdit========'+sid);
			var tol = $('#tol').val();
			var sd = $('#sd').val();
			
			var ed = $('#ed').val();
			
			var np = $('#np').val();
			var ss = $('#ss').val();
			var used = $('#used').val();
			

		popupWindow =window.open('postLoginJsp/ATND/LeaveoverviewEdit.jsp?sid='+sid+'&tol='+tol+'&sd='+sd+'&ed='+ed+'&np='+np+'&ss='+ss+'&used='+used,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200");
		
		}	
		function parent_disable() {
		if(popupWindow && !popupWindow.closed)
		popupWindow.focus();
		}
</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Overview Delete</title>
</head>
<body>
<%
String message="";
String id =request.getParameter("sid"); 

System.out.println("sid...."+id);  
CallableStatement callableStatement = null;
CallableStatement cal = null;		
		
		
//PRO_UPDATE_DAYS
		
		String getDBUSERByUserIdSql = "{call calendardelete('"+id+"')}";
		String deleteLeaves = "{call PRO_UPDATE_DAYS('"+id+"')}";
		
		String RegQry ="delete from CALENDAR_LEAVE_APPLY_TEST where SID="+id+"";
		System.out.println("delete query...."+RegQry);
		Connection con=null;
		Connection con1=null;
		try {
con1=GetConnection.getConnection();
callableStatement = con1.prepareCall(deleteLeaves);
callableStatement.executeUpdate();
System.out.println("calling leaves delete procedure");
				 con= GetConnection.getConnection(); 
				callableStatement = con.prepareCall(getDBUSERByUserIdSql);
				System.out.println("calling procedure");
				callableStatement.executeUpdate();
			PreparedStatement st = con.prepareStatement(RegQry);
		
			int rs = st.executeUpdate();
			
		message="successfully Deleted one Record";
			
		} catch (Exception ex) {
			System.out.println("record deletion=="+ex.getMessage());
		}
		finally{
			con.close();
			con1.close();
		}
		
	%>
	<div id="lvrNew">
<div id='cssmenu' style="width: 1000px;height: 25px;padding-bottom:15px;text-align:left">

	<div id='cssmenu' style="width: 1200px;text-align:left;margin-top:100px;margin-left:-4%;padding-left:15px;background-color: #00CED1">
	<b>Leave Data Overview</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- <div id="LR"><img  src="images/n2.png" style="width: 30px;height: 30px">New</div> --> 
 <a href="#LR" id="LR" style="color:black;text-decoration: none;" onclick="openPage(this.id);"><img  src="images/n2.png" style="width: 30px;height: 30px"><b>New</b></a>   	
	
	</div>
	
	</div>
	<br>
	<br>
	
<div id="leaveOverview">
	<table align="center">
		<tr style="background-color: #40E0D0">

			<th>Cancel</th>
			<th>Type of Leave</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Next Processor</th>
			<th>Status</th>
			<th>Used</th>
			
		</tr>
		<%
			ArrayList<String> leaveOV = AttendanceDetails.getLeaveOverview();
			if (leaveOV.size() > 0) {
				for (int i = 0; i < leaveOV.size(); i++) {

					String employeedata = leaveOV.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");
					String sid = empDataAry[0];
					String typeOfLeave = empDataAry[1];
					String startDate = empDataAry[2];
					
					String endDate = empDataAry[3];
					
					String nextProcessor = empDataAry[4];
					String status = empDataAry[5];
					String used = empDataAry[6];
		%>
		<tr align="center">
		 
		
         <td style="background-color: #4682B4">
        <%--  <input type="radio" name="radio"   onclick="confirm_deletion('<%=sid%>');" /> --%>
        
          <button type="button"   onclick="confirm_deletion('<%=sid%>');" > 
          <span style="color:black" class="glyphicon glyphicon-trash"></span> </button>
         
         </td>  

		
			<%-- <td><input type="hidden" id="sid" value="<%=sid%>" ></td> --%>
			<td><%=typeOfLeave%></td>
			<td><%=startDate%></td>
			<td><%=endDate%></td>
			<td><%=nextProcessor%></td>
			<td><%=status%></td>
			<td><%=used%></td>

		</tr>
	<%-- 	<%
			}
			}
		%> --%>
		
		
		<%
			}
			}else {
		%>
		
							<tr>
								<td colspan="10">No Records Available</td>
							</tr>

							<%
								}
							%>


	</table>
	
	
	 <!-- FOR LEAVE APPROAVAL -->
	
	<h3 style="background-color: #00CED1;margin-left:-4%;padding-left:10px">Leave Approval Overview</h3>
		<table align="center">
		<tr style="background-color: #40E0D0">

			
			<!-- <th>Cancel</th> -->
			<!-- <th></th> -->
			<th>Type of Leave</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Next Processor</th>
			<th>Status</th>
			<th>Leave Days</th>
			
		</tr>
		<%
			ArrayList<String> leaveOV1 = AttendanceDetails.getLeaveOverviewApproval();
			if (leaveOV1.size() > 0) {
				for (int i = 0; i < leaveOV1.size(); i++) {

					String employeedata = leaveOV1.get(i).toString();
					
					String empDataAry[] = employeedata.split("\\^");
					String sid = empDataAry[0];
					String typeOfLeave = empDataAry[1];
					String startDate = empDataAry[2];
					String endDate = empDataAry[3];
					String nextProcessor = empDataAry[4];
					String status = empDataAry[5];
					String used = empDataAry[6];
		%>
		<tr align="center">
		<%-- <td style="background-color: #4682B4">  <input type="button" id="<%=sid%>" value="Edit"  onclick="javascript:child_open(id);"/> </td> --%>
		<!--  <input type="button" id="edit" value="Edit"  onclick="javascript:child_open(this.id);"/>  -->
			 <!-- <a href="javascript:child_open()" style="text-decoration:none">EDIT</a> -->
			
				 <!-- onclick="window.open('ATND/LeaveoverviewEdit.jsp','mywindow','width=500,height=400,toolbar=no,resizable=yes');" -->
        <%--  <td style="background-color: #4682B4"><input type="radio" name="radio"   onclick="confirm_deletion('<%=sid%>');" /></td> --%>  
         
         

			<!--  <td><input type="radio" id="delBtn" onclick="openPage(id)" /></td> -->
		
			<%-- <td><input type="hidden" id="sid" value="<%=sid%>" readonly="readonly" ></td>
			<td><input type="text" id="tol" size="10" value="<%=typeOfLeave%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="sd" size="10" value="<%=startDate%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="ed" size="10" value="<%=endDate%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="np" size="10" value="<%=nextProcessor%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="ss" size="10" value="<%=status%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="used" size="10" value="<%=used%>" readonly="readonly" style="background-color: white;color:black"></td>
			 --%>
			<%-- <td><input type="hidden" id="sid" value="<%=sid%>" readonly="readonly" ></td> --%>
			<td><%=typeOfLeave%></td>
			<td><%=startDate%></td>
			<td><%=endDate%></td>
			<td><%=nextProcessor%></td>
			<td><%=status%></td>
			<td><%=used%></td>
			

		</tr>
		<%
			}
			}else {
		%>
		

							
							<tr>
								<td colspan="10">No Records Available</td>
							</tr>

							<%
								}
							%>


	</table>
	

	<h3 style="background-color: #00CED1;margin-left:-4%;padding-left:10px">Leave Accounts Overview</h3>
	<br>
	<br>
	<table align="center">
		<tr style="background-color: #40E0D0">


			<th>Type of Leave</th>
			<th>Opening Balance</th>
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
					
					String availableBalance = empDataAry[2];
		%>
		<tr align="center">
			<td><%=typeOfLeave%></td>
			<td><%=openingBalance%></td>
			<td><%=availableBalance%></td>

		</tr>
		
		
		<%
			}
			}else {
		%>
							<tr>
								<td colspan="10">No Records Available</td>
							</tr>

							<%
								}
							%>


	</table>
</div></div>
</body>
</html>