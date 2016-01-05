<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetails"%>
    <%@ page import="java.lang.*,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
<br>



	<table align="center">
		<tr style="background-color: #40E0D0">

			
			
			<th>EMP ID</th>
			<th>FIRST NAME</th>
			<th>LAST NAME</th>
			<th>DOJ</th>
			<th>DOB</th>
			<th>DESIGNATION</th>
			<th>MAIL ID</th>
			<th>REPORTING MANAGER</th>
			<th>CTC</th>
		</tr>
		<%
			ArrayList<String> leaveOV = EmployeeDetails.getAllEmployeeResignInfo();
			if (leaveOV.size() > 0) {
				for (int i = 0; i < leaveOV.size(); i++) {

					String employeedata = leaveOV.get(i).toString();

					
					String empDataAry[] = employeedata.split("\\^");
					String empId = empDataAry[0];
					String empFname = empDataAry[1];
					String empLname = empDataAry[2];
					String joiningDate = empDataAry[3];
					String empDob = empDataAry[4];
					String empDesig = empDataAry[5];
					String empEmail = empDataAry[6];
					String repManager = empDataAry[7];
					String empCtc = empDataAry[8];
		%>
		
		
		<tr align="center">
		
			
			<td><%=empId%></td>
			<td><%=empFname%></td>
			<td><%=empLname%></td>
			<td><%=joiningDate%> </td>
			<td><%=empDob%></td>
			<td><%=empDesig%></td>
			<td><%=empEmail%></td>
			<td><%=repManager%></td>
			<td><%=empCtc%></td>
			

		</tr>
		<%
			}
			}else {
		%>
		

							
							<tr>
								<td colspan="10">No Records</td>
							</tr>

							<%
								}
							%>


	</table>

</body>
</html>