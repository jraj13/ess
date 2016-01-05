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
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>Career and Job</b></h3>
<div> 

 <ul style="align:left">
<li ><a href="#CAJ_ELC" id="CAJ_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Career and Job</b></a></li>
<li><a href="#ICO_ELC" id="ICO_ELC" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>Internal Career opportunities</b></a></li>
<li><a href="#RAF_ELC" id="RAF_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Refer a Friend</b></a></li>
<li><a href="#RFUM_ELC" id="RFUM_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Refer a Friend-User Manual</b></a></li>
</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>


</body>
</html>