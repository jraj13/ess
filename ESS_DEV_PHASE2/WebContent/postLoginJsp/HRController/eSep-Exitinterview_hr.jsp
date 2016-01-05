<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
th {
	background-color: #CCCCCC;
}

#fnf_hr_table_f1 {
	border-style: solid;
	border-width: 3px;
}

#fnf_hr_table_f2 {
	border-style: solid;
	border-width:10px;
}

#fnf_hr_table_f3 {
	border-style: solid;
	border-width: 1px;
}

#fnf_hr_table_f4 {
	border-style: solid;
	border-width: 1px;
}

#tab_esep1 {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep1 td {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep2 {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep2 td {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

hr {
	color: #999;
}

.btn, .ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ColVis_MasterButton,
	.fc-state-default {
	text-shadow: none;
	font-size: 12px;
	font-weight: bold;
	color: #333333;
	/* font-size: 10px; */
	cursor: pointer;
}

.ui-tabs .ui-tabs-nav {
	margin: 0;
	padding: .1em .2em 0;
}

.tabs {
	tab-size: 16;
}

.ui-widget-header {
	border: 1px solid #aaaaaa;
	background: red url("images/ui-bg_highlight-soft_75_cccccc_1x100.png")
		50% 50% repeat-x;
	color: #222222;
	font-weight: bold;
}

#leave_summary_table {
	width: 100%;
	border:0px;
	color:black;
}
#leave_summary_table td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}
#recovery_pay_table {
	width: 100%;
	border:0px;
	color:black;
}
#recovery_pay_table td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}

#second_table {
	width: 80%;
}

#third_table {
	width: 80%;
}

p.third_table {
	line-height: 80%;
}
/* .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
border: 1px solid #d3d3d3;
background: #AFD3CA url("images/ui-bg_glass_75_e6e6e6_1x400.png") 50% 50% repeat-x;
font-weight: normal;
color: #555555;
} */


.ui-widget-content {
    border: 0px solid #aaaaaa;
    /* background: #ffffff url("images/ui-bg_flat_75_ffffff_40x100.png") 50% 50% repeat-x;
    color: #222222;
 */}

.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited
	{
	color: #161313;
	text-decoration: none;
}


#fnfs_hr_tab-1_2,#fnfs_hr_tab-2_1,#fnfs_hr_tab-4_1,#fnfs_hr_tab-5_1{
border-style: solid;
	border-width: 12px;
	/*  color:#555555;  */
	 color:#dfecf5;
	 padding-left: 15px;
	
}

p {
    margin: 5px 10px -1px;
    line-height: 14px;
    color:black;
}

</style>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>

</head>
<body>
	eSep-Exitinterview_hr.jsp
	<!-- <br>
	<br>
	<br>

	<div id="fnf_hr_table_f1"
		style="margin-top: -15px; margin-left: -2.5%; padding-left: 15px; font-size: 15px; width: 102%;">

		<div
			style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>Employee Detail</b>
		</div>

		<div
			style="background-color: #98c3e2; margin-top: 0.66px; margin-left: -1.5%; padding-left: 15px; width: 101.5%;">
			<button type="button" value="Continue" id="continue"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				<span class="glyphicon glyphicon-ok"
				style="color: green; padding-left: 0px;"></span>
				Return to Main screen
			</button>
			<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				<span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span>
				FNF Worksheet
			</button>

			<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				<span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span>
				Due Clearance Details
			</button>

			<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 216px; float: right">
				 <span class="glyphicon glyphicon-print"
				style="color: black; padding-left: 0px;"></span> 
				Print Full and Final Settlement
			</button>

		</div>
		
		<br>
	<div style="background-color: #dfecf5;margin-left: -1.5%; padding-left: 15px;margin-top: -30px;height: 316px;">

		 <label>Eseparation Request No:</label>&nbsp;<input  id="esep_req_no" style="background-color: #dfecf5;height:26px;"readonly="readonly"/>
		<hr>

		<table id="tab_esep1">
			<tr>
				<td>Personal no.:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
				<td>Business HR:&nbsp;</td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
			</tr>

			<tr>
				<td>Company.:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
				<td>Location:&nbsp;</td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
			</tr>

			<tr>
				<td>Level/Desg.:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
				<td>Employment Type:&nbsp;</td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 24px; width: 260px" readonly="readonly"/></td>
			</tr>

		</table>

		<hr>
		
		
		<table id="tab_esep2">
			<tr>
				<td>Joining Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
					<td>Resignation Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
					
					<td>Date of Leaving:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
				
			</tr>

			<tr>
				<td>Confirmation Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
					<td>Hold Salary Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
					
					<td>PDC Error Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
			</tr>

			<tr>
				<td>Reason:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 24px; width: 160px" readonly="readonly"/></td>
					
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

		</table>
		
		
		
		
		</div>
		<div
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>&nbsp;&nbsp;</b>
		</div>
		
		FOR TAB OPTION
		<br>
		<div id="tabs">
		<ul style="width: 84%;">
			<li><a href="#tabs-1" style="width: 140px;">Leave Summary</a></li>
			<li><a href="#tabs-2" style="width: 140px;">Recovery/Paybles</a></li>
			<li><a href="#tabs-3" style="width: 140px;">Bond & Loans</a></li>
			<li><a href="#tabs-4" style="width: 140px;">Bank Details</a></li>
			<li><a href="#tabs-5" style="width: 140px;">Address</a></li>
			<li><a href="#tabs-6" style="width: 140px;">Clearance</a></li>

		</ul>
	tab-1 start
			<div id="tabs-1">

				<div id="fnfs_hr_tab-1_2"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2;color:black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Leave and Notice-detailed information</b>
					</div>
					<table id="leave_summary_table">
						<tr>
							<td>Leave Balance</td>
							<td>As on 31-03-2015</td>
							<td>After 31-03-2015</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>(S)**</td>
							<td>(A)**</td>
							<td>(S)**</td>
							<td>(A)**</td>
						</tr>
						<tr>
							<td>Available PL:</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly" /></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
						</tr>
						<tr>
							<td>Advance PL:</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
						</tr>

						<tr>
							<td>Net PL:</td>
							<td>&nbsp;</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" /></td>
							<td>&nbsp;</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" /></td>
						</tr>
						<tr>
							<td>Available SL:</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
						</tr>
						<tr>
							<td>Advance SL:</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="0.0" id=""
								style="background-color: white; height: 24px; width: 160px" /></td>
						</tr>

						<tr>
							<td>Net SL:</td>
							<td>&nbsp;</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" /></td>
							<td>&nbsp;</td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" /></td>
						</tr>

						<tr>
							<td>Notice Period(as per Policy):</td>
							<td><input value="30.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>Given Notice Period:</td>
							<td><input value="4.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>Short fall in notice period:</td>
							<td><input value="26.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td><input type="checkbox" />Short fall in notice period:</td>
							<td><input value="&nbsp;" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td><input value="&nbsp;" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>Balance Recoverable:</td>
							<td><input value="26.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>Excess CL availed:</td>
							<td><input value="4.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px" readonly="readonly"/></td>
						</tr>


					</table>
					<p>*All values indicated above are in "Days".</p>
					<p>**(S) indicated system generated value, (A) indicats the
						adjusted value by HR.</p>
					<br />
				</div>

				<br /> <input id="conclusion" type="button" value="Experience" />
			</div>
			
			tab-1 end

				tab-2 start
			<div id="tabs-2">

				<div id="fnfs_hr_tab-2_1"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>&nbsp;</b>
					</div>
					<table id="recovery_pay_table">
						<tr>
							<td><b>Component</b></td>
							<td><b>Upto 31-03-2015(Rs)</b></td>
							<td><b>After 31-03-2015(Rs)</b></td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>PL</td>
							<td><input value="0.00" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="11506.85" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="11506.85" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>SL:</td>
							<td><input value="0.00" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="26301.37" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="0.00" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Short falls in notice:</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="-51000" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>

						<tr>
							<td>CL:</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="-5600" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Net Amount<span>*</span>:
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="-44000" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>

					</table>
					<p>*The Net Amount if(-)ve indicats its recovery else its
						payable to employee.</p>
					<p>**For All the Leave calculation please refer the policy
						document.</p>
					<br />
				</div>


				<input id="reason" type="button" value="Reason"/>
			</div>

			tab-2 end

			tab-3 start
		<div id="tabs-3" style="background-color: #dfecf5; width:890px;" >

				<div
					style="background-color: #98c3e2;color:black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 90%;">
					<b>Bond Summary</b>
				</div>

				<table
					style="background-color: #dfecf5; margin-left: 2%; width: 78%;">
					<tr>
						<th>...</th>
						<th>Description</th>
						<th>Begin Date</th>
						<th>Ending Date</th>
						<th>Effect</th>
						<th>Remarks</th>
					</tr>

					<tr>
						<td>...</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>


				</table>
				<br>
				
					<div
					style="background-color: #98c3e2;color:black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 90%;">
					<b>Loan Summary</b>
				</div>

				<table
					style="background-color: #dfecf5; margin-left: 2%; width: 78%;">
					<tr>
						<th>Sub Type</th>
						<th>Description</th>
						<th>Loan Amount</th>
						<th>Balance Amount</th>
						<th>Special Repayment</th>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>


				</table>
				
			<input id="conclusion" type="button" value="Conclusion"/>
		</div>
		tab-3 end



				tab-4 start
			<div id="tabs-4">

				<div id="fnfs_hr_tab-4_1"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Employee Account Information</b>
					</div>
					<table id="recovery_pay_table" style="background-color: white;">
						<tr>
							<td>Bank Account Details:</td>
							<td><b>Saving</b></td>
							<td>Types of Bank Account:</td>
							<td><b>Salary Account</b></td>
						</tr>
						<tr>
							<td>Bank Name:</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>Bank Account No</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>MICR No.:</td>

							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

					</table>
					<hr style="height: 30px; margin-left: -1.7%; width: 101.8%;">

					<div
						style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Advance Details</b>
					</div>
					<table id="recovery_pay_table">
						<tr>
							<td>Cheque no.:<span style="color: red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>Bank Account:<span style="color: red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>Bank Name:<span style="color: red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Amount:<span style="color: red">*</span></td>
							<td><input value="0.0" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>Date:<span style="color: red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

					</table>



					<hr style="height: 30px; margin-left: -1.7%; width: 101.8%;">

					<div
						style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Payment Details</b>
					</div>
					<table id="recovery_pay_table">
						<tr>
							<td><input type="checkbox" value="checked">Payment
								to Salary Account</td>
							<td>&nbsp;</td>

						</tr>
						<tr>

							<td>Bank Account:</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							<td>Bank Name:</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
						</tr>

					</table>


					<br />
				</div>

				<input id="reason" type="button" value="Reason"/>
			</div>

			tab-4 end


		tab-5 start
			<div id="tabs-5">

				<div id="fnfs_hr_tab-5_1"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Permanent Address</b>
					</div>
					<table id="recovery_pay_table" style="background-color:white;">
						
						<tr>
							<td>Street/House:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 360px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>Address:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 360px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>City:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 260px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>District:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 260px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Postal Code:</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 100px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>Contact Number:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							
						</tr>
						

					</table>
	<hr style="height:30px;margin-left: -1.7%;width: 101.8%;">
					
					<div
						style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Present Address</b>
					</div>
					<table id="recovery_pay_table" style="background-color:white;">
						
						<tr>
							<td>Street/House:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 360px;"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>Address:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 360px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>City:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 260px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>District:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 260px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Postal Code:</td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 100px"
								readonly="readonly" /></td>
							
						</tr>
						<tr>
							<td>Contact Number:<span style="color:red">*</span></td>
							<td><input value="" id=""
								style="background-color: #dfecf5; height: 24px; width: 160px"
								readonly="readonly" /></td>
							
						</tr>
						
					</table>

					<br />
					
				</div>

				<input id="reason" type="button" value="Reason"/>
			</div>

			tab-5 end


tab-6 start
		<div id="tabs-6" style="background-color: #dfecf5; width:890px;" >

				<table
					style="background-color: #dfecf5; margin-left: 2%; width: 78%;">
					<tr>
						<th>&nbsp;</th>
						<th>Creation Date</th>
						<th>Task Owner Id</th>
						<th>Short Description</th>
						<th>Task Status</th>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>


				</table>
				<br>
				
				
			<input id="conclusion" type="button" value="Conclusion"/>
		</div>
		tab-6 end




		</div>
		
		
		
		
		<br><br>

	</div>
 --></body>
</html>