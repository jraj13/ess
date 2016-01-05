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
<li ><a href="#TRVL_MGMT_ESS" id="TRVL_MGMT_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Travel Management"><b>Travel Management</b></a></li>
<li><a href="#DOM_TRVL_REQ_ESS" id="DOM_TRVL_REQ_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Domestic Travel Request"><b>Domestic Travel Request</b></a></li>
<li><a href="#RESCH_TRIP_ESS" id="RESCH_TRIP_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Reschedule Trip"><b>Reschedule Trip</b></a></li>
<li><a href="#USR_MAN_ESS" id="USR_MAN_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="User Manual"><b>User Manual</b></a></li>

<li ><a href="#OVER_TRVL_REQ_ESS" id="OVER_TRVL_REQ_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Overseas travel Request"><b>Overseas travel Request</b></a></li>
<li><a href="#OVER_TRVL_REQ_APR_ESS" id="OVER_TRVL_REQ_APR_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Overseas travel Request - Approval"><b>Overseas travel Request- Approval</b></a></li>
<li><a href="#OVER_TRVL_MIS_REPORT_ESS" id="OVER_TRVL_MIS_REPORT_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Overseas travel - MIS Report"><b>Overseas travel- MIS Report</b></a></li>
<li><a href="#OVER_TRVL_USR_MAN_ESS" id="OVER_TRVL_USR_MAN_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Overseas travel - User Manual"><b>Overseas travel- User Manual</b></a></li>

<li><a href="#PASS_DETAIL_ESS" id="PASS_DETAIL_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Passport Details"><b>Passport Details</b></a></li>

</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="argin-top:10%"> 
</div>


</body>
</html>