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
    
<div style="height:500px;width:250px;float:left;margin-left:5%;margin-top:3%">


<!-- ----------new code for hide and expand -->


		<div class="accordion">
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-1" style="text-decoration:none;pointer:mouse;color:white;">DETAIL NAVIGATION&#9660;</a>
				<div id="accordion-1" class="accordion-section-content">
					<ul>
					<li><a href="<s:url action="Personal_details"/>" style="text-decoration:none;pointer:mouse"> Personal information</a> </li>
					<li><a href="<s:url action="Personal_profile"/>" style="text-decoration:none;pointer:mouse">Personal profile</a></li>
					<li><a href="<s:url action="Personal_qualification"/>" style="text-decoration:none;pointer:mouse"> Qualification</a></li>
					<li><a href="<s:url action="Previous_emp"/>" style="text-decoration:none;pointer:mouse;color:pink"> Previous Employer</a></li>
					<li><a href="<s:url action="Emp_nominations"/>" style="text-decoration:none;pointer:mouse">Nominations</a></li>
					<li><a href="<s:url action="pan_retailers"/>" style="text-decoration:none;pointer:mouse">PAN/Retirals</a></li>
					
					</ul>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			
		</div><!--end .accordion-->

<!-- --------end hide and expand--- -->

<%-- <div style="height:2px;width:250px;float:left;margin-left:1%">
<a href="jsp2/${applicationScope.hashMap['working_time']}" style="text-decoration:none;pointer:mouse;color:white;"><h3>Working Time </h3></a>
<a href="<s:url action="Personal_Info"/>" style="text-decoration:none;pointer:mouse;color:white;"><h3>Personal Information </h3></a>
</div>

<div style="height:2px;width:250px;float:left; margin-top:20%;margin-left:1%">
<a href="jsp2/${applicationScope.hashMap['attendance_query']}" style="text-decoration:none;pointer:mouse;color:white;"><h3>Attendance Query</h3></a>
<a href="<s:url action="Personal_profile"/>" style="text-decoration:none;pointer:mouse;color:white;"><h3>Personal Profile</h3></a>
</div>

<div style="height:2px;width:750px;float:left; margin-top:20%;margin-left:1%">
 <a href="jsp2/${applicationScope.hashMap['leave_overview']}" style="text-decoration:none;pointer:mouse;color:white;"><h3>Leave Overview or Request</h3></a>
<a href="<s:url action="Personal_qualification"/>" style="text-decoration:none;pointer:mouse;color:white;"><h3> Qualification</h3></a>

</div>
                        
<div style="height:2px;width:250px;float:left; margin-top:20%;margin-left:1%">              
<!--  <a href="Leave_inhancement.jsp" style="text-decoration:none;pointer:mouse;color:white;"><h3>Leave Inhancement</h3></a></b> -->
 <a href="<s:url action="Previous_emp"/>" style="text-decoration:none;pointer:mouse;color:white;"><h3>Previous Employer</h3></a></b>
</div>

<div style="height:2px;width:250px;float:left; margin-top:20%;margin-left:1%">
<!-- <a href="paid_holiday_calendar.jsp" style="text-decoration:none;pointer:mouse;color:white;"><h3>Paid Holiday Calendar</h3></a></b> -->
<a href="<s:url action="Emp_nominations"/> " style="text-decoration:none;pointer:mouse;color:white;"><h3>Nominations</h3></a></b>

</div>

<div style="height:2px;width:250px;float:left; margin-top:20%;margin-left:1%">
<!-- <a href="paid_holiday_calendar.jsp" style="text-decoration:none;pointer:mouse;color:white;"><h3>Paid Holiday Calendar</h3></a></b> -->
<a href="<s:url action="pan_retailers"/> " style="text-decoration:none;pointer:mouse;color:white;"><h3>PAN/Retirals</h3></a></b>

</div>
 --%>



</div>

</div>
<center>
<h2>Previous Employer</h2></center>

<div id="footer" style="margin-left:-1%">
    <tiles:insertAttribute name="footer" />
   </div> 
    
   </body>
</html>