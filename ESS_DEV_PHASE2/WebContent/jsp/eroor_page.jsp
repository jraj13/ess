<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function validate_password()
{
	var enter_password=document.getElementById("old_password").value;
	alert("existing password"+enter_password);
	var old_password=document.getElementByName("old_password").value;
	
	var old_upper= old_password.toUpperCase();
	var new_first_password=document.getElementByName("new_first_password").value;
	
	var new_second_password=document.getElementByName("new_second_password").value;
	
	if(old_password=="")
		{
		alert("Please Enter old password");
		return false;
		}
	if(!(old_upper==enter_password))
		{
		alert("Please Enter correct Old password ");
		return false;
		}
	if(!(new_first_password==new_second_password))
		{
		alert("Please Enter  choose new password and Re enter new Password must be same ");
		return false;
		}
	else
		{
		return true;
		}
	
	
}
</script>
</head>
<body>
<%

String login_password = (String) session.getAttribute("empid");
System.out.println("old password is" + login_password);

%>

<form action="expire_password" method="post" onsubmit="return validate_password()">
<h2>Password Expired!!!!!!!!!!!!!</h2>
 Enter old password :<input type="password" name="old_password" /><br/>
 choose new password:<input type="password" name="new_first_password"/><br/>
 Re enter new Password:<input type="password" name="new_second_password"/><br/>
 
 <input type="hidden" id="old_password" value="<%=login_password %>"/>
 
 <input type="submit" value="submit" />
 
 </form>
</body> 
</html>