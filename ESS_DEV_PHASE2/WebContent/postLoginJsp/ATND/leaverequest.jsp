 <%@page import="com.ess.common.action.AttendanceDetails"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="com.ess.common.action.RegularizationAction"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" /> -->
	<title>Leave Request</title>

	<style>
.blue a.ui-state-default {
    background-color: green;
    background-image: none;
}

.grey a.ui-state-default {
    background-color: black;
    background-image: none;
}

.ui-datepicker-week-end, .ui-datepicker-week-end a.ui-state-default {
color: #C00;
}

</style>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style2.css"> 
<link rel="stylesheet" href="css/style3.css">

<!-- <link rel="stylesheet" href="date/jquery-ui.css"/> -->
 <script src="date/jquery-1.10.2.js"></script>
<script src="date/latest.min.js"></script>
<script src="date/jquery-ui.js"></script> 




<!-- script for regularization datepicker -->
<script>

$(document).ready(function(){
    $("#datepiker_regularization").datepicker({ 
        maxDate: 'today',
    	numberOfMonths:2,
    	 onSelect: function(dateStr) {
         	  var select_date_reg = $(this).val();
         	 document.getElementById('date_reg').value=select_date_reg;
    	 }
    	});
});
</script>


<script>
$(function() {
	$('#reg_button').click(
			function() {
				var reg_select=$('#reg_select').val();
				
				var date_reg=$('#date_reg').val();
				var note_reg=$('#note_reg').val();
				var reporting=$('#rm_reg').val();
				
				if(reg_select=="Type of Regularization" && date_reg=="" && note_reg=="" )
				{
				alert("Please Enter Mandatory Feilds(*)");
				return false;
				}
				if(reg_select=="Type of Regularization"){
					alert("Please choose regularization Type");
					window.setTimeout(function ()
						    {
					document.getElementById('reg_select').focus();
						    }, 0);
					//document.getElementById('reg_select').value="";
					return false;
				}
				if(date_reg==""){
					alert("Please select date");
					window.setTimeout(function ()
						    {
					document.getElementById('date_reg').focus();
						    }, 0);
					//document.getElementById('date_reg').value="";
					
					return false;
				}
				if(note_reg==""){
					alert("Please Enter Note");
					window.setTimeout(function ()
						    {
					document.getElementById('note_reg').focus();
						    }, 0);
					return false;
				}
				if(reporting==null || reporting=="")
					{
					alert("Please Enter Note");
					return false;
					}
			else{
					alert("PLease wait and Don't Refresh until messgae dispaly");
					var reg_data = "&regularization_type=" + reg_select + "&input_date=" + date_reg
							+ "&note_reg=" + note_reg+ "&Reporting_Manager="+reporting;
					
					$.ajax({

						url : 'postLoginJsp/ATND/regularizationApply.jsp',
						type : 'POST',
						data : reg_data,
						datatype : 'json',
						success : function(data) {
							//alert("successfully leave applied");

							$('#lrmain').html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}
				})
	});

</script>







<script>

	/* function for geting description value */
	function run1() {
		var choice1=document.getElementById("choice1").value;
		var tot_leave=document.getElementById("tot_leave").value;
		var pl=document.getElementById("pl").value;
		var sl=document.getElementById("sl").value;
		var cl=document.getElementById("cl").value;
		
		var advancepl=document.getElementById("advancepl").value;
	//	var oph=document.getElementById("oph").value;
		var advancesl=document.getElementById("advancesl").value;
		
		var compo=document.getElementById("compo").value;
		
	document.getElementById("desc1").value = document.getElementById("choice1").value;
	
	  document.getElementById("datepicker2").value=" ";
	 // document.getElementById("absence1").value="0";
		var dop = document.getElementById("desc1").value;
		
		if(choice1=="Personal Leave"){
			
			 document.getElementById("tot_leave").value=document.getElementById("pl").value;
		}
		else if(choice1=="Sick Leave"){
			
			 document.getElementById("tot_leave").value=document.getElementById("sl").value;
		}
else if(choice1=="Casual Leave"){
			
			document.getElementById("tot_leave").value=document.getElementById("cl").value;
			
		}
else if(choice1=="Advanced PL"){
	
	 document.getElementById("tot_leave").value=document.getElementById("advancepl").value;
}
/* else if(choice1=="OPH"){
	
	document.getElementById("tot_leave").value=document.getElementById("oph").value;
	
} */
else if(choice1=="Advanced SL"){
	
	document.getElementById("tot_leave").value=document.getElementById("advancesl").value;
	
}

else if(choice1=="Compensatory OFF"){
	
	document.getElementById("tot_leave").value=document.getElementById("compo").value;
	
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


/* script for getting all holidays */
var leaveArray=[];
var str=[];    
var leaves=document.getElementById("result1").value;
var s=leaves.replace("\[",'');
var seafter=s.replace("\]",'');
var sdafter=seafter.replace(/\s/g, '');
strarr=$.trim(sd).split(",");
for(var i =0;i<strarr.length;i++){
  datesArray.push(strarr[i]);
}

str=$.trim(sdafter).split(",");
for(var j =0;j<str.length;j++){
	leaveArray.push(str[j]);
}

$(function($) { 
	var starting=document.getElementById('datepicker1');
	$('#datepickers').datepicker({
		dateFormat: 'mm/dd/yy',
		numberOfMonths : 3,
		 beforeShowDay: colorize,
	        onSelect: function(dateStr) {
          	  var min = $("#datepickers").datepicker('getDate');
                  day1 = $("#datepickers").datepicker('getDate');
                  var selected = $(this).val();
      	        document.getElementById('datepicker1').value=selected;
      	      document.getElementById("datepicker2").value=" ";
      	    document.getElementById("absence1").value="0";
  
      	     
            }
});
});


 function colorize(date) {
		
	    mdy = (date.getMonth() + 1) + '-' + date.getDate() + '-' + date.getFullYear();
	    if ($.inArray(mdy, datesArray) > -1) {
	        return [true, "blue","public holiday"];
	    } 
	    else  if ($.inArray(mdy, leaveArray) > -1) {
	        return [false,""];
	    }    
	     else {
	        return [true, ""];
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
	     return true;
	 } 
	
	function verify()
	 {
		 var mobile=document.getElementById("phnum1").value;

		<!-- var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  -->
		
		 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
		
		  if(mobile.match(phoneno))  
		     {  
		       return true;         
		     }  
			 else if(mobile.length<10)
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
		   else 
		     {  
		     alert("Not a valid Phone Number");
		     window.setTimeout(function ()
					    {
				document.getElementById('phnum1').focus();
					    }, 0);
			 document.getElementById('phnum1').value="";
					    return false;
		     }  
		}  
	</script> 

	
	
<script>

        function cal(){
        	//alert("hai");
        	var choice=document.getElementById("choice1").value;
        	var tot=document.getElementById("absence1").value;
        	var from_ses=document.getElementById("from_ses").value;
        	var to_ses=document.getElementById("to_ses").value;
        	var tot_fi=document.getElementById("absence1").value;
            
        	
                var dropdt = new Date(document.getElementById("datepicker2").value);
                //alert(dropdt);
                
                var pickdt = new Date(document.getElementById("datepicker1").value);
               // alert(pickdt);
               /* var start = $("#datepicker1").datepicker("getDate"); */
                
               var noOf=parseInt((dropdt - pickdt) / (24 * 3600 * 1000)+1);
              
               alert("you are selectted  "+noOf+"  days");
               document.getElementById("cal_days").value=noOf;
              
            
               if(isNaN(noOf)){
            	   alert("Please select End Date");
            	   document.getElementById("datepicker2").value=" ";
               }
               else if(choice=="Type of Leave"){
            	   alert("please choose Type of Leave");
            	   document.getElementById("datepicker2").value=" ";
               }
               else if(noOf<1)
            		   {
            		   alert("Selected Start Date and End Date is not valid");
            		   document.getElementById("absence1").value="0";
            		   document.getElementById("datepicker2").value=" ";
            		   }
            	else if(noOf>0 && from_ses=="Session 1" && to_ses=="Session 2"){
            		   
            		   document.getElementById("absence1").value=noOf;
            	   }
				else if(noOf>0 && from_ses=="Session 2" && to_ses=="Session 2"){
            		   
            		noOf=noOf-0.5;   
					document.getElementById("absence1").value=noOf;
            		   
            	   }
				else if(noOf>0 && from_ses=="Session 1" && to_ses=="Session 1"){
         		   
            		noOf=noOf-0.5;   
					document.getElementById("absence1").value=noOf;
            		   
            	   }
				else if(noOf>0 && from_ses=="Session 2" && to_ses=="Session 1"){
            		noOf=noOf-1;   
					document.getElementById("absence1").value=noOf;
				}
            	   
        }

    </script>
    
   
	<script>
	
	$(function() {
		$('#submit1').click(
				function() {

					//alert("Am In Btn Click leaverequest");

					
					var choice1 = $('#choice1').val();
					var desc1 = $('#desc1').val();
					var date1 = $('#datepicker1').val();
					var date2 = $('#datepicker2').val();
					//alert("Am In Btn Click leaverequest1"+date1);
					//alert("Am In Btn Click leaverequest2"+date2);
					
					var mob = $('#phnum1').val();
					var eid = $('#eid1').val();
					var absence = $('#absence1').val();
					var txtarea = $('#txtarea1').val();
					var tot_leave=$('#tot_leave').val();
					var cal_days=$('#cal_days').val();
					
					var from_ses=$('#from_ses').val();
					var to_ses=$('#to_ses').val();
					
					
					
					
					if(desc1=="" && mob=="" && date1=="" &&date2=="")
					{
					alert("Please Enter Mandatory Feilds(*)");
					return false;
					}
					  if(desc1.toString() == "")
					  {
						  alert("Please Enter A Types Of Leave");
					  choice1.focus();
					  return false;
					  }
					  if(tot_leave==0)
						{
						alert("Leave is not Available");
						}
					  if(mob.toString() == ""){
						  alert("Please Enter Your Contact Number");
						  mob.focus();
						  return false;
						  }
					  if(mob.length<10){
						  alert("You are not Entered 10 Digits Contact Number");
						  return false;
						  }
				      if(date1.toString() == "")
				      {
				    	  alert("Please Select Start Date.");
				    	  date1.focus();
				    	  return false;
				    	  }
				      if(date2.toString() == "")
				      {
				    	  alert("Please Select End Date");
				    	  date2.foucs();
				    	  return false;
				    	  }
				      if(absence.toString() == "0")
				      {
				    	  alert("Please select Start date and End Date");
				    	  date2.foucs();
				    	  return false;
				    	  }
					if(Number(absence) > Number(tot_leave))
						{
						document.getElementById("datepicker2").value=" ";
						alert("Please select leave with in the Available Leaves");
				    	  return false;
						}
					

			
					else{
				      
					
					var dataString = "&ltype=" + choice1 + "&desc1=" + desc1
							+ "&date1=" + date1 + "&date2=" + date2 + "&mob="
							+ mob + "&eid=" + eid + "&absence=" + absence
							+ "&txtarea=" + txtarea+ "&calendar=" + cal_days+ "&availed=" + tot_leave
							+ "&from_ses=" +from_ses + "&to_ses=" +to_ses;
					
					
					
					$.ajax({

						url : 'postLoginJsp/ATND/calendarLeaveApply.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							//alert("successfully leave applied");

							$('#lrmain').html(data);

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}

				})
	});
	
</script>
	
	<script type="text/javascript">
	
	function onlyNum(event) {
		 var mobile=document.getElementById("phnum1").value;
	     var e = event || evt; // for trans-browser compatibility
	     var charCode = e.which || e.keyCode;
	     
	     if (charCode > 31 && (charCode < 48||charCode > 57&&charCode==107))
	    	 {
	         return false;
	    	 }
	     return true;
	 } 
	 </script>
	 
	<!--  <script>
	 function swap(related_note, related_attachment) {
		    document.getElementById(regulization_dd).style.display = 'block';
		    document.getElementById(related_attachment).style.display = 'none';
		   /* var tleave=  document.getElementById('choice1').style.display; */
		}

		$("#related_attachment").hide();
		$("#regulization_dd").hide();

		document.getElementById('note').addEventListener('click',function(e){
		    swap('related_note','related_attachment');
		});
		document.getElementById('attachment').addEventListener('click',function(e){
		    swap('related_attachment','related_note');
		});
	 
	 </script>  -->
	
	
</head>

<body> 
<%
			 ArrayList<String> pHolidaylist = AttendanceDetails.getHolidayDates();
ArrayList<String> pHolidaylist1 = AttendanceDetails.getHolidayDates1();


RegularizationAction rm_action=new RegularizationAction();
String reporting=rm_action.getting_reportingManager();
%>

				<div class="row" id="lrmain" style="border:2px solid #F5F5F5;  margin-top:100px;">
				<h4 style="margin-left:1px;background-color:skyblue;height: 30px">Leave Request:New</h4>
					<div class="col-md-12">
						<!-- Tabs-->
						<div class="tabbable tabbable-custom tabbable-full-width">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_edit_account" data-toggle="tab" style="background-color:skyblue">Leave Request</a></li>
                                <li><a href="#tab_overview" data-toggle="tab" style="background-color:skyblue">Leave Account</a></li>
								<!-- <li><a href="#tab_edit" data-toggle="tab" style="background-color:skyblue">Leave Request</a></li> -->
								<li><a href="#tab_edit" data-toggle="tab" style="background-color:skyblue">Regularization</a></li>
								</ul>
								
								
								<div class="tab-content row">
								
								
								<div class="tab-pane" id="tab_edit">
								  <div class="col-md-9">
									  <div class="row profile-info"></div> <!-- /.row -->

										<div class="row">
											<div class="col-md-12">
												<div class="widget">
													<div class="widget-content">
											<div class="col-md-6"><div id="datepiker_regularization" style="width:50px"></div></div>
														</div>
													</div> <!-- /.row -->
												</div> <!-- /.widget-content -->
											</div> <!-- /.widget -->
										</div> 
										
										
										
										
										
											
										<div class="col-md-12 form-vertical no-margin">
										
											<div class="widget">
												<div class="widget-header">
													<!-- <h4>Leave Details</h4> -->
												</div>
												<div class="widget-content">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
								<label class="col-md-4 control-label"><span style="color: red">*</span>Regularization Type</label>
									<div class="col-md-8"><select id="reg_select" name="reg_select"  class="form-control">
									<option value="Type of Regularization">Type of Regularization</option>
									<option value="Early Going Regularization">Early Going Regularization</option>
									<option value="Late Coming Regularization">Late Coming Regularization</option>
									<option value="Extensis">Extensis</option>
									<option value="Outdoor Duty">Outdoor Duty</option>
									<option value="Forgot ID Card">Forgot ID Card</option>
									
								</select></div>
															</div>
													<br>
													<br>

															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Date:</label>
																<div class="col-md-8"><input type="text" name="date_reg" id="date_reg"  placeholder="select date from above calendar" class="form-control" readonly="readonly"/></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Note</label>
																<div class="col-md-8"><textarea cols="35" rows="3" name="note_reg" id="note_reg" class="form-control"></textarea></div>
															</div>
															<br>
															<br/>
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Reporting Manager</label>
																<div class="col-md-8"><div><input type="text"  id="rm_reg" name="rm_reg" value="<%=reporting %>" class="form-control" readonly="readonly"></div></div>
															</div>
															<br/>
															<br/>
															<br/>
															
															<div class="form-group">
																<label class="col-md-4 control-label"> &nbsp;</label>
																<div class="col-md-8"><input type="button" name="reg_button" id="reg_button"  value="Regularization Apply"/></div>
															</div>
												
												</div>
												</div>
												</div>
												
											<!-- /Striped Table -->
										</div> <!-- /.row -->
									</div> <!-- /.col-md-9 -->
								</div>
								<!-- /Overview -->
								
								
								
								
								
								
						<%-- 	<div class="tab-content row">
								
								
								<div class="tab-pane" id="tab_edit">
								  <div class="col-md-9">
									  <div class="row profile-info"></div> <!-- /.row -->

										<div class="row">
											<div class="col-md-12">
												<div class="widget">
													<div class="widget-content">
														<table style="width: 100%">
															
							<tr style="background-color: #40E0D0;">
								<th>Leave Type</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Employee ID</th>
								<th>Personal Number</th>
								<th>Pending With</th>
								<!-- <th>Clock IN</th>
								<th>Clock Out</th> -->
								<th>Status</th>
								<th>Leave Days</th>
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
										/* String clock_in = reqarr[6];
										String clock_out = reqarr[7]; */
										String status = reqarr[8];
										String leavedays=reqarr[9];
							%>
							<tr align="left" >
								<td><%=type_of_leave%></td>
								<td><%=start_date%></td>
								<td><%=end_date%></td>
								<td><%=employee_name%></td>
								<td><%=personal_number%></td>
								<td><%=pending_with%></td>
								<td><%=clock_in%></td>
								<td><%=clock_out%></td>
								<td><%=status%></td>
								<td><%=leavedays%></td> 
							</tr>

							 <%
								}
								} else {
							%> 
							<tr>
								<td colspan="12">No Records</td>
							</tr>

							 <%
								}
							%> 
							
						</table>
													</div>
												</div>
											</div>
											<!-- /Striped Table -->
										</div> <!-- /.row -->
									</div> <!-- /.col-md-9 -->
								</div>
								<!-- /Overview --> --%>
								
								
								<!--=== Overview ===-->
								<div class="tab-pane" id="tab_overview">
								  <div class="col-md-9">
									  <div class="row profile-info"></div> <!-- /.row -->

										<div class="row">
											<div class="col-md-12">
												<div class="widget">
													<div class="widget-content">
														<table style="width: 80%">
															<thead>
																<tr style="background-color: #40E0D0;">
																	<th>Leave Type</th>
																	<th>Granted Leaves</th>
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
										//String availed = timeoverAr[2];
										//String pending_with_approver = timeoverAr[3];
										String available_balance = timeoverAr[2];
							%> 
							
							
							 <tr align="center">
								<td ><%=leave_type%></td>
								<td ><%=opening_balance%></td>
								<td ><%=available_balance%></td>

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






								<!--=== Edit Account ===-->
								<div class="tab-pane active"id="tab_edit_account">
									<!-- <form class="form-horizontal" action="#"> -->
										<div class="col-md-12">
											<div class="widget">
												<div class="widget-header">
													<h4>Personal Calendar</h4>
												</div>
												<div class="widget-content">
													<div class="row">
														
															<input id="result" type="hidden" name="result" value="<%=pHolidaylist %>"/>
															<input id="result1" type="hidden" name="result1" value="<%=pHolidaylist1 %>"/>
							<!-- <div class="col-md-2"></div> -->
							<div class="col-md-6"><div id="datepickers" style="width:50px"></div></div>
							<!-- <div class="col-md-3"></div> -->
															
														</div>
													</div> <!-- /.row -->
												</div> <!-- /.widget-content -->
											</div> <!-- /.widget -->
										<!-- </div> /.col-md-12 -->
										
										

										<div class="col-md-12 form-vertical no-margin">
										
											<div class="widget">
												<!-- <div class="widget-header">
													<h4>Leave Details</h4>
												</div> -->
									<div class="widget-content">
										<div class="row">
										<div class="col-md-6">
										<div class="form-group">
									<label class="col-md-4 control-label"><span style="color: red">*</span>Type of Leave</label>
										<div class="col-md-8"><select id="choice1" name="choice1"  onChange="run1()" class="form-control">
									<option value="Type of Leave">Type of Leave</option>
									<option value="Personal Leave">PL</option>
									<option value="Sick Leave">SL</option>
									<option value="Casual Leave">CL</option>
									<option value="Advanced PL">Advance PL</option>
									<!-- <option value="OPH">OPH</option> -->
									<option value="Advanced SL">Advance SL</option>
									<option value="Compensatory OFF">Comp OFF</option>
									
									</select></div>
										</div>
													<br>

															<div class="form-group">
																<label class="col-md-4 control-label">Description:</label>
																<div class="col-md-8"><input id="desc1" type="text" name="desc1" class="form-control" readonly="readonly"/></div>
															</div>
															<br><br>
															
															
															
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Start Date</label>
																<div class="col-md-8"><input type="text" name="datepicker1" id="datepicker1" class="form-control" readonly="readonly"/></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>End Date</label>
																<div class="col-md-8"><div><input type="date" name="datepicker2" id="datepicker2" class="form-control"  onchange="cal()" onchange="calculate()"/></div></div>
															</div>
															<br>
															<div class="form-group">
																<label class="col-md-4 control-label">No.of Days</label>
																<div class="col-md-8"><input id="absence1" type="text" name="absence1" class="form-control" readonly="readonly"/></div>
															</div>
															<br>
															<!-- <div class="form-group">
																<label class="col-md-4 control-label">Calenadar Days</label>
																<div class="col-md-8"><input id="calendar1" type="text" name="calendar1" class="form-control" /></div>
															</div>
															
															<br> -->
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
								<center><input id="submit1" type="button" value="APPLY"></center>
								

															
															<div id="qryload">
								</div>
														</div>


														<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label"><span style="color: red">*</span>Contact Number</label>
																<div class="col-md-8">
																	<input name="phnum1" id="phnum1" type="text"  onchange="verify()"  class="form-control"/>	
																</div>
															</div>
															</div>
															<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label">Leave Balance</label>
																<div class="col-md-8">
																	<input name="tot_leave" id="tot_leave" type="text"  class="form-control" readonly="readonly"/>	
																</div>
															</div>
															</div>
															<br><br><br>
															<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label">From Session</label>
																<div class="col-md-8">
																	<select id="from_ses" name="from_ses"  onchange="cal()" class="form-control">
																	<option value="Session 1">Session 1</option>
																	<option value="Session 2">Session 2</option>
																	</select>	
																</div>
															</div>
															</div>
															<br>
															<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label">To Session</label>
																<div class="col-md-8">
																	<select id="to_ses" name="to_ses"  onchange="cal()" class="form-control">
									<option value="Session 2">Session 2</option>
									<option value="Session 1">Session 1</option>
									</select>		
																</div>
															</div>
														<br>
														<div class="col-md-6">
															<div class="form-group">
																<label class="col-md-4 control-label">  </label>
																<div class="col-md-8">
																	<input name="cal_days" id="cal_days" type="hidden"  class="form-control"/>	
																</div>
															</div>
															</div>
														<br>
				<%
				String pl = AttendanceDetails.getLeaveDaysPL();
				String cl = AttendanceDetails.getLeaveDaysCL();
				String sl = AttendanceDetails.getLeaveDaysSL();
				/* String oph = AttendanceDetails.getLeaveDaysOth(); */
				String advancepl = AttendanceDetails.getLeaveDaysPaternity();
				
				String advancesl = AttendanceDetails.getAvanceSL();
				String compo = AttendanceDetails.getCompo();
			
				/* System.out.println("pl leaves are==" + pl);
				System.out.println("Cl leaves are==" + cl);
				System.out.println("sl leaves==" + sl);
				System.out.println("oph leaves==" + oph);
				System.out.println("Advanced pl==" + advancepl);
				System.out.println("Advanced SL==" + advancesl);
				System.out.println("combo==" + compo); */
				
				
			
			
				
		%>
													<input type="hidden" id="pl" value="<%=pl%>"/><br>
													<input type="hidden" id="sl" value="<%=sl%>"/><br>
													<input type="hidden" id="cl" value="<%=cl%>"/><br>
													
													<%-- <input type="hidden" id="oph" value="<%=oph%>"/><br> --%>
													<input type="hidden" id="advancepl" value="<%=advancepl%>"/><br>
													<input type="hidden" id="advancesl" value="<%=advancesl%>"/><br>
													<input type="hidden" id="compo" value="<%=compo%>"/><br>
													
													
															
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


 