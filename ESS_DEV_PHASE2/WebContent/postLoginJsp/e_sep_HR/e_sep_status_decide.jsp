<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.E_separation_HR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("This is Hr insert into e-separation page");

String emp_id=request.getParameter("emp_id").trim();
String given_notice=request.getParameter("given_notice").trim();
String hr_comments=request.getParameter("comments_text").trim();
String status=request.getParameter("status").trim();


E_separation_HR e_hr=new E_separation_HR();

String final_result=e_hr.save_hr_data(emp_id,given_notice,hr_comments,status);
if(final_result.equalsIgnoreCase("yes"))
{
	out.println("Successfully Approved");
}
else
{
	out.println("Sorry Try Again....");
}

%>
</body>
</html>