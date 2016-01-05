



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="java.util.ArrayList"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.ess.util.GetConnection"%>
<%@ page import="com.ess.common.action.LeaveConfigAdmin" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String message = "";
		System.out.println("come in generateleave_assignforAll----------------------------");
		
		 LeaveConfigAdmin leaves_assign_for_all_emp=new LeaveConfigAdmin();
		 String status_res=leaves_assign_for_all_emp.saveLeaveAssigned_forall_emp(); 
		
		 System.out.println("status in leave assigned:::::::::::::::::::"+status_res);
		
		 if(status_res.equalsIgnoreCase("Yes"))
		 {
		 message="Successfully Leave Assigned";
		 out.println("<font color=green>");
		 out.println(message);
		 System.out.println(message);
		 out.println("</font>");
		 }
		 else
		 {
		 message="Sorry! Please Try Again";
		 out.println("<font color=red>");
		 out.println(message);
		 System.out.println(message);
		 out.println("</font>");
		 }    
		

	/* 	System.out.println("update the status in saveLeaveAssigned");
		CallableStatement cstmt = null;
		Connection con = null;
		String res_status_report = "";

		String leaves_assign_procedure = "{call ASSIGN_LEAVES_ONCE.fetching_all_employees1}";
		System.out.println("the query in leave assign is"
				+ leaves_assign_procedure);
		try {
			con = GetConnection.getConnection();

			cstmt = con.prepareCall(leaves_assign_procedure);
			int res = cstmt.executeUpdate();

			if (res > 0) {
				message = "Yes";
				out.println(message);
			}

		} catch (Exception e) {
			message = "Problem in assing leave";
			out.println(message);
			System.out.println("Problem in assing leave ");
			e.printStackTrace();
		} finally {
			cstmt.close();
			con.close();
		} */
	%>
</body>
</html>