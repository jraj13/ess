
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
    <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
  <%@ page import="java.util.ArrayList" %>
   <%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

#fnfworksheet_table_1,#fnfworksheet_table_3,#gratuty_tab,#excemptions,#net_earnings {
	border-spacing: 1px;
	border-style: none;
	border: 1;
	font-size: 13px;
}

#fnfworksheet_table_1 td,#fnfworksheet_table_3 td,#gratuty_tab td,#excemptions td,#net_earnings td {
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
    height: 100px;
}


</style>

<script type="text/javascript">
function openCurrentPage(id){
if (id == "submit_to_ac") {
	alert("you can not submit details to Account ! ");
	}}
	</script>
	
	<script>
	$(function() {
		$("#submit_to_sa").click(function() {
			
				var id = $('#seq_no').val();
						//	alert(id);
							var check_submit = $('#hr_clear_pro_sts').val();
							alert("check..." + check_submit);

							if (check_submit == "Submitted to SA") {
								$('#submit_to_sa').prop('disabled', true);
							}
							/* else if(check_submit=="Submitted to A/C"){
							$('#submit_to_ac').prop('disabled', true);
							} */
							else if (check_submit == "Returned to HR") {
								$('#return_to_hr').prop('disabled', true);
							}

							else {
								$('#submit_to_sa').prop('disabled', false);

								var dataString = '&sequence_id=' + id;
							//	alert(dataString);

								$.ajax({
											url : 'postLoginJsp/HRController/fnf_hr_clilck_Sectioning_authority.jsp',
											type : 'POST',
											data : dataString,
											datatype : 'json',
											success : function(data) {
												// $('#Sectioning_authority_res').html(data).delay(5000).fadeOut();  
												$('#Sectioning_authority_res')
														.html(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {

											}
										});
							}
						});
	});
</script>

	
	 <script>
  $(function() {
		//$("#fnfworksheet_save").click(function() {
				$('button[type=button]').click(function(){
			//alert("hi save");
			//Earnings calculation
			//var statusmain=($(this).val);
			var status = $(this).val();
			alert(status);
			if(status=="Submitted to SA"){
				status="Submitted to SA";
			}
			if(status=="Returned to HR"){
				status="Returned to HR";
			}
			if(status=="Save as draft"){
				status="Save as draft";
			}
			
			var seq_no=$('#seq_no').val();
			//alert(seq_no);
			
			var basic_salary= $('#basic_salary').val();
			var convey_allowance=$('#convey_allowance').val();
			var hra=$('#hra').val();
			var spa=$('#spa').val();
			var fuel_maint=$('#fuel_maint').val();
			
			
			//"&basic_salary=" + basic_salary+"&convey_allowance=" + convey_allowance+ "&hra=" + hra+ "&spa=" +spa+"&fuel_maint=" + fuel_maint
			
			
			var pl_encash=$('#pl_encash').val();
			var el_encash=$('#el_encash').val();
			var sl_encash=$('#sl_encash').val();
			var actual_reimburse=$('#actual_reimburse').val();
			var management_medical=$('#management_medical').val();
			
			var hold_salary=$('#hold_salary').val();
			
//"&pl_encash=" + pl_encash+"&el_encash=" + el_encash+ "&sl_encash=" + sl_encash+ "&actual_reimburse=" +actual_reimburse+"&management_medical=" + management_medical+"&hold_salary=" + hold_salary			
			
			//End of Earnings calculation
			
			//Deduction Calculation
			
			 var pf=$('#pf').val();
			var profession_tax=$('#profession_tax').val();
			var ess_claim=$('#ess_claim').val();
			var notice_period=$('#notice_period').val();
			var impress=$('#impress').val();

			//"&pf=" + pf+"&profession_tax=" + profession_tax+ "&ess_claim=" + ess_claim+ "&notice_period=" +notice_period+"&impress=" + impress
			
				var id_card=$('#id_card').val();
				var notice_peroid_previous=$('#notice_peroid_previous').val();
				var white_goods_recovery=$('#white_goods_recovery').val();
				var vat_white_goods=$('#vat_white_goods').val();
				var complint_triggered=$('#complint_triggered').val();
	
	//"&id_card=" + id_card+"&notice_peroid_previous=" + notice_peroid_previous+ "&white_goods_recovery=" + white_goods_recovery+ "&vat_white_goods=" +vat_white_goods+"&complint_triggered=" + complint_triggered
			
				var incometax=$('#incometax').val();
				var labour_welfare=$('#labour_welfare').val();
				var esic=$('#esic').val();
				var lease_car_emi=$('#lease_car_emi').val();
				var residual_value=$('#residual_value').val();

//"&incometax=" + incometax+"&labour_welfare=" + labour_welfare+ "&esic=" + esic+ "&lease_car_emi=" +lease_car_emi+"&residual_value=" + residual_value
				
				var excess_cl_recovery=$('#excess_cl_recovery').val();
				var bmp_recovery=$('#bmp_recovery').val();
			
				//end of Deduction Calculation
				
//"&excess_cl_recovery=" + excess_cl_recovery+"&bmp_recovery=" + bmp_recovery+
				
			//rest of fields
			
				
				var cumulative_basic=$('#cumulative_basic').val();
				//alert("cumulative_basic"+cumulative_basic);
				
				var gratuty=$('#gratuty').val();
				//alert("gratuty"+gratuty);
				var non_taxable_leaves=$('#non_taxable_leaves').val();
				var total_earnings=$('#total_earnings').val();
				var total_deductions=$('#total_deductions').val();
				
//"&cumulative_basic=" + cumulative_basic+"&gratuty=" + gratuty+ "&non_taxable_leaves=" + non_taxable_leaves+ "&total_earnings=" +total_earnings+"&total_deductions=" + total_deductions
				var net_amount=$('#net_amount').val();
				
//"&net_amount=" + net_amount;
			
			 if (confirm('Are you sure you want process this?')) {
				 
				 var final_data="seq_no="+seq_no+ "&basic_salary=" + basic_salary+"&convey_allowance=" + convey_allowance+ "&hra=" + hra+ "&spa=" +spa+"&fuel_maint=" + fuel_maint+
 "&pl_encash=" + pl_encash+"&el_encash=" + el_encash+ "&sl_encash=" + sl_encash+ "&actual_reimburse=" +actual_reimburse+"&management_medical=" + management_medical+"&hold_salary=" + hold_salary+
 "&pf=" + pf+"&profession_tax=" + profession_tax+ "&ess_claim=" + ess_claim+ "&notice_period=" +notice_period+"&impress=" + impress+
 "&id_card=" + id_card+"&notice_peroid_previous=" + notice_peroid_previous+ "&white_goods_recovery=" + white_goods_recovery+ "&vat_white_goods=" +vat_white_goods+"&complint_triggered=" + complint_triggered+
 "&incometax=" + incometax+"&labour_welfare=" + labour_welfare+ "&esic=" + esic+ "&lease_car_emi=" +lease_car_emi+"&residual_value=" + residual_value+
 "&excess_cl_recovery=" + excess_cl_recovery+"&bmp_recovery=" + bmp_recovery+
 "&cumulative_basic=" + cumulative_basic+"&gratuty=" + gratuty+ "&non_taxable_leaves=" + non_taxable_leaves+ "&total_earnings=" +total_earnings+"&total_deductions=" + total_deductions+
 "&net_amount=" + net_amount+ "&status="+status;
				 
				// alert(final_data);
				
				$.ajax({
					url : 'postLoginJsp/HRController/fandf_step1_update_values.jsp',
					type : 'POST',
					data : final_data,
					datatype : 'json',
					success : function(data) {
						
						$("#qryload").html(data);
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Please try Again");

					}
				});
					} 
			
				})
		});

  
  </script>
	
	 <script>
  $(function() {
		$("#reclaculate").click(function() {
			alert("reclaculating....");
			//Earnings calculation
			var basic_salary= parseFloat($('#basic_salary').val());
			var convey_allowance=parseFloat($('#convey_allowance').val());
			var hra=parseFloat($('#hra').val());
			var spa=parseFloat($('#spa').val());
			var fuel_maint=parseFloat($('#fuel_maint').val());
			
			var pl_encash=parseFloat($('#pl_encash').val());
			var el_encash=parseFloat($('#el_encash').val());
			var sl_encash=parseFloat($('#sl_encash').val());
			var actual_reimburse=parseFloat($('#actual_reimburse').val());
			var management_medical=parseFloat($('#management_medical').val());
			var hold_salary=parseFloat($('#hold_salary').val());

			var total_earning=(basic_salary)+(convey_allowance)+(hra)+(spa)+(fuel_maint)+(pl_encash)+(el_encash)+(sl_encash)+(actual_reimburse)+(management_medical)+(hold_salary);
			
			//alert("total_earning..."+total_earning)
			document.getElementById("total_earnings").value=total_earning;
			
			
			 //Deduction Calculation
			
			   var pf=parseFloat($('#pf').val());
			   var profession_tax=parseFloat($('#profession_tax').val());
			   var ess_claim=parseFloat($('#ess_claim').val());
			   var notice_period=parseFloat($('#notice_period').val());
			   var impress=parseFloat($('#impress').val());
			
				var id_card=parseFloat($('#id_card').val());
				var notice_peroid_previous=parseFloat($('#notice_peroid_previous').val());
				 // alert("notice_peroid_previous..."+notice_peroid_previous);
				var white_goods_recovery=parseFloat($('#white_goods_recovery').val());
				// alert("white_goods_recovery..."+white_goods_recovery);
				var vat_white_goods=parseFloat($('#vat_white_goods').val());
				var complint_triggered=parseFloat($('#complint_triggered').val());

				var incometax=parseFloat($('#incometax').val());
				var labour_welfare=parseFloat($('#labour_welfare').val());
				var esic=parseFloat($('#esic').val());
				var lease_car_emi=parseFloat($('#lease_car_emi').val());
				var residual_value=parseFloat($('#residual_value').val());
			
				var excess_cl_recovery=parseFloat($('#excess_cl_recovery').val());
				var bmp_recovery=parseFloat($('#bmp_recovery').val());
			
				
				var total_deductions=(pf)+(profession_tax)+(ess_claim)+(notice_period)+(impress)+(id_card)+(notice_peroid_previous)+(white_goods_recovery)+(vat_white_goods)+(complint_triggered)+(incometax)+(labour_welfare)+(esic)+(lease_car_emi)+(residual_value)+(excess_cl_recovery)+(bmp_recovery);;
			//	alert(total_deductions);
				document.getElementById("total_deductions").value=total_deductions;

				// Net Amount Calculation
			var net_amount_total=	total_earning-total_deductions;
			document.getElementById("net_amount").value=net_amount_total;
			
				})
		});
  
  </script>
  
	
	
</head>

<body>
<div id="qryload">
<%

String seq_no=request.getParameter("seq_no").trim();
System.out.println("fandf_step1_view..."+seq_no);

session.setAttribute("pdfsequence_id_due_clerance", seq_no);

//String seq_no=request.getParameter("returntoMain_screen").trim();

//String seq_no="106";
								
System.out.println("fnf worksheet hr number in full and final hr");

Full_N_Final_Settlement fnf_obj = new Full_N_Final_Settlement();
ArrayList<String> list = fnf_obj.hr_crearance_reports(seq_no);

if (list.size() > 0) {

	for (int y = 0; y < list.size(); y++) {
		String fnf_data = list.get(y).toString();
		String fnf_arr[] = fnf_data.split("\\^");

		String hr_clear_pro_sts = fnf_arr[0];
		



WorkSheet_FandF sheet1=new WorkSheet_FandF();

ArrayList<String> data=sheet1.fetching_step1_fandF(seq_no);
if (data.size() > 0) {
	for (int i = 0; i < data.size(); i++) {
		String fandf_data = data.get(i).toString();
		
		String reg_arr[] = fandf_data.split("\\^");
		
		String basic_salary=reg_arr[0];
		String convey_allowance = reg_arr[1];
		String hra=reg_arr[2];
		String spa = reg_arr[3];
		String fuel_maint = reg_arr[4];
		String pl_encash = reg_arr[5];
		
		String el_encash = reg_arr[6];
		String sl_encash = reg_arr[7];
		String actual_reimburse = reg_arr[8];
		String management_medical = reg_arr[9];
		String hold_salary = reg_arr[10];
 
		String pf = reg_arr[11];
		String profession_tax = reg_arr[12];
		String ess_claim = reg_arr[13];
		String notice_period = reg_arr[14];
		String impress = reg_arr[15];
		
		String id_card = reg_arr[16];
		String notice_peroid_previous = reg_arr[17];
		String white_goods_recovery = reg_arr[18];
		String vat_white_goods = reg_arr[19];
		String complint_triggered = reg_arr[20];
		
		String incometax = reg_arr[21];
		String labour_welfare = reg_arr[22];
		String esic = reg_arr[23];
		String lease_car_emi = reg_arr[24];
		String residual_value = reg_arr[25];
		
		String excess_cl_recovery = reg_arr[26];
		String bmp_recovery = reg_arr[27];
		String gratuty = reg_arr[28];
		String non_taxable_leaves = reg_arr[29];
		System.out.println("non_taxable_leaves amount is"+non_taxable_leaves);
		String total_earnings = reg_arr[30];
		System.out.println("total_earnings amount is"+total_earnings);
		String total_deductions = reg_arr[31];
		System.out.println("total_deductions amount is"+total_deductions);
		String net_amount = reg_arr[32];
		
 System.out.println("net amount is"+net_amount);

%> 


  <div id="qrySuccess">  

<div 
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			
			<%-- <button type="button" value="<%=seq_no %>" id="fnf_settlement_back" onclick="openPage(id)" --%>
			<button type="button" value="<%=seq_no %>" id="fnf_settlement_back" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 52px;">
				
				Back
			</button>
			
			<button type="button" value="Continue" id="returntoMain_screen" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 144px;">
				Back to Main screen
			</button>
			<!-- <button type="button" value="Continue" id="fnfworksheet" onclick="openPage(id)"
				onclick="openPageFnFworksheet(id)"
				style="background-color: #FFFF99; height: 26px; width: 102px;">
				
				Save as draft
			</button> -->
			<input type="hidden" value="<%=seq_no %>"
				id="seq_no">
			<button type="button" value="Save as draft" id="fnfworksheet_save" 
				style="background-color: #FFFF99; height: 26px; width: 102px;">
				Save as draft
			</button>
			
			<input type="hidden" value="<%=hr_clear_pro_sts %>"
				id="hr_clear_pro_sts">
				
			<button type="button" value="Submitted to SA" id="submit_to_sa"
				class="bind"
				style="background-color: #FFFF99; height: 26px; width: 232px;">
				Submitted to Sanctioning Authority</button>
				
			<!-- <button type="button" value="Continue" id="fnfworksheet" onclick="openPage(id)"
				onclick="openPageFnFworksheet(id)"
				style="background-color: #FFFF99; height: 26px; width: 221px;">
				Submitted to Sectioning Authority
			</button> -->

			<button type="button" value="Submitted to A/C" id="submit_to_ac"
				onclick="openCurrentPage(this.id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;" disabled>
				Submitted to Account
			</button>
			<button type="button" value="Returned to HR" id="return_to_hr"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 115px;" disabled>
				Resubmit to HR
			</button>
			
			<!-- <button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 152px;">
				Due Clearance Details
			</button> -->
			
				<a style="background-color: #FFFF99; height: 26px; width: 152px;" href="<s:url action="pdf_due_clerance"/> ">Due Clearance Details</a>
			

			
			
		</div>
		
	<div class="wrap">
		<div class="fleft">
		
	<table id="fnfworksheet_table_1"
		 style="margin-top: 3px; margin-left: -1.5%; padding-left: 15px;  float:left;width: 100%; "> 
		
				<caption style="background-color: #98c3e2;padding-left: 0px;height:30px;"><b>Earning(Rs)</b></caption>
		<tr>
			<td style="padding-left:12px;">Basic Salary:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=basic_salary %>" disabled="disabled" /></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Conveyance Allowance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=convey_allowance %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Housing Rent Allowance(HRA):</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=hra %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Special Personal Allowance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=spa %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Fuel and Maintenance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=fuel_maint %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">PL Encashment:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=pl_encash %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">EL Encashment:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=el_encash %>" disabled="disabled"/></td>
			</tr>
			
			<tr>
			<td style="padding-left:12px;">SL Encashment:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;"  value="<%=sl_encash %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Actual Reimbursment Total:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=actual_reimburse %>" disabled="disabled"/></td>
			
			</tr>
			<tr>
			<td style="padding-left:12px;">Management Medical:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=management_medical %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Hold Salary:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=hold_salary %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text"  value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text"  value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			<tr >
			<td style="padding-left:12px;"> <input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text"  value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;"><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:135px;" /></td>
			<td><input type="text"  value="0.0" style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			
	</table>
	
	<table id="gratuty_tab" border="1" style="margin-top: 3px;margin-left: -3px;"><!--  style="margin-top: 3px; margin-left: -1.5%; padding-left: 15px; "> --> 
	
		 <caption style="background-color: #98c3e2;padding-left: 35px;width:329px; margin-top: 2%;"><b>Gratuty/Exgratia</b></caption> 
		<tr>
		<td style="padding-left:12px;">Cumulative Basic </td>
		<td style="padding-left: 50px;" ><input type="text" id="cumulative_basic"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=basic_salary %>" disabled="disabled"/></td>
		</tr>
		<tr>
		<td style="padding-left:12px;">Total Gratuty/Exgratia</td>
		<td style="padding-left: 50px;"><input type="text" id="gratuty"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=gratuty %>" disabled="disabled"/></td>
		</tr>
		</table> 
		<br>
		<table id="excemptions" style="margin-left: -3px;margin-top: -24px;">
		 <caption style="background-color: #98c3e2;padding-left: 0px; width:329px"><b>Exemptions</b></caption> 
		<tr>
		<td style="padding-left: 12px;">Non Taxable Leave exemption </td>
		<td style="padding-left: 0px;" ><input type="text" id="non_taxable_leaves"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=non_taxable_leaves %>" disabled="disabled"/></td>
		</tr>
		</table> 
	
</div>

	<table id="fnfworksheet_table_2"
		style="margin-top: 3px; font-size: 15px; width: 14%;float:left;margin-left:0.0%; ">
		<caption style="background-color: #98c3e2;"><b>Earning(Rs)</b></caption>
		<tr>
			<td><input type="text" id="basic_salary" style="height: 26px;width:126px;" value="<%=basic_salary%>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="convey_allowance" style="height: 26px;width:126px;" value="<%=convey_allowance %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="hra" style="height: 26px;width:126px;" value="<%=hra %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="spa" style="height: 26px;width:126px;" value="<%=spa %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="fuel_maint" style="height: 26px;width:126px;" value="<%=fuel_maint %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="pl_encash" style="height: 26px;width:126px;" value="<%=pl_encash %>" /></td>
			</tr>
			
			<tr>
			<td><input type="text" id="el_encash" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=el_encash %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="sl_encash" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=sl_encash %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="actual_reimburse" style="height: 26px;width:126px;" value="<%=actual_reimburse %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="management_medical" style="height: 26px;width:126px;" value="<%=management_medical %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="hold_salary" style="height: 26px;width:126px;" value="<%=hold_salary %>" /></td>
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
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=pf %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Professional Tax:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=profession_tax %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">ESS Claim Recovery:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=ess_claim %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Notice Period:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=notice_period %>" disabled="disabled"/></td>
			</tr>
			
			<!-- <tr>
			<td style="padding-left:7px;">RIM Handset Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;"  /></td>
			</tr> -->
			<tr>
			<td style="padding-left:7px;">imprest/Any Other Advance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=impress %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Identity Card:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=id_card %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Notice Pay to Previous Employer:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=notice_peroid_previous %>" disabled="disabled"/></td>
			</tr>
			
			<tr>
			<td style="padding-left:7px;">White goods recovery:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=white_goods_recovery %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">VAT-White goods:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=vat_white_goods %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Complaint triggered recovery:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=complint_triggered %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Income Tax:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=incometax %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Labour Welfare Fund</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=labour_welfare %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">ESIC</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=esic %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Lease Car EMI</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=lease_car_emi %>" disabled="disabled"/></td>
			</tr>
			
			<tr>
			<td style="padding-left:7px;">Residual Value</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=residual_value %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Excess CL Recovery</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=excess_cl_recovery %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">SMP Recovery</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=bmp_recovery %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" disabled="disabled"/> </td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" disabled="disabled"/></td>
			<td ><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" disabled="disabled"/></td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" /></td>
			</tr>
		
	</table>

	<table id="fnfworksheet_table_4"
		style="margin-top: 3px; font-size: 15px; width: 14%; float: left;margin-left: 0.4%;">
		<caption style="background-color: #98c3e2;"><b>Deductions(Rs)</b></caption>
		<tr>
			<td><input type="text" id="pf" style="height: 26px;width:126px;" value="<%=pf %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="profession_tax" style="height: 26px;width:126px;" value="<%=profession_tax %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="ess_claim" style="height: 26px;width:126px;" value="<%=ess_claim %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="notice_period" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=notice_period %>" /></td>
			</tr>
			<!-- <tr>
			<td><input type="text" id="" style="height: 26px;width:126px;" /></td>
			</tr> -->
			<tr>
			<td><input type="text" id="impress" style="height: 26px;width:126px;" value="<%=impress %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="id_card" style="height: 26px;width:126px;" value="<%=id_card %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="notice_peroid_previous" style="height: 26px;width:126px;" value="<%=notice_peroid_previous %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="white_goods_recovery" style="height: 26px;width:126px;" value="<%=white_goods_recovery %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="vat_white_goods" style="height: 26px;width:126px;" value="<%=vat_white_goods %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="complint_triggered" style="height: 26px;width:126px;" value="<%=complint_triggered %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="incometax"  style="height: 26px;width:126px;" value="<%=incometax %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="labour_welfare"  style="height: 26px;width:126px;" value="<%=labour_welfare %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="esic"  style="height: 26px;width:126px;" value="<%=esic %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="lease_car_emi"  style="height: 26px;width:126px;" value="<%=lease_car_emi %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="residual_value"  style="height: 26px;width:126px;" value="<%=residual_value %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="excess_cl_recovery"  style="height: 26px;width:126px;" value="<%=excess_cl_recovery %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="bmp_recovery"  style="height: 26px;width:126px;" value="<%=bmp_recovery %>"/></td>
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
	<td colspan="2" style="padding-left: 12px;"><input type="button" id="reclaculate" style="background-color:#FFFF99;" value="Recalculate Net Amount"/></td>
		</tr>
		
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Earnings(Rs) :</td>
		<td><input type="text"  id="total_earnings" style="height: 26px;width:126px;" value="<%=total_earnings%>" disabled="disabled"/></td>
		</tr>
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Deductions(Rs) :</td>
		<td><input type="text"  id="total_deductions" style="height: 26px;width:126px;" value="<%=total_deductions %>" disabled="disabled"/></td>
		</tr>
		<tr>
		<td style="width:150px;padding-left: 12px;">Total Net Amount:</td>
		<td><input type="text"  id="net_amount" style="height: 26px;width:126px;" value="<%=net_amount %>" disabled="disabled"/></td>
		<tr>
		
</table>
 <%
	}}
 
 }
 }
 %>
 </div>
 </div>
 </div>
</body>
</html>
