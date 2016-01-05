<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List"%>
 <%@ page import="com.ess.common.eseparation.Eseparation_Basic_Info"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="datejs/jquery-ui.css"> -->
<link rel="stylesheet" href="cartian/jquery-ui.css">
<style>

/* .inlineTab.table {
            display: inline-block;
            width: 100px;
            font-size:10px;
            border: 0px;
        } */
   .inlineTab{
    border-spacing: 0px;  
    border-style:none; 
     border: 0px;
   }
  .inlineTab tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  .inlineTab td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
}

table {
    border-collapse: collapse;
}
td {
    padding: 0;
}
table, th, td {
border: 1px solid rgb(248, 242, 242);
}
</style>

</head>

<script>
$(function() {
	$("#withdraw").click(function() {
		var empid = $('#emp_id').val();
		var dataString = "&empid=" + empid;
		if (confirm('Are you sure you want to withdraw this?')) {
		$.ajax({
			url : 'postLoginJsp/e-separation_ELC/withdrawstatus.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				
				$("#qryload").html(data);
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Please try Again");

			}
		});
			
		}
		})
});

</script>



<body>
<div id="qryload">
<%
Eseparation_Basic_Info info_basic=new Eseparation_Basic_Info();
List<String> reg_man_process=info_basic.e_separation_withdraw();
	if (reg_man_process.size() > 0) {
		for (int j = 0; j < reg_man_process.size(); j++) {
			String reg_data = reg_man_process.get(j).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String emp_id=reg_arr[0];
			String reason_resign = reg_arr[1];
			String detailed_resign = reg_arr[2];
			String relieving_date = reg_arr[3];
			String anp = reg_arr[4];
			String gnp = reg_arr[5];
			String rm_rel_date = reg_arr[6];
			String hr_rel_date = reg_arr[7];
%> 
  <h3 style="background-color: #C0DEF5;">Separation Details:Withdraw</h3>
  
 <table  class="inlineTab">
 <tr>
 <td colspan="3" style="padding-left:5em;"><u>Reason Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>

 <td colspan="2" style="padding-left:5em;"><u>Approved Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
 
 </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Personnel Number</td>
  <td colspan="2" style="padding-left:5em;"><input type="text" id="emp_id" style="background-color:#C0DEF5;height:26px;" value="<%=emp_id%>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Physical Leaving Date (RM)</td>
  <td style="padding-left:5em;"><input id="relieving_rm" type="text" style="background-color:#C0DEF5;height:26px;" readonly="readonly" value="<%=rm_rel_date %>"/> </td>
 </tr>
  
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Reason for Action </td>
  <td colspan="2" style="padding-left:5em;"><input id="reason" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=reason_resign %>" readonly="readonly"/> </td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(HR) </td>
  <td style="padding-left:5em;"><input id="r_date" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=hr_rel_date %> " readonly="readonly" /> </td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Detailed Reason </td>
  <td colspan="2" style="padding-left:5em;"><input id="detailed" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=detailed_resign %> " readonly="readonly"/> </td>
  <td></td>
  <td></td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(R) </td>
  <td colspan="2" style="padding-left:5em;"><input id="relieving" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=relieving_date %> " readonly="readonly"/></td>
  <td></td>
  <td></td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Withdraw Reason </td>
  <td style="padding-left:5em;"><select name="widrwatype" id="widrwatype" >
							<option  value="Resignation Withdraw">Resignation Withdraw</option>
					</select></td>
  <td></td>
  <td></td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;">Actual Notice Period </td>
  <td colspan="2" style="padding-left:5em;"><input id="anp" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=anp %> " readonly="readonly"/></td>
  <td></td>
  <td></td>
  </tr>
  <tr>
  <td style="padding-left:5em;">Given Notice Period </td>
  <td colspan="2" style="padding-left:5em;"><input id="anp" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=gnp %> " readonly="readonly"/></td>
  <td></td>
  <td></td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;" colspan="4"> <input id="withdraw" type="submit" value="withdraw" /> </td>

  </tr>
 <%
								}
								} else {
							%>
							<tr>
								<td colspan="16">No Records Available</td>
							</tr>

							<%
								}
							%> 

  </table>
  </div>
</body>
</html>