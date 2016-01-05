<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
  <%@ page import="java.util.ArrayList" %>
  
       <%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement"%>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- <script>
$(document).ready(function(){
	alert("ajax");
	var seq_no=$('#seq_no').val();
	
	alert("seq_no.."+seq_no);
	//var url = 'postLoginJsp/HRController/fnfworksheet_hr.jsp';
	$.ajax({ 
		
		url: "postLoginJsp/HRController/fnfworksheet_hr.jsp",
		
	        context: document.body,
	        success: function(){
	        	$('#output').html(data);
	         //  alert("done");
	        }});
	
	});

</script>
 -->


<body>

<div id="output">

<%


//String seq_no=request.getParameter("seq_no").trim();
String seq_no=request.getParameter("returntoMain_screen").trim();


WorkSheet_FandF objfnf=new WorkSheet_FandF();

int initial_data=objfnf.check_existor_not(seq_no);

System.out.println("dummy.jsp page.."+initial_data);
%>


<input type="hidden" id="seq_no" value="<%=seq_no %>">

<%if(initial_data==1){ %>

<jsp:forward page="fandF_step1_view.jsp" >
<jsp:param name="seq_no" value="<%=seq_no %>"/> 
</jsp:forward> 	



<%
}
else{%>

<jsp:forward page="fnfworksheet_hr.jsp" >
<jsp:param name="seq_no" value="<%=seq_no %>"/> 
</jsp:forward> 	
	
<%}%>



</div>
</body>
</html>