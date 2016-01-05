

<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>



<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="refresh" content="15"> -->
<title>Leave Overview & Request</title>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style2.css"> 
<link rel="stylesheet" href="css/style3.css">
<style>
.blue a.ui-state-default {
    background-color: green;
    background-image: none;
}
.ui-datepicker-week-end, .ui-datepicker-week-end a.ui-state-default {
color: #C00;
}

</style>


   <link rel="stylesheet" href="date/jquery-ui.css"/>
   
<script src="date/jquery-1.10.2.js"></script>

 <script src="date/jquery-ui.js"></script> 
 
 
 
 
 
 
										<!-- ###############script for dynamic color calendar##################### -->
										
	
<script>


var datesArray=[];
var strarr=[];    
var hdates=document.getElementById("result").value;

  
var ss=hdates.replace("\[",'');
var se=ss.replace("\]",'');
var sd=se.replace(/\s/g, '');


strarr=$.trim(sd).split(",");

for(var i =0;i<strarr.length;i++){
  datesArray.push(strarr[i]);
}


$(function($) { 
	$('#datepickers').datepicker({
		numberOfMonths : 3,
		//showCurrentAtPos : 1,
		 beforeShowDay: colorize
});
});

 $(function($) { 
		$('#datepickerss').datepicker({
			numberOfMonths : 3,
			//showCurrentAtPos : 1,
			 beforeShowDay: colorize
	});
	});

 function colorize(date) {
		
	    mdy = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();
	    if ($.inArray(mdy, datesArray) > -1) {
	        return [true, "blue","public holiday"];
	    } 
	        
	        else {
	        return [true, ""];
	    }
	}  
 </script>
 
 
 
 <script>
 var day1;
 var day2;
  $(function($) {
	  
	  $('#datepicker1').datepicker({

	              onSelect: function(dateStr) {
	            	  var min = $("#datepicker1").datepicker('getDate');
	                    day1 = $("#datepicker1").datepicker('getDate');
	                  
	                    
	                    $("#datepicker2").datepicker('option', 'minDate', min || '0');
	                    //datepicked();
	              }
	        });

});
 
 
$(function($) {
	  $('#datepicker2').datepicker({
	  
	              onSelect: function(dateStr) {
	                    var max = $(this).datepicker('getDate');
	                    day2 = $(this).datepicker('getDate');
	                    $("#datepicker1").datepicker('option', 'maxDate', max || '+1Y');
	                    
	                    datepicked();   
	              }
	        });
	     });
	 
 

  function datepicked() {
		var from = day1;
		
	    var to =day2;
	    var nights = $("#absence1");

	    var startDate = from;

	    var endDate = to;


	// Validate input
	if (endDate && startDate) {


	// Calculate days between dates
	var millisecondsPerDay = 86400 * 1000; // Day in milliseconds
	startDate.setHours(0,0,0,1);  // Start just after midnight
	endDate.setHours(23,59,59,999);  // End just before midnight
	var diff = endDate - startDate;  // Milliseconds between datetime objects    
	var days = Math.ceil(diff / millisecondsPerDay);
	var days1 = Math.ceil(diff / millisecondsPerDay);

	// Subtract two weekend days for every week in between
	var weeks = Math.floor(days / 7);
	var days = days - (weeks * 2);

	// Handle special cases
	var startDay = startDate.getDay();
	var endDay = endDate.getDay();


	// Remove weekend not previously removed.   
	if (startDay - endDay > 1)         
	    var days = days - 2;      

	// Remove start day if span starts on Sunday but ends before Saturday
	if (startDay == 0 && endDay != 6)
	    var days = days - 1;  

	// Remove end day if span ends on Saturday but starts after Sunday
	if (endDay == 6 && startDay != 0)
	   var days = days - 1;  

	 
	  
	   $("#calendar1").val(days1);
	    
	   
	nights.val(days);

	    }
	    }
  
 
  

 </script>
 
 <script>
	/* function for geting description value */
	function run1() {

	document.getElementById("desc1").value = document.getElementById("choice1").value;
		var dop = document.getElementById("desc1").value;
	}

	function formvalidation() {
		alert("form validate");
		var desc1 = document.getElementById("desc1").value;
		if (desc1 == " ") 
		{

			alert("Please select Type of Leave");
			return false;

		}
	}
	</script>
	<script>
	function onlyNumbers(event) {
		 var mobile=document.getElementById("phnum1").value;
	     var e = event || evt; // for trans-browser compatibility
	     var charCode = e.which || e.keyCode;
	     if (charCode > 31 && (charCode < 48 || charCode > 57))
	    	 {
	         return false;
	    	 }
	     else if(mobile.length>9){
	    	 alert("You are already Entered 10 Digits");
	    	 return false;
	     }
	     return true;
	 }
	 
	 </script>
	 <script>
	 function verify()
	 {
		
		 var mobile=document.getElementById("phnum1").value;
		 if(mobile.length<10)
			 {
			 document.getElementById("phnum1").focus();
			 alert("Please Enter  10 Digits Phone Number");
			 window.setTimeout(function ()
					    {
				document.getElementById('phnum1').focus();
					    }, 0);
			 document.getElementById('phnum1').value="";
					    return false;
			 }
		return true;
	 }
	</script>
	<script> 
	
	/* $(function() {
		$('#submit1').click(
				function() {

					

					var choice1 = $('#choice1').val();
					var desc1 = $('#desc1').val();
					var date1 = $('#datepicker1').val();
					var date2 = $('#datepicker2').val();
					var mob = $('#phnum1').val();
					var eid = $('#eid1').val();
					var absence = $('#absence1').val();
					var calendar = $('#calendar1').val();
					var txtarea = $('#txtarea1').val();

					var dataString = "&ltype=" + choice1 + "&desc1=" + desc1
							+ "&date1=" + date1 + "&date2=" + date2 + "&mob="
							+ mob + "&eid=" + eid + "&absence=" + absence
							+ "&calendar=" + calendar + "&txtarea=" + txtarea;

					//alert("dataString..." + dataString);

					$.ajax({

						url : 'postLoginJsp/ATND/calendarLeaveApply.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							alert("am in jquery");

							$('#lrmain').html(data).delay(5000).fadeOut();
							//return window.location.reload();
							//location.reload(true);

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});

				})
	}); */
	
	$(function() {
		$('#submit1').click(
				function() {

					//alert("Am In Btn Click leaverequest");

					
					var choice1 = $('#choice1').val();
					var desc1 = $('#desc1').val();
					var date1 = $('#datepicker1').val();
					var date2 = $('#datepicker2').val();
					var mob = $('#phnum1').val();
					var eid = $('#eid1').val();
					var absence = $('#absence1').val();
					var calendar = $('#calendar1').val();
					var txtarea = $('#txtarea1').val();

					/* if(choice1=="" && mob=="" && date1=="" &&date2=="")
					{
					alert("Please Enter Mandatory(*) Feilds");
					return false;
					} */
					if(desc1=="" && mob=="" && date1=="" &&date2=="")
					{
					alert("Please Enter Mandatory Feilds(*)");
					return false;
					}
					  if(desc1.toString() == ""){alert("Please Enter A Types Of Leave");choice1.focus();return false;}
					  if(mob.toString() == ""){alert("Please Enter Your Contact Number.");mob.focus();return false;}
					  if(mob.length<10){ alert("You are not Entered 10 Digits Contact Number"); return false;}
				      if(date1.toString() == ""){alert("Please Select Start Date.");date1.focus();return false;}
				      if(date2.toString() == ""){alert("Please Select End Date.");date2.foucs();return false;}
				    
			

			
					else{
					//alert("am in else")
				      
					
					var dataString = "&ltype=" + choice1 + "&desc1=" + desc1
							+ "&date1=" + date1 + "&date2=" + date2 + "&mob="
							+ mob + "&eid=" + eid + "&absence=" + absence
							+ "&calendar=" + calendar + "&txtarea=" + txtarea;
					
					
					//alert("dataString..." + dataString);

					$.ajax({

						url : 'postLoginJsp/ATND/calendarLeaveApply.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							alert("successfully leave applied");

							$('#lrmain').html(data).delay(5000).fadeOut();

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}

				})
	});

</script>

						<!-- 	########## end for script for calendar page fields######### -->
</head>
<body>
<%
			 ArrayList<String> pHolidaylist = AttendanceDetails.getHolidayDates();
%>


	<!------------main cocntiner--------------->
	<div class="main1" id="lrmain" Style="margin-top:50px">
		<h4 style="margin-left:1px">Leave Request:New</h4>

		<!------------conatiner----------->
		<div class="container1">

			

			
			<!--------alternative-code------------>

			<h3>Personal Calendar</h3>

			<div class="cd-tabs">

				<nav>
					<ul class="cd-tabs-navigation">
						
						<li><a data-content="new" href="#0" style="text-decoration: none;font-size:medium;">Calendar</a></li>
						<li><a data-content="store" href="#0" style="text-decoration: none;font-size:medium;">Time Accounts</a></li>
						<li><a data-content="gallery" href="#0" style="text-decoration: none;font-size:medium;">Leave Request</a></li>

					</ul>
					<!-- cd-tabs-navigation -->
				</nav>

				<ul class="cd-tabs-content">
					<li data-content="inbox" class="selected">
						<div class="block_1">
							<h5>Personal Calender</h5>
							<h6>

								<div>
									
						<input id="result" type="hidden" name="result" value="<%=pHolidaylist %>"/>
		
		
				<!-- ###################First datepicker############################## -->
									 <div id="datepickerss"></div>

								</div>
							</h6>

						</div> 
					</li>

					<li data-content="new">
						<div class="block_1">
							<h5>Personal Calender</h5>
							
							
					<!-- ######################second dynamic datepicker############################## -->
							
							<div id="datepickers"></div>

							<br>


						</div> <!-----------block_2 code--------------->
						<div class="block_2">
							<h5>Leave details</h5>
							<div class="section_1">

								<h6>Types of Leave</h6>
								<hr />
								<label> <span style="color: red; font-weight: bold">*</span>Types
									of leave:
								</label> <select id="choice1" name="choice1" size="1" onChange="run1()"
									class="cont">
									
									<option value="Type of Leave">Type of Leave</option>
									<option value="PL">PL</option>
									<option value="SL">SL</option>
									<option value="CL">CL</option>
									<option value="Advance PL">Advance PL</option>
									<option value="OPH">OPH</option>
									<option value="Advance SL">Advance SL</option>
									<option value="Outdoor Duty">Outdoor Duty</option>
									<option value="Leave Without Pay(LWP)">Leave Without Pay(LWP)</option>
									<option value="Present_Non ART Location">Present_Non ART Location</option>
									<option value="Present-ART Not Working">Present-ART Not Working</option>
									<option value="Paternity Leave">Paternity Leave</option>
								</select> <br /> <br /> <label> Description:</label> <input id="desc1"
			type="text" name="desc1" class="cont" Readonly />
							</div>

							<div class="section_1">

								<h6>Additional details</h6>
								<hr />
								<label>Contact Num:</label> <input name="phnum1" id="phnum1" type="text" onkeypress="return onlyNumbers(event)" onchange="verify()"  class="cont" > <br /> <br /> <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>

							<div class="section_1">

								<h6>General details</h6>
								<hr />
								<br />

	<label><span style="color: red">*</span>Start Date :</label><input type="text" name="datepicker1" id="datepicker1" class="cont" /> <br /><br /> 
	
	<label><span style="color: red">*</span>End Date  :</label><input type="text" name="datepicker2" id="datepicker2" class="cont" /><br><br /> <br /> 
								
	<label>Absence Days: </label>&nbsp;&nbsp; <input id="absence1" type="text" name="absence1" class="cont" /> <br /><br /> 
	
	<label>Calendar Days: </label>&nbsp;&nbsp; <input id="calendar1" type="text" name="calendar1"  class="cont" /> <br /> <br />

<label>New Note:</label><textarea cols="35" rows="3" name="txtarea" id="txtarea1" class="cont"></textarea> <br /> <br /> 
									
									<%
								String id=(String)session.getAttribute("loginid");
								System.out.println("id from jsp===="+id); %>
								<input type="hidden" name="eid" id="eid" value="<%=id %>" /><br>
								<br>
								<center>

                      <input id="submit1" type="submit" value="APPLY"/>
</center>
								<br>
								<br>
								
								<div id="qryload">
								</div>
							</div>

						</div> <!-------------end block_2 code--------->


					</li>



					<li data-content="gallery">
						<table style="width: 100%">
							<tr style="background-color: #B4C2CF;">
								<th>Leave Type</th>
								<th>Start Date</th>
								<th>End Date</th>
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
										
										
										String employee_name = reqarr[3];
										String personal_number = reqarr[4];
										String pending_with = reqarr[5];
										String clock_in = reqarr[6];
										String clock_out = reqarr[7];
										String status = reqarr[8];
							%>
							<tr align="left">
								<td><%=type_of_leave%></td>
								<td><%=start_date%></td>
								<td><%=end_date%></td>
								<td><%=employee_name%></td>
								<td><%=personal_number%></td>
								<td><%=pending_with%></td>
								<td><%=clock_in%></td>
								<td><%=clock_out%></td>
								<td><%=status%></td>
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
						
				
											<!--TIME ACCOUNT PAGE  -->
											
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
						

						</div> <!-------------end block_2 code--------->
	
					</li>




				</ul>
				<!-- cd-tabs-content -->
			</div>
			
			<!-- cd-tabs -->

			<script src="js/jquery-2.1.1.js"></script>
			<script src="js/main.js"></script>



		</div>
		<!------------conatiner----------->
	</div>

	<!------------ end main cocntiner--------------->
<!-- </body> -->
</html>









