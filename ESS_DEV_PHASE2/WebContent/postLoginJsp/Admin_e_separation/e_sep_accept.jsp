<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.E_separation_ADMIN" %>
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
System.out.println("e_sep_accept.jsp");

String emp_id=request.getParameter("empid").trim();

String rm_name=request.getParameter("rm_name").trim();

String r_date_jsp=request.getParameter("r_date").trim();



SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
 Date tempDate2=simpleDateFormat.parse(r_date_jsp);
SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd-MMM-YYYY");           
Object r_date=outputDateFormat2.format(tempDate2);

String gnp=request.getParameter("gnp").trim();


String admin_note=request.getParameter("admin_note").trim();
String status=request.getParameter("status").trim();


E_separation_ADMIN e_ad_acc=new E_separation_ADMIN();

String accept_req=e_ad_acc.save_admin_context(emp_id,r_date,gnp,admin_note,status);

String emp_mail_id=e_ad_acc.find_emp_mailid(emp_id);

if(accept_req.equalsIgnoreCase("yes"))
{
	String mail_status=e_ad_acc.mail_admin_status(emp_mail_id,rm_name,status,r_date_jsp);
	out.println("<font color=green>");
	out.println(status+" successfully");
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