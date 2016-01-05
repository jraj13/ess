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
  <h3 style="color:#FFFFFF;font-size:15px;background-color: #FF1493"><b>Personal Information</b></h3>
<div> 

 <ul align="left">
 <!-- <li><a href="#PWRKTYM" id="PWRKTYM" style="text-decoration: None;color:#FA8072;"	onclick="openPage(this.id);"><b>Working Time</b></a></li> -->
<li><a href="#PROF" id="PROF" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>My Profile</b></a></li>
<li><a href="#QAL" id="QAL" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>Qualification</b></a></li>
<li><a href="#PE" id="PE" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Previous Employer</b></a></li>
<li><a href="#NOM" id="NOM" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Nominations</b></a></li>
<li><a href="#PAN" id="PAN" style="text-decoration: None;color:#FFFFFF;" class='last' onclick="openPage(this.id);"><b>PAN/Retirals</b></a></li>
</ul>

 </div> 
</div>


<div>

<!--  <img src="D:\eimages\unite2.jpg" alt="Unite2" width="45%" height="30%" align="left" margin-top:10%> --> 
<!-- <img src="postLoginJsp/images/sidebar_menu_img.PNG" alt="Unite2" width="90%" height="30%" align="left" margin-top:10%> -->
 <img src="postLoginJsp/images/sidebar_menu_img.PNG" alt="Unite2" width="99%" height="45%" align="left" margin-top:10%> 
</div>


</body>
</html>