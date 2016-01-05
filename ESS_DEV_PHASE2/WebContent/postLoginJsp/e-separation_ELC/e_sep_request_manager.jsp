<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ess.common.eseparation.E_separation_manager_level" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

/*  #oldtable {
            display: inline-block;
           width: 100px;
            font-size:10px;
            border: 0px;
        }
  #oldtable tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #oldtable td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
}
#inlineTab {
            display: inline-block;
           width: 100px;
            font-size:10px;
            border: 0px;
        }
  #inlineTab tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #inlineTab td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
} */

.inlineTab_esep_mgr  th {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
 
.inlineTab_esep_mgr  tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
 
 .inlineTab_esep_mgr  td{
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}

</style>
<script>
				function editFun(id) 
				{
					var dataString = "&sequence_id=" + id ;
					$.ajax({

						url : 'postLoginJsp/e-separation_ELC/manager_view_specific.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#qrySuccess').html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}
				
</script>
</head>
<body>

<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 100%">
		<b>Separation Details</b>
</div>
<table class="inlineTab_esep_mgr" width="1000px" >
<tr style="background-color: #40E0D0">
<th>Edit</th>
<th>Employee ID</th>
<th>Sequence ID</th>
<th>Creation Date</th>
<th>Relieving Date</th>
<th>Actual Notice Period</th>
<th>Given Notice Period</th>

</tr>


<%
 System.out.println("manager_serach_based_on_emp.jsp");
 E_separation_manager_level reg_man=new E_separation_manager_level(); 
ArrayList<String> reg_man_process=reg_man.e_separation_manager();
	if (reg_man_process.size() > 0) {
		for (int i = 0; i < reg_man_process.size(); i++) {
			String reg_data = reg_man_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String emp_id=reg_arr[0];
			String seq_no = reg_arr[1];
			String creation_date = reg_arr[2];
			String reason_action = reg_arr[3];
			String detailed_reason = reg_arr[4];
			String rileaving_date = reg_arr[5];
			String actual_notice = reg_arr[6];
			String given_notice = reg_arr[7];
%> 
<tr align="center">
<td style="background-color: #4682B4"><button type="button"  id="<%=seq_no%>" onclick="editFun(id);"> 
         <span class="glyphicon glyphicon-pencil" ></span> </button> </td>
<td><%=emp_id %> </td>
<td><%=seq_no %> </td>
<td><%=creation_date %> </td>
<td><%=rileaving_date %> </td>
<td><%=actual_notice %> </td>
<td><%=given_notice %> </td>
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

<div id="qrySuccess">

</div>

</body>
</html>