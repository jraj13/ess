
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>


<title>Insert title here</title>
<script>
/* Leave Assing For Employee Individually */
$(function() {
	$('#generateleave').click(
			function() {
				
				var empid=$('#empid').val();
				var monthid=$('#monthid').val();
				if (empid == "" || empid=="none selected") {
					alert("Please select employee id ! ");
					return false;
				}
				if(monthid == "" || monthid=="none selected"){
					alert("Please select month !");
					return false;
				}
				
				else{
				  var dataString = '&empid=' + empid+ '&monthid=' +monthid;
				  alert(dataString);
		
				$.ajax({
					url :'postLoginJsp/ADMINController/generateleave_assignform.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
					/*  $('#lrmain').html(data).delay(5000).fadeOut();  */
				$('#lrmain').html(data); 
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			})
});

/* Leave Assing For All Employee At a Time */
$(function() {
	$('#autoassign').click(
			function() {
	 			var empid="dfd";
				if(empid=="none selected"){
					alert("Please enter employee id ! ");
					return false;
				}
				else{
				  var dataString = '&empid=' + empid;
				  alert(dataString); 
		
				$.ajax({
					url :'postLoginJsp/ADMINController/generateleave_assignforAll.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
				  $('#assignleavemodify').html(data).delay(5000).fadeOut();  
				/* $('#lrmain').html(data);  */
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
			 	} 

			})
});


$(function() {
	$('#generateleaveformodify').click(
			function() {
				
				var empid_modify=$('#empid_modify').val();
				var monthid=$('#monthid').val();
				if (empid_modify == "" || empid_modify==null) {
					alert("Please select employee id ! ");
					return false;
				}
				
				else{
				  var dataString = '&empid_modify=' + empid_modify;
				  alert(dataString);
		
				$.ajax({
					url :'postLoginJsp/ADMINController/generateleave_modify_assignform.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
					/*  $('#lrmain').html(data).delay(5000).fadeOut();  */
				$('#assignleavemodify').html(data); 
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			})
});

	</script>

</head>
<body>
	<h2>Leaves Assign For Employees</h2>
	<hr>
	<h3>
		<b>Leave Assign For All Employee</b>
	</h3>
	<br>
	<div id="1st_id" style="margin-top: -5px;">
		<button type="button" id="autoassign">Click Here</button>
		&nbsp;&nbsp;
		<!-- <div id="assignleaveforAll"></div> -->
	</div>


	<div id="2nd_id" style="margin-left: 30.3%; margin-top: -102px;">
		<h3>
			<b>Leave Assign For Employee Individually</b>
		</h3>
		<br> <label>EMPLOYEE ID:</label> <select id="empid" class="abc">
			<option value="none selected">Select Id</option>
			<% 
Connection con=null;
/* String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where STATUS='Active'  order by emp_id"; */
/* String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where emp_id not in(select EMP_ID from NCSS_ATTENDANCE_TIME_ACCOUNTS)"; */
String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where status='Active' and emp_id not in(select EMP_ID from NCSS_ATTENDANCE_TIME_ACCOUNTS)";
try
{
	 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String name = rs.getString("emp_id");
%>
			<option value="<%=name%>"><%=name%></option>
			<%
     }
}catch(Exception e)
{    out.print(e);
}
%>
		</select> &nbsp;&nbsp; <label>Month:</label> <select id="monthid" class="abc">
			<option value="none selected">Select Month</option>
			<option value="1">JAN</option>
			<option value="2">FEB</option>
			<option value="3">MAR</option>
			<option value="4">APR</option>
			<option value="5">MAY</option>
			<option value="6">JUN</option>
			<option value="7">JUL</option>
			<option value="8">AUG</option>
			<option value="9">SEP</option>
			<option value="10">OCT</option>
			<option value="11">NOV</option>
			<option value="12">DEC</option>
		</select> <br> <input type="button" id="generateleave"
			value="Mannual Assign" />

	</div>
	<br>
	<center>
		<div id="lrmain"></div>
	</center>
	<br>

	<div id="assignleaveforAll"></div>
	


	<div id="3rd_id" style="margin-left: 70.3%; margin-top: -202px;">
		<!-- <button type="button" id="autoassign2" >Assign Leave For Particular Employee</button> -->
		<h3>
			<b>For Modifying Leave Details</b>
		</h3>
		<br> <label>EMPLOYEE ID:</label> <input type="text"
			id="empid_modify" style="height: 28px; width: 150px;" /> <br> <input
			type="button" id="generateleaveformodify" value="Submit" /><br><br>
	</div><br><br>
<center><div id="assignleavemodify" ></div></center>

</body>
</html>
