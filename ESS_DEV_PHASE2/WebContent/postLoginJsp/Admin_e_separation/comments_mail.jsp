<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.E_separation_ADMIN" %>
    <%@ page import="com.ess.common.eseparation.Admin_Comments_Mail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("comments_mail.jsp");

String emp_id=request.getParameter("empid").trim();
String admin_note=request.getParameter("admin_note").trim();



 E_separation_ADMIN e_ad_acc=new E_separation_ADMIN();
String emp_mail_id=e_ad_acc.find_emp_mailid(emp_id);


Admin_Comments_Mail mail=new Admin_Comments_Mail();
String mail_status=mail.mail_admin_status(emp_mail_id, admin_note);


if(mail_status.equalsIgnoreCase("yes"))
{
	out.println("<font color=green>");
	out.println("Successfully Mail Sent");
	out.println("</font>");
}
else
{
	out.println("<font color=red>");
	out.println("Please Try Again");
	out.println("</font>");
} 

%>
</body>
</html>