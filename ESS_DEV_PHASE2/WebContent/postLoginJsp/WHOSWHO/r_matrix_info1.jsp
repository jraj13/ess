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
<div>R-Matrix View</div>
</div>
<table >
		<tr style="background-color: #98c3e2">

					<th>REPORTING MANAGER</th>
						<th>Business Head</th>
							<th>HR</th>
							
							<!-- <th>S.No.</th>
							<th>Name</th>
							<th>Level</th> -->
					
		</tr>

		<%
	String input_value=request.getParameter("checked_matrix_radio");
	System.out.println("jsp input value1.."+input_value);
	
		    
	ArrayList<Object> leaveOV1 = EmployeeDetails.r_matrix_info_self_details(input_value);
	System.out.println("leaveOV1.size()... "+leaveOV1.size() );
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

<%

 ArrayList<Object> newobj = EmployeeDetails.r_matrix_info_self(input_value);
System.out.println("newobj.size()... "+newobj.size() );
if (newobj.size() > 0) {
	for (int j = 0; j < newobj.size(); j++) {

		String employeedata2 = newobj.get(j).toString();
		
		String empDataAry2[] = employeedata2.split("\\^");
		String empFname_rm = empDataAry2[0];
		String empLname_rm = empDataAry2[1];



%>

<tr >

	
	<td><%=repManager%></td>
	<td><%=business_heade %></td>
	<td><%=hr %></td>


 
</tr>
<%
		}}
	}
	}else {
%>
					<tr>
						<td colspan="3">No Records Found</td>
					</tr>

					<%
						}
					%>

</table>
</body>
</html>