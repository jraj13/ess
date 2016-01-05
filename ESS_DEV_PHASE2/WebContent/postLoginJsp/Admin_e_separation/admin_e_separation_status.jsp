<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.ess.common.eseparation.E_separation_ADMIN"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>

$(function() {
	$('#approveesepByAdmin').click(
			function() {
				
				var empid = $('#empid').val();
				
				var r_date = $('#r_date').val();
				var gnp = $('#gnp').val();
				var admin_note = $('#admin_note').val();
				var rm_name=$('#rm_name').val();
				var status="Accepted";
				
				
				
				if(gnp==" ")
				{
				alert("Please enter given Notice Period");
				return false;
				}
			else if(r_date==" ")
				{
				alert("Please Select Reliving Date");
					return false;
				}
			else if(admin_note==""){
				alert("Please Enter Comments");
				return false;
			}
				
				
				if (confirm('Are you sure you want to Accept Resignation ?')) {
				
					var dataString = "&empid=" + empid + "&r_date=" + r_date +  "&gnp=" + gnp+ "&admin_note=" + admin_note+"&status="+status+"&rm_name="+rm_name;
					
					$.ajax({

						url : 'postLoginJsp/Admin_e_separation/e_sep_accept.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#lrmain').html(data).delay(5000).fadeOut();
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}
				})
	});
</script>

<script>

$(function() {
	$('#rejectesepByAdmin').click(
			function() {
				
				var empid = $('#empid').val();
				//var r_date = $('#r_date').val();
				//var gnp = $('#gnp').val();
				
				var admin_note = $('#admin_note').val();
				
				
			if(admin_note==""){
				alert("Please Enter Comments");
				return false;
			}
				
				if (confirm('Are you sure you want to Send a Mail ?')) {
					var dataString = "&empid=" + empid + "&admin_note=" + admin_note;
					
					$.ajax({

						url : 'postLoginJsp/Admin_e_separation/comments_mail.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#lrmain').html(data).delay(5000).fadeOut();
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}
				})
	});
</script>
<script>
$("#admin_note").on('keydown', function(event) {
    var currentString = $("#admin_note").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >999 )  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script>
</head>
<body>
<div id="lrmain">
<div style="background-color: skyblue; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
		<b>Employee Details</b>
</div>
<table>
							
							<%
							System.out.println("admin_e_separation_status.jsp");  
								ArrayList<String> esepObj = E_separation_ADMIN.esepEmpSearch();
								if (esepObj.size() > 0) {
									for (int i = 0; i < esepObj.size(); i++) {
										String req = esepObj.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										 String empid = reqarr[0];
										 String reason = reqarr[1];
										 String detailed = reqarr[2];
										 String creation_date = reqarr[3];
									     String reliving_date = reqarr[4];
									     
										 String anp = reqarr[5];
										 String gnp = reqarr[6];
										 String rm_name = reqarr[7];
										 String emp_note = reqarr[8];
										 
										 String rm_note = reqarr[9];
										 String hr_note = reqarr[10];
										
										
							%>
								
							<tr>
								<td><label>EMPLOYEE ID </label></td> 
								<td><input type="text" id="empid" value="<%=empid%>" readonly="readonly"/></td>
								</tr>
								
								<tr>
								<td><label>REASON FOR RESIGN</label></td>
								<td><input type="text" id="r_resign" value="<%=reason%>" readonly="readonly"/></td>
								</tr>
								
								<tr>
								<td><label>DETAIL REASON FOR RESIGN</label> </td> 
								<td><input type="text" id="dr_resign" value="<%=detailed%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>CREATION DATE</label> </td> 
								<td><input type="text" id="c_date" value="<%=creation_date%>" readonly="readonly"/></td>
								</tr>
								<tr>
									<td><label>RELEAVING DATE</label> </td>
								<td><input type="text" id="r_date" value="<%=reliving_date%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>ACTUAL NOTICE PERIOD </label></td>
								
								<td><input type="text" id="anp" value="<%=anp%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>GIVING NOTICE PERIOD</label> </td>
								<td><input type="text" id="gnp" value="<%=gnp%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>REPORTING MANAGER NAME</label></td>
								<td><input type="text" id="rm_name" value="<%=rm_name%>" readonly="readonly" /></td>
								</tr>
								<tr>
								<td><label>EMPLOYEE NOTE</label> </td>
								<td><input type="text" id="emp_note" value="<%=emp_note%>" readonly="readonly"/></td>
								</tr>
								
								<tr>
								<td><label>REPORTING MANAGER COMMENTS </label></td>
								<td><input type="text" id="rm_note" value="<%=rm_note%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>HR COMMENTS </label></td>
								<td><input type="text" id="hr_note" value="<%=hr_note%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>ADMIN COMMENTS<span style ="color:red">*</span> </label></td>
								<td><textarea id="admin_note" rows=" " cols=" "></textarea>  </td>
								</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="20">No Records Available</td>
							</tr>

							<%
								}
							%>
						</table>
<br/>

<input id="approveesepByAdmin" type="button" class="btn btn-success" value="APPROVE"/>
 <input id="rejectesepByAdmin" type="button" class="btn btn-warning" value="Send Mail"/>
<!-- <button type="button"   ck="editFunction1(id);"> 
         <span class="glyphicon glyphicon-pencil" ></span> </button> -->

</div>
</body>
</html>