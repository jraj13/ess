<%@ page errorPage="errorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.eseparation.E_separation_HR"%>
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

<!-- <script>
$('.req_edit').on('click', function(event){
	
	//alert("req_edit");
	
	var emp_id=($(event.target).closest('tr').find('.emp_id').text());
    var creation_date=($(event.target).closest('tr').find('.creation_date').text());
    var rileaving_date=($(event.target).closest('tr').find('.rileaving_date').text());
    var actual_notice=($(event.target).closest('tr').find('.actual_notice').text());
    var given_notice=($(event.target).closest('tr').find('.given_notice').text());
    var emp_note=($(event.target).closest('tr').find('.emp_note').text());
    var rm_note=($(event.target).closest('tr').find('.rm_note').text());
    var rm_note=($(event.target).closest('tr').find('.SEQUENCE_NO').text());
    
    if(given_notice=="")
    	{
    	alert("please enter given Notice Period");
    	return false;
    	}
    else if(isNaN(given_notice))
    	{
    	alert("please enter given Notice Period");
    	return false;
    	}

   /*  if (confirm('Are you sure you want to Accept Resignation ?')) {
		status="Inprocess"; */
		
		var dataString = "&emp_id=" + emp_id +"&creation_date=" + creation_date + "&rileaving_date=" + rileaving_date 
		+"&actual_notice="+actual_notice+"&given_notice="+given_notice+"&emp_note="+emp_note+"&rm_note="+rm_note+"&status="+status
		+"&SEQUENCE_NO="+SEQUENCE_NO;
		
		alert(dataString);
		$.ajax({
			url : 'postLoginJsp/HRController/usermanual_hr.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				/* $('#qryload').html(data).delay(2000).fadeOut(); */
				$('#qryload').html(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Sorry Try Again in jsp ajax");
			}
		
		});
			/* } */
    
})

</script>
 -->

<script>
$("#comments_note").on('keydown', function(event) {
    var currentString = $("#comments_note").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >999 )  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script> 

<script>
				function editnew_Hr(id) 
				{
					//alert("call");
					var dataString = "&SEQUENCE_NO=" + id ;
				//	alert(dataString);
					$.ajax({

						url : 'postLoginJsp/HRController/usermanual_hr.jsp',
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
<!-- <td>Accept</td> -->
<!-- <td>Reject</td> -->
 <td>Resignation No.</td> 
<td>Employee ID</td>
<td>Creation Date</td>
<td>Relieving  Date</td>
<td>Actual NP</td>
<td>Given NP</td>
<td>Emp Comments</td>
<td>RM Comments</td>



</tr>


 <%
 System.out.println("Initial page e-separation HR  page"); 

 E_separation_HR hr_module=new E_separation_HR(); 
 List<String> reg_hr_process=hr_module.getstatus_info();

	if (reg_hr_process.size() > 0) {
		for (int i = 0; i < reg_hr_process.size(); i++) {
			String reg_data = reg_hr_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String emp_id=reg_arr[0];
			String creation_date = reg_arr[1];
			String relev_date = reg_arr[2];
			String actual_notice = reg_arr[3];
			String given_notice = reg_arr[4];
			String emp_note = reg_arr[5];
			String rm_note = reg_arr[6];
			String SEQUENCE_NO=reg_arr[7];
			
%> 

 <tr align="center">
 <td style="background-color: #4682B4">
  <!-- <button type="button" id="delete" class="reg_approve" class="glyphicon glyphicon-ok" > 
          <span style="color:green" class="glyphicon glyphicon-ok"></span> </button> -->
          <button type="button" id="<%=SEQUENCE_NO %>" class="req_edit"  onclick="editnew_Hr(id)" class="glyphicon glyphicon-pencil" > 
          <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
 
 </td>
 	<!-- <td style="background-color: #4682B4">
 	
 	 <button type="button" id="delete" class="reg_reject" class="glyphicon glyphicon-remove" > 
          <span style="color:red" class="glyphicon glyphicon-remove"></span> </button>
 	</td> -->
 	 <td class="SEQUENCE_NO" ><%=SEQUENCE_NO %></td> 
 	<td class="emp_id" ><%=emp_id %></td>
	<td class="creation_date"><%=creation_date%></td>
	<td class="rileaving_date" ><%=relev_date%></td>
	<td class="actual_notice" ><%=actual_notice%></td>
	<td class="given_notice" ><%=given_notice%></td>
	<td class="emp_note" ><%=emp_note%></td>
	<td class="rm_note"><%=rm_note%></td>
	
	
</tr> 
 <%
	}
	} else {

%> <tr>
	<td colspan="14">No Records</td>
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
