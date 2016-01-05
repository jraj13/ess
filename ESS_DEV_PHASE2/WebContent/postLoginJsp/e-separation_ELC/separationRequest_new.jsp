
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.eseparation.Eseparation_Basic_Info"%>
<%@ page import="java.lang.*,java.util.*"%>

    <%@page import="com.ess.util.GetConnection"%>
    <%@page import="java.text.SimpleDateFormat"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
if(len>1)
	{
	return false;
	}

    } 
    return true; 
 } 

</script>
<script>
$(function() {
	$("#submit").click(function() {
		var emp_id = $('#emp_id').val();
		var reasion_action= $('#reason').val();
		
		var detailed_reason = $('#detailed').val();
		var rel_date_before= $('#reliv_date').val();
		
		var actual_notice = $('#ac_notice').val();
		var given_notice= $('#given_notice').val();
		
		var note=$('#note').val();
		var rm = $('#rm').val();
		
		if(reasion_action==""||reasion_action==null){
			alert("Enter reason for action");
			return false;
		}
		if(detailed_reason==""||detailed_reason==null){
			alert("Enter detailed reason for action");
			return false;
		}
		if(given_notice=="" || given_notice==null)
			{
			alert("Enter notice period");
			return false;
			}
		if (confirm('Are you sure you want process this?')) {
		
		/* else { */
			alert("Don't Refresh Until message will display");
			var dataString = "&reasion_action=" + reasion_action + "&detailed_reason=" + detailed_reason + "&rel_date_before=" + rel_date_before + "&rel_date_before=" + rel_date_before +
			"&actual_notice=" + actual_notice + "&given_notice=" + given_notice  + "&note=" + note +"&rm=" + rm;
			$.ajax({
				url : 'postLoginJsp/e-separation_ELC/emp_initiate_Entry_page.jsp',
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

<script>
$(function() {
	$("#delete").click(function() {
		
		var empid = $('#emp_id').val();
		
		var dataString = "&empid=" + empid;
		alert(dataString);
		if (confirm('Are you sure you want to delete this?')) {
		$.ajax({

			url : 'postLoginJsp/e-separation_ELC/e_sepdelete.jsp',
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

<script>
$("#note").on('keydown', function(event) {
    var currentString = $("#note").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >499 )  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script>

</head>
<body>

<div id="qryload">


<%
System.out.println("separationRequest_new.jsp");  
Eseparation_Basic_Info month_date=new Eseparation_Basic_Info();
String month=month_date.getthirtyDaysAfter();

%>

<%
Eseparation_Basic_Info info_basic=new Eseparation_Basic_Info();

ArrayList<String>  intial_data=info_basic.getBasicInfo_eseparation();
if (intial_data.size() > 0) {
	for (int i = 0; i < intial_data.size(); i++) {
		String intial_homepage = intial_data.get(i).toString();

String into_data[]=intial_homepage.split("\\^");

String emp_id=into_data[0];
String f_name=into_data[1];
String l_name=into_data[2];
String designation=into_data[3];
String emp_Rm=into_data[4];


%>
			<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
		<b>Separation Request:New</b>
</div>
<table>
<tr>
<td colspan="2">Reason Details</td>
</tr>
<tr>
<td>Personnel Number</td>
<td><input type="text" id="emp_id" value="<%=emp_id%>" readonly="readonly"/> </td>
</tr>
<tr>
<td>Reason for Action<span style="color:red">*</span></td>
<td><input type="text" id="reason" /></td>
</tr>
<tr>
<td>Detailed Reason<span style="color:red">*</span></td>
<td><input type="text" id="detailed" /></td>
</tr>
<tr>
<td>Relieving Date</td>

<td><input type="text" id="reliv_date" value="<%=month%>" readonly="readonly"/></td>
</tr>
<tr>
<td>Actual Notice Period </td>
<td><input type="text" id="ac_notice" value="30" readonly="readonly"/></td>
</tr>
<tr>
<td>Given Notice Period<span style="color:red">*</span></td>
<td><input type="text" id="given_notice" onkeypress="return isernps(event)"/>
<input type="hidden" id="rm" value="<%=emp_Rm %>"/></td>
</tr>

							
		</table>
<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
			
		<b>Note</b>
</div>
<table >
<tr>
<th>Delete</th>
<th>Visibility Details</th>
<th>Created By User</th>
<th>Creating By Role</th>
<th>Creation Date</th>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="delete" class="reg_reject"  class="glyphicon glyphicon-trash" > 
          <span style="color:red" class="glyphicon glyphicon-trash"></span> </button></td>
<td>Roles and Users</td>
<td><%=f_name%> <%=l_name%></td>
<td>Employee</td>
<%
Date date = Calendar.getInstance().getTime();
SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
String today = formatter.format(date);

%>
<td id="today"><%=today%></td>
</tr>
<tr>
<td colspan="5"><textarea id="note" rows="4" cols="105" placeholder="Enter Note Here"></textarea>
</td>
</tr>
<tr>
<td colspan="5"  style=padding-left:25em><input id="submit" type="submit" class="btn btn-success" value="Save" > 
</td>
</tr>
<%
								
								} 
}
							%>
</table>


</div>
</body>
</html>
