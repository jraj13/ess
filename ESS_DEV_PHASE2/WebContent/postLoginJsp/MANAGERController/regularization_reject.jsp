<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.action.RegularizationAction"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		 <%

	String message="";

	System.out.println("regularization status page");
	String seq_id=request.getParameter("seq_no");
	System.out.println("sequence id is"+seq_id);
	String reg_status="Regularization Rejected";
	RegularizationAction reg_action=new RegularizationAction();
	
	String result=reg_action.regularization_Approve(seq_id,reg_status);
	
	if(result.equalsIgnoreCase("Update successfully"))
	{
	
			message="Regularization Rejected successfully";
			out.print(message);
			}
			else
			{
				message="Sorry! try Again";
				out.print(message);
			}

	%>

<div id="leaveOverview">
	<table align="center">
		<tr style="background-color: #40E0D0">
<td>Approve</td>
<td>Reject</td>
<td>Emplyoee ID</td>
<td>Regularization Type</td>
<td>Date</td>
<td>Reason</td>
</tr>


<%
RegularizationAction reg_man=new RegularizationAction(); 
ArrayList<String> reg_man_process=reg_man.GettingManger_Regularization();
	if (reg_man_process.size() > 0) {
		for (int i = 0; i < reg_man_process.size(); i++) {
			String reg_data = reg_man_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String empid = reg_arr[0];
			String type = reg_arr[1];
			String date = reg_arr[2];
			String note = reg_arr[3];
			String seq_no = reg_arr[4];
%> 

 <tr align="center">
 	<td style="background-color: #4682B4"><input type="radio" id="reg_approve" name="reg_radio" onclick="Approve_regularization('<%=seq_no%>');" />
 	<td style="background-color: #4682B4"><input type="radio" id="reg_reject" name="reg_radio" onclick="Reject_regularization('<%=seq_no %>');" />
	<td><%=empid%></td>
	<td><%=type%></td>
	<td><%=date%></td>
	<td><%=note%></td>

</tr> 
 <%
	}
	} else {

%> <tr>
	<td colspan="10">No Records Available</td>
</tr>

 <%
	}
%> 


</table>
	</div>
 

</body>
</html>
