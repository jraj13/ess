<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
 var urlmenu = document.getElementById( 'menu1' );
 urlmenu.onchange = function() {
      window.open(  this.options[ this.selectedIndex ].value );
 };
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance/Leave menu page</title>

<!-- ----------new style and script for hide and expand-->

	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Abeezee:400|Open+Sans:400,600,700|Source+Sans+Pro:400,600">
	
	<link rel="stylesheet" type="text/css" href="css/demo.css">

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/accordion.js"></script>
<!-- ---------end new style and script -->
</head>
<body bgcolor="#FFFFFF">


<div id="header">
    <tiles:insertAttribute name="header" />
</div>

<div id="sidebar" style="margin-top:0.3%;margin-left:-1%;height:2510px">
    
<div style="height:500px;width:250px;float:left;margin-left:5%;margin-top:10%">
<!-- ----------new code for hide and expand -->
<div class="accordion">
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-1" style="text-decoration:none;pointer:mouse;color:white;">DETAIL NAVIGATION&#9660;</a>
				<div id="accordion-1" class="accordion-section-content">
					<ul>
					<li><a href="<s:url action="WorkingTime"/>" style="text-decoration:none;pointer:mouse"> Working Time</a> </li>
					<li><a href="<s:url action="AttendanceQuery"/>" style="text-decoration:none;pointer:mouse">Attendance Query</a></li>
					<li><a href="<s:url action="LeaveOverview"/>" style="text-decoration:none;pointer:mouse;color:pink"> Leave Overview & Request</a></li>
					<li><a href="<s:url action="LeaveEnhancement"/>" style="text-decoration:none;pointer:mouse"> Leave Encashment</a></li>
					<li><a href="<s:url action="PaidHolidayCalendar"/>" style="text-decoration:none;pointer:mouse">Paid Holiday Calender
</a></li>
					
					
					</ul>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			
		</div><!--end .accordion-->

<!-- --------end hide and expand--- -->


</div>
</div>
<center><h2>Leave Overview</h2></center>
<div id="footer" style="margin-left:-1%">
    <tiles:insertAttribute name="footer" />
   </div> 
    
   </body>
</html>