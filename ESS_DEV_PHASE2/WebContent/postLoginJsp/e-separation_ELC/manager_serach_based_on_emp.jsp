
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.eseparation.E_separation_manager_level"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.comments_note{
align:center;
background-color: #4682B4";
}


</style>



<script>
$("#comments_text").on('keydown', function(event) {
    var currentString = $("#comments_text").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >999 )  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script>
<script>
function isernps(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("given_notice").value;
        var len = document.getElementById("given_notice").value.length; 
        var index = document.getElementById("given_notice").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 1) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >0) {
   return false;
   }
if(len>2)
	{
	return false;
	}

    } 
    return true; 
 } 

</script>
<script>
	
	$(function() {
		$('#reg_approve').click(
				function() {
					
					var emp_id = $('#emp_id').val();
					
					var seqid = $('#seqid').val();
					var given_notice = $('#given_notice').val();
					
					var comments_text = $('#comments_text').val();
    				var r_date=	 $('#r_date').val();

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
    else if(r_date=="")
	{
	alert("please select Relieving Date");
	return false;
	}
    else if(comments_text=="")
    	{
    	alert("please Enter Comments");
    	return false;
    	}
    
   if (confirm('Are you sure you want to Accept Resignation ?')) {
		var status="Inprocess";
		var man_accept = "&emp_id=" + emp_id +
							"&seqid=" + seqid + "&given_notice=" + given_notice +"&comments_text=" + comments_text+"&status="+status+"&r_date="+r_date;
		
		$.ajax({

			url : 'postLoginJsp/e-separation_ELC/manager_level_status_accept.jsp',
			type : 'POST',
			data : man_accept,
			datatype : 'json',
			success : function(data) {
				$('#qryload').html(data).delay(2000).fadeOut();
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Sorry Try Again");

			}
		});
		
		}
	})
});

</script>

<script>

	$(function() {
		$('#reg_reject').click(
				function() {
					
					var emp_id = $('#emp_id').val();
					
					var seqid = $('#seqid').val();
					var given_notice = $('#given_notice').val();
					
					var comments_text = $('#comments_text').val();
    				var r_date=	 $('#r_date').val();

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
    else if(r_date=="")
	{
	alert("please select Relieving Date");
	return false;
	}
    else if(comments_text=="")
    	{
    	alert("please Enter Comments");
    	return false;
    	}
    
   if (confirm('Are you sure you want to Reject Resignation ?')) {
		var status="Reject";
		var man_accept = "&emp_id=" + emp_id +
							"&seqid=" + seqid + "&given_notice=" + given_notice +"&comments_text=" + comments_text+"&status="+status+"&r_date="+r_date;
		
		$.ajax({

			url : 'postLoginJsp/e-separation_ELC/manager_level_status_accept.jsp',
			type : 'POST',
			data : man_accept,
			datatype : 'json',
			success : function(data) {
				$('#qryload').html(data).delay(2000).fadeOut();
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Sorry Try Again");

			}
		});
		
		}
	})
});
</script>


</head>
<body>
<div id="qryload">

<div style="background-color: skyblue; margin-top: 5px; margin-left: -5.5%; padding-left: 15px; width: 94%">
		<b>Employee Details</b>
</div>

<!-- <h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:12px">Employee Details</h2> -->
	<table><!--  align="center"> -->
		


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

 <tr>
								<td><label>EMPLOYEE ID </label></td> 
								<td><input type="text" id="emp_id" value="<%=emp_id%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>SEQENCE NUMBER</label></td>
								<td><input type="text" id="seqid" value="<%=seq_no%>" readonly="readonly"/></td>
								</tr>
								
								<tr>
								<td><label>REASON FOR RESIGN</label></td>
								<td><input type="text" id="r_resign" value="<%=reason_action%>" readonly="readonly"/></td>
								</tr>
								
								<tr>
								<td><label>DETAIL REASON FOR RESIGN</label> </td> 
								<td><input type="text" id="dr_resign" value="<%=detailed_reason%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>CREATION DATE</label> </td> 
								<td><input type="text" id="c_date" value="<%=creation_date%>" readonly="readonly"/></td>
								</tr>
								<tr>
									<td><label>RELEAVING DATE</label> </td>
								<td><input type="date" id="r_date" value="<%=rileaving_date%>" /></td>
								</tr>
								<tr>
								<td><label>ACTUAL NOTICE PERIOD </label></td>
								
								<td><input type="text" id="anp" value="<%=actual_notice%>" readonly="readonly"/></td>
								</tr>
								<tr>
								<td><label>GIVING NOTICE PERIOD</label> </td>
								<td><input type="text" id="given_notice" value="<%=given_notice%>" onkeypress="return isernps(event)"/></td>
								</tr>
								<tr>
								
								<tr>
								<td><label>REPORTING MANAGER COMMENTS <span style="color:red">*</span></label></td>
								<td><textarea id="comments_text" rows=" " cols=" "></textarea>  </td>
								</tr>
								<tr>
								<td style=padding-left:5em><input id="reg_approve" type="button" class="btn btn-success" value="APPROVE"/></td>
								<td  style=padding-left:5em><input id="reg_reject" type="button" class="btn btn-danger" value="REJECT"/></td>
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
