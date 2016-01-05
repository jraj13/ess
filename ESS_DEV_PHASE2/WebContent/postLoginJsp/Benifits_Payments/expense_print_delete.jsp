<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String msg = "";

	String empid=(String)session.getAttribute("empid");
	System.out.println("empid for expense entry===="+empid);
	String choose = request.getParameter("choose");
	System.out.println("sequence id is..."+choose);
	/* String sql="delete from ESS_EXPENSE_ENTRY where COUNT='"+choose+"' and emp_id='"+empid+"'"; */
	//String sql2="select rowcount
		String sql="delete from ESS_EXPENSE_ENTRY where emp_COUNT='"+choose+"' and emp_id='"+empid+"'";
	
	try{
	Connection con = GetConnection.getConnection();
	Statement st = con.createStatement();

	int rs = st.executeUpdate(sql);
	if (rs > 0) {
		System.out.println("successfully deleted on entry expenses ");
		msg = "successfully deleted recored";
		
	} else {
		
		msg="not deleted Try again !";
	}

} catch (Exception ex) {
	
	System.out.println("from deletion on expense entry delete=="+ex.getMessage());

} finally {

	out.println(msg);

}

%>
</body>
</html>