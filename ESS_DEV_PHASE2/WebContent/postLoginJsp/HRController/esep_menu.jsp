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
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>Detailed Navigation</b></h3>
<div> 

 <ul style="align:left">
 <!-- <li><a href="#ESEP_USERMANUAL_HRD" id="ESEP_USERMANUAL_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>User Manual</b></a></li> -->
<li><a href="#ESEP_REQ_HRD" id="ESEP_REQ_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>eSeparation-Request</b></a></li>
<li><a href="#ESEP_APPROVAL_HRD" id="ESEP_APPROVAL_HRD" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>eSeparation-Approval</b></a></li>
<li><a href="#ESEP_OVERVIEW_HRD" id="ESEP_OVERVIEW_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>eSeparation-HR Overview</b></a></li>
<li><a href="#ESEP_CLEAR_HRD" id="ESEP_CLEAR_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>eSeparation-Clearance</b></a></li>
<li><a href="#ESEP_EXTINTERVIEW_HRD" id="ESEP_EXTINTERVIEW_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>e-Separation_Exit Interview</b></a></li>
<li><a href="#ESEP_FNF_HRD" id="ESEP_FNF_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Full & Final Settlement</b></a></li>
<!-- <li><a href="#ESEP_FNF_TEST_HRD" id="ESEP_FNF_TEST_HRD" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Testing</b></a></li> -->
</ul>

</div> 
</div>


<div>
 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%"> 
</div>


</body>
</html>

