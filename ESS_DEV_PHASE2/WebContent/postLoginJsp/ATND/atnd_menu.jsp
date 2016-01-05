<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Collapse content</title>
  <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  
  
  <link rel="stylesheet" href="jstest/jquery2-ui.css">
   <link rel="stylesheet" href="cartian/jquery-ui.css">
   
  <script src="jstest/jquery1-1.10.2.js"></script>
  <script src="jstest/jquery3-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <script>
  $(function() {
    $( "#accordion1" ).accordion({
      collapsible: true
    });
  });
  </script>
 
</head>
<body>
 
<div id="accordion1" >
  <!-- <h3 style="color:#DC143C;font-size:15px;background-color:#A9A9A9"><b>ATTENDANCE/LEAVE</b></h3> -->
  <h3 style="color:#FFFFFF;font-size:15px;background-color: #FF1493"><b>Attendance/Leave</b></h3>
<div > 

 <ul align="left" style="background-color:#4169E1">

<li><a href="#PWRKTYM" id="PWRKTYM" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Working Time</b></a></li>
<li><a href="#ATNDQRY" id="ATNDQRY" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Attendance Query</b></a></li>
<li><a href="#LOVAR" id="LOVAR" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Leave OverView</b></a></li>
<li><a href="#LE" id="LE" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id)"><b>Leave Encashment</b></a></li>
<li><a href="#PHC" id="PHC" style="text-decoration: None;color:#FFFFFF;" class='last'onclick="openPage(this.id);"><b>Paid Holiday Calendar</b></a></li>
</ul>

 </div> 
 
</div>

<div>

<!--  <img src="D:\eimages\unite2.jpg" alt="Unite2" width="45%" height="30%" align="left" margin-top:10%> --> 
<!-- <img src="postLoginJsp/images/sidebar_menu_img.PNG" alt="Unite2" width="90%" height="30%" align="left" margin-top:10%> -->
 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left" style="margin-top:0%;"> 
</div>
 
</body>
</html>