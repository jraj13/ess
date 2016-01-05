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
	$('#generateleaveformodify_save').click(function() {
				
				alert("updateleave_Assign_save");
				
				var opening_pl=$('#opening_pl').val();
				if(opening_pl==""|| opening_pl==null){ opening_pl=0.0; }
				var available_pl=$('#available_pl').val();
				if(available_pl==""|| available_pl==null){ available_pl=0.0; }
				var pl_new=$('#pl_new').val();
				if(pl_new==""|| pl_new==null){ pl_new=0.0; }
				
				var opening_sl=$('#opening_sl').val();
				if(opening_sl==""|| opening_sl==null){ opening_sl=0.0; }
				var available_sl=$('#available_sl').val();
				if(available_sl==""|| available_sl==null){ available_sl=0.0; }
				var sl_new=$('#sl_new').val();
				if(sl_new==""|| sl_new==null){ sl_new=0.0; }
				
				var opening_cl=$('#opening_cl').val();
				if(opening_cl==""|| opening_cl==null){ opening_cl=0.0; }
				var available_cl=$('#available_cl').val();
				if(available_cl==""|| available_cl==null){ available_cl=0.0; }
				var cl_new=$('#cl_new').val();
				if(cl_new==""|| cl_new==null){ cl_new=0.0; }
				
				var opening_adv_pl=$('#opening_adv_pl').val();
				if(opening_adv_pl==""|| opening_adv_pl==null){ opening_adv_pl=0.0; }
				var available_adv_pl=$('#available_adv_pl').val();
				if(available_adv_pl==""|| available_adv_pl==null){ available_adv_pl=0.0; }
				var advpl_new=$('#advpl_new').val();
				if(advpl_new==""|| advpl_new==null){ advpl_new=0.0; }
				
				var opening_adv_sl=$('#opening_adv_sl').val();
				if(opening_adv_sl==""|| opening_adv_sl==null){ opening_adv_sl=0.0; }
				var available_adv_sl=$('#available_adv_sl').val();
				if(available_adv_sl==""|| available_adv_sl==null){ available_adv_sl=0.0; }
				var advsl_new=$('#advsl_new').val();
				if(advsl_new==""|| advsl_new==null){ advsl_new=0.0; }
				
				var opening_compoff=$('#opening_compoff').val();
				if(opening_compoff==""|| opening_compoff==null){ opening_compoff=0.0; }
				var available_compoff=$('#available_compoff').val();
				if(available_compoff==""|| available_compoff==null){ available_compoff=0.0; }
				var compoff_new=$('#compoff_new').val();
				if(compoff_new==""|| compoff_new==null){ compoff_new=0.0; }
				
				var emp_id=$('#emp_id').val();
				
				
				  var dataString = '&opening_pl=' +opening_pl+ '&available_pl=' +available_pl+  '&pl_new=' +pl_new+    '&opening_sl=' +opening_sl+ '&available_sl=' +available_sl+  '&sl_new=' +sl_new+  '&opening_cl=' +opening_cl+ '&available_cl=' +available_cl+ '&cl_new=' +cl_new+   '&opening_adv_pl=' +opening_adv_pl+ '&available_adv_pl=' +available_adv_pl+  '&advpl_new=' +advpl_new+    '&opening_adv_sl=' +opening_adv_sl+ '&available_adv_sl=' +available_adv_sl+  '&advsl_new=' +advsl_new+  '&opening_compoff=' +opening_compoff+ '&available_compoff=' +available_compoff+  '&compoff_new=' +compoff_new+    '&emp_id=' +emp_id;
				  alert(dataString);
		
				$.ajax({
					url :'postLoginJsp/ADMINController/leaves_assign_modify_for_employee_success.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
				 $('#leave_assign_modify_success').html(data).delay(5000).fadeOut(); 
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				
			})
});
</script>

</head>
<body>

 <!-- <div id="qrySuccess"> -->
 <div id="leave_assign_modify_success">
 
<table style="width:62%">
<tr>
<td>LEAVE TYPES</td>
<td>OPENING BALANCE</td>
<td>AVAILABLE BALANCE</td>
<!-- <td>OPENING PL</td>
<td>AVAILABLE PL</td>
<td>OPENING SL</td>
<td>AVAILABLE SL</td>
<td>OPENING CL</td>
<td>AVAILABLE CL</td>
<td>OPENING ADVANCE PL</td>
<td>AVAILABLE ADVANCE PL</td>
<td>OPENING ADVANCE SL</td>
<td>AVAILABLE ADVANCE SL</td>
<td>OPENING COMPOFF</td>
<td>AVAILABLE COMPOFF</td> -->
<td>NEW BALANCE</td>
</tr>



<%
/* String msg="";


msg="success";
out.println(msg); */

String emp_id=request.getParameter("empid_modify").trim().toUpperCase();
System.out.println("empid in jsp...."+emp_id);



LeaveConfigAdmin lcaObj=new LeaveConfigAdmin();

ArrayList<String> list=lcaObj.input_modification_to_employee(emp_id);
if (list.size() > 0) {
for(int i=0;i<list.size();i++){
	String list_value=list.get(i).toString();
		String list_ArrValue[]=list_value.split("\\^");
	
		String opening_pl = list_ArrValue[0];
		String available_pl = list_ArrValue[1];
		String opening_sl = list_ArrValue[2];
		String available_sl = list_ArrValue[3];
		String opening_cl = list_ArrValue[4];
		String available_cl = list_ArrValue[5];
		String opening_adv_pl = list_ArrValue[6];
		String available_adv_pl = list_ArrValue[7];
		String opening_adv_sl = list_ArrValue[8];
		String available_adv_sl = list_ArrValue[9];
	    String opening_compoff = list_ArrValue[10]; 
	    String available_compoff = list_ArrValue[11];  

%>


<tr>
<td><label>Personal Leave</label></td>
<td><input type="text"  name="pl" value="<%=opening_pl %>" id="opening_pl" disabled="true" style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
<td><input type="text"  name="pl" value="<%=available_pl %>" id="available_pl" disabled="true" style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
<td><input type="text"  name="pl" value="" id="pl_new"  style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>

<tr>
<td><label>Sick Leave</label></td>
<td><input type="text" name="sl" value="<%=opening_sl %>" id="opening_sl" disabled="true" style="background-color: white;color:black"  onkeypress="return isSL(event)" /></td>
<td><input type="text" name="sl" value="<%=available_sl %>" id="available_sl" disabled="true" style="background-color: white;color:black"  onkeypress="return isSL(event)" /></td>
<td><input type="text"  name="pl" value="" id="sl_new"  style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>

<tr>
<td><label>Casual Leave</label></td>
<td><input type="text" class="" name="cl" value="<%=opening_cl %>" id="opening_cl" disabled="true" style="background-color: white;color:black"  onkeypress="return isCL(event)"  maxlength="15" /></td>
<td><input type="text" class="" name="cl" value="<%=available_cl %>" id="available_cl" disabled="true" style="background-color: white;color:black"  onkeypress="return isCL(event)"  maxlength="15" /></td>
<td><input type="text"  name="pl" value="" id="cl_new"  style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>

<tr>
<td><label>Advance PL</label></td>
<td><input type="text" name="advpl" value="<%=opening_adv_pl %>" id="opening_adv_pl" disabled="true" style="background-color: white;color:black"  onkeypress="return isAdvancePL(event)"  maxlength="15" /></td>
<td><input type="text" name="advpl" value="<%=available_adv_pl %>" id="available_adv_pl" disabled="true" style="background-color: white;color:black"  onkeypress="return isAdvancePL(event)"  maxlength="15" /></td>
<td><input type="text"  name="pl" value="" id="advpl_new"  style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>

<tr>
<td><label>Advance SL</label></td>
<td><input type="text" name="advsl" value="<%=opening_adv_sl %>" id="opening_adv_sl" disabled="true" style="background-color: white;color:black" onkeypress="return isAdvanceSL(event)" /></td>
<td><input type="text" name="advsl" value="<%=available_adv_sl %>" id="available_adv_sl" disabled="true" style="background-color: white;color:black" onkeypress="return isAdvanceSL(event)" /></td>
<td><input type="text"  name="pl" value="" id="advsl_new"  style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr>


<tr>
<td><label>Compensatory OFF</label></td>
<td><input type="text" name="compoff" value="<%=opening_compoff %>" id="opening_compoff" disabled="true" style="background-color: white;color:black" onkeypress="return isCompOff(event)" /></td>
<td><input type="text" name="compoff" value="<%=available_compoff %>" id="available_compoff" disabled="true" style="background-color: white;color:black" onkeypress="return isCompOff(event)" /></td>
<td><input type="text"  name="pl" value="" id="compoff_new" style="background-color: white;color:black" onkeypress="return isPL(event)" /></td>
</tr> 


<input type="hidden" value="<%=emp_id %> " id="emp_id"/>


<tr>

<!-- <td>&nbsp;</td>
<td ><input type="button"  id="edit" value="Edit"  onclick="return validate()" style="width:75px;float:right;"/> </td> -->
<td colspan="4"> <center><input type="button" id="generateleaveformodify_save" value="Save" style="width:75px;" /> </center></td>
<!-- <td>&nbsp;</td> -->


</tr>

<%
	}
	} 

%>

</table>
<!-- </div>
 -->
<!-- <div id="leave_assign">
</div>  -->

</div>
</body>
</html>