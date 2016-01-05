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

<table >
<tr style="background-color: #98c3e2">

	<th>EMP ID</th>
	<th>EMP NAME</th>
	<!-- <th>FIRST NAME</th>
	<th>LAST NAME</th> -->
	<th>DOJ</th>
	<th>DOB</th>
	<th>DESIGNATION</th>
	<th>MAIL ID</th>
    <th>REPORTING MANAGER</th>
	<th>CTC</th>
	<!--  <th>STATUS</th> -->
	<!--  <th>REMARKS</th>
	 <th>DOR</th> -->
	 <th>CONTACT NO</th>
</tr>

	<%
	ArrayList<String> leaveOV1 = EmployeeDetails.getEmployeeSearchInfoByBloodGroup();
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
		   /*  String Dor = empDataAry[11];   */
		    String phno = empDataAry[11];
%>


<tr >

	<td><%=empId%></td>
	<td><%=empFname%>&nbsp;<%=empLname%></td>
	<%-- <td><%=empLname%></td> --%>
	<td><%=joiningDate%></td>
	<td><%=empDob%></td>
	<td><%=empDesig%></td>
	<td><%=empEmail%></td>
	<td><%=repManager%></td>
	<td><%=empCtc%></td>
	<%-- <td><%=status%></td> --%>
	<td><%=phno%></td>

 
</tr>
<%
	}
	}else {
%>
					<tr>
						<td colspan="10">No Records Found</td>
					</tr>

					<%
						}
					%>

</table>


<!-- 
<div>Employee Search</div>
<hr>
<br>




<div style="background-color: #98c3e2; width:40%;height: 28px; ">&nbsp;&nbsp;Employee Search</div>
 <table border="1"  width="40%";  class = "tableStyle_emps" > 
 
 <tr><td><b>&nbsp;&nbsp;&nbsp;Employee Id</b></td><td><input type="text"  id="empid" value=""  /></td></tr>
 <tr><td><B>&nbsp;&nbsp;&nbsp;Employee Name</b></td><td><input type="text"  id="empid" value="" /></td></tr>

 <tr><td><b>&nbsp;&nbsp;&nbsp;Blood Group</b></td>
 <td><select>
 <option value="none selected">Select</option>
 <option value="O+">O+</option>
 <option value="O+">O+</option>
 <option value="O+">O+</option>
 <option value="O+">O+</option>
 </select></td>
 </tr> 
 <tr>
 <td>&nbsp;&nbsp;&nbsp;<input type="button" value="Search" id="empsearch"/></td><td>&nbsp;</td>
 </tr>

 </table>  -->
 
 
 


</body>
</html>