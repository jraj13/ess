<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.HelpDeskAction"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Resignation Details in ESS</title>

<style>
#hdesk_table{
border:none;
}
 #hdesk_table tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #hdesk_table td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('#submit').click(function(){
		
		var sno=$('#s_no').val();
		var helpdeskcat=$('#helpdeskcat').val();
		var status=$('#stts').val();
		alert(status);
		var remarks=$('#remarks').val();
		var mailid=$('#mailid').val();
		
		if(status=="none selected")
			{
			alert("Please select status");
			}
		
		else if(remarks==null)
		{
		alert("Please enter remarks field");
		}
		
		else{
			
			dataString='&sno='+sno + '&helpdeskcat='+helpdeskcat+ '&status='+status+ '&remarks='+remarks+ '&mailid='+mailid;
			alert(dataString);
			$.ajax({
				
				url :'postLoginJsp/HELP_DESK/helpdeskreviewUpdate.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success: function(data){
					/*  $('#helpdeskreviewUpdate').html(data).delay(5000).fadeOut();  */
					$('#helpdeskreviewUpdate').html(data); 
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			
				
			});
			
		}
		
	})
	
});



</script>
</head>
<body>
<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">Employee Help Desk Query Status </h2>
<br>


<table id="hdesk_table" >
							
							<%
							System.out.println("check_emp_status.jsp");  
							int s_no=Integer.parseInt(request.getParameter("sno"));

							ArrayList<Object> esepObj = HelpDeskAction.fetch_Perticular_HD_empdeetails(s_no);
							
								if (esepObj.size() > 0) {
									for (int i = 0; i < esepObj.size(); i++) {
										String req = esepObj.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										String sno=reqarr[0];
										String helpdeskcat = reqarr[1];
									 	String helpdeskqry = reqarr[2];
										String attachment = reqarr[3];
										String empid = reqarr[4];
										String mailid = reqarr[5];
										String status = reqarr[6];
										String qrydate=reqarr[7];
										String remarks=reqarr[8];
							%>
								
								<input type="hidden" value="<%=sno%>" id="s_no" style="height:115%;">
								<input type="hidden" value="<%=mailid%>" id="mailid" style="height:115%;">
								
								<tr>
								<td><label>Help Desk Type :</label></td>
								<td><input type="text" value="<%=helpdeskcat%>" id="helpdeskcat" style="height:115%;width:100%; background-color:white" readonly="readonly"></td>
								</tr>
								
								<tr>
								<td><label>Query :</label> </td> 
								<td><textarea id="helpdeskcat" style="height:115%;background-color:white" readonly="readonly" rows="5" cols="30"><%=helpdeskqry%></textarea></td>
								</tr>
								<tr>
								<td><label>Attachment :</label> </td> 
								<td><input type="text" value="<%=attachment%>" id="attachment" style="height:115%;"></td>
								</tr>
								<tr>
								<td><label>Employee Mail Id</label> </td>
								<td><input type="text" value="<%=mailid%>" id="status" style="height:115%;width:100%;background-color:white" readonly="readonly"></td>
								</tr>
								<tr>
								<td><label>Status</label></td>
							<%-- 	<td><input type="text" value="<%=status%>" id="status" style="height:115%;width:100%;"></td> --%>
								<td><select id="stts" style="height:115%;width:100%;">
								<option value="none selected">Select</option>
								<option value="Inprocess">Inprocess</option>
								<option value="Completed">Completed</option>
								
								</select></td>
								</tr>
								<tr>
								<td><label>Query Date</label> </td>
								<td><input type="text" value="<%=qrydate%>" id="qrydate" style="height:115%;width:100%;background-color:white" readonly="readonly"></td>
								</tr>
								<tr>
								<td><label>Remarks</label> </td>
								<td><textarea  id="remarks" style="height:115%;"rows="5" cols="30"><%=remarks%></textarea></td>
								<%-- <td><input type="text" value="<%=remarks%>" id="remarks" style="height:115%;"></td> --%>
								</tr>
								
								<tr><td colspan="2"><input type="button" value="Submit" id="submit" ></td></tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="9">No Records Available</td>
							</tr>

							<%
								}
								
							%>
							
						</table>
						<div id="helpdeskreviewUpdate"></div>



</body>
</html>