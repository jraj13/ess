<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
		<b>Separation Details</b>
</div>

<label>Select Employee Id : </label>
<select id="choose" class="abc" >
							<option  value="none selected">Select Id </option>
							<% 
							System.out.println("e_sep_request_manager.jsp");  
Connection con=null;
String RegQry="select emp_id  from E_SEPARATION_EMP where  RM_APPROVE='Pending' and EMP_APPROVEL='Initiate' and HR_APPROVE='Pending' and ADMIN_APPROVE='Pending'";
try
{
	 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String name = rs.getString("emp_id");
%>
          <option  value="<%=name%>"><%=name%></option>
<%
     }
}catch(Exception e)
{    out.print(e);
}
%>
</select>

<input type="button" id="esep_manager_search" class="btn btn-default btn-sm" value="Search" onclick="openPage(id)"></input>


<div id="qrySuccess">

</div>

</body>
</html>