<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetails"%>
    <%@ page import="java.lang.*,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../date/jquery-ui.css"/>
 <script src="../date/jquery-1.10.2.js"></script>
<script src="../date/latest.min.js"></script>
<script src="../date/jquery-ui.js"></script> 
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <script>
	function child_open(atndId)
		{
	alert("come in emp edit");
			var empid =atndId;
			var empfn = $('#empfn').val();
			var empln = $('#empln').val();
			var doj = $('#doj').val();
			var dob = $('#dob').val();
			var design = $('#design').val();
			var mailid = $('#mailid').val();
			var rtm = $('#rtm').val();
			var ctc = $('#ctc').val();
			 var status=$('#status').val(); 
			
		/*  var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); */
		 var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc+ '&status='+status,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); 
		}
		/* function parent_disable() {
		if(popupWindow && !popupWindow.closed)
		popupWindow.focus();
		} */
</script> -->


</head>
<body>
<br>

	<table align="center">
		<tr style="background-color: #40E0D0">

			<th>EDIT</th>
			
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
			ArrayList<String> leaveOV1 = EmployeeDetails.getAllEmployeeInfo();
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
	<%-- 	 <td style="background-color: #4682B4"><input type="button" id="<%=empId%>" value="Edit"  onclick="javascript:child_open(id);"/> </td>  --%>
		 <%-- <td style="background-color: #4682B4"><input type="button" id="<%=empId%>" value="Edit"  onclick="editFunction(id);"/> </td> --%> 
			<td style="background-color: #4682B4">
 	
 	 	 <button type="button" id="<%=empId%>" onclick="editFunction(id);" > 
          <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
 	</td>
			<td><input type="text" id="empid" size="10" value="<%=empId%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="empfn" size="10" value="<%=empFname%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="empln" size="10" value="<%=empLname%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="doj" size="10" value="<%=joiningDate%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="dob" size="10" value="<%=empDob%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="design" size="10" value="<%=empDesig%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="mailid" size="10" value="<%=empEmail%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="rtm" size="10" value="<%=repManager%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="ctc" size="10" value="<%=empCtc%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input  type="text" id="status" size="10" value="<%=status%>" readonly="readonly" style="background-color: white;color:black"></td>
			<td><input type="text" id="remarks" size="10" value="<%=remarks%>" readonly="readonly" style="background-color: white;color:black"></td>
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