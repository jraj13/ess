<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ess.common.action.LeaveConfigAdmin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String message = "";

		float pl = Float.parseFloat(request.getParameter("pl").trim());
		float sl = Float.parseFloat(request.getParameter("sl").trim());
		float cl = Float.parseFloat(request.getParameter("cl").trim());
		float adv_pl = Float.parseFloat(request.getParameter("advpl").trim());
		float adv_sl = Float.parseFloat(request.getParameter("advsl").trim());
		float compoff = Float.parseFloat(request.getParameter("compoff").trim());
		String emp_id = request.getParameter("emp_id").trim();

	LeaveConfigAdmin obj = new LeaveConfigAdmin();

	String result=obj.insert_Leaves_first_time(emp_id, pl, sl, cl, adv_pl, adv_sl, compoff);
	
		System.out.println("leave assing status/////" + result);

		if (result.equalsIgnoreCase("Yes")) {
			message = "Successfully Leave Assigned";
			out.println("<font color=green>");
			out.println(message);
			System.out.println(message);
			out.println("</font>");
		} else {
			message = "Sorry! Please Try Again";
			out.println("<font color=red>");
			out.println(message);
			System.out.println(message);
			out.println("</font>");
		}
	%>


</body>
</html>