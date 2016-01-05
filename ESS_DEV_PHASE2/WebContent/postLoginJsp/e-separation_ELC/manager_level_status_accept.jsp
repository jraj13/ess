<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.ess.separation.newly.Managerseparation"%>
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
System.out.println("manager_level_status_accept.jsp");



/* "&rate_value=" + rate_value+ "&comments_approve=" + comments_approve
+ "&note=" + note; */

Object upload_loc=session.getAttribute("upload_manager");

System.out.println("uploaded file upload path"+upload_loc);

String sequence_id=request.getParameter("sequence_id").trim();

String emp_id=request.getParameter("emp_id").trim();

String action_type=request.getParameter("action").trim();

String reason_action=request.getParameter("reason_a").trim();

String detailed_reason=request.getParameter("detailed_a").trim();

String phy_relev_date_jsp=request.getParameter("relieving_rm").trim();

SimpleDateFormat format_1 = new SimpleDateFormat("yyyy-MM-dd");
Date temp_value=format_1.parse(phy_relev_date_jsp);
SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-YYYY");           
Object phy_relev_date=format2.format(temp_value);




/* String r_date_jsp=request.getParameter("r_date").trim();

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate2=simpleDateFormat.parse(r_date_jsp);
SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd-MMM-YYYY");           
Object r_date=outputDateFormat2.format(tempDate2); */


String status_rm=request.getParameter("rate_value").trim();
String short_notes=request.getParameter("comments_approve").trim();
String big_notes=request.getParameter("note").trim();


System.out.println(emp_id);
System.out.println(action_type);
System.out.println(reason_action);

System.out.println(detailed_reason);
System.out.println(phy_relev_date);
/* System.out.println(r_date); */

System.out.println(status_rm);
System.out.println(short_notes);
System.out.println(big_notes);

 String message="";

 Managerseparation man_sta=new Managerseparation();

 String status=man_sta.saveManagerStatus(emp_id,action_type,reason_action,detailed_reason,phy_relev_date,status_rm,short_notes,big_notes,sequence_id);

System.out.println("status in manager status:::::::::::::::::::"+status);

if(status.equalsIgnoreCase("Yes"))
{
	//man_sta.mail_from_manager(emp_id,given_notice,comments_text);
	message="Successfully Applied";
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