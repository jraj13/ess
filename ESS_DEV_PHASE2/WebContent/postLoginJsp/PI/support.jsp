<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
$(function() {
	$('#submit').click(
			function() {
				
				var hdCategory=$('#hdCategory').val();
				var hdQuery=$('#hdQuery').val();
				var hdAttachment=$('#hdAttachment').val();
				var mailid=$('#mailid').val();
				var empid=$('#empid').val();
				
				var img=document.getElementById("hdAttachment").files[0].name;
				alert(img);
				/* inputNode.value = hdAttachment.value.replace("C:\\fakepath\\", "");
				alert(inputNode.value); */
				/* if (empid == "") {
					alert("Please enter employee id ! ");
					return false;
				}
				if(empid=="none selected"){
					alert("Please enter employee id ! ");
					return false;
				}
				else{ */
				  var dataString = '&hdCategory=' + hdCategory+ '&hdQuery=' + hdQuery+ '&hdAttachment=' + img+ '&mailid=' + mailid+ '&empid=' + empid;
				  alert(dataString);
		
				$.ajax({
					url :'postLoginJsp/HELP_DESK/helpdesksuccess.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
	                // alert("CTC generated successfully");
						
					/*  $('#lrmain').html(data).delay(5000).fadeOut();  */
				$('#lrmain').html(data); 

					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
				/*}  */

			})
});

</script>

</head>
<body>
<%

String mailid = (String) session.getAttribute("loginid");
String empid = (String) session.getAttribute("empid");

%>
 <s:div><b>Help Desk</b></s:div>
 <hr>

<%--   <s:form action="support" method="post" enctype="multipart/form-data">
  <table>  
  <tr>
   <td><s:select name="Category" label="Category"
         list="{'Employee Information','Payslip','Income Tax','Attendance/Leave','Travel Management','F and F settlement','Others'}" />
 
   </td>
   <tr><td>
   <s:textarea key="Query" name="email.body" rows="10" cols="50" /></td>
   <tr>
  <td> <s:label for="attachment" value="Attachment"/></td>
  <td> <s:file name="attachment" accept="text/html,text/plain" /></td>
  </tr>
  
   <s:token />
	
    <tr><td colspan="2"> <s:submit key="Submit" value="Submit" />
   <s:submit key="Cancel" value="Cancel" /></td></tr>
    
    </table>
   </s:form> --%>


 <s:form action="helpdesk1" method="post">
   <label>Category</label>&nbsp;
   <select name="hdCategory" id="hdCategory">
   <option value="Employee Information">Employee Information</option>
   <option value="Payslip">Payslip</option>
   <option value="Income Tax">Income Tax</option>
   <option value="Attendance/Leave">Attendance/Leave</option>
   <option value="Travel Management">Travel Management</option>
   <option value="F and F settlement">F and F settlement</option>
   <option value="Others">Others</option>
   </select> 
   <br>
    <label>Query</label>&nbsp;
    <textarea rows="5" cols="80" name="hdQuery" id="hdQuery"></textarea>
    <br>
    
     <label>Attachment</label>&nbsp;
    <input type="file" name="hdAttachment"  id="hdAttachment">
    <br><br>
    <input type="hidden" name="mailid" id="mailid" value="<%=mailid %>">
    <input type="hidden" name="empid" id="empid" value="<%=empid %>">
    <input type="button" value="Submit" id="submit" >&nbsp;<input type="submit" value="Cancel">
   
   
   </s:form>
   <div id="lrmain" ></div>
</body>
</html>