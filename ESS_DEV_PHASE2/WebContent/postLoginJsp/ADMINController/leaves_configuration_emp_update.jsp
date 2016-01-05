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
function update()
{
	alert("update save");
		var basic=document.getElementById("pl").value;
		var hra=document.getElementById("sl").value;
		var conv=document.getElementById("cl").value;
		var lta=document.getElementById("advpl").value;
		var ma=document.getElementById("advsl").value;
		var pf=document.getElementById("compoff").value;
		
		/*  window.location = "PayslipConfigUpdate?basic1=" +basic+ "&hra1=" +hra+ "&conv1=" +conv+ "&lta1=" +lta+ "&ma1=" +ma+ "&pf1=" +pf; */
		 window.location = "PayslipConfigUpdate?basic1=" +basic+ "&hra1=" +hra+ "&conv1=" +conv+ "&lta1=" +lta+ "&ma1=" +ma+ "&pf1=" +pf;
		// document.getElementById('update').style.visibility = 'hidden';
		// document.getElementById('edit').style.visibility = 'visible'; 
		
		 alert("Recored Updated Successfully ");
		}

</script>



</head>
<body>
<h2>Leave Configurations Detail</h2>
<hr>
<table>

<%

float pl=Float.parseFloat(request.getParameter("pl").trim());
float sl=Float.parseFloat(request.getParameter("sl").trim());
float cl=Float.parseFloat(request.getParameter("cl").trim());
float advpl=Float.parseFloat(request.getParameter("advpl").trim());
float advsl=Float.parseFloat(request.getParameter("advsl").trim());
float compoOFF=Float.parseFloat(request.getParameter("compoff").trim());


LeaveConfigAdmin lca2=new LeaveConfigAdmin();

lca2.update_Leaves_Config(pl, sl, cl, advpl, advsl, compoOFF);

%>

<%
LeaveConfigAdmin lca= new LeaveConfigAdmin();
		ArrayList<Object> info=lca.leaves_config();
		
		Iterator<Object> itr=info.iterator();
		while(itr.hasNext())
		{
			Object pl_value=itr.next();
			Object sl_value=itr.next();
			Object cl_value=itr.next();
			Object advpl_value=itr.next();
			Object advsl_value=itr.next();
			Object compoff_value=itr.next();
			
		%>
	

 
<tr>
<td><label>Personal Leave</label></td>
<td><input type="text"  name="pl" value="<%=pl_value %>" id="pl" disabled="true" style="background-color: white;color:black" onkeypress="return isPL(event)"   /></td>
</tr>

<tr>
<td><label>Sick Leave</label></td>
<td><input type="text" name="sl" value="<%=sl_value %>" id="sl" disabled="true" style="background-color: white;color:black"  onkeypress="return isSL(event)"   /></td>
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

<%
	} 

%>

<tr>
<td style="float:right"><input type="button"  id="edit" value="Edit"  onclick="return validate()"/> </td>
<!-- <td> <input type="submit" id="update" value="update Save" onclick="update()"/> </td> -->
<td> <input type="submit" id="updateleave_config" value="update Save" onclick="openPage(this.id);"/> </td>
</tr>



</table>




</body>
</html>