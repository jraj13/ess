<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="com.ess.util.GetConnection" %>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

/* String res_comment1=request.getParameter("res_comment");
System.out.println("res_comment1.."+res_comment1); */

String res_comment1=request.getParameter("resign_no1");
System.out.println("res_comment1.."+res_comment1);

String resign_no2=request.getParameter("resign_no2");
System.out.println("resign_no2.."+resign_no2);

/* String res_comment1="No Dues"; */


String msg="";

 String query="update EMP_DUE_CLEARANCE set IT_SUPPORT_COMMENT='"+res_comment1+"' where RESIGNATION_NO='"+resign_no2+"'";
System.out.println(query);

try{
	
	Connection con=GetConnection.getConnection();
	Statement st=con.createStatement();
	
	int rs=st.executeUpdate(query);
			
			if(rs>0)
			{
				msg="Due Clearance Status Updated successfully";
				System.out.println("Due Clearance Status Updated successfully");
			}
			else
			{
				msg="Due Clearance Status not Updated";
				System.out.println("Due Clearance Status not Updated");
			}
}catch(Exception e)
	{
		msg="some internal problem";
		System.out.println("some internal problem");
		
	}
	finally
	{
		out.println(msg);
	}




        	 %>
        	 
</body>
</html>