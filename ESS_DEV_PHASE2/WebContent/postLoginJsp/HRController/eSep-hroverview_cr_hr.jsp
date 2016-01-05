<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ess.common.eseparation.E_separation_HR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- <script src="date/jquery-ui.js"></script>
<script src="investmentjs/jquery-1.10.2.js"></script>
 -->
 
<style>
#hr_table tr{
 border-spacing: 0px;  
    border-style:none; 
    border:0px;
}
#hr_table td{
 border-spacing: 0px;  
    border-style:none; 
    border:0px;
}
</style>

<script>
$(function() {
	$('#submit').click(function() {
		
				var empid = $('#empid').val();
				var reason_action = $('#reason_action').val();
				var dreason = $('#dreason').val();
				var rel_date = $('#rel_date').val();
				var actual_np = $('#actual_np').val();
				var given_np = $('#given_np').val();
				var pre_sep_date = $('#pre_sep_date').val();
				var emp_rm= $('#emp_rm').val();
				var emp_mailid= $('#emp_mailid').val();
				
				if(reason_action=="none selected" || reason_action=="")
				{
					alert("Please select Reason action!");
					window.setTimeout(function ()
						    {
					document.getElementById('reason_action').focus();
						    }, 0);
					
					return false;
				}
				if(dreason=="none selected" || dreason=="")
				{
					alert("Please select Detailed reason !");
					window.setTimeout(function ()
						    {
					document.getElementById('dreason').focus();
						    }, 0);
					return false;
				}
				if(rel_date==""|| rel_date==null )
				{
					alert("Please select relieving date !");
					window.setTimeout(function ()
						    {
					document.getElementById('rel_date').focus();
						    }, 0);
					document.getElementById('rel_date').value="";
					return false;
				}
				if(pre_sep_date==""|| pre_sep_date==null )
				{
					alert("Please select pre separation date !");
					window.setTimeout(function ()
						    {
					document.getElementById('pre_sep_date').focus();
						    }, 0);
					document.getElementById('pre_sep_date').value="";
					return false;
				}
					
				else{
				var dataString = "&empid=" + empid + "&reason_action=" + reason_action
							+ "&dreason=" + dreason + "&rel_date=" + rel_date + "&actual_np=" 
							+ actual_np + "&given_np=" + given_np+ "&pre_sep_date=" + pre_sep_date+ "&emp_rm=" +emp_rm + "&emp_mailid=" +emp_mailid ;
					//alert(dataString);
			
					$.ajax({
						url : 'postLoginJsp/HRController/eSep-hroverview_cr_insert.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							/*  $('#lrmain_res').html(data).delay(5000).fadeOut();  */
							 $('#lrmain_res').html(data); 
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("internal problem");
						}
					});
				}
				})
	});
</script>

 <script>
	function backhroverview(id) 
		{
			var dataString = "&sequence_id=" + id ;
				$.ajax({
						url : 'postLoginJsp/HRController/eSep-hroverview_hr.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#qrySuccessback').html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
			}
</script>


<body>
<div id="qrySuccessback">
<div id="lrmain">
<div style="background-color: #98c3e2; margin-top: 10px; margin-left: -3.5%; padding-left: 15px">eSeparation-HR Overview</div>
	<hr>
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -2.5%; padding-left: 15px;font-size:15px;"><b>Separation Request: New</b></div>
		<!-- <input type="button" value="Submit" id="continue"  style="background-color: #98c3e2; margin-top: 10px; margin-left: -2.5%; padding-left: 15px;width:200px"/> -->
		<button type="button"  id="submit"  style="background-color: #98c3e2; margin-top: 0px; margin-left: -2.5%; padding-left: 15px;width:200px">
		<span class="glyphicon glyphicon-saved" style="color: green;  padding-left: 0px;"></span>&nbsp;&nbsp;Submit </button>
		
		<input type="button" value="Back to Search" id="backhrcreatereq" onclick="backhroverview(this.id)" style="background-color: #98c3e2; margin-top: 0px; margin-left: -0.8%; padding-left: 15px;width:300px"/>
	<br>
								
<table style="width:45%" id="hr_table">					
<caption style="background-color: #98c3e2; margin-top: 10px; margin-left: -0.2%; padding-left: 0px;"><b>Separation Details</b></caption>					
							 
<%
	 System.out.println("Initial page e-separation HR  page for hr overview");  
	 E_separation_HR hr_module=new E_separation_HR(); 
    	List<String> hr_process=hr_module.getempinfobyHR();
	    if (hr_process.size() > 0) {
		    for (int i = 0; i < hr_process.size(); i++) {
			String reg_data = hr_process.get(i).toString();
			String reg_arr[] = reg_data.split("\\^");
			
			String emp_id=reg_arr[0];
			String emp_fname = reg_arr[1];
			String emp_lname = reg_arr[2];
			String emp_rm=reg_arr[3];
			String emp_mailid=reg_arr[4];
			
%> 

<tr><td><b>Reason Details</b></td><td>&nbsp;</td></tr>
<tr><td><hr></td><td><hr></td></tr>
							<tr align="center">
								<td style="width:200px;"><span style="color:red">*</span>Personal Number </td> 
								<td><input type="text" id="empid" value="<%=emp_id%>" readonly="readonly" style="width:304px;height:27px;margin-top: 33px;" /><br><u><a href="#" style="width:304px;height:27px;">(<%=emp_fname %>&nbsp;<%=emp_lname %>)</a></u></td>
							</tr>
							
							<tr align="center">
								<td><span style="color:red">*</span>Reason For Action</td>
								<td><!-- <input type="text" id="reason_action" value="" /> -->
								<select name="reason_action" style="width:304px; height:27px;"  id="reason_action">
								<option value="none selected">Select</option>
								<option value="Resignation">Resignation</option>
								</select></td>
							</tr>
								
							<tr align="center">
								<td><span style="color:red">*</span>Detailed Reason </td> 
								<td><!-- <input type="text" id="dreason" value="" /> -->
								<select  name="dreason" style="width:304px; height:27px;" id="dreason">
								<option value="none selected">Select</option>
								<option value="Personal">Personal</option>
								</select>
								</td>
							</tr>
								
							<tr align="center">
								<td><span style="color:red">*</span>Relieving Date(R)</td> 
								<td><input type="date" id="rel_date" value="" style="width:304px; height:27px;"/></td>
							</tr>
								
							<tr align="center">
								<td>Actual Notice Period</td>
								<td><input type="text" id="actual_np" value="30" style="width:304px; height:27px;" readonly="readonly"/></td>
							</tr>
							
							<tr align="center">
								<td>Given Notice Period</td>
								<td><input type="text" id="given_np" value="" onkeypress="return iseffective(event)" style="width:304px; height:27px;"/></td>
							</tr>
							
							<tr align="center">
								<td><span style="color:red">*</span>Pre Separation Date</td>
								<td><input type="date" id="pre_sep_date" value="" style="width:304px; height:27px;"/></td>
							</tr>
							<input type="hidden" value="<%=emp_rm %>" id="emp_rm"/>
							<input type="hidden" value="<%=emp_mailid %>" id="emp_mailid"/>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="14">No Records Available</td>
							</tr>

							<%
								}
							%>
						</table>
						
</div> <!-- end div for create request  --> 

<div id="lrmain_res"></div>  <!-- end div for submit response  --> 

</div> <!-- end div for back to search button --> 

<br>&nbsp;<br>

</body>
</html>

