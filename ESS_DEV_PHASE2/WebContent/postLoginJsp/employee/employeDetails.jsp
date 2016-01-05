<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<table border="1">
		<tr>
			<td>Emp ID</td>
			<td>Emp Name</td>
			<td>Designation</td>
			<td>DOJ</td>
			<td>PAN</td>
			<td>Email ID</td>
			<td>CTC</td>
		</tr>
		<%
			ArrayList employeelist = EmployeeDetailsPersonal.getEmployees();
			if (employeelist.size() > 0) {
				for (int i = 0; i < employeelist.size(); i++) {

					String employeedata = employeelist.get(i).toString();

					String empDataAry[] = employeedata.split("\\^");

					String empId = empDataAry[0];
					String empName = empDataAry[1];
					String empDesig = empDataAry[2];
					String empDoj = empDataAry[3];
					String empPan = empDataAry[4];
					String empEmail = empDataAry[5];
					String empCtc = empDataAry[6];
		%>

		<tr>
			<td><%=empId%></td>
			<td><%=empName%></td>
			<td><%=empDesig%></td>
			<td><%=empDoj%></td>
			<td><%=empPan%></td>
			<td><%=empEmail%></td>
			<td><%=empCtc%></td>
		</tr>


		<%
			}
			} else {
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