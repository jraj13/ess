
<html>
    <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
  <%@ page import="java.util.ArrayList" %>
<%@taglib prefix="s" uri="/struts-tags"%>

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

#remarks_table{
border: 1;
}
#remarks_table tr{
 border-spacing: 0px;  
 border-style:none; 
font-size: 13px;
}
#remarks_table td{
 border-spacing: 0px;  
 border-style:none; 
font-size: 13px;
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
		$("#reclaculate").click(function() {
			alert("reclaculating....");
			//Earnings calculation
			var basic_salary= parseFloat($('#basic_salary').val());
			var convey_allowance=parseFloat($('#convey_allowance').val());
			var hra=parseFloat($('#hra').val());
			var spa=parseFloat($('#spa').val());
			var fuel_maint=parseFloat($('#fuel_maint').val());
			
			
			var education=parseFloat($('#education').val());
			var hostel=parseFloat($('#hostel').val());
			var medical=parseFloat($('#medical').val());
			var one_time_payment=parseFloat($('#one_time_payment').val());
			var lta_amount=parseFloat($('#lta_amount').val());
			
			
			
			var bonus_exgratia_amount=parseFloat($('#bonus_exgratia_amount').val());
			var advance=parseFloat($('#advance').val());
			var washing=parseFloat($('#washing').val());
			var entertainment=parseFloat($('#entertainment').val());
			var travel_fuel_expenses=parseFloat($('#travel_fuel_expenses').val());
			

			var food=parseFloat($('#food').val());
			var gift=parseFloat($('#gift').val());
			
			
			var pl_encash=parseFloat($('#pl_encash').val());
			var el_encash=parseFloat($('#el_encash').val());
			var sl_encash=parseFloat($('#sl_encash').val());
			var actual_reimburse=parseFloat($('#actual_reimburse').val());
			var hold_salary=parseFloat($('#hold_salary').val());

var total_earning=(basic_salary)+(convey_allowance)+(hra)+(spa)+(fuel_maint)+(education)+(hostel)+(medical)+(one_time_payment)+(lta_amount)+
(bonus_exgratia_amount)+(advance)+(washing)+(entertainment)+(travel_fuel_expenses)+(food)+(gift)+

(pl_encash)+(el_encash)+(sl_encash)+(actual_reimburse)+(hold_salary);
			
			//alert("total_earning..."+total_earning)
			document.getElementById("total_earnings").value=total_earning;
			
			
			 //Deduction Calculation
			
			   var pf=parseFloat($('#pf').val());
			   var profession_tax=parseFloat($('#profession_tax').val());
			   var ess_claim=parseFloat($('#ess_claim').val());
			   var notice_period=parseFloat($('#notice_period').val());
			   var mariage_loan=parseFloat($('#mariage_loan').val());
			   
			   var personal_loan=parseFloat($('#personal_loan').val());
				var medical_loan=parseFloat($('#medical_loan').val());
				var medical_reim_recovery=parseFloat($('#medical_reim_recovery').val());
				var fuel_maint_recovery=parseFloat($('#fuel_maint_recovery').val());
				var joining_bonus=parseFloat($('#joining_bonus').val());
			   
				
				var house_shift=parseFloat($('#house_shift').val());
				var black_berry=parseFloat($('#black_berry').val());
				var retemtion_bonus=parseFloat($('#retemtion_bonus').val());
				var salary_advance=parseFloat($('#salary_advance').val());
				var domestic_travel=parseFloat($('#domestic_travel').val());
			   
				
				
				var foreign_travel=parseFloat($('#foreign_travel').val());
			   
			   var impress=parseFloat($('#impress').val());
				var id_card=parseFloat($('#id_card').val());
				var notice_peroid_previous=parseFloat($('#notice_peroid_previous').val());
				 // alert("notice_peroid_previous..."+notice_peroid_previous);
				var white_goods_recovery=parseFloat($('#white_goods_recovery').val());
				// alert("white_goods_recovery..."+white_goods_recovery);
				
			

				
				
				
				var incometax=parseFloat($('#incometax').val());
				var labour_welfare=parseFloat($('#labour_welfare').val());
				var esic=parseFloat($('#esic').val());
				var lease_car_emi=parseFloat($('#lease_car_emi').val());
				var residual_value=parseFloat($('#residual_value').val());
			
				var excess_cl_recovery=parseFloat($('#excess_cl_recovery').val());
				var bmp_recovery=parseFloat($('#bmp_recovery').val());
				
				var total_deductions=(pf)+(profession_tax)+(ess_claim)+(notice_period)+(mariage_loan)+
				(personal_loan)+(medical_loan)+(medical_reim_recovery)+(fuel_maint_recovery)+(joining_bonus)+
				
				(house_shift)+(black_berry)+(retemtion_bonus)+(salary_advance)+(domestic_travel)+(foreign_travel)+
				
				(impress)+(id_card)+(notice_peroid_previous)+(white_goods_recovery)+
				(incometax)+(labour_welfare)+(esic)+(lease_car_emi)+(residual_value)+(excess_cl_recovery)+(bmp_recovery);
			//	alert(total_deductions);
				document.getElementById("total_deductions").value=total_deductions;

				// Net Amount Calculation
			var net_amount_total=	total_earning-total_deductions;
			document.getElementById("net_amount").value=net_amount_total;
			
				})
		});

  
  </script>
	
	
	
	
	 <script>
  $(function() {
	//	$("#fnfworksheet_save").click(function() {
		$('button[type=button]').click(function(){
			//alert("hi save");
			//Earnings calculation
			//var statusmain=($(this).val);
			var status = $(this).val();
			alert(status);
			if(status=="Submitted to A/C"){
				
				status="Submitted to A/C";
			}
			if(status=="Returned to HR"){
				status="Returned to HR";
			}
			if(status=="Save as draft"){
				status="Save as draft";
			}
			
			
			var seq_no=$('#seq_no').val();
			
			var basic_salary= $('#basic_salary').val();
			var convey_allowance=$('#convey_allowance').val();
			var hra=$('#hra').val();
			var spa=$('#spa').val();
			var fuel_maint=$('#fuel_maint').val();
			
			var education=$('#education').val();
			var hostel=$('#hostel').val();
			var medical=$('#medical').val();
			var one_time_payment=$('#one_time_payment').val();
			var lta_amount=$('#lta_amount').val();
			
//"&education=" + education+"&hostel=" + hostel+ "&medical=" + medical+"&one_time_payment=" + one_time_payment+"&lta_amount=" + lta_amount		
			
			
			
			
			var bonus_exgratia_amount=$('#bonus_exgratia_amount').val();
			var advance=$('#advance').val();
			var washing=$('#washing').val();
			var entertainment=$('#entertainment').val();
			var travel_fuel_expenses=$('#travel_fuel_expenses').val();
			
//"&bonus_exgratia_amount=" + bonus_exgratia_amount+"&advance=" + advance+ "&washing=" + washing+"&entertainment="+entertainment+"&travel_fuel_expenses=" + travel_fuel_expenses

			var food=$('#food').val();
			var gift=$('#gift').val();
			var pl_encash=$('#pl_encash').val();
			var el_encash=$('#el_encash').val();
			var sl_encash=$('#sl_encash').val();
		
//"&food=" + food+"&gift=" + gift			
			var actual_reimburse=$('#actual_reimburse').val();
			var hold_salary=$('#hold_salary').val();
			
			
			//End of Earnings calculation
			
			//Deduction Calculation
			
			 var pf=$('#pf').val();
			var profession_tax=$('#profession_tax').val();
			var ess_claim=$('#ess_claim').val();
			var notice_period=$('#notice_period').val();
			var mariage_loan=$('#mariage_loan').val();
//"&pf=" + pf+"&profession_tax=" + profession_tax+ "&ess_claim=" + ess_claim+ "&notice_period=" +notice_period+"&mariage_loan=" + mariage_loan+			
			
			var personal_loan=$('#personal_loan').val();
			var medical_loan=$('#medical_loan').val();
			var medical_reim_recovery=$('#medical_reim_recovery').val();
			var fuel_maint_recovery=$('#fuel_maint_recovery').val();
			var joining_bonus=$('#joining_bonus').val();
						
//"&personal_loan="+personal_loan+"&medical_loan="+medical_loan+"&medical_reim_recovery="+medical_reim_recovery+"&fuel_maint_recovery="+fuel_maint_recovery+"&joining_bonus="+joining_bonus+			
			
			var house_shift=$('#house_shift').val();
			var black_berry=$('#black_berry').val();
			var retemtion_bonus=$('#retemtion_bonus').val();
			var salary_advance=$('#salary_advance').val();
			var domestic_travel=$('#domestic_travel').val();

//"&house_shift=" + house_shift+"&black_berry=" + black_berry+ "&retemtion_bonus=" + retemtion_bonus+ "&salary_advance=" +salary_advance+"&domestic_travel=" + domestic_travel+			
			var foreign_travel=$('#foreign_travel').val();
				var impress=$('#impress').val();
				var id_card=$('#id_card').val();
				var notice_peroid_previous=$('#notice_peroid_previous').val();
				var white_goods_recovery=$('#white_goods_recovery').val();
				
//"&foreign_travel="+foreign_travel+"&impress=" + impress+ "&id_card="+id_card+ "&notice_peroid_previous=" +notice_peroid_previous+"&white_goods_recovery=" + white_goods_recovery+	
			
				var incometax=$('#incometax').val();
				var labour_welfare=$('#labour_welfare').val();
				var esic=$('#esic').val();
				var lease_car_emi=$('#lease_car_emi').val();
				var residual_value=$('#residual_value').val();

//"&incometax=" + incometax+"&labour_welfare=" + labour_welfare+ "&esic=" + esic+ "&lease_car_emi=" +lease_car_emi+"&residual_value=" + residual_value+				
				var excess_cl_recovery=$('#excess_cl_recovery').val();
				var bmp_recovery=$('#bmp_recovery').val();
			
				//end of Deduction Calculation
				
				
			//rest of fields
			
				
				var cumulative_basic=$('#cumulative_basic').val();
			//	alert("cumulative_basic"+cumulative_basic);
				
				var gratuty=$('#gratuty').val();
				//alert("gratuty"+gratuty);
				var non_taxable_leaves=$('#non_taxable_leaves').val();
				var total_earnings=$('#total_earnings').val();
				var total_deductions=$('#total_deductions').val();
				
				var net_amount=$('#net_amount').val();
				
				var remarks=$('#remarks').val();
				//var status="";
				
			
			 if (confirm('Are you sure you want process this?')) {
				 
var final_data=
	
"&seq_no=" +seq_no+ "&basic_salary=" + basic_salary+"&convey_allowance=" + convey_allowance+ "&hra=" + hra+ "&spa=" +spa+"&fuel_maint=" + fuel_maint+
"&education=" + education+"&hostel=" + hostel+ "&medical=" + medical+"&one_time_payment=" + one_time_payment+"&lta_amount=" + lta_amount+				 
"&bonus_exgratia_amount=" + bonus_exgratia_amount+"&advance=" + advance+ "&washing=" + washing+"&entertainment="+entertainment+"&travel_fuel_expenses=" + travel_fuel_expenses+
"&food=" + food+"&gift=" + gift+"&pl_encash=" + pl_encash+"&el_encash=" + el_encash+ "&sl_encash=" + sl_encash+ 
"&actual_reimburse=" +actual_reimburse+"&hold_salary=" + hold_salary+

"&pf=" + pf+"&profession_tax=" + profession_tax+ "&ess_claim=" + ess_claim+ "&notice_period=" +notice_period+"&mariage_loan=" + mariage_loan+
"&personal_loan="+personal_loan+"&medical_loan="+medical_loan+"&medical_reim_recovery="+medical_reim_recovery+"&fuel_maint_recovery="+fuel_maint_recovery+"&joining_bonus="+joining_bonus+
"&house_shift=" + house_shift+"&black_berry=" + black_berry+ "&retemtion_bonus=" + retemtion_bonus+ "&salary_advance=" +salary_advance+"&domestic_travel=" + domestic_travel+
"&foreign_travel="+foreign_travel+"&impress=" + impress+ "&id_card="+id_card+ "&notice_peroid_previous=" +notice_peroid_previous+"&white_goods_recovery=" + white_goods_recovery+
  
"&incometax=" + incometax+"&labour_welfare=" + labour_welfare+ "&esic=" + esic+ "&lease_car_emi=" +lease_car_emi+"&residual_value=" + residual_value+
 "&excess_cl_recovery=" + excess_cl_recovery+"&bmp_recovery=" + bmp_recovery+
 
 
 "&cumulative_basic=" + cumulative_basic+"&gratuty=" + gratuty+ "&non_taxable_leaves=" + non_taxable_leaves+ "&total_earnings=" +total_earnings+"&total_deductions=" + total_deductions+
 "&net_amount=" + net_amount + "&remarks="+remarks + "&status="+status;
				 
				// alert(final_data);
				
				$.ajax({
					url : 'postLoginJsp/SA_Dashbord/fandf_phase3_update.jsp',
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
	
	
	
	
	
	
</head>

<body>
<div id="qryload">
<%

String seq_no=request.getParameter("seq_no").trim();
								
								
session.setAttribute("pdfsequence_id_due_clerance", seq_no);							
								
								
//String seq_no=request.getParameter("returntoMain_screen").trim();

System.out.println("fnf worksheet hr number in full and final hr step3");
WorkSheet_FandF sheet3=new WorkSheet_FandF();



ArrayList<String> data=sheet3.getting_phase3_values(seq_no);
	System.out.println("data.size().."+data.size());
if (data.size() > 0) {
	for (int i = 0; i < data.size(); i++) {
		String fandf_data = data.get(i).toString();
		
		String reg_arr[] = fandf_data.split("\\^");
		
		String basic_salary=reg_arr[0];
		String convey_allowance = reg_arr[1];
		String hra=reg_arr[2];
		String spa = reg_arr[3];
		String fuel_maint = reg_arr[4];
		
		String education=reg_arr[5];
		String hostel=reg_arr[6];
		String medical=reg_arr[7];
		String one_time_payment=reg_arr[8];
		String lta_amount=reg_arr[9];
		
		String bonus_exgratia_amount=reg_arr[10];
		String advance=reg_arr[11];
		String washing=reg_arr[12];
		String entertainment=reg_arr[13];
		String travel_fuel_expenses=reg_arr[14];
		
		String food=reg_arr[15];
		String gift=reg_arr[16];
		
		
		String pl_encash = reg_arr[17];
		
		String el_encash = reg_arr[18];
		String sl_encash = reg_arr[19];
		String actual_reimburse = reg_arr[20];
		String hold_salary = reg_arr[21];
 
		
		
		String pf = reg_arr[22];
		String profession_tax = reg_arr[23];
		String ess_claim = reg_arr[24];
		String notice_period = reg_arr[25];
		
		String mariage_loan= reg_arr[26];
		String personal_loan= reg_arr[27];
		String medical_loan= reg_arr[28];
		String medical_reim_recovery= reg_arr[29];
		String fuel_maint_recovery= reg_arr[30];
		
		String joining_bonus= reg_arr[31];
		String house_shift= reg_arr[32];
		String black_berry= reg_arr[33];
		String retemtion_bonus= reg_arr[34];
		String salary_advance= reg_arr[35];
		
		String domestic_travel= reg_arr[36];
		String foreign_travel= reg_arr[37];
		
		
		
		
		String impress = reg_arr[38];
		String id_card = reg_arr[39];
		String notice_peroid_previous = reg_arr[40];
		String white_goods_recovery = reg_arr[41];
		
		
		
		String incometax = reg_arr[42];
		String labour_welfare = reg_arr[43];
		String esic = reg_arr[44];
		String lease_car_emi = reg_arr[45];
		String residual_value = reg_arr[46];
		
		String excess_cl_recovery = reg_arr[47];
		String bmp_recovery = reg_arr[48];
		
		
		
		String gratuty = reg_arr[49];
		String cumulative_basic=reg_arr[50];
		
		String non_taxable_leaves = reg_arr[51];
		
		//System.out.println("non_taxable_leaves amount is"+non_taxable_leaves);
		String total_earnings = reg_arr[52];
		
		//System.out.println("total_earnings amount is"+total_earnings);
		String total_deductions = reg_arr[53];
		
		//System.out.println("total_deductions amount is"+total_deductions);
		
		String net_amount = reg_arr[54];
		//String remarks_val = reg_arr[55];
		String remarks = reg_arr[55];
		
		
 //System.out.println("net amount is"+net_amount);

%> 


  <div id="qrySuccess">  

<div 
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			
			<%-- <button type="button" value="<%=seq_no %>" id="fnf_settlement_back" onclick="openPage(id)" --%>
			<button type="button" value="<%=seq_no %>" id="fnf_settlement_back_sa" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 52px;">
				Back
			</button>
			
			<!-- <button type="button" value="Continue" id="returntoMain_screen" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 144px;">
				Back to Main screen
			</button> -->
		
			<input type="hidden" id="seq_no" value="<%=seq_no %>" >
			
			<button type="button" value="Continue" id="fnfworksheet_save" 
				style="background-color: #FFFF99; height: 26px; width: 102px;">
				Save as draft
			</button>
			
			<button type="button" value="Submitted to SA" id="fnfworksheet" onclick="openPage(id)"
				onclick="openPageFnFworksheet(id)"
				style="background-color: #FFFF99; height: 26px; width: 221px;" disabled>
				Submitted to Sectioning Authority
			</button>

<!-- onclick="openCurrentPage(this.id)" -->
			<button type="button" value="Submitted to A/C" id="submit_to_ac"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				Submitted to Account
			</button>
				<button type="button" value="Returned to HR" id="hrcreatereq"
				style="background-color: #FFFF99; height: 26px; width: 115px;">
				Resubmit to HR
			</button>
			
			<%-- <s:button value="Due Clearance Details" action="pdf_due_clerance" style="background-color: #FFFF99; height: 26px; width: 152px;">
			
			</s:button> --%>
				<a style="background-color: #FFFF99; height: 26px; width: 152px;" href="<s:url action="pdf_due_clerance"/> ">Due Clearance Details</a>
			
		</div>
		
	<div class="wrap">
		<div class="fleft">
		
	<table id="fnfworksheet_table_1"
		 style="margin-top: 3px; margin-left: -1.5%; padding-left: 15px;  float:left;width: 100%; "> 
		
				<caption style="background-color: #98c3e2;padding-left: 0px;height:30px;"><b>Earning(Rs)</b></caption>
		<tr>
			<td style="padding-left:12px;">Basic Salary:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=basic_salary %>" disabled="disabled"/></td>
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
			<td style="padding-left:12px;">Education Allowance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=education %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Children Hostel Allowance:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=hostel %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Medical Reimbursement:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=medical %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">One Time Payment:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=one_time_payment %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">LTA:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=lta_amount %>" disabled="disabled"/></td>
			</tr>
			
			
			
			<tr>
			<td style="padding-left:12px;">Bonus/Ex Gratia:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=bonus_exgratia_amount %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Advance Bonus:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=advance %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Washing Expense:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=washing %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Entertainment Expense:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=entertainment %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Travel/Fuel Expense:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=travel_fuel_expenses %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Food Coupens:</td>
			<td><input type="text" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=food %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:12px;">Gift Coupens:</td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=gift %>" disabled="disabled"/></td>
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
		<td style="padding-left: 50px;" ><input type="text" id="cumulative_basic"  style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=cumulative_basic %>" disabled="disabled"/></td>
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
			<td><input type="text" id="education"  style="height: 26px;width:126px;" value="<%=education %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="hostel"  style="height: 26px;width:126px;" value="<%=hostel %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="medical"  style="height: 26px;width:126px;" value="<%=medical %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="one_time_payment"  style="height: 26px;width:126px;" value="<%=one_time_payment %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="lta_amount"  style="height: 26px;width:126px;" value="<%=lta_amount %>"/></td>
			</tr>
			<tr>
			<td><input type="text" id="bonus_exgratia_amount"  style="height: 26px;width:126px;" value="<%=bonus_exgratia_amount %>"/></td>
			</tr>
			
			
			<tr>
			<td><input type="text" id="advance"  style="height: 26px;width:126px;" value="<%=advance %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="washing"  style="height: 26px;width:126px;" value="<%=washing %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="entertainment"  style="height: 26px;width:126px;" value="<%=entertainment %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="travel_fuel_expenses"  style="height: 26px;width:126px;" value="<%=travel_fuel_expenses %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="food"  style="height: 26px;width:126px;" value="<%=food %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="gift"  style="height: 26px;width:126px;" value="<%=gift %>" /></td>
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
			
			
			
			<tr>
			<td style="padding-left:7px;">Marriage Loan:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=mariage_loan %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Personal Loan:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=personal_loan %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Medical Loan:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=medical_loan %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Medical Reimb. Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=medical_reim_recovery %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Fuel&Maintainance Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=fuel_maint_recovery %>" disabled="disabled"/></td>
			</tr>
			
			
			
			<tr>
			<td style="padding-left:7px;">Joining Bonus:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=joining_bonus %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">House Shift Allowance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=house_shift %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">BlackBerry Handset Recovery:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=black_berry %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Retention Bonus:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=retemtion_bonus %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Salary Advance:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=salary_advance %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Domestic Travel Adv.:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=domestic_travel %>" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;">Foreign Travel Adv.:</td>
			<td><input type="text" id="" style="background-color: #dfecf5;height: 26px;width:126px;" value="<%=foreign_travel %>" disabled="disabled"/></td>
			</tr>
			
			
			
			
			
			
			
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
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /> </td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /></td>
			<td ><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
			</tr>
			<tr>
			<td style="padding-left:7px;"><input type="text" id="" value=" " style="background-color: white;height: 26px;width:135px;" /></td>
			<td><input type="text"  style="background-color: #dfecf5;height: 26px;width:126px;" disabled="disabled"/></td>
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
			
			
			
			<tr>
			<td><input type="text" id="mariage_loan"  style="height: 26px;width:126px;" value="<%=mariage_loan %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="personal_loan" style="height: 26px;width:126px;" value="<%=personal_loan %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="medical_loan" style="height: 26px;width:126px;" value="<%=medical_loan %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="medical_reim_recovery"  style="height: 26px;width:126px;" value="<%=medical_reim_recovery %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="fuel_maint_recovery"  style="height: 26px;width:126px;" value="<%=fuel_maint_recovery %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="joining_bonus"  style="height: 26px;width:126px;" value="<%=joining_bonus %>" /></td>
			</tr>
			
			
			
			<tr>
			<td><input type="text" id="house_shift"  style="height: 26px;width:126px;" value="<%=house_shift %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="black_berry"  style="height: 26px;width:126px;" value="<%=black_berry %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="retemtion_bonus" style="height: 26px;width:126px;" value="<%=retemtion_bonus %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="salary_advance"  style="height: 26px;width:126px;" value="<%=salary_advance %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="domestic_travel"  style="height: 26px;width:126px;" value="<%=domestic_travel %>" /></td>
			</tr>
			<tr>
			<td><input type="text" id="foreign_travel"  style="height: 26px;width:126px;" value="<%=foreign_travel %>" /></td>
			</tr>
			
			
			
			
			
			
			
			
			
			
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
	 <caption style="background-color: #98c3e2;margin-top: 43px"><b>Net Earnings and Deductions</b></caption>
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
<hr style="color:#000000;">

 <table id="remarks_table"  style= "width: 100%;float:left;" >
 <caption style="background-color: #98c3e2;"><b>Remarks*</b></caption>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td style="width:150px;padding-left:12px;"><textarea rows="3" cols="46" id="remarks" ><%=remarks %></textarea></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
</table>
<br><br>

 <%
 }
 }
 %>
 </div>
 </div>
 </div>
</body>
</html>
