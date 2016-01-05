<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
              <%@page import="com.ess.common.action.LeaveConfigAdmin"%>
     <%@ page import="java.io.*,java.text.*,java.util.*"%>
     <%@ page import="java.util.ArrayList"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="investmentjs/ChoicePayCal_update.js"></script>
<script type="text/javascript">
function validate() {
	// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
    x=document.getElementById("pl")
    x.disabled = !x.disabled;
    x=document.getElementById("sl")
    x.disabled = !x.disabled;
    x=document.getElementById("cl")
    x.disabled = !x.disabled;
    
    x=document.getElementById("advpl")
    x.disabled = !x.disabled;
    x=document.getElementById("advsl")
    x.disabled = !x.disabled;
    x=document.getElementById("compoff")
    x.disabled = !x.disabled;
 
}
</script>

<script>
$(function() {
	$('#updateleave_Assign_save').click(function() {
				
				alert("updateleave_Assign_save");
				
				var pl=$('#pl').val();
				var sl=$('#sl').val();
				var cl=$('#cl').val();
				var advpl=$('#advpl').val();
				var advsl=$('#advsl').val();
				var compoff=$('#compoff').val();
				var emp_id=$('#emp_id').val();
				alert(emp_id);
				
				  var dataString = '&pl=' +pl+ '&sl=' +sl+  '&cl=' +cl+ '&advpl=' +advpl+ '&advsl=' +advsl+ '&compoff=' +compoff+ '&emp_id=' +emp_id;
				  alert(dataString);
		
				$.ajax({
					url :'postLoginJsp/ADMINController/leaves_assign_for_employee_success.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
				 $('#leave_assign').html(data).delay(5000).fadeOut(); 
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				
			})
});
</script>

</head>
<body>
<div id="qrySuccess">

<table>


			<%
LeaveConfigAdmin lca= new LeaveConfigAdmin();
		ArrayList<Object> info=lca.saveLeaveAssigned_for_a_emp();
		System.out.println(info.size());
		
if (info.size() > 0) {
	for (int i = 0; i < info.size(); i++) {
		String intial_homepage = info.get(i).toString();

String into_data[]=intial_homepage.split("\\^");

String pl_value=into_data[0];
String sl_value=into_data[1];
String cl_value=into_data[2];
String advpl_value=into_data[3];
String advsl_value=into_data[4];
String compoff_value=into_data[5];
		


String emp_id=request.getParameter("empid");
		%>


<tr>
<td><label>Personal Leave</label></td>
<td><input type="text"  name="pl" value="<%=pl_value %>" id="pl" disabled="true" style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>

<tr>
<td><label>Sick Leave</label></td>
<td><input type="text" name="sl" value="<%=sl_value %>" id="sl" disabled="true" style="background-color: white;color:black"  onkeypress="return isSL(event)" /></td>
</tr>

<tr>
<td><label>Casual Leave</label></td>
<td><input type="text" class="" name="cl" value="<%=cl_value %>" id="cl" disabled="true" style="background-color: white;color:black"  onkeypress="return isCL(event)"  maxlength="15" /></td>
</tr>

<tr>
<td><label>Advance PL</label></td>
<td><input type="text" name="advpl" value="<%=advpl_value %>" id="advpl" disabled="true" style="background-color: white;color:black"  onkeypress="return isAdvancePL(event)"  maxlength="15" /></td>
</tr>

<tr>
<td><label>Advance SL</label></td>
<td><input type="text" name="advsl" value="<%=advsl_value %>" id="advsl" disabled="true" style="background-color: white;color:black" onkeypress="return isAdvanceSL(event)" /></td>
</tr>


<tr>
<td><label>Compensatory OFF</label></td>
<td><input type="text" name="compoff" value="<%=compoff_value %>" id="compoff" disabled="true" style="background-color: white;color:black" onkeypress="return isCompOff(event)" /></td>
</tr> 


<input type="hidden" value="<%=emp_id %> " id="emp_id"/>


<tr>
<td style="float:right"><input type="button"  id="edit" value="Edit"  onclick="return validate()"/> </td>
<!-- <td> <input type="submit" id="updateleave_Assign_save" value="Save" onclick="openPage(this.id);"/> </td> -->
<td> <input type="button" id="updateleave_Assign_save" value="Save" /> </td>
</tr>

<%
	}
	} 

%>

</table>
</div>

<div id="leave_assign">
</div>


</body>
</html>