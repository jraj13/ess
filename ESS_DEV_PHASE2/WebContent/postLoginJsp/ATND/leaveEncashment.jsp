<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>Leave Request</title>

<!-- 	<style>
.blue a.ui-state-default {
    background-color: green;
    background-image: none;
}
red  a.ui-state-default{
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

</style> -->
<style>
.blue a.ui-state-default {
    background-color: green;
    background-image: none;
}
.ui-datepicker-week-end, .ui-datepicker-week-end a.ui-state-default {
color: #C00;
}

</style>

<!-- <link rel="stylesheet" href="date/jquery-ui1.css"/>
 <script src="date/jquery-1.10.2.js"></script>
<script src="date/latest.min.js"></script>
<script src="date/jquery-ui.js"></script>  -->

<!-- <link rel="stylesheet" href="date/bootstrap.min.css"/>
 <link rel="stylesheet" href="date/main.css"/>  -->
 <!-- <script>
 var day1;
 var day2;
  
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
	var starting=document.getElementById('datepicker1');
	$('#datepickers').datepicker({
		numberOfMonths : 3,
		 beforeShowDay: colorize,
		/* onSelect: function(){
	        var selected = $(this).val();
	        document.getElementById('datepicker1').value=selected;
	        datepicked();
	        
	        } */
	        onSelect: function(dateStr) {
          	  var min = $("#datepickers").datepicker('getDate');
                  day1 = $("#datepickers").datepicker('getDate');
                  $("#datepicker2").datepicker('option', 'minDate', min || '0');
                  var selected = $(this).val();
      	        document.getElementById('datepicker1').value=selected;
                  /* datepicked(); */
            }
	
	
	
	
	
	
});
});


 function colorize(date) {
		
	    mdy = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();
	    if ($.inArray(mdy, datesArray) > -1) {
	        return [true, "blue","public holiday"];
	    } 
	    else if ($.inArray(mdy, datesArray) > -1) {
	    	
	        return [true, "red","public holiday"];
	    }    
	        else {
	        return [true, ""];
	    }
	}  
 </script>
 
 
 --> 

 
 
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
	     if (charCode > 31 && (charCode < 48||charCode > 57))
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
	function formValidationInsert()
	{
		//alert("am in button click");
		var desc1=document.getElementById("desc1").value;
		var phno=document.getElementById("phnum1").value;
		var start=document.getElementById("datepicker1").value;
		var end=document.getElementById("datepicker2").value;
		
		if(desc1==""||phno==""||start==""||end=="")
			{
			alert("please enter mandatory feilds");
			
			return false;
			
			}
		else{
		alert("am in else")
			return true;
		}
	}
	</script> 
	
	
	<script>
	
	$(function() {
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
						cache: false,
						type : 'POST',
						data : dataString,
						datatype : 'json',
						datatype: "script",
						cache: false,
						
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
	


<body> 
<%
			 ArrayList<String> pHolidaylist = AttendanceDetails.getHolidayDates();
%>
<%-- 
				<div class="row" style="border:2px solid #F5F5F5; margin:0px;">
					<div class="col-md-12">
						<!-- Tabs-->
						<div class="tabbable tabbable-custom tabbable-full-width">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_edit_account" data-toggle="tab">Calendar</a></li>
                                <li><a href="#tab_overview" data-toggle="tab">Time Accounts</a></li>
								<li><a href="#tab_edit" data-toggle="tab">Leave Request</a></li>
								</ul>
								
								
							<div class="tab-content row">
								
								
								<div class="tab-pane" id="tab_edit">
								  <div class="col-md-9">
									  <div class="row profile-info"></div> <!-- /.row -->

										<div class="row">
											<div class="col-md-12">
												<div class="widget">
													<div class="widget-content">
														<table class="table table-hover table-striped" style="width: 100%">
															<thead>
																<tr>
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
															</thead>
															<tbody>
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
							<td bgcolor="#D4DCE4"><%=type_of_leave%>
							<td bgcolor="#D4DCE4"><%=start_date %>
							<td bgcolor="#D4DCE4"><%=start_time %>
							<td bgcolor="#D4DCE4"><%=end_date %>
							<td bgcolor="#D4DCE4"><%=end_time %>
							<td bgcolor="#D4DCE4"><%=employee_name %>
							<td bgcolor="#D4DCE4"><%=personal_number %>
							<td bgcolor="#D4DCE4"><%=pending_with %>
							<td bgcolor="#D4DCE4"><%=clock_in %>
							<td bgcolor="#D4DCE4"><%=clock_out %>
							<td bgcolor="#D4DCE4"><%=status %>
							</tr>
							
							 <%
								}
								} else {
							%> <tr>
								<td colspan="12">No Records</td>
							</tr>

							 <%
								}
							%> 
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- /Striped Table -->
										</div> <!-- /.row -->
									</div> <!-- /.col-md-9 -->
								</div>
								<!-- /Overview -->
								
								
								<!--=== Overview ===-->
								<div class="tab-pane" id="tab_overview">
								  <div class="col-md-9">
									  <div class="row profile-info"></div> <!-- /.row -->

										<div class="row">
											<div class="col-md-12">
												<div class="widget">
													<div class="widget-content">
														<table class="table table-hover table-striped" style="width: 100%">
															<thead>
																<tr style="background-color: #B4C2CF;">
																	<th>Leave Type</th>
								<th>Opening Balance</th>
								<th>Availed</th>
								<th>Pending with Approver</th>
								<th>Available Balance</th>
																</tr>
															</thead>
															<tbody>
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
							
							%> <tr>
								<td colspan="10">No Records</td>
							</tr>

							 <%
								}
							%> 
							
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- /Striped Table -->
										</div> <!-- /.row -->
									</div> <!-- /.col-md-9 -->
								</div>
								<!-- /Overview -->


 --%>

								<!--=== Edit Account ===-->
								<div class="tab-pane active"id="tab_edit_account">
									<!-- <form class="form-horizontal" action="#"> -->
											<div class="widget">
												<div class="widget-header">
												<!-- 	<h4>Personal Calendar</h4> -->
												</div>
												<div class="widget-content">
													<div class="row">
														
															<input id="result" type="hidden" name="result" value="<%=pHolidaylist %>"/>
							
							<div class="col-md-2"></div>
							<div class="col-md-6"><div id="datepickers" style="width:50px"></div></div>
							<div class="col-md-3"></div>
															
														</div>
													</div> <!-- /.row -->
												</div> <!-- /.widget-content -->
											</div> <!-- /.widget -->
										<!-- </div> /.col-md-12 -->
										
										

										<div class="col-md-12 form-vertical no-margin">
											<div class="widget">
												<div class="widget-header">
													<h4>Leave Details</h4>
												</div>
												<div class="widget-content">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Type of Leave</label>
																<div class="col-md-8"><select id="choice1" name="choice1"  onChange="run1()" class="form-control">
									<option value="Type of Leave">Type of Leave</option>
									<option value="PL">PL</option>
									<option value="SL">SL</option>
									<option value="Advance PL">Advance PL</option>
									<option value="Advance SL">Advance SL</option>
								
								</select></div>
															</div>
													<br>
															<div class="form-group">
																<label class="col-md-4 control-label">Description:</label>
																<div class="col-md-8"><input id="desc1" type="text" name="desc1" class="form-control" readonly="readonly"/></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Start Date</label>
																<div class="col-md-8"><input type="date" name="datepicker1" id="datepicker1" class="form-control" /></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>End Date</label>
																<div class="col-md-8"><div><input type="date" name="datepicker2" id="datepicker2" class="form-control" /></div><!-- <input type="text" name="datepicker2" id="datepicker2" class="form-control" /> --></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label">Absence Days</label>
																<div class="col-md-8"><input id="absence1" type="text" name="absence1" class="form-control" /></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label">Calenadar Days</label>
																<div class="col-md-8"><input id="calendar1" type="text" name="calendar1" class="form-control" /></div>
															</div>
															
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label">Note</label>
																<div class="col-md-8"><textarea cols="35" rows="3" name="txtarea" id="txtarea1" class="form-control"></textarea></div>
															</div>
															<br>
															<%
								String id=(String)session.getAttribute("empid");
								System.out.println("id from jsp===="+id); %>
								<input type="hidden" name="eid" id="eid"
									value="<%=id %>" /><br>
								<br>
								<center><input id="submit1" type="button" value="APPLY" onclick="return formValidationInsert()"/></center>
															
															<div id="qryload">
								</div>
														</div>


														<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label">Contact Number</label>
																<div class="col-md-8">
																	<input name="phnum1" id="phnum1" type="text" onkeypress="return onlyNumbers(event)" onchange="verify()"  class="form-control"/>
																		
																</div>
															</div>
														<br>
															
															
														</div>
												</div> <!-- /.widget-content -->
											</div> <!-- /.widget -->

											
										</div> <!-- /.col-md-12 -->
									
								</div>
								
								<!-- /Edit Account -->
								
								
								
							</div> <!-- /.tab-content -->
						</div>
						<!--END TABS-->
					</div>
				</div> <!-- /.row -->
				<!-- /Page Content -->
				</div>
			

</body>
</html>


