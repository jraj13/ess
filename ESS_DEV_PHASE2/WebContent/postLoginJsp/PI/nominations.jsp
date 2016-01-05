 <%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
	width
	="100";
}
</style>
</head>
<body>
<br>
	<table align="center">

		<tr>
		<col width="130">
			<col width="130">
			<td><b>Nomini1</b></td>
			<td>spouce</td>
		</tr>
		<tr>
			<td><b>Nomini2</b></td>
			<td>mother</td>
		</tr>
		<tr>
			<td><b>Nomini3</b></td>
			<td>father</td>
		</tr>


	</table>

</body>
</html> 
 --%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
	width
	="100";
}
</style>

   <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>


<script type="text/javascript">
function validate() {
	// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
    x=document.getElementById("spousename")
    x.disabled = !x.disabled;
    x=document.getElementById("mothername")
    x.disabled = !x.disabled;
    x=document.getElementById("fathername")
    x.disabled = !x.disabled;

}
</script>

<script>
function update()
{
		var Spouse_Name=document.getElementById("spousename").value;
		var Mother_Name=document.getElementById("mothername").value;
		var Father_Name=document.getElementById("fathername").value;
		
		 window.location = "NominiesUpdate?Spouse_Name=" +Spouse_Name+ "&Mother_Name=" +Mother_Name+ "&Father_Name=" +Father_Name;
		// document.getElementById('update').style.visibility = 'hidden';
		// document.getElementById('edit').style.visibility = 'visible'; 
		
		 alert("Recored Updated Successfully ");
		}

</script>

</head>
<body>
<br>

<%
String empQualification=EmployeeDetailsPersonal.getEmpNomineeInfo();
System.out.println("empPersonalInfo===="+empQualification);

String empPersonalInfoAry[]=empQualification.split("\\^");

String empId = empPersonalInfoAry[0];
String Spouse_Name = empPersonalInfoAry[1];
String Mother_Name = empPersonalInfoAry[2];
String Father_Name =empPersonalInfoAry[3];

%>


 <table align="center" >

 <tr>
 <col width="225">
<col width="190">

<input type="hidden" value="<%=empId %>" id="empId"  >
<%-- <td><b>EMP ID</b></td> <td><input type="text" value="<%=empId %>" id="empId" disabled="true" style="background-color: white;color:black"></td></tr> --%>
<tr><td><b>Nominee1(if spouse name)</b></td><td><input type="text" value="<%=Spouse_Name %>" id="spousename" disabled="true" style="background-color: white;color:black" onchange="verifyn5()"/></td></tr>
<tr><td><b>Nominee2(if mother name)</b></td><td><input type="text" value="<%=Mother_Name %>" id="mothername" disabled="true" style="background-color: white;color:black" onchange="verifyn4()"/></td></tr>
<tr><td><b>Nominee3(if father name)</b></td><td><input type="text" value="<%=Father_Name %>" id="fathername" disabled="true" style="background-color: white;color:black" onchange="verifyn3()"/></td></tr>

</table>

	<center>
 <input type="button"  id="edit" value="Edit"  onclick="return validate()"/> 
 <input type="submit" id="update" value="Submit" onclick="update()"/> 
 
 </center>

</body>
</html> 