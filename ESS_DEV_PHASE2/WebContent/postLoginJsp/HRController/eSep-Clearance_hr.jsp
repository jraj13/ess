<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    <%@ page import="com.ess.common.eseparation.E_separation_HR"%>
    <%@ page import="java.lang.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function editFun_dueclerance(id) 
{
	alert("call");
	var dataString = "&sequence_id=" + id ;
	alert(dataString);
	$.ajax({

		url : 'postLoginJsp/HRController/dueclearance.jsp',
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

<table>
<tr style="background-color: #40E0D0">
<th>Select</th>
<th>Emp ID</th>
<th>Resignation No.</th>
<th>Creation Date</th>
<th>Reason Action</th>
<th>Detailed Reason</th>
<th>Relieving Date</th>
<th>Notice Period</th>
<th>HR Status</th>
</tr>

<%

E_separation_HR hr_module=new E_separation_HR();
ArrayList<String> arryObj=hr_module.esepHrClearance_data();
if (arryObj.size() > 0) {
for(int i=0;i<arryObj.size();i++){
	String stringdata=arryObj.get(i).toString();
	String arrdata[]=stringdata.split("\\^");
	
	String emp_id=arrdata[0];
	String req_no=arrdata[1];
	String creation_date=arrdata[2];
	String reason_action=arrdata[3];
	String detailed_reason=arrdata[4];
	String rileaving_date=arrdata[5];
	String actual_notice_period=arrdata[6];
	
	String given_notice_period=arrdata[7];
	String ACTION_TYPE_RM=arrdata[8];
	String REASON_FOR_ACTION_RM=arrdata[9];
	String DETAILED_REASON_RM=arrdata[10];
	String PHY_REL_DATE_RM=arrdata[11];
	String rm_approve=arrdata[12];
	String hr_approve=arrdata[13];
	String admin_approve=arrdata[14];
%>

<tr align="center">
<%-- <td><button type="button"  id="<%=req_no%>" onclick="editFun_dueclerance(id);"> 
         <span class="glyphicon glyphicon-pencil" ></span> </button> </td> --%>
         <td><input type="radio" id="<%=req_no %>" name="rbtn" onclick="editFun_dueclerance(id);"/></td>
<td><%=emp_id %></td>
<td><%=req_no %></td>
<td><%=creation_date %></td>
<td><%=reason_action %></td>
<td><%=detailed_reason %></td>
<td><%=rileaving_date %></td>
<td><%=given_notice_period %></td>
<td><%=hr_approve %></td>

<%
}
}
else{

%>

<tr>
<td colspan="10">Records Not Found</td>
</tr>

<%
}
%>



</table><br>
<div id="qrySuccess"></div>
</body>
</html>