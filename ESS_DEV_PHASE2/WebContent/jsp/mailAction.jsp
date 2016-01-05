 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Mail Pusher</title>
</head>
<body>
   <h1>Send Mail :</h1>
   <form action="mail" method="post">
   <label for="ccAddress">CC To:</label><input type="text" name="ccAddress"/><br><br>
      <label for="toAddres"> To mailId:</label>
      <input type="text" name="toAddress"/><br/><br/>
      <label for="Subject"> Subject:</label>
      <input type="text" name="Subject"/><br/><br/>
      <input type="submit" name="execute" value="Send"/>
   </form>
</body>
</html> 

<%-- 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Email Form</title>
</head>
<center style="background-color:skyblue;width:50%;height:auto">
<body>
   <em>The form below uses Google's SMTP server. 
   So you need to enter a gmail username and password
   </em>
   <form action="mail" method="post">
   <label for="from">From:</label>
   <input type="text" name="from"/><br/><br/>
   <label for="password">Password:</label>
   <input type="password" name="password"/><br/><br/>
   <label for="to">To:</label>
   <input type="text" name="to"/><br/><br/>
   <label for="subject">Subject:</label>
   <input type="text" name="subject"/><br/><br/>
   <label for="body">Body:</label>
   <input type="text" name="body"/><br/><br/>
   <input type="submit" name ="execute" value="Send Email"/>
   </form>
</body>
</center>
</html> --%>