<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String seq_no=request.getParameter("seq_no").trim();

//String seq_no="106";
float  basic_salary= Float.parseFloat(request.getParameter("basic_salary").trim());
float convey_allowance=Float.parseFloat(request.getParameter("convey_allowance").trim());
float hra=Float.parseFloat(request.getParameter("hra").trim());
float spa=Float.parseFloat(request.getParameter("spa").trim());
float fuel_maint=Float.parseFloat(request.getParameter("fuel_maint").trim());

float education=Float.parseFloat(request.getParameter("education").trim());
float hostel=Float.parseFloat(request.getParameter("hostel").trim());
float medical=Float.parseFloat(request.getParameter("medical").trim());
float one_time_payment=Float.parseFloat(request.getParameter("one_time_payment").trim());
float lta_amount=Float.parseFloat(request.getParameter("lta_amount").trim());





float bonus_exgratia_amount=Float.parseFloat(request.getParameter("bonus_exgratia_amount").trim());
float advance=Float.parseFloat(request.getParameter("advance").trim());
float washing=Float.parseFloat(request.getParameter("washing").trim());
float entertainment=Float.parseFloat(request.getParameter("entertainment").trim());
float travel_fuel_expenses=Float.parseFloat(request.getParameter("travel_fuel_expenses").trim());


float food=Float.parseFloat(request.getParameter("food").trim());
float gift=Float.parseFloat(request.getParameter("gift").trim());
float pl_encash=Float.parseFloat(request.getParameter("pl_encash").trim());
float el_encash=Float.parseFloat(request.getParameter("el_encash").trim());
float sl_encash=Float.parseFloat(request.getParameter("sl_encash").trim());

float actual_reimburse=Float.parseFloat(request.getParameter("actual_reimburse").trim());
float hold_salary=Float.parseFloat(request.getParameter("hold_salary").trim());


//End of Earnings calculation

//Deduction Calculation

 float pf=Float.parseFloat(request.getParameter("pf").trim());
float profession_tax=Float.parseFloat(request.getParameter("profession_tax").trim());
float ess_claim=Float.parseFloat(request.getParameter("ess_claim").trim());
float notice_period=Float.parseFloat(request.getParameter("notice_period").trim());
float mariage_loan=Float.parseFloat(request.getParameter("mariage_loan").trim());

float personal_loan=Float.parseFloat(request.getParameter("personal_loan").trim());
float medical_loan=Float.parseFloat(request.getParameter("medical_loan").trim());
float medical_reim_recovery=Float.parseFloat(request.getParameter("medical_reim_recovery").trim());
float fuel_maint_recovery=Float.parseFloat(request.getParameter("fuel_maint_recovery").trim());
float joining_bonus=Float.parseFloat(request.getParameter("joining_bonus").trim());
			

float house_shift=Float.parseFloat(request.getParameter("house_shift").trim());
float black_berry=Float.parseFloat(request.getParameter("black_berry").trim());
float retemtion_bonus=Float.parseFloat(request.getParameter("retemtion_bonus").trim());
float salary_advance=Float.parseFloat(request.getParameter("salary_advance").trim());
float domestic_travel=Float.parseFloat(request.getParameter("domestic_travel").trim());

float foreign_travel=Float.parseFloat(request.getParameter("foreign_travel").trim());
	float impress=Float.parseFloat(request.getParameter("impress").trim());
	float id_card=Float.parseFloat(request.getParameter("id_card").trim());
	float notice_peroid_previous=Float.parseFloat(request.getParameter("notice_peroid_previous").trim());
	float white_goods_recovery=Float.parseFloat(request.getParameter("white_goods_recovery").trim());
	

	float incometax=Float.parseFloat(request.getParameter("incometax").trim());
	float labour_welfare=Float.parseFloat(request.getParameter("labour_welfare").trim());
	float esic=Float.parseFloat(request.getParameter("esic").trim());
	float lease_car_emi=Float.parseFloat(request.getParameter("lease_car_emi").trim());
	float residual_value=Float.parseFloat(request.getParameter("residual_value").trim());

	float excess_cl_recovery=Float.parseFloat(request.getParameter("excess_cl_recovery").trim());
	float bmp_recovery=Float.parseFloat(request.getParameter("bmp_recovery").trim());

	//end of Deduction Calculation
	
	
//rest of fields

	
	float cumulative_basic=Float.parseFloat(request.getParameter("cumulative_basic").trim());
	//alert("cumulative_basic"+cumulative_basic);
	
	float gratuty=Float.parseFloat(request.getParameter("gratuty").trim());
	//alert("gratuty"+gratuty);
	float non_taxable_leaves=Float.parseFloat(request.getParameter("non_taxable_leaves").trim());
	float total_earnings=Float.parseFloat(request.getParameter("total_earnings").trim());
	float total_deductions=Float.parseFloat(request.getParameter("total_deductions").trim());
	
	float net_amount=Float.parseFloat(request.getParameter("net_amount").trim());

	String remarks=request.getParameter("remarks").trim();

	String status=request.getParameter("status").trim();

	WorkSheet_FandF fandf_insert=new WorkSheet_FandF();

String inser_msg=fandf_insert.update_step3_values(
		
		basic_salary,convey_allowance,hra,spa,fuel_maint,
		education,hostel,medical,one_time_payment,lta_amount,
		bonus_exgratia_amount,advance,washing,entertainment,travel_fuel_expenses,
		food,gift,pl_encash,el_encash,sl_encash,
		actual_reimburse,hold_salary,
		
		
		pf,profession_tax,ess_claim,notice_period,mariage_loan,
		personal_loan,medical_loan,medical_reim_recovery,fuel_maint_recovery,joining_bonus,
		
		house_shift,black_berry,retemtion_bonus,salary_advance,domestic_travel,foreign_travel,
		
		impress,id_card,notice_peroid_previous,white_goods_recovery,
		incometax,labour_welfare,esic,lease_car_emi,residual_value,
		excess_cl_recovery,bmp_recovery,
		
		cumulative_basic,
		gratuty,
		non_taxable_leaves,
		total_earnings,
		total_deductions,
		net_amount,seq_no,remarks,status);


out.println(inser_msg);

%>










</body>
</html>