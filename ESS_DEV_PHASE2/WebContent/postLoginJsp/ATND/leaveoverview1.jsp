<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>



<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Leave Overview & Request</title>

<link rel="stylesheet" href="../js/jquery-ui.css">
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/jquery-ui.js"></script>
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css" />
<!-- <script src="../js/jquery-1.7.1.min.js" > </script>
<script src="../js/jquery-ui-1.8.16.custom.min.js" > </script>
<script src="../js/custom.min.js"></script>
<script src="../js/jquery-1.10.1.min.js"></script>
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/jquery-ui.js"></script> -->

<style>
.blue a.ui-state-default {
    background-color: green;
    background-image: none;
}
.red  a.ui-state-default{
    background-color: #FFFF00;
    background-image: none;
}
.green  a.ui-state-default{
    background-color: #CC9999;
    
    background-image: none;
}

.ui-datepicker-week-end, .ui-datepicker-week-end a.ui-state-default {
color: #C00;
}

/* .ui-datepicker-calendar a.ui-state-default { background: cyan; } */

.ui-datepicker-calendar td.ui-datepicker-today a { background: red; } /* Today */
.ui-datepicker-calendar a.ui-state-hover { background: yellow; } /*  Hovered date */

.ui-datepicker-calendar a.ui-state-active { background: lime; } /*  Selected date */

</style>
<!-- 
<link rel="stylesheet" href="../../date/jquery-ui.css">
<script src="../../date/jquery-1.10.2.js"></script>
<script src="../../date/jquery-ui.js"></script>
 -->
 <script>
	$(function($) {
		$("#datepicker").datepicker({
			numberOfMonths : 3,
			showCurrentAtPos : 1,
			showButtonPanel : false

		});

	});
	$(function($) {
		$("#datepickers").datepicker({
			numberOfMonths : 3,
			showCurrentAtPos : 1,
			showButtonPanel : false

		});

	});
</script>

<script>
	$(function($) {
		$(document).ready(function() {
			$("#datepicker1").datepicker();
		});
	});

	$(function($) {
		$(document).ready(function() {
			$("#datepicker2").datepicker();
		});
	});
	/* })(jQuery); */
</script>


<!--  END DATE PICKER 2 -->
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet" href="../css/style2.css">
<link rel="stylesheet" href="../css/style3.css">



<script>
	/* $(function() {

	 $('#submit').click(function() {

	 alert("Am In Btn Click apply leave");
	
	 var choice1 = $('#choice1').val();
	 var desc1=$('#desc1').val();
	 var date1 = $('#datepicker1').val();
	 var date2 = $('#datepicker2').val();
	 var mob = $('#phnum').val();
	 var eid=$('#eid').val();
	 var absence=$('#absence').val();
	 var calendar=$('#calendar').val();
	 var txtarea=$('#txtarea').val()
	
	 var dataString = "ltype=" + choice1 + "desc1=" + desc1 +"&date1=" + date1+ "&date2=" +date2+ "&mob=" +mob+ "&eid=" +eid+ "&absence=" +absence+ "&calendar=" +calendar+ "&txtarea=" +txtarea;

	 alert("dataString..."+dataString);
	 $.ajax({

	 url : 'calendarLeaveApply.jsp',
	 type : 'POST',
	 data : dataString,
	 datatype : 'json',
	 success : function(data) {

	 alert("Am cumin");

	 $('#qryload').html(data).delay(5000).fadeOut();

	 },
	 error : function(jqXHR, textStatus, errorThrown) {

	 }
	 });

	 })
	 });
	 */

	$(function() {
		/* 	$("#datepicker1").datepicker(); */

		$('#submit').click(
				function() {

					alert("Am In Btn Click");

					var choice1 = $('#choice1').val();
					var desc1 = $('#desc1').val();
					var date1 = $('#datepicker1').val();
					var date2 = $('#datepicker2').val();
					var mob = $('#phnum').val();
					var eid = $('#eid').val();
					var absence = $('#absence').val();
					var calendar = $('#calendar').val();
					var txtarea = $('#txtarea').val()

					var dataString = "ltype=" + choice1 + "desc1=" + desc1
							+ "&date1=" + date1 + "&date2=" + date2 + "&mob="
							+ mob + "&eid=" + eid + "&absence=" + absence
							+ "&calendar=" + calendar + "&txtarea=" + txtarea;

					alert("dataString..." + dataString);

					$.ajax({

						url : 'calendarLeaveApply.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							alert("Am cumin");

							$('#qryload').html(data).delay(5000).fadeOut();

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});

				})
	});
</script>

</head>

<script>
	/* function for geting description value */
	function run() {

		document.getElementById("desc1").value = document
				.getElementById("choice1").value;
		var dop = document.getElementById("desc1").value;
	}

	function formvalidation() {
		alert("form validate");
		var desc1 = document.getElementById("desc1").value;
		if (desc1 == " ") {

			alert("Please select Type of Leave");
			return false;

		}
	}
</script>

<body>


	<!------------main cocntiner--------------->
	<div class="main">
		<h4>Leave Request:New</h4>

		<!------------conatiner----------->
		<div class="container">

			<h3>Choice Pay Overview</h3>

			<h6>

				Effective From: &nbsp;<input name="04-May-2015" type="text"
					value="04-May-2015" />
			</h6>

			<!--------alternative-code------------>

			<h3>Personal Calendar</h3>

			<div class="cd-tabs">

				<nav>
					<ul class="cd-tabs-navigation">
						<!--		</a>
			 	</li> -->
						<li><a data-content="new" href="#0">Calender</a></li>
						<li><a data-content="store" href="#0">Time Accounts</a></li>
						<li><a data-content="gallery" href="#0">Leave Request</a></li>

					</ul>
					<!-- cd-tabs-navigation -->
				</nav>

				<ul class="cd-tabs-content">
					<li data-content="inbox" class="selected">
						<div class="block_1">
							<h5>Personal Calender</h5>
							<h6>

								<div>
									<!-- <p> Hai</p>  -->
									<div id="datepicker"></div>

								</div>
							</h6>

						</div> <!-----------block_2 code--------------->
						<div class="block_2">
							<h5>Leave details</h5>
							<div class="section_1">

								<h6>Type of leave</h6>
								<hr />
								<label> Types of leave: </label> <select name="choice" size="1"
									onChange="jump(this.form)">
									<option value="">Type of Leave</option>
									<option value="">PL</option>
									<option value="">SL</option>
									<option value="">CL</option>
									<option value="">Advance PL</option>
									<option value="">OPH</option>
									<option value="">Advance SL</option>
									<option value="">Outdoor Duty</option>
									<option value="">Leave Without Pay(LWP)</option>
									<option value="">Present_Non ART Location</option>
									<option value="">Present-ART Not Working</option>
									<option value="">Paternity Leave</option>
								</select> <br /> <br /> <label> Description:<input id="desc"
									type="text" />
								</label>
								</form>
							</div>

							<div class="section_1">

								<h6>Adiition Data</h6>
								<hr />
								<form action="dummy" method="post">
									<label> Contact Number: </label> <input name="contactno"
										name="" type="text" class="cont"> <br /> <br /> <label>
										Description: &nbsp;&nbsp;Type of leave </label>
								</form>
							</div>

							<p>hhhhhhhhhhhhhhh</p>
						</div>
						<!--  -----------end block_2 code------- -->
					</li>

					<li data-content="new">
						<div class="block_1">
							<h5>Personal Calender</h5>
							<h6>
								<!-- Effective From: &nbsp;<input name="04-May-2015" type="text"
									value="04-May-2015" /> -->
							</h6>

							<!-- <input type="text" name="sdate" id="datepicker" /> -->
							<div id="datepickers"></div>

							<br>


						</div> <!-----------block_2 code--------------->
						<div class="block_2">
							<h5>Leave details</h5>
							<div class="section_1">

								<h6>Type of leave</h6>
								<hr />
								<!-- <form action="calendar.jsp" method="post"> -->
								<label> <span style="color: red; font-weight: bold">*</span>Types
									of leave:
								</label> <select id="choice1" name="choice1" size="1" onChange="run()"
									class="cont">
									<option value="Type of Leave">Type of Leave</option>
									<option value="PL">PL</option>
									<option value="SL">SL</option>
									<option value="CL">CL</option>
									<option value="Advance PL">Advance PL</option>
									<option value="OPH">OPH</option>
									<option value="Advance SL">Advance SL</option>
									<option value="Outdoor Duty">Outdoor Duty</option>
									<option value="Leave Without Pay(LWP)">Leave Without
										Pay(LWP)</option>
									<option value="Present_Non ART Location">Present_Non
										ART Location</option>
									<option value="Present-ART Not Working">Present-ART
										Not Working</option>
									<option value="Paternity Leave">Paternity Leave</option>
								</select> <br /> <br /> <label> Description:</label> <input id="desc1"
									type="text" name="desc1" class="cont" />
								<!-- 	</form> -->
							</div>

							<div class="section_1">

								<h6>Additional details</h6>
								<hr />
								<!-- 	<form action="dummy" method="post"> -->
								<label>Contact Num:</label> <input name="phno" id="phnum"
									type="text" class="cont"> <br /> <br /> <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<!-- 	</form> -->
							</div>

							<div class="section_1">

								<h6>General details</h6>
								<hr />
								<br />
								<!-- <form action="calendar.jsp" method="post"> -->


								<label><span style="color: red">*</span>Start Date :<input
									type="text" name="from" id="datepicker1" class="cont" /></label> <br />
								<br /> <label><span style="color: red">*</span>End Date
									:<input type="text" name="to" id="datepicker2" class="cont" /><br></label>
								<br /> <br /> <label>Absence Days: </label>&nbsp;&nbsp; <input
									id="absence" type="text" name="absence" value="0.00"
									class="cont" /> <br />
								<br /> <label>Calendar Days: </label>&nbsp;&nbsp; <input
									id="calendar" type="text" name="calendar" value="0.00"
									class="cont" /> <br /> <br /> <label>New Note:</label>
								<textarea cols="35" rows="3" name="txtarea" id="txtarea"
									class="cont"></textarea>
								<br /> <br /> <input type="hidden" name="eid" id="eid"
									value="YOGESH@CLOCKSOFT.INFO" /><br>
								<br>
								<center>
									<!-- <input type="submit" value="submit" /> -->
									<input type="button" value="APPLY" id="submit" />
								</center>
								<br>
								<br>
								<div id="qryload"></div>
								<!--  </form> -->
							</div>

						</div> <!-------------end block_2 code--------->


					</li>



					<li data-content="gallery">
						<table style="width: 100%">
							<tr style="background-color: #B4C2CF;">
								<th>Leave Type</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Start Time</th>
								<th>End Time</th>
								<th>Employee Name</th>
								<th>Personal Number</th>
								<th>Pending With</th>
								<th>Clock IN</th>
								<th>Clock Out</th>
								<th>Status</th>
							</tr>
							<%
								ArrayList<String> leareq = AttendanceDetails.getLeaverequest();
								if (leareq.size() > 0) {
									for (int i = 0; i < leareq.size(); i++) {
										String req = leareq.get(i).toString();
										String reqarr[] = req.split("\\^");
										String type_of_leave = reqarr[0];
										String start_date = reqarr[1];
										String end_date = reqarr[2];
										String start_time = reqarr[3];
										String end_time = reqarr[4];
										String employee_name = reqarr[5];
										String personal_number = reqarr[6];
										String pending_with = reqarr[7];
										String clock_in = reqarr[8];
										String clock_out = reqarr[9];
										String status = reqarr[10];
							%>
							<tr align="center">
								<td bgcolor="#D4DCE4"><%=type_of_leave%></td>
								<td bgcolor="#D4DCE4"><%=start_date%></td>
								<td bgcolor="#D4DCE4"><%=end_date%></td>
								<td bgcolor="#D4DCE4"><%=start_time%></td>
								<td bgcolor="#D4DCE4"><%=end_time%></td>
								<td bgcolor="#D4DCE4"><%=employee_name%></td>
								<td bgcolor="#D4DCE4"><%=personal_number%></td>
								<td bgcolor="#D4DCE4"><%=pending_with%></td>
								<td bgcolor="#D4DCE4"><%=clock_in%></td>
								<td bgcolor="#D4DCE4"><%=clock_out%></td>
								<td bgcolor="#D4DCE4"><%=status%></td>
							</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="10">No Records</td>
							</tr>

							<%
								}
							%>
						</table> <br>
					<br> <!-----------block_2 code--------------->
						<div class="block_2">
							<h5>Leave details</h5>
							<div class="section_1">

								<h6>Type of leave</h6>
								<hr />
								<form action="dummy" method="post">
									<label> <span style="color: red; font-weight: bold">*</span>Types
										of leave:
									</label> <select name="choice" size="1" onChange="jump(this.form)">
										<option value="">Type of Leave</option>
										<option value="">PL</option>
										<option value="">Leave Without Pay(LWP)</option>
										<option value="">Present-Non ART Location</option>
										<option value="">Present-ART Not Working</option>
										<option value="">Paternity Leave</option>
										<option value="">Joining Leave(JL)</option>
										<option value="">Transfer Leave(TL)</option>
										<option value="">Late Coming Regularization</option>
										<option value="">Early Going Regularization</option>
										<option value="">Maternity Leave (ML)</option>
										<option value="">Miscarraige Leave(MIL)</option>
									</select> <br /> <br />

									<!-- <label> Description: &nbsp;&nbsp;Type of leave </label>  -->
									<label> Description:</label> <input id="desc1" type="text"
										name="dsc1" class="cont" />
								</form>
							</div>

							<div class="section_1">

								<h6>Adiition details</h6>
								<hr />
								<form action="dummy" method="post">
									<label> Contact no: </label> <input name="" type="text"
										class="cont"> <br /> <br /> <label>
										&nbsp;&nbsp;&nbsp;&nbsp; </label>
								</form>
							</div>
							<!-- if suppose ending tag -->

							<div class="section_1">

								<h6>General details</h6>
								<hr />
								<form action="dummy" method="post">
									<label> <span style="color: red; font-weight: bold">*</span>Start
										Date
									</label> <input name="" type="text" class="cont"> <br /> <br />
									<!--  <br/> -->
									<label> <span style="color: red; font-weight: bold">*</span>End
										Date:
									</label> <input name="" type="text" class="cont"> <br /> <br />

									<label>Absence Days: </label>&nbsp;&nbsp; <input id="absence"
										type="text" name="absence" value="0.00" class="cont" /> <br />
									<br /> <label>Calendar Days: </label>&nbsp;&nbsp; <input
										id="calendar" type="text" name="calendar" value="0.00"
										class="cont" /> <br /> <br /> <label>New Note:</label>
									<textarea cols="35" rows="3" name="myname" class="cont"></textarea>
									<br /> <br />
								</form>

							</div>
							<!-------------end block_2 code--------->
					</li>

					<li data-content="store">
						<table style="width: 100%">
							<tr style="background-color: #B4C2CF;">
								<th>Leave Type</th>
								<th>Opening Balance</th>
								<th>Availed</th>
								<th>Pending with Approver</th>
								<th>Available Balance</th>
							</tr>
							<%
								ArrayList<String> acctime = AttendanceDetails.getLeavetimeAccounts();

								if (acctime.size() > 0) {
									for (int i = 0; i < acctime.size(); i++) {
										String timeover = acctime.get(i).toString();
										String timeoverAr[] = timeover.split("\\^");
										String leave_type = timeoverAr[0];
										System.out.println("leave type...." + leave_type);
										String opening_balance = timeoverAr[1];
										String availed = timeoverAr[2];
										String pending_with_approver = timeoverAr[3];
										String available_balance = timeoverAr[4];
							%>
							<tr align="center">
								<td bgcolor="#D4DCE4"><%=leave_type%></td>
								<td bgcolor="#D4DCE4"><%=opening_balance%></td>
								<td bgcolor="#D4DCE4"><%=availed%></td>
								<td bgcolor="#D4DCE4"><%=pending_with_approver%></td>
								<td bgcolor="#D4DCE4"><%=available_balance%></td>

							</tr>
							<%
								}
								} else {
							%>
							<tr>
								<td colspan="10">No Records</td>
							</tr>
							<%
								}
							%>
						</table> <!-----------block_2 code--------------->
						<div class="block_2">
							<h5>Leave details</h5>
							<div class="section_1">

								<h6>Type of leave</h6>
								<hr />
								<form action="dummy" method="post">
									<label> <span style="color: red; font-weight: bold">*</span>Types
										of leave:
									</label> <select name="choice" size="1" onChange="jump(this.form)">
										<option value="">Type of Leave</option>
										<option value="">PL</option>
										<option value="">Leave Without Pay(LWP)</option>
										<option value="">Present-Non ART Location</option>
										<option value="">Present-ART Not Working</option>
										<option value="">Paternity Leave</option>
										<option value="">Joining Leave(JL)</option>
										<option value="">Transfer Leave(TL)</option>
										<option value="">Late Coming Regularization</option>
										<option value="">Early Going Regularization</option>
										<option value="">Maternity Leave (ML)</option>
										<option value="">Miscarraige Leave(MIL)</option>
									</select> <br /> <br /> <label> Description:</label> <input id="desc1"
										type="text" name="dsc1" class="cont" />
								</form>
							</div>

							<div class="section_1">

								<h6>Adiition details</h6>
								<hr />
								<form action="dummy" method="post">

									<label> Contact no: </label> <input name="" type="text"
										class="cont"> <br /> <br /> <label>
										&nbsp;&nbsp;&nbsp;&nbsp; </label>
								</form>
							</div>

							<div class="section_1">

								<h6>General details</h6>
								<hr />
								<form action="dummy" method="post">
									<label> <span style="color: red; font-weight: bold">*</span>Start
										Date
									</label> <input name="" type="text" class="cont"> <br /> <br />
									<!--  <br/> -->
									<label> <span style="color: red; font-weight: bold">*</span>EndDate:
									</label> <input name="" type="text" class="cont"> <br /> <br />

									<label>Absence Days: </label>&nbsp;&nbsp; <input id="absence"
										type="text" name="absence" value="0.00" class="cont" /> <br />
									<br /> <label>Calendar Days: </label>&nbsp;&nbsp; <input
										id="calendar" type="text" name="calendar" value="0.00"
										class="cont" /> <br /> <br /> <label>New Note:</label>
									<textarea cols="35" rows="3" name="myname" class="cont"></textarea>
									<br /> <br />
								</form>
							</div>

						</div> <!-------------end block_2 code--------->
					</li>




				</ul>
				<!-- cd-tabs-content -->
			</div>
			<!-- cd-tabs -->

			<script src="../../js/jquery-2.1.1.js"></script>
			<script src="../../js/main.js"></script>



		</div>
		<!------------conatiner----------->
	</div>

	<!------------ end main cocntiner--------------->
</body>
</html>
