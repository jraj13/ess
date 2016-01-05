<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.ess.common.eseparation.E_separation_HR"%>
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

String emp_id=request.getParameter("emp_id").trim();
System.out.println("emp_id.."+emp_id);

String action=request.getParameter("action").trim();
System.out.println("action.."+action);

String reason_a=request.getParameter("reason_a").trim();
System.out.println("reason_a.."+reason_a);

String detailed_a=request.getParameter("detailed_a").trim();
System.out.println("detailed_a.."+detailed_a);

String relieving_rm=request.getParameter("relieving_rm").trim();
System.out.println("relieving_rm.."+relieving_rm);

String r_date=request.getParameter("r_date").trim();

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate2=simpleDateFormat.parse(r_date);
SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd-MMM-YYYY");           
Object r_date1=outputDateFormat2.format(tempDate2);

System.out.println("r_date1.."+r_date1);

String recomended_status=request.getParameter("recomended_status").trim();
System.out.println("recomended_status.."+recomended_status);

String comments_approve=request.getParameter("comments_approve").trim();
System.out.println("comments_approve.."+comments_approve);

String note=request.getParameter("note").trim();
System.out.println("note.."+note);

String hr_withdraw_action=request.getParameter("hr_withdraw_action");
System.out.println("hr_withdraw_action.."+hr_withdraw_action);

String sequence_no=request.getParameter("sequence_no");

 String message="";
 E_separation_HR man_sta=new E_separation_HR();

/* String status=man_sta.saveHrStatus(emp_id,action,reason_a,detailed_a,relieving_rm,r_date1,recomended_status,comments_approve,note,hr_withdraw_action); */

String status=man_sta.saveHrStatus(emp_id,sequence_no,r_date1,recomended_status,comments_approve,note,hr_withdraw_action);

System.out.println("status in HR update:::::::::::::::::::"+status);

if(status.equalsIgnoreCase("Yes"))
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
}  

%>

</body>
</html>

