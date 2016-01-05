
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
String name="";
String filename="";
String uName="";
uName = (String) session.getAttribute("empid");
System.out.println("login id in form16"+uName);

 filename="Form16/"+uName+".pdf";
		
%>
<a href="<%=filename%>" target="_new"><font color="">this is filename</font></a><br>
<!-- <a href="Form16/CSSE150059.pdf" target="_new"><font color="">DIA,L3 VPN</font></a> -->


<%
System.out.println("login id in form16  dsfdg"+filename);
%>
</body>
</html>