<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ page import="com.ess.common.action.EmployeeDetails" %>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
<b>R-Matrix View</b>
</div>
<table >
		<tr style="background-color: #98c3e2">

					<th>EMP ID</th>
					<th>EMP NAME</th>
					<th>DESIGNATION</th>
					<th>MAIL ID</th> 
					<th>HR</th> 
					<th>Business Head</th>
					
					<!-- <th>REPORTING MANAGER</th>
						<th>Business Head</th>
							<th>HR</th> -->
					
		</tr>

		<%
	String input_value=request.getParameter("checked_matrix_radio");
	System.out.println("jsp input value1.."+input_value);
	
	ArrayList<Object> leaveOV1 = EmployeeDetails.r_matrix_info_subordinate(input_value);
	if (leaveOV1.size() > 0) {
		for (int i = 0; i < leaveOV1.size(); i++) {

			String employeedata = leaveOV1.get(i).toString();
			
			String empDataAry[] = employeedata.split("\\^");
			String empId = empDataAry[0];
			String empFname = empDataAry[1];
			String empLname = empDataAry[2];
			String joiningDate = empDataAry[3];
			String empDob = empDataAry[4];
			String empDesig = empDataAry[5];
			String empEmail = empDataAry[6];
			String repManager = empDataAry[7];
		    String business_heade = empDataAry[8];
		    String hr = empDataAry[9];
			
%>


<tr >

	 <td><%=empId%></td>
	<td><%=empFname%>&nbsp;<%=empLname%></td>
	<td><%=empDesig%></td>
	<td><%=empEmail%></td> 
	<td><%=hr%></td>
	<td><%=business_heade%></td> 
 
</tr>
<%
	}
	}else {
%>
					<tr>
						<td colspan="6">No Records Found</td>
					</tr>

					<%
						}
					%>

</table>
</body>
</html>