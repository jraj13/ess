<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.ess.common.action.EmployeeDetails"%>
            <%@ page import="java.lang.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<br>

	<table align="center">
		<tr style="background-color: #40E0D0">

			<!-- <th>EDIT</th> -->
			
			<th>EMP ID</th>
			<th>FIRST NAME</th>
			<th>LAST NAME</th>
			<th>DOJ</th>
			<th>DOB</th>
			<th>DESIGNATION</th>
			<th>MAIL ID</th>
			<th>REPORTING MANAGER</th>
			<th>CTC</th>
			<th>STATUS</th>
		    <th>REMARKS</th>
			<!-- <th>DOR</th>  -->
			   
		</tr>
		<%
			ArrayList<String> leaveOV1 = EmployeeDetails.getAllEmployeeInfoMgr();
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
					String empCtc = empDataAry[8];
				    String status = empDataAry[9]; 
					String remarks = empDataAry[10];
				   /*  String Dor = empDataAry[11];  */
		%>

		
		<tr align="center">
		<%--  <td style="background-color: #4682B4"><input type="button" id="<%=empId%>" value="Edit"  onclick="editFunction(id);"/> </td>  --%>
			
			<td><%=empId%></td>
			<td><%=empFname%></td>
			<td><%=empLname%></td>
			<td><%=joiningDate%></td>
			<td><%=empDob%></td>
			<td><%=empDesig%></td>
			<td><%=empEmail%></td>
			<td><%=repManager%></td>
			<td><%=empCtc%></td>
			<td><%=status%></td>
			<td><%=remarks%></td>
			<%-- <td><input  type="text" id="dor" size="10" value="<%=Dor%>" readonly="readonly" style="background-color: white;color:black"></td>  --%>
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