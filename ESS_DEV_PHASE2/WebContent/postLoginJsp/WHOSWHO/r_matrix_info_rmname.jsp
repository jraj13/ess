<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ page import="com.ess.common.action.EmployeeDetails" %>
    <%@ page import="java.util.*,java.sql.*" %>
       <%@ page import=" com.ess.util.GetConnection" %>
    
<!--     
    import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String message="";

String empmailid=request.getParameter("empmailid");
System.out.println("jsp input empmailid.."+empmailid);


Connection con = GetConnection.getConnection();
Statement stmt = con.createStatement();
//String query="select * from NCSS_EMP_MASTER_INFO where EMP_MAILID='"+empmailid+"' and status='Active'";
String query="select EMP_FNAME,EMP_LNAME from NCSS_EMP_MASTER_INFO where EMP_MAILID in (select EMP_RM from NCSS_EMP_MASTER_INFO where EMP_MAILID='"+empmailid+"')";


System.out.println("in jsp page.."+query);

ResultSet rs = stmt.executeQuery(query);


if(rs.next())
{

	//String rm_name=rs.getString("EMP_RM");
	String EMP_FNAME=rs.getString("EMP_FNAME");
	String EMP_LNAME=rs.getString("EMP_LNAME");
	if(EMP_LNAME=="" || EMP_LNAME==null)
	{
		EMP_LNAME="-";
	}
	message=EMP_FNAME+" "+EMP_LNAME;
	//message=rm_name;
	
	out.println(message);

}

rs.close();
stmt.close();
con.close();









%>
</body>
</html>