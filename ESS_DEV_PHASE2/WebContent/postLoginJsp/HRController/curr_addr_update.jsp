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

String curr_street=request.getParameter("curr_street");
String curr_addr=request.getParameter("curr_addr");
String curr_addr_city=request.getParameter("curr_addr_city");
String curr_addr_distt=request.getParameter("curr_addr_distt");
String curr_add_pcode=request.getParameter("curr_add_pcode");
String curr_cont_no=request.getParameter("curr_cont_no");
String curr_emp_id=request.getParameter("curr_emp_id");


Full_N_Final_Settlement fnf_obj=new Full_N_Final_Settlement();
String result=fnf_obj.update_emp_curr_addr(curr_street, curr_addr, curr_addr_city, curr_addr_distt, curr_add_pcode, curr_cont_no, curr_emp_id);

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