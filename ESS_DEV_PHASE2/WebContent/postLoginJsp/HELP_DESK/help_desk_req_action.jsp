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
				function checking_status_hd(sid) {

					alert(sid);

					var url ='postLoginJsp/HELP_DESK/help_desk_fetch_per_emp.jsp';
						var dataString = "&sno=" + sid;

					loadPage(url, dataString);

					return true;
				}
				
				function loadPage(url, dataString) {
					$('#content').html('<img src="images/loading.gif">');
							$.ajax({
								url : url,
								type : 'POST',
								data : dataString,
								datatype : 'json',
								success : function(data) {
									$('#content').html(data)

								},
								error : function(jqXHR, textStatus, errorThrown) {

								}
							});

						}
</script>

</head>
<body>

<%  
String help_desk_type=request.getParameter("help_desk_type").trim();

%>

<table align="center" width="1000px" style="margin-left:0.5%;" id="table_esep_initial">
		<tr style="background-color: #40E0D0">

		<!-- 	<td>Edit</td> -->
			<td>Help Desk Type</td>
			<td>Help Desk Query</td>
			<td>Attachment</td>
			<td>Mail Id</td>
			<td>Status</td>
			<td>Query Date</td>

		</tr>


 <%
 System.out.println("Initial page help desk"); 

 List<Object> reg_hr_process=HelpDeskAction.fetch_Perticular_HDTypeDetails(help_desk_type);

	if (reg_hr_process.size() > 0) {
		for (int i = 0; i < reg_hr_process.size(); i++) {
			String reg_data = reg_hr_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String sno=reg_arr[0];
			String helpdeskcat = reg_arr[1];
		 	String helpdeskqry = reg_arr[2];
			String attachment = reg_arr[3];
			String empid = reg_arr[4];
			String mailid = reg_arr[5];
			String status = reg_arr[6];
			String qrydate=reg_arr[7];
			if(qrydate==null){
				qrydate="-";
			}
			String remarks=reg_arr[8];
			
%> 


 <tr align="left">
<%--  <td style="background-color: #4682B4">
          <button type="button" id="<%=sno %>" class="req_edit"  onclick="editnew_Hr(id)" class="glyphicon glyphicon-pencil" > 
          <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
 </td> --%>
 	
 	<td class="helpdeskcat" ><%=helpdeskcat %></td>
	<td style="text-indent: 3em;  color:blue;cursor:pointer; " id="<%=sno%>"  onclick="checking_status_hd(id);" ><u>click here</u> </td>
	<td class="actual_notice" ><%=attachment%></td>
	<td class="given_notice" ><%=mailid%></td>
	<td class="emp_note" ><%=status%></td>
	<td class="rm_note"><%=qrydate%></td> 

</tr> 

 <%
	}
	} else {

%>
 <tr>
	<td colspan="6">No Records</td>
</tr>

 <%
	}
%> 
</table>
<br/>
	
	<!-- <div id="qryload" >
	</div> -->

</body>
</html>
