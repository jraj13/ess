<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
  
  <script>
  $(function() {
    $( "#accordion2" ).accordion({
      collapsible: true
    });
  });
  </script>

</head>
<body>

<div id="accordion2">
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>e-Separation</b></h3>
<div> 

 <ul style="align:left">
<li ><a href="#ESR_ELC" id="ESR_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>eSeparation-Request</b></a></li>
<li><a href="#ESC_ELC" id="ESC_ELC" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>eSeparation-Clearance</b></a></li>
<li><a href="#ESEI_ELC" id="ESEI_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>eSeparation-ExitInterview</b></a></li>
<li><a href="#ESUM_ELC" id="ESUM_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>User Manual</b></a></li>
</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>
</body>
</html>