<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" java.sql.*" %>
    
    
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
					<li><a href="<s:url action="AttendanceQuery"/>" style="text-decoration:none;pointer:mouse;color:pink">Attendance Query</a></li>
					<li><a href="<s:url action="LeaveOverview"/>" style="text-decoration:none;pointer:mouse"> Leave Overview & Request</a></li>
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
<center><h2 style="background-color:#B0C4DE">Attendance Query </h2></center>

<body>

<h3 style="background-color:#B0C4DE">Enter Month And Year</h3>
&nbsp;&nbsp;&nbsp;&nbsp;<label for="tdate">Todays Date :</label>
<input type="text" name="tdate" value="<%= new java.util.Date() %>" size="20"/><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;<label for="monthlist">Month :</label>
<select name="monthlist">
<option value="none selected">select</option>
<option value="1">Jan</option>
<option value="2">Fab</option>
<option value="3">Mar</option>
<option value="4">Apr</option>
<option value="5">May</option>
<option value="6">Jun</option>
<option value="7">Jul</option>
<option value="8">Aug</option>
<option value="9">Sep</option>
<option value="10">Oct</option>
<option value="11">Nov</option>
<option value="12">Dec</option>
</select>&nbsp;&nbsp;
 <label for="tdate">Year :</label><input type="text" size="7">
 <br><br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<s:url action="Attendancequery_success"/>" style="text-decoration:none;pointer:mouse;BACKGROUND-COLOR:BLACK;COLOR:WHITE">DISPLAY</a> 
 
<h3 style="background-color:#B0C4DE">Attendance Status</h3>

 






   


<div id="footer" style="margin-left:-1%">
    <tiles:insertAttribute name="footer" />
   </div> 
    
   </body>
</html>