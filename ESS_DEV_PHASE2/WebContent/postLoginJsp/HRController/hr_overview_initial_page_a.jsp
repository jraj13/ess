<%@ page errorPage="errorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.eseparation.E_sep_HR_Overview"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
 
 <style type="text/css">
   
/* #inlineTab {
            display: inline-block;
           width: 100px;
            font-size:10px;
            border: 0px;
        } */
  #table_esep_initial tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #table_esep_initial td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
}
 


  </style>
  
<style>
.comments_note{
align:center;
background-color: #4682B4";
}


</style>
<script>

$("#comments_note").hide();
</script>

<script>
function display(){
	$("#comments_note").show();
	$("#comments_note").focus();
}

</script>


<script>
				function editnew_Hr(id) 
				{
					//alert("call");
					var dataString = "&SEQUENCE_NO=" + id ;
				//	alert(dataString);
					$.ajax({

						url : 'postLoginJsp/HRController/e_sep_hr_overview_coresspandance_letter_initialpage.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#qryload').html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}
				
</script>

</head>
<body>



<table align="center" width="1000px" style="margin-left:0.5%;" id="table_esep_initial">
		<tr style="background-color: #40E0D0">

<td>Edit</td>
 <td style="padding-left:5em;">Resignation No.</td> 
<td style="padding-left:5em;">Employee ID</td>
<td style="padding-left:5em;">Creation Date</td>
<td style="padding-left:5em;">Relieving  Date</td>

</tr>


 <%
 System.out.println("Initial page e-separation HR  page"); 

 E_sep_HR_Overview hr_overview=new E_sep_HR_Overview(); 
 List<String> reg_hr_initial=hr_overview.hr_overview_esep();

	if (reg_hr_initial.size() > 0) {
		for (int i = 0; i < reg_hr_initial.size(); i++) {
			String reg_data = reg_hr_initial.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String emp_id=reg_arr[0];
			String seq_id=reg_arr[1];
			String creation_date = reg_arr[2];
			String relev_date = reg_arr[3];
%> 

 <tr align="center">
 <td style="background-color: #4682B4">
  
          <button type="button" id="<%=seq_id %>" class="req_edit"  onclick="editnew_Hr(id)" class="glyphicon glyphicon-pencil" > 
          <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
 
 </td>
 	
 	 <td class="SEQUENCE_NO" ><%=seq_id %></td> 
 	<td class="emp_id" ><%=emp_id %></td>
	<td class="creation_date"><%=creation_date%></td>
	<td class="rileaving_date" ><%=relev_date%></td>
	
</tr> 
 <%
	}
	} else {

%> <tr>
	<td colspan="8">No Records</td>
</tr>

 <%
	}
%> 
</table>
<br/>
	
	<div id="qryload" >
	</div>

</body>
</html>
