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
<li ><a href="#SELF_SP_CH_MEDICLAIM_ESS" id="SELF_SP_CH_MEDICLAIM_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Self,Spouse & Child Mediclaim"><b>Self,Spouse & Child Mediclaim</b></a></li>
<li><a href="#LIFE_INSU_POLICY_ESS" id="LIFE_INSU_POLICY_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Life Insurance Policy"><b>Life Insurance Policy</b></a></li>
<li><a href="#PARENT_GRP_MEDICLAIM_ESS" id="PARENT_GRP_MEDICLAIM_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Parent Group Mediclaim"><b>Parent Group Mediclaim</b></a></li>
<li><a href="#INSURANCE_DETAIL_ESS" id="INSURANCE_DETAIL_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Insurance Details"><b>Insurance Details</b></a></li>

</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>


</body>
</html>