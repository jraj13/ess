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
<li ><a href="#FORMS_ESS" id="FORMS_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Forms"><b>Forms</b></a></li>
<li><a href="#PF_NOMINI_ESS" id="PF_NOMINI_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="PF Nominations"><b>PF Nominations</b></a></li>
<li><a href="#GRATUITY_NOMINI_ESS" id="GRATUITY_NOMINI_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Gratuity Nominations"><b>Gratuity Nominations</b></a></li>
<li><a href="#SUPERNNUATION_NOMINI_ESS" id="SUPERNNUATION_NOMINI_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Supernnuation Nominations"><b>Supernnuation Nominations</b></a></li>

<li ><a href="#TRANS_PF_TRUST_ESS" id="TRANS_PF_TRUST_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Transfer From Other PF Trust"><b>Transfer From Other PF Trust</b></a></li>
<li><a href="#TRANS_SUPERNNUATION_ESS" id="TRANS_SUPERNNUATION_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Transfer of Superannuation"><b>Transfer of Superannuation</b></a></li>
<li><a href="#FAQ_RETIRAL_BENE_ESS" id="FAQ_RETIRAL_BENE_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="FAQ on Retiral Benefits"><b>FAQ on Retiral Benefits</b></a></li>
<li><a href="#PF_SLIP_2011_ESS" id="PF_SLIP_2011_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="PF Slip - 2011 Onwards"><b>PF Slip - 2011 Onwards</b></a></li>

<li><a href="#SUPERNNUATION_SLIP_ESS" id="SUPERNNUATION_SLIP_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Superannuation Slip"><b>Superannuation Slip</b></a></li>

</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>


</body>
</html>