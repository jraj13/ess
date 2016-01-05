<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.dao.DataDao" %>
    <%@ page import="java.io.*,java.sql.*" %>
    <%@ page import="com.google.gson.Gson" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String searchList="";
System.out.println("Data from ajax call CONTROLLER.JSP PAGE");
	try {
			String term = request.getParameter("term").toUpperCase();
			System.out.println("Data from ajax call " + term);

			DataDao dataDao = new DataDao();
			ArrayList<String> list = dataDao.getFrameWork(term);

			searchList = new Gson().toJson(list);
			response.getWriter().write(searchList);
			//out.println(searchList);
			//System.out.println("searchList.."+searchList);
		} 
		
		 catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	//out.println(searchList);
%>
</body>
</html>