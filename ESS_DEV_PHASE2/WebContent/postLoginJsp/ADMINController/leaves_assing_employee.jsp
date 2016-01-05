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




<%
String msg="Leave assigned successfully";

out.println(msg);

/* LeaveConfigAdmin lca2=new LeaveConfigAdmin();
lca2.update_Leaves_Config(pl, sl, cl, advpl, advsl, compoOFF); */

%>


</body>
</html>