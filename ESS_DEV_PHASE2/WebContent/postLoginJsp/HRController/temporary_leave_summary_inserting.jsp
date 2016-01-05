<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.ess.common.eseparation.Temporary_saving_Draft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
float available_pl_hr_col1=Float.parseFloat(request.getParameter("available_pl_hr_col1"));
System.out.println("available_pl_hr_col1 :"+available_pl_hr_col1);

float advance_pl_col1=Float.parseFloat(request.getParameter("advance_pl_col1"));
System.out.println("advance_pl_col1 :"+advance_pl_col1);

float available_sl_hr_col1=Float.parseFloat(request.getParameter("available_sl_hr_col1"));
System.out.println("available_sl_hr_col1 :"+available_sl_hr_col1);

float advance_sl_hr_col1=Float.parseFloat(request.getParameter("advance_sl_hr_col1"));
System.out.println("advance_sl_hr_col1 :"+advance_sl_hr_col1);


float available_pl_hr_col2=Float.parseFloat(request.getParameter("available_pl_hr_col2"));
System.out.println("available_pl_hr_col2 :"+available_pl_hr_col2);

float advance_pl_col2=Float.parseFloat(request.getParameter("advance_pl_col2"));
System.out.println("advance_pl_col2 :"+advance_pl_col2);



float available_sl_hr_col2=Float.parseFloat(request.getParameter("available_sl_hr_col2"));
System.out.println("available_sl_hr_col2 :"+available_sl_hr_col2);

float advance_sl_hr_col2=Float.parseFloat(request.getParameter("advance_sl_hr_col2"));
System.out.println("advance_sl_hr_col2 :"+advance_sl_hr_col2);


float short_fall=Float.parseFloat(request.getParameter("short_fall"));
System.out.println("short_fall :"+short_fall);

String seq_no=request.getParameter("seq_no").trim();

float cl_days=Float.parseFloat(request.getParameter("cl_days").trim());

System.out.println("cl_days :"+cl_days);

Temporary_saving_Draft draft=new Temporary_saving_Draft();

String result_msg=draft.insert_leave_summary( seq_no, available_pl_hr_col1, advance_pl_col1, available_sl_hr_col1, advance_sl_hr_col1,
		
		available_pl_hr_col2, advance_pl_col2, available_sl_hr_col2, advance_sl_hr_col2, short_fall,cl_days);



%>





</body>
</html>