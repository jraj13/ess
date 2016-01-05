<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

#fnfworksheet_table_1,#fnfworksheet_table_3,#gratuty,#excemptions,#net_earnings {
	border-spacing: 1px;
	border-style: none;
	border: 1;
	font-size: 13px;
}

#fnfworksheet_table_1 td,#fnfworksheet_table_3 td,#gratuty td,#excemptions td,#net_earnings td {
	border-spacing: 0px;
	border-style: none;
	border: 1px;
	font-size: 13px;
}
#fnfworksheet_table_2,#fnfworksheet_table_4 {
	border-spacing: 1px;
	border-style: none;
	border: 1px;
	font-size: 13px;
	
}

#fnfworksheet_table_2 td,#fnfworksheet_table_4 td {
	border-spacing: 0px;
	border-style: none;
	border: 1px;
	font-size: 13px;
	padding-left: 10px;
}




.wrap {
 width: 100%; 
overflow:auo; 
}

.fleft {
    float:left; 
    width: 31.5%;
/* background:blue; */ 
    height: 100px;
    
}




</style>
<script type="text/javascript">
function openCurrentPage2(id){
if (id == "submit_to_ac") {
	alert("you can not submit details to Account ! ");
	}}
	</script>

<script type="text/javascript">
	
function openCurrentPage1(id){
	alert(id);
	
	var dataString='&sequence_id='+id;
	
			$.ajax({
				url :'postLoginJsp/HRController/fnf_hr_clilck_Sectioning_authority.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data) {
				 // $('#Sectioning_authority_res').html(data).delay(5000).fadeOut();  
					 $('#Sectioning_authority_res').html(data); 
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
};

$( "#bind" ).click(function() {
	   $(this).attr("disabled", "disabled");
	   $("#unbind").removeAttr("disabled");
	});
	</script>
</head>
<body>
<%-- <%
String seq_no=request.getParameter("seq_no").trim();

%> --%>
<div id="Sectioning_authority_res"></div>
<div 
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			
			<button type="button" value="Continue" id="fnf_settlement_action" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 52px;">
				
				Back
			</button>
			
			<button type="button" value="Continue" id="returntoMain_screen" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 144px;">
				Back to Main screen
			</button>
			<button type="button" value="Continue" id="fnfworksheet" onclick="openPage(id)"
				onclick="openPageFnFworksheet(id)"
				style="background-color: #FFFF99; height: 26px; width: 102px;">
				
				Save as draft
			</button>
			
			<button type="button" value="112" id="submit_to_sa" 
				onclick="openCurrentPage1(this.value)"
				style="background-color: #FFFF99; height: 26px; width: 232px;">
				
				Submitted to Sanctioning Authority
			</button>

			<button type="button" value="submit_to_ac" id="submit_to_ac"
				onclick="openCurrentPage2(this.id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				
				Submitted to Account
			</button>
				<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 115px;">
			
				Resubmit to HR
			</button>
				<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 152px;">
				
				Due Clearance Details
			</button>

			
			
		</div>
		
	<!-- 	<div
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 19.5%;float:left;">
			<b>Earning (Rs)</b>
		</div> -->
		
	<div class="wrap">
		<div class="fleft">
		
	<table id="fnfworksheet_table_1"
		 style="margin-top: 3px; margin-left: -1.5%; padding-left: 15px;  float:left;width: 100%; "> 
		
				<caption style="background-color: #98c3e2;padding-left: 0px;height:30px;"><b>Earning(Rs)<b></b></caption>
		<tr>
			<td style="padding-left:12px;">Basic Salary:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Conveyance Allowance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Housing Rent Allowance(HRA):</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Special Personal Allowance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Fuel & Maintenance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">PL Encashment:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">EL Encashment:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">SL Encashment:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Actual Reimbursment Total:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Management Medical:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Hold Salary:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr >
			<td style="padding-left:12px;"> <input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			
			
			
			
	</table>
	
	<table id="gratuty" border="1" style="margin-top: 3px;margin-left: -3px;"><!--  style="margin-top: 3px; margin-left: -1.5%; padding-left: 15px; "> --> 
	
	<!-- <table id="gratuty"> -->
		 <caption style="background-color: #98c3e2;padding-left: 35px;width:329px; margin-top: 2%;"><b>Gratuty/Exgratia</b></caption> 
		<tr>
		<td style="padding-left:12px;">Cumulative Basic </td>
		<td style="padding-left: 50px;" ><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
		</tr>
		<tr>
		<td style="padding-left:12px;">Total Gratuty/Exgratia</td>
		<td style="padding-left: 50px;"><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
		</tr>
		
		</table> 
		<br>
		
		<table id="excemptions" style="margin-left: -3px;margin-top: -24px;">
		 <caption style="background-color: #98c3e2;padding-left: 0px; width:329px"><b>Exemptions</b></caption> 
		<tr>
		<td style="padding-left: 12px;">Non Taxable Leave exemption </td>
		<td style="padding-left: 0px;" ><input type="text" id="" value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
		</tr>
		
		
		</table> 
	
</div>

	<table id="fnfworksheet_table_2"
		style="margin-top: 3px; font-size: 15px; width: 14%;float:left;margin-left: 0.0%; ">
		<caption style="background-color: #98c3e2;"><b>Earning(Rs)</b></caption>
		<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="0.0" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="0.0" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="0.0" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="0.0" style="height: 26px;width:126px;" /></td>
			</tr>
			
	</table>

	<table id="fnfworksheet_table_3"
		style="margin-top: 3px; font-size: 15px; width: 36.5%; float: left;margin-left: 0.4%;">
		<caption style="background-color: #98c3e2;"><b>Deductions(Rs)</b></caption>
		<tr>
			<td style="padding-left:7px;">PF:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Professional Tax:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">ESS Claim Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Notice Period:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">RIM Handset Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">imprest/Any Other Advance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Identity Card:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Notice Pay to Previous Employer:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">White goods recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">VAT-White goods:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Complaint triggered recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Income Tax:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Labour Welfare Fund</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">ESIC</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Lease Car EMI</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Residual Value</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Excess CL Recovery</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">SMP Recovery</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /> </td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /></td>
			<td ><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /></td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
		
	</table>

	<table id="fnfworksheet_table_4"
		style="margin-top: 3px; font-size: 15px; width: 14%; float: left;margin-left: 0.4%;">
		<caption style="background-color: #98c3e2;"><b>Deductions(Rs)</b></caption>
		<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td><input type="text" id="" value="" style="height: 26px;width:126px;" /></td>
			</tr>
			
			
	</table>
	
<br><br>

 <table  id="net_earnings" style= "width: 100%;margin-left: -3px;margin-top: 160px">
	 <caption style="background-color: #98c3e2;margin-top: 19px"><b>Net Earnings and Deductions</b></caption>
	<tr>
	<td colspan="2" style="padding-left: 12px;"><input type="button" style="background-color:#FFFF99;" value="Recalculate Net Amount"/></td>
		</tr>
		
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Earnings(Rs) :</td>
		<td><input type="text" value="105" style="height: 26px;width:126px;"/></td>
		</tr>
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Deductions(Rs) :</td>
		<td><input type="text" value="999" style="height: 26px;width:126px;"/></td>
		</tr>
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Net Amount:</td>
		<td><input type="text" value="999" style="height: 26px;width:126px;"/></td>
		<tr>
		
</table>
<!-- <input type="button" value="save"/> -->
 </div>
 
</body>
</html>