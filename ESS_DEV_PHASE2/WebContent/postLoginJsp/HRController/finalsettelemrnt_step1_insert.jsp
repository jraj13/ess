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
System.out.println("THis is Saving the f and f sheet1 jsp page");

String seq_no=request.getParameter("seq_no").trim();

float basic_salary=Float.parseFloat(request.getParameter("basic_salary").trim());
float convey_allowance=Float.parseFloat(request.getParameter("convey_allowance").trim());
float hra=Float.parseFloat(request.getParameter("hra").trim());
float spa=Float.parseFloat(request.getParameter("spa").trim());
float fuel_maint=Float.parseFloat(request.getParameter("fuel_maint").trim());


float pl_encash=Float.parseFloat(request.getParameter("pl_encash").trim());
float el_encash=Float.parseFloat(request.getParameter("el_encash").trim());
float sl_encash=Float.parseFloat(request.getParameter("sl_encash").trim());
float actual_reimburse=Float.parseFloat(request.getParameter("actual_reimburse").trim());
float management_medical=Float.parseFloat(request.getParameter("management_medical").trim());

float hold_salary=Float.parseFloat(request.getParameter("hold_salary").trim());


float pf=Float.parseFloat(request.getParameter("pf").trim());
float profession_tax=Float.parseFloat(request.getParameter("profession_tax").trim());
float ess_claim=Float.parseFloat(request.getParameter("ess_claim").trim());
float notice_period=Float.parseFloat(request.getParameter("notice_period").trim());
float impress=Float.parseFloat(request.getParameter("impress").trim());


float id_card=Float.parseFloat(request.getParameter("id_card").trim());
float notice_peroid_previous=Float.parseFloat(request.getParameter("notice_peroid_previous").trim());
float white_goods_recovery=Float.parseFloat(request.getParameter("white_goods_recovery").trim());
float vat_white_goods=Float.parseFloat(request.getParameter("vat_white_goods").trim());
float complint_triggered=Float.parseFloat(request.getParameter("complint_triggered").trim());


float incometax=Float.parseFloat(request.getParameter("incometax").trim());
float labour_welfare=Float.parseFloat(request.getParameter("labour_welfare").trim());
float esic=Float.parseFloat(request.getParameter("esic").trim());
float lease_car_emi=Float.parseFloat(request.getParameter("lease_car_emi").trim());
float residual_value=Float.parseFloat(request.getParameter("residual_value").trim());



float excess_cl_recovery=Float.parseFloat(request.getParameter("excess_cl_recovery").trim());
float bmp_recovery=Float.parseFloat(request.getParameter("bmp_recovery").trim());


float cumulative_basic=Float.parseFloat(request.getParameter("cumulative_basic").trim());
float gratuty=Float.parseFloat(request.getParameter("gratuty").trim());
float non_taxable_leaves=Float.parseFloat(request.getParameter("non_taxable_leaves").trim());
float total_earnings=Float.parseFloat(request.getParameter("total_earnings").trim());
float total_deductions=Float.parseFloat(request.getParameter("total_deductions").trim());


float net_amount=Float.parseFloat(request.getParameter("net_amount").trim());

String status=request.getParameter("status");

WorkSheet_FandF fandf_insert=new WorkSheet_FandF();


 String result=fandf_insert.Insert_step1_values(basic_salary,convey_allowance,hra,spa,fuel_maint,
		pl_encash,el_encash,sl_encash,actual_reimburse,management_medical,
		hold_salary,
		pf,profession_tax,ess_claim,notice_period,impress,
		id_card,notice_peroid_previous,white_goods_recovery,vat_white_goods,complint_triggered,
		incometax,labour_welfare,esic,lease_car_emi,residual_value,
		excess_cl_recovery,bmp_recovery,
		
		cumulative_basic,gratuty,non_taxable_leaves,total_earnings,total_deductions,
		
		net_amount,seq_no,status);

if (result.equalsIgnoreCase("inserted"))
{
	out.println("Successfully "+status);
}
else
{
	out.println("Sorry Try Again");
}
%>
</body>
</html>