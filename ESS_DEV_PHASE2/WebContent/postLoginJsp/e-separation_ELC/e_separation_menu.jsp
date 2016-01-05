<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.ess.common.eseparation.E_separation_manager_level" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="jstest/jquery2-ui.css">
 <link rel="stylesheet" href="cartian/jquery-ui.css">
 
  <script src="jstest/jquery1-1.10.2.js"></script>
  <script src="jstest/jquery3-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
 .badge {

/* color: #D82582; */
background-color: #DD4343;
} 

</style>
  <script>
  $(function() {
    $( "#accordion2" ).accordion({
      collapsible: true
    });
  });
  </script>

</head>
<body>
<%
E_separation_manager_level aa=new E_separation_manager_level();
String count=aa.geTotla_counts();
%>

<div id="accordion2">
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>e-SEPARATION MENU </b></h3>
<div> 

 <ul><!--  align="left"  > -->
<%-- <li><a href="#e-SEP_MAN" id="e-SEP_MAN" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>e-Separation Request<span class="badge"><%=count %></span></b>  </a></li> --%>
<li><a href="#e-SEP_MAN" id="e-SEP_MAN" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>e-Separation Request</b>  </a></li>
</ul>

 </div> 
</div>


<div>
 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"> 
</div>


</body>
</html>