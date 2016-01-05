<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    <%@page import="com.ess.util.GetConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String ltype = request.getParameter("ltype");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String mob = request.getParameter("mob");

		System.out.println("ltype..."+ltype);
		System.out.println("date1...."+date1);
		System.out.println("date2..."+date2);
		System.out.println("mob...."+mob);
		
		
		String RegQry = "INSERT INTO LEAVEAPPLYTEST VALUES('" + ltype
				+ "','" + date1 + "', '"+date2+"', '"+mob+"')";
		String msg = "";
		try {

			Connection con = GetConnection.getConnection(); 

			Statement st = con.createStatement();
			

			int rs = st.executeUpdate(RegQry);

			if (rs > 0) {
				System.out.println("successfully inserted date in db");
				msg = "successfully inserted";
			} else {

				msg = "fail";
			}

		} catch (Exception ex) {
			
			System.out.println("from Insertion=="+ex.getMessage());

		} finally {

			out.println(msg);

		}
	%>
</body>
</html>