<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
    <%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement" %>
     <%@ page import="java.util.ArrayList"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String message="";

String per_street=request.getParameter("per_street");
String per_addr=request.getParameter("per_addr");
String per_addr_city=request.getParameter("per_addr_city");
String per_addr_distt=request.getParameter("per_addr_distt");
String per_add_pcode=request.getParameter("per_add_pcode");
String per_cont_no=request.getParameter("per_cont_no");
String per_emp_id=request.getParameter("per_emp_id");


Full_N_Final_Settlement fnf_obj=new Full_N_Final_Settlement();
String result=fnf_obj.update_emp_per_addr(per_street, per_addr, per_addr_city, per_addr_distt, per_add_pcode, per_cont_no, per_emp_id);

System.out.println("result..."+result);


if(result.equalsIgnoreCase("Recored updated successfully"))
{
	
	message="Recored updated successfully";
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