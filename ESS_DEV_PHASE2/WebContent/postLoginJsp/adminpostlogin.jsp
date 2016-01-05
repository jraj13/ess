
 <%@ taglib prefix="s" uri="/struts-tags" %>
  <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
  <!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">


<script type="text/javascript">
function loadPage(url, dataString) {
$('#content').html('<img src="images/loading.gif">');
		$.ajax({
			url : url,
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {

				$('#content').html(data)

			},
			error : function(jqXHR, textStatus, errorThrown) {

			}
		});

	}
function qryPage(url, dataString) {

	$('#qrySuccess').html('<img src="images/loading.gif">');
	$.ajax({
		url : url,
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {

			$('#qrySuccess').html(data)

		},
		error : function(jqXHR, textStatus, errorThrown) {

		}
	});

}

function atndQryRslt(id) {

	alert("Am In Btn Click");

	$('#qryload').html('<img src="images/loading.gif" >');
	$.ajax({
		url : 'url',
		type : 'POST',
		data : dataString,
		datatype : 'json',
		success : function(data) {

			$('#qryload').html(data)

		},
		error : function(jqXHR, textStatus, errorThrown) {

		}
	});

}


	$(function() {	
		
	$("#info").click(function() {

	//	alert("Am frm Info");

	 $('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
	// $('#sidebar').load('postLoginJsp/ATND/atnd_menu1.jsp');
		
		
		loadPage('postLoginJsp/PI/personalProfile.jsp', '');
		//loadPage('postLoginJsp/PI/personalinfo_menu1.jsp', '');

	})
	//employee self service
	$("#ess").click(function() {
		  /*  $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/empSelfService.jsp', ''); */
		
	  $('#sidebar').load('postLoginJsp/PI/personalinfo_menu1.jsp');
		loadPage('postLoginJsp/PI/personalProfile.jsp', '');
		
	})
	//manager services
	$("#ms").click(function() {
		//alert("you can not access!!!please contact to ADMIN");
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/managerserviece.jsp', '');
	})
	
	// employee life cycle
	$("#elc").click(function() {
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/empLifeCycle.jsp', '');
		
	})
	
	//hr Dashboard
	$("#hrd").click(function() {
		//alert("you can not access!!!please contact to ADMIN");
			/* var id=1;
			 window.location = "HRDashboard?id=" +id;  */
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
			loadPage('postLoginJsp/PI/hr.jsp', '');
			 
	})
	//employee offers
	$("#eos").click(function() {
		//alert("you can not access write now");
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/empOffers.jsp', '');
	})
	//benfits & payments
	$("#bpay").click(function() {
		
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/benfitsPayments.jsp', '');
		//alert("you can not access write now");
	})
	//travel management
	$("#tmt").click(function() {
		//alert("you can not access write now");
		 $('#sidebar').load('postLoginJsp/PI/sideMenu.jsp');
		loadPage('postLoginJsp/PI/travelManagement.jsp', '');
		
	})
	
	
	})
	
	$(function() {
	
	$("#atnd").click(function() {

		//alert("Am frm Info");

	 $('#sidebar').load('postLoginJsp/ATND/atnd_menu.jsp');
		
		loadPage('postLoginJsp/ATND/worktime.jsp', '');
		//loadPage('postLoginJsp/PI/personalinfo_menu1.jsp', '');

	})
	})
	
	
	function openPage(id) {

		//alert(id);

		var url, dataString;

		if (id == "PROF") {

			url = "postLoginJsp/PI/personalProfile.jsp";
			dataString = "";

		} else if (id == "QAL") {

			url = "postLoginJsp/PI/qualification.jsp";
			dataString = "";

		} else if (id == "PE") {

			url = "postLoginJsp/PI/previousEmployer.jsp";
			dataString = "";

		} else if (id == "NOM") {

			url = "postLoginJsp/PI/nominations.jsp";
			dataString = "";

		} else if (id == "PAN") {

			url = "postLoginJsp/PI/panRetrials.jsp";
			dataString = "";

		} else if (id == "PHC") {

			url = "postLoginJsp/ATND/publicholiday.jsp";
			dataString = "";

		} else if (id == "ATNDQRY") {

			url = "postLoginJsp/ATND/attendancequery.jsp";
			dataString = "";

		} else if (id == "PWRKTYM") {

			url = "postLoginJsp/ATND/worktime.jsp";
			dataString = "";

		} else if (id == "LOVAR") {

			url = "postLoginJsp/ATND/leaveoverview.jsp";
			dataString = "";

		} else if (id == "LR") {
			

			url = "postLoginJsp/ATND/leaverequesttest.jsp";
			dataString = "";

		} else if (id == "LE") {

			url = "postLoginJsp/ATND/leaveEncashment.jsp";
			dataString = "";
			
		}else if (id == "ta") {

				url = "postLoginJsp/ATND/timeaccounts.jsp";
				dataString = "";
		}/* else if (id == "lrs") {

					url = "postLoginJsp/ATND/leaverequest.jsp";
					dataString = "";

		} */ else if (id == "qryBtn") {

			

			var month = $('#month').val();

			var year = $('#year').val();

			

			if (month == "none selected" || year == "none selected") {

				alert("Please Select Month ! ");

				return false;

			} else {
				alert(" month==="+month+"Year==="+year);

				var url = 'postLoginJsp/ATND/attendancequerySuccess.jsp'; 
				/* var url = 'AttendanceDetails.java'; */
				var dataString = 'month=' + month + '&year=' + year;

				

				qryPage(url, dataString);

				return true;

			}
		}
		
		/* else if (id == "delBtn") {
			var sid = $('#sid').val(); 
			
			if (confirm("Are you sure to delete this record???")) {

				
				alert("succesfully deleted record:" + sid);
				
				
				var url = 'postLoginJsp/ATND/leaveOverviewActionRslt.jsp';
				var dataString = "&sid="+sid;

			}else {
				return false;

			}
			alert("succesfully deleted record:" + sid);

			leaveOvrvwSuccess(url, dataString);

			return true;

		} */
		 else if (id == "editSub") {
			 

			url = "postLoginJsp/ATND/leaveOverviewEditSuccess.jsp";
			dataString = "";

		} 
		loadPage(url, dataString);

	}

	</script>
	
	<script type="text/javascript">
	function confirm_deletion(sid) {
		
		//alert(sid);
		if (confirm("Are you sure you want to delete this recored?")) {
			//window.location = "postLoginJsp/ATND/leaveOverviewActionRslt.jsp?sid=" + sid ;
alert("succesfully deleted record:" + sid);
			var url = 'postLoginJsp/ATND/leaveOverviewDelete.jsp';
			var dataString = "&sid="+sid;

		} else {
			
			return false;
		}
		
		loadPage(url, dataString);

		return true;
	}
	
	/* function parent_disable() {
	if(popupWindow && !popupWindow.closed)
	popupWindow.focus();
	} */
	function child_open(atndId)
	{
		//alert('am in openFormEdit========'+atndId);
		//var atndId=atndId;
		
		var sid =atndId;
		/* var sid = $('#sid').val(); */
		//alert('am in openFormEdit========'+sid);
		var tol = $('#tol').val();
		var sd = $('#sd').val();
		var st = $('#st').val();
		var ed = $('#ed').val();
		var et = $('#et').val();
		var np = $('#np').val();
		var ss = $('#ss').val();
		var used = $('#used').val();
		

	popupWindow =window.open('postLoginJsp/ATND/LeaveoverviewEdit.jsp?sid='+sid+'&tol='+tol+'&sd='+sd+'&st='+st+'&ed='+ed+'&et='+et+'&np='+np+'&ss='+ss+'&used='+used,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200");
	
	}	
	function parent_disable() {
	if(popupWindow && !popupWindow.closed)
	popupWindow.focus();
	}

</script>  
	
<style>
table, th, td {
	border: 1px solid black;
	width
	="100";
}
</style>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>EMPLOYEE SELF SERVICE</title>

	<!--=== CSS ===-->

	<!-- Bootstrap -->
	<link href="bootstrapN/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

	<!-- jQuery UI -->
	<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
	<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

	<!-- Theme -->
	<link href="assets/css/main.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="assets/css/fontawesome/font-awesome.min.css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

	<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

	<!--=== JavaScript ===-->

	<script type="text/javascript" src="assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>

	<script type="text/javascript" src="bootstrapN/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/libs/lodash.compat.min.js"></script>

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

	<!-- Smartphone Touch Events -->
	<script type="text/javascript" src="plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="plugins/event.swipe/jquery.event.swipe.js"></script>

	<!-- General -->
	<script type="text/javascript" src="assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="plugins/respond/respond.min.js"></script> <!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
	<script type="text/javascript" src="plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.slimscroll.min.js"></script>

	<!-- Page specific plugins -->
	<!-- Charts -->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.resize.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.time.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.growraf.min.js"></script>
	<script type="text/javascript" src="plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

	<script type="text/javascript" src="plugins/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="plugins/blockui/jquery.blockUI.min.js"></script>

	<script type="text/javascript" src="plugins/fullcalendar/fullcalendar.min.js"></script>

	<!-- Noty -->
	<script type="text/javascript" src="plugins/noty/jquery.noty.js"></script>
	<script type="text/javascript" src="plugins/noty/layouts/top.js"></script>
	<script type="text/javascript" src="plugins/noty/themes/default.js"></script>

	<!-- Forms -->
	<script type="text/javascript" src="plugins/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="plugins/select2/select2.min.js"></script>

	<!-- App -->
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins.js"></script>
	<script type="text/javascript" src="assets/js/plugins.form-components.js"></script>

	<script>
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
	</script>

	<!-- Demo JS -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<script type="text/javascript" src="assets/js/demo/pages_calendar.js"></script>
	<script type="text/javascript" src="assets/js/demo/charts/chart_filled_blue.js"></script>
	<script type="text/javascript" src="assets/js/demo/charts/chart_simple.js"></script>
</head>

<body style="height:0px">

	<!-- Header -->
	<header class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">

			<!-- Only visible on smartphones, menu toggle -->
			<ul class="nav navbar-nav">
				<li class="nav-toggle"><a href="javascript:void(0);" title=""><i class="icon-reorder"></i></a></li>
			</ul>

						<%
							String id1=(String)session.getAttribute("loginid");
							 String names[]=id1.split("\\@");
						      String id11=names[0];
						%>
			<a class="navbar-brand"  style="text-decoration:none;">
				<H6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome &nbsp;&nbsp;<%=id11 %></H6> 
				<%-- <span class="username"> Welcome &nbsp;&nbsp;<%=id1 %></span> --%>
			</a>

			<!-- Logo -->
			<a class="navbar-brand"  style="text-decoration:none;">
				<img src="images/clocksoftlogo.jpg" alt="logo" style="width:55px" />
				<strong>Nali Clock software Solutions</strong>
			</a>
			<!-- /logo -->
 

			<!-- Top Right Menu -->
			<ul class="nav navbar-nav navbar-right">
				
	<!-- Project Switcher Button -->

				<!-- User Login Dropdown -->
				<li>
					<a href="<s:url action="home"/>" style="text-decoration:none;pointer:mouse">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Help</span>
					</a>
				</li>
			<ul class="nav navbar-nav navbar-right">
				
	<!-- Project Switcher Button -->

				<!-- User Login Dropdown -->
				<li>
					<a href="<s:url action="Adminhome"/>" style="text-decoration:none;pointer:mouse">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Home</span>
					</a>
				</li>
                
                
                <ul class="nav navbar-nav navbar-right">
				
		<!-- Project Switcher Button -->

				<!-- User Login Dropdown -->
				<li>
					<a href="<s:url action="LogoutAction"/>" style="text-decoration:none;pointer:mouse">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<span class="username">Log Off</span>
					</a>
				</li>
                
               <%--  <li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<i class="icon-male"></i>
						<%
							String id=(String)session.getAttribute("loginid");
							System.out.println("id===="+id);
						
						%>
						<span class="username"> Welcome &nbsp;&nbsp;<%=id %></span>
						<i class="icon-caret-down small"></i>
					</a>
					<ul class="dropdown-menu">
		 				
						<!-- <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li> -->
						<li><a href="<s:url action="LogoutAction"/>" style="text-decoration:none;pointer:mouse"><i class="icon-key"></i>Log Out</a></li>
					</ul>
				</li> --%>
				<!-- /user login dropdown -->
				
			</ul>
			<!-- /Top Right Menu -->
            
		</div>
		<!-- /top navigation bar -->

		
        
        
        <!----------second header------------->
        
        <!-- Top Navigation Bar -->
		<!--   background:#63A2CF -->
		<div class="container"  style="background:#63A2CF; border-bottom:2px solid #4D7496;">
	<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li>
					<div id="ess" style="cursor:pointer;width:170px;background-color:#63A2CF;border-left:0px ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee Self Services
					</div>
				</li>
                <li>
					<div id="ms" style="cursor:pointer;width:170px; background-color:#63A2CF;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manager Services
					</div>
				</li>
                <li>
					<div id="elc" style="cursor:pointer;width:170px; background-color:#63A2CF;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee life cycle
					</div>
				</li>
                
                  <li>
					 <div id="hrd" style="cursor:pointer;width:170px;background-color:#63A2CF; ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HR Dashboard
					</div> 
					<%-- <a href="<s:url action="HRDashboard" />" style="text-decoration:none;pointer:mouse;color:white">HR Dashboard</a>  --%>
				</li>
                
				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Dropdown
						<i class="icon-caret-down small"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="icon-user"></i> Example #1</a></li>
						<li><a href="#"><i class="icon-calendar"></i> Example #2</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-tasks"></i> Example #3</a></li>
					</ul>
				</li> -->
			</ul>
			<!-- /Top Left Menu -->
            
            
            
		</div>
		  <!---------------end second header--------->
          
          
          
          
          
        
        <!---------third header------------->
        
        <!-- Top Navigation Bar -->
		<div class="container" style="background:#63C0ED">
	<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li>
					<%-- <a href="<s:url action="personal_info_menu" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%>
					 <%-- <a href="<s:url action="personlaMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">PERSONAL INFO</a> --%> 
						
					<div id="info" style="cursor:pointer;width:170px ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal Information&nbsp;&nbsp;</div> 
				</li>
                <li>
					<div id="eos" style="cursor:pointer;width:170px ">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee offers
					</div>
				</li>
                <li>
					<%-- <a href="<s:url action="attandenceMenuAction" />" style="text-decoration:none;pointer:mouse;color:white">Attendance/Leave</a> --%>
					<div id="atnd" style="cursor:pointer;width:150px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Attendance/Leave</div> 	
				</li>
                
                  <li>
					<div id="bpay" style="cursor:pointer;width:170px ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Benifits & Payments
					</div>
				</li>
                
                
				<li class="dropdown">
					<div id="tmt" style="cursor:pointer;width:170px ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Travel Managment
						<!-- <i class="icon-caret-down small"></i> -->
					</div>
					<!-- <ul class="dropdown-menu">
						<li><a href="#"><i class="icon-user"></i> Example #1</a></li>
						<li><a href="#"><i class="icon-calendar"></i> Example #2</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-tasks"></i> Example #3</a></li>
					</ul> -->
				</li>
			</ul>
			<!-- /Top Left Menu -->
            
            
            
		</div>
		  <!---------------end Third header--------->
          
        
	</header> <!-- /.header -->
    
    
    
    <!------new added header-------->
    
    
    <!-----end new added header------------->

	<div id="container" >
	<!-- Sidebar -->
		<div id="sidebar" class="sidebar-fixed" style="margin-top:21px">
		 <%-- <jsp:include page="postLoginJsp/PI/personalinfo_menu1.jsp"> </jsp:include>  --%>
			
		</div>
		
		<!-- end Sidebar -->
<!-- body -->
		<div id="content">
		
		<br>
<%
	String empPersonalInfo=EmployeeDetailsPersonal.getPersonalInfo();
System.out.println("empPersonalInfo===="+empPersonalInfo);

String empPersonalInfoAry[]=empPersonalInfo.split("\\^");

String empId = empPersonalInfoAry[0];
String empFname =empPersonalInfoAry[1];
String empLname =empPersonalInfoAry[2];
String joiningDate=empPersonalInfoAry[3];
String empDob = empPersonalInfoAry[4];
String empDesig = empPersonalInfoAry[5];
String empEmail =empPersonalInfoAry[6];
String repManager = empPersonalInfoAry[7];
String empCtc = empPersonalInfoAry[8];
%>

 <table  align="center" >

<tr>
<col width="130">
<col width="130">
<td><b>EMP ID</b></td> <td><%=empId %></td></tr>
<tr><td><b>FIRST NAME</b></td><td><%=empFname %></td></tr>
<tr><td><b>LAST NAME</b></td><td><%=empLname %></td></tr>
<tr><td><b>JOINING DATE</b></td><td><%=joiningDate %></td></tr>
<tr><td><b>DOB </b></td><td><%=empDob %></td></tr>
<tr><td><b>DESIGNATION</b></td><td><%=empDesig %></td></tr>
<tr><td><b>EMAIL</b></td><td><%=empEmail %></td></tr>
<tr><td><b>REPORTING MANAGER</b></td> <td><%=repManager %></td></tr>
<tr><td><b>CTC</b></td><td><%=empCtc %></td></tr>

</table>

		
			
		</div>
		<!-- end body -->
	</div>

</body>
</html>