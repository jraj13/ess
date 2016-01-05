<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.ess.common.eseparation.IT_Support_Dueclearance"%>
 <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
System.out.println("come in due clearance succes page");

String taskstatus=request.getParameter("taskstatus").trim();
System.out.println("taskstatus.."+taskstatus);

String t_owner_remarks=request.getParameter("t_owner_remarks").trim();
System.out.println("t_owner_remarks.."+t_owner_remarks);



String sequence_no=request.getParameter("sequence_no").trim();

String favorite=request.getParameter("favorite");

System.out.println("total favourate is.."+favorite);
 String message="";
 
 
 IT_Support_Dueclearance man_sta=new IT_Support_Dueclearance();


String status=man_sta.saveDueClearanceStatus(taskstatus,sequence_no,t_owner_remarks);

String task_save_result=man_sta.saveTasks(favorite,sequence_no);
out.println(task_save_result);

//System.out.println("status in dueclearance update:::::::::::::::::::"+status);

/* if(status.equalsIgnoreCase("Yes"))
{
	//man_sta.mail_from_manager(emp_id,given_notice,comments_text);
	
	message="Successfully Updated Status ";
	out.println("<font color=green>");
	out.println(message);
	out.println("</font>");
}
else
{
	message="Sorry! Please Try Again";
	out.println("<font color=red>");
	out.println(message);
	out.println("</font>");
}   */

%>

</body>
</html>

