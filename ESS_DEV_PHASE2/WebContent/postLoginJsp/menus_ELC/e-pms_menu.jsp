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
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>e-PMS</b></h3>
<div> 

 <ul style="align:left">
<li ><a href="#AD_ELC" id="AD_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Appraisal Documents</b></a></li>
<li><a href="#ADP_ELC" id="ADP_ELC" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>Appraisal Document-Appraisee</b></a></li>
<li><a href="#PRAP_ELC" id="PRAP_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>PMS Rating and Payments</b></a></li>
<li><a href="#PMSUM_ELC" id="PMSUM_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>User Manual</b></a></li>
</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>
</body>
</html>