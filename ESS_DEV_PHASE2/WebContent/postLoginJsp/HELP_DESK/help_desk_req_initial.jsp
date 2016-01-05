<%@ page errorPage="errorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.action.HelpDeskAction"%>
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
					var dataString = "&help_desk_type=" + id ;
				//	alert(dataString);
					$.ajax({

						url : 'postLoginJsp/HELP_DESK/help_desk_req_action.jsp',
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
<div id="qryload" >
<%  
 String count_incometax =HelpDeskAction.types_of_incometax_ticket();
System.out.println("income tax count.."+count_incometax);

String count_empinfo =HelpDeskAction.types_of_empinfo_ticket();
System.out.println("count_empinfo count.."+count_empinfo);

String count_payslip =HelpDeskAction.types_of_payslip_ticket();
System.out.println("count_payslip count.."+count_payslip);

String count_atndleave =HelpDeskAction.types_of_atndleave_ticket();
System.out.println("count_atndleave count.."+count_atndleave);
String count_travelmgmt =HelpDeskAction.types_of_travelmgmt_ticket();
System.out.println("count_travelmgmt  count.."+count_travelmgmt);
String count_fnfsettlement =HelpDeskAction.types_of_fnfsettlement_ticket();
System.out.println("count_fnfsettlement count.."+count_fnfsettlement);
String count_others =HelpDeskAction.types_of_others_ticket();
System.out.println("count_others count.."+count_others);

%>


<table align="center" width="500px" style="margin-left:0.5%;" id="table_esep_initial">
		<tr style="background-color: #40E0D0">

<td>Select</td> 
<td>Help Desk Type</td>
<td>No. Of Request</td>




</tr>


 <%
 System.out.println("Initial page help desk"); 

// HelpDeskAction hr_module=new HelpDeskAction(); 
 List<Object> reg_hr_process=HelpDeskAction.fetchHDTypeDetails();

	if (reg_hr_process.size() > 0) {
		for (int i = 0; i < reg_hr_process.size(); i++) {
			String reg_data = reg_hr_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
		//	String sno=reg_arr[0];
			String helpdeskcat = reg_arr[0];
			String count = reg_arr[1];
			
		/* 	String helpdeskqry = reg_arr[2];
			String attachment = reg_arr[3];
			String empid = reg_arr[4];
			String mailid = reg_arr[5];
			String status = reg_arr[6];
			String qrydate=reg_arr[7];
			String remarks=reg_arr[8];
			
			String count="";
			if(helpdeskcat.equalsIgnoreCase("Income Tax")){
				count=count_incometax;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("Employee Information")){
				count=count_empinfo;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("Payslip")){
				count=count_payslip;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("Attendance/Leave")){
				count=count_atndleave;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("Travel Management")){
				count=count_travelmgmt;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("F and F Settlement")){
				count=count_fnfsettlement;
				System.out.println(helpdeskcat);
			}
			if(helpdeskcat.equalsIgnoreCase("Others")){
				count=count_others;
				System.out.println(helpdeskcat);
			} */
			
		
%> 


 <tr align="center">
 <td style="background-color: #4682B4">
 
          <button type="button" id="<%=helpdeskcat %>" class="req_edit"  onclick="editnew_Hr(id)" class="glyphicon glyphicon-pencil" > 
          <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
 
 </td>
 	<!-- <td style="background-color: #4682B4">
 	
 	 <button type="button" id="delete" class="reg_reject" class="glyphicon glyphicon-remove" > 
          <span style="color:red" class="glyphicon glyphicon-remove"></span> </button>
 	</td> -->
 	<%--  <td class="sno" ><%=sno %></td>  --%>
 	<td class="helpdeskcat" ><%=helpdeskcat %></td>
	<td class="creation_date"><%=count%></td>
<%-- 	<td class="rileaving_date" ><%=relev_date%></td>
	<td class="actual_notice" ><%=actual_notice%></td>
	<td class="given_notice" ><%=given_notice%></td>
	<td class="emp_note" ><%=emp_note%></td>
	<td class="rm_note"><%=rm_note%></td> --%>
	
	
</tr> 
 <%
	}
	} else {

%> <tr>
	<td colspan="3">No Records</td>
</tr>

 <%
	}
%> 
</table>
<br/>
	
	
	</div>

</body>
</html>
