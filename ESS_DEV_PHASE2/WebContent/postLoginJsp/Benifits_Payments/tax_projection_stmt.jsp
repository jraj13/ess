

<%@page import="com.ess.common.action.Is_to_incometax" %>

<%@page import="com.ess.common.action.IncometaxAction"%>
<%@page import="com.ess.common.action.NewIncomeTax"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.ess.util.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import="com.ess.common.util.MonthandyearDecide" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table{
width:100%;
 border: 0px;
}
.inlineTable1 {
            display: inline-block;
            width:26%;
            font-size:10px;
            border: 0px;
        }
 .inlineTable {
            display: inline-block;
            width:20%;
            font-size:10px;
            border: 0px;
        }
.tableStyle2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
     border: 0px;
}
.tableStyle2 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}

.inlineTable tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.inlineTable td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}

td.normal{
text-indent: 1em;
font-size:10px;
font-weight: bold;
height:2px;
}
td.small{
font-size:10px;
text-indent: 3em;
height:2px;
}
br {
  content: " ";
  display: block;
  margin: 0.5em;
}
.fontst
{
font-size: 10px;
text-indent: 3em;
height: 2px;
}


.inlineTable1{
 display: inline-block;
            width:30%;
            font-size:10px;
            border: 0px;
}

.inlineTable1 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.inlineTable1 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}




.inlineTable2{
 display: inline-block;
            width:20%;
            font-size:10px;
            border: 0px;
}

.inlineTable2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.inlineTable2 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}

.inlineTable2 {
            display: inline-block;
            width:20%;
            font-size:10px;
            border: 0px;
        }





.inlineTable3{
 display: inline-block;
            width:45%;
            font-size:10px;
            border: 0px;
}

.inlineTable3 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.inlineTable3 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}

.inlineTable3 {
            display: inline-block;
            width:40%;
            font-size:10px;
            border: 0px;
        }

.bor{
    border-style: solid;
    border-width: 1px;
}

</style>
<script type="text/javascript">
$(function() {	
		 
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				 $('#print').hide();
				 
			 
			})
			
	})

	</script>
</head>
<body>
<div style="float:right;">
  <a onclick="javascript:window.print();" title="print"><input type="button"  name="bprint" value="Print" id="print"/></a>
</div>
<%
ArrayList<String> info = NewIncomeTax.getBasicInfo();
ArrayList<Object> actualinfo = NewIncomeTax.getactual();
if (info.size() > 0) {
	for (int i = 0; i < info.size(); i++) {

		String employeedata = info.get(i).toString();

		String empDataAry[] = employeedata.split("\\^");

		String empid = empDataAry[0];
		String name = empDataAry[1];
		String lname=empDataAry[2];
		String designation = empDataAry[3];
		String  pan = empDataAry[4];


if(actualinfo.size()>0){
	for (int j = 0; j < actualinfo.size(); j++) {
		String empactual=actualinfo.get(j).toString();
		String income[] = empactual.split("\\^");
		String actual=income[0];
		String projection=income[1];
		String basic_actual=income[2];
		String basic_pro=income[3];
		String basic_tot=income[4];
		
		String hra_actual=income[5];
		String hra_pro=income[6];
		String hra_tot=income[7];
		
		String sa_actual=income[8];
		String sa_pro=income[9];
		String sa_tot=income[10];
		
		String pli_actual=income[11];
		String pli_pro=income[12];
		String pli_tot=income[13];
		String ear_tot=income[14];
		String choicepay=income[15];
		
		String gross_ear=income[16];
		String per_tot=income[17];
		String gross_sal=income[18];
		String in_pre=income[19];
		String gro_prev=income[20];
		
		String sd=income[21];
		String pro_tax=income[22];
		String pro_tax_prv=income[23];
		String ded_tot=income[24];
		String inc_char=income[25];
		String inc_oth=income[26];
		
		String max_qual=income[27];
		String tot_tax_income=income[28];
		String tax_cre=income[29];
		String tax_pay=income[30];
		String sur_tax=income[31];
		String high_edu=income[32];
		String tot_tax=income[33];
		String tax_current=income[34];
		String rebate=income[35];
		String tax_prev=income[36];
		
		
		MonthandyearDecide mm=new MonthandyearDecide();
		String mm_year=mm.monthyear();
		
		String empPersonalInfoAry11[]=mm_year.split("\\^");
		String fy_start = empPersonalInfoAry11[0];
		String fy_end =empPersonalInfoAry11[1];
		
		
		
	%>
<div align=justify>

<center>Nali Clock Software Solutions Pvt. Ltd.</center>
<center >INCOME TAX PROJECTION FOR YEAR <%=fy_start %>-<%=fy_end %></center>
</div>
<hr>
<table class = "tableStyle2" width="100%">

<tr>
<td colspan="1">
Employee:
</td>

<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" size="40" value="<%=empid%>&nbsp;&nbsp;<%=name%>&nbsp;<%=lname %>"/>
</td>
<td>
Designation:
</td>
<td colspan="2">
<input style="background-color: #FFFFFF;border:0px;" name="emp"   value="<%=designation%>"/>
</td>

</tr>

<tr>
<td colspan="2">
Earnings/Deductions 
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="Projection"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="Actual"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="Total"/>
</td>
</tr>

<tr>
<td>
PAN No.
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp"  size="20" value="<%=pan%>"/>
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="(<%=actual %> Month (s))"/>
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="(<%=projection %>Month (s))"/>
</td>
<td>
</td>
</tr>
	
</table>
<hr>
<br>
<div class="bor">
<table class = "tableStyle2">
<tr>
<td class="normal">
01)EARNINGS
</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="3" class="small">
01.01) Basic Salary
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=basic_actual%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=basic_pro%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=basic_tot%>"/>
</td>
</tr>
<tr>
<td colspan="3" class="small">
01.02) House Rent Allowance
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=hra_actual%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=hra_pro%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=hra_tot%>"/>
</td>
</tr>
<tr>
<td colspan="3" class="small">
01.03) Special Allowance
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=sa_actual%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=sa_pro%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=sa_tot%>"/>
</td>
</tr>
<tr>
<td colspan="3" class="small">
01.04) Performance Linked Inc
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pli_actual%>"/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pli_pro%> "/>
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pli_tot%>"/>
</td>
</tr>

<tr>
<td COLSPAN="4">
</td>
<td style="text-indent: 1em;"><b>
Total </b>
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=ear_tot%>"/>
</td>
</tr>
</table>
<table class="inlineTable3">
<tr><td><b>
02)EXEMPTIONS</b></td>
</tr>
							<%
								
							ArrayList<Object> cho_qual = NewIncomeTax.ChoicepayColuns();
							if (cho_qual.size() > 0) {
								for (int t = 0; t < cho_qual.size();t++) {
									String ch_req = cho_qual.get(t).toString();
									String charr[] = ch_req.split("\\'");
									 String ch_tot = charr[0];
							
%>
	
	<tr>
	<td><%=ch_tot%></td>
</tr>
 <%										
}
}

%>

</table>

<table class="inlineTable3">
<tr><td>
</td>
</tr>
							<%
								
							ArrayList<Object> cho_val = NewIncomeTax.ChoicepayValues();
							if (cho_val.size() > 0) {
								for (int t = 0; t < cho_val.size();t++) {
									String ch_val = cho_val.get(t).toString();
									String chaval[] = ch_val.split("\\'");
									 String ch_val_tot = chaval[0];
							
%>
	
	<tr>
	<td><%=ch_val_tot%></td>
</tr>
 <%										
}
}

%>

</table>

<table class = "tableStyle2">

<tr>
<td COLSPAN="4">
</td>
<td style="text-indent: 1em;"><b>
Total     </b>
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=choicepay%>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
03) GROSS EARNING FROM SALARIES AFTER EXEMPTION (1-2)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=gross_ear %>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
04)VALUE OF THE PREQUISITES 
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value=" "/>
</td>
</tr>

<tr>
<td COLSPAN="4">
</td>
<td style="text-indent: 1em;"><b>
Total     </b>
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=per_tot %> "/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
05) GROSS SALARY INCLUDING PREQUISITES(3+4)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value=" <%=gross_sal %>"/>
</td>
</tr>


<tr>
<td COLSPAN="5" class="small">
Income from Previous Employer
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value=" <%=in_pre %>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="small">
Gross Salary Including Previous Employer
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=gro_prev%>"/>
</td>
</tr>

<tr>
<td COLSPAN="6" class="normal">
06) DEDUCTIONS -U/S 16(1) 
</td>
</tr>

<tr>
<td COLSPAN="5" class="small">
06.01) Standard Deduction
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value=" <%=sd%>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="small">
06.02) Professional Tax
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pro_tax%>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="small">
06.03) Professional Tax - Previous Employer
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pro_tax_prv%>"/>
</td>
</tr>
<tr>
<td COLSPAN="4">
</td>
<td style="text-indent: 1em;"><b>
Total     </b>
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=ded_tot%> "/>
</td>
</tr>
<tr>
<td COLSPAN="5" class="normal">
07) INCOME CHARAGES UNDER THE HEAD SALARIES (5-6) 
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value=" <%=inc_char%>"/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
08) INCOME FROM OHER SOURCES / LOSS FROM HOUSE PROPERTY 
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=inc_oth%> -"/>
</td>
</tr>

<tr>

<tr>
<td COLSPAN="5" class="normal">
9) OTHER DEDUCTIONS AS PER IT ACT
</td>
<td>
</td>
</tr>
</table>
<table border=0 class="inlineTable2">
<tr><td style="text-indent: 3em;"> <b>
</b></td>
</tr>
							<%
								
							ArrayList<Object> col_oth = Is_to_incometax.investment_80c_column();
							if(col_oth.size()>0)	{
								for(int l=0;l < col_oth.size();l++){
									String col_inst = col_oth.get(l).toString();
									String col_arr[] = col_inst.split("\\'");
									 String type_col = col_arr[0];
										
%>
	
	<tr>
	<td COLSPAN="2" style="text-indent: 3em;" ><%=type_col%></td>
</tr>
 <%										
}
}
%>

</table>
<table border=0 class="inlineTable2">
							<%
								
							ArrayList<Object> val_oth = Is_to_incometax.investment_80c_value_Gross();
							if(val_oth.size()>0)	{
								for(int l=0;l < val_oth.size();l++){
									String val_inst = val_oth.get(l).toString();
									String val_arr[] = val_inst.split("\\'");
									 String type_val = val_arr[0];
										
%>
	
	<tr>
	<td COLSPAN="2" style="text-indent: 3em;" ><%=type_val%></td>
</tr>
 <%										
}
}

%>

</table>
<table border=0 class="inlineTable2">

							<%
								
							ArrayList<Object> val_qual = Is_to_incometax.investment_80c_value_Qual();
							if(val_qual.size()>0)	{
								for(int l=0;l < val_qual.size();l++){
									String Qual_val = val_qual.get(l).toString();
									String qua_arr[] = Qual_val.split("\\'");
									 String qual_val = qua_arr[0];
										
%>
	
	<tr>
	<td COLSPAN="2" style="text-indent: 3em;" ><%=qual_val%></td>
</tr>
 <%										
}
}

%>

</table>

<table border=0 class="inlineTable1">
							<%
								
							ArrayList<Object> val_ded = Is_to_incometax.investment_80c_ded();
							if(val_ded.size()>0)	{
								for(int l=0;l < val_ded.size();l++){
									String ded_val = val_ded.get(l).toString();
									String ded_arr[] = ded_val.split("\\'");
									 String ded_type = ded_arr[0];
										
%>
	
	<tr>
	<td COLSPAN="2" style="text-indent: 3em;" ><%=ded_type%></td>
</tr>
 <%										
}
}

%>

</table>



<table class = "tableStyle2" width="100%">
<tr>
<td COLSPAN="5" class="normal">
9A) MAXIMUM QUALIFYING AMOUNT
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=max_qual%>"/>
</td>

</tr>


<tr>
<td COLSPAN="5" class="normal">
10) TOTAL TAXABLE INCOME (7+8-9A)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value=" <%= tot_tax_income %>"/>
</td>
</tr>


<tr>
<td COLSPAN="5" class="normal">
10A) TAX CREDIT
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%= tax_cre %> "/>
</td>
</tr>


<tr>
<td COLSPAN="5" class="normal">
11) TAX PAYABLE
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=tax_pay  %> "/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
12) SURCHARGE ON TAX (10 % OF 11)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%= sur_tax %> "/>
</td>
</tr>

<!-- 
<tr>
<td COLSPAN="5" class="normal">
13a) EDUCATION CESS
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value=" "/>
</td>
</tr>
 -->
<tr>
<td COLSPAN="5" class="normal">
13B) HIGHER EDUCATION CESS
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=high_edu  %> "/>
</td>
</tr>

<tr>
<td COLSPAN="5" class="normal">
14) TOTAL TAX  ( 11+12+13)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%= tot_tax %> "/>
</td>
</tr>

 <tr>
<td COLSPAN="5" class="normal">
15) TAX DEDUCTED IN CURRENT YEAR
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=tax_current  %> "/>
</td>
</tr> 


<tr>
<td COLSPAN="5" class="normal">
16) REBATE U/S 89
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=rebate  %> "/>
</td>
</tr>


<tr>
<td COLSPAN="5" class="normal">
17) TAX DEDUCTED BY PREVIOUS EMPLOYER
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=tax_prev  %> "/>
</td>
</tr>

<%-- <tr>
<td COLSPAN="5" class="normal">
18) BALANCE TAX DEDUCTIBLE (14-15-16-17)
</td>
<td>
<input style="background-color: #FFFFFF;font-weight:bold;border:0px;"  name="emp" value="<%=bal_ded  %> "/>
</td>
</tr> --%>
<%
	}
}
	}
	}
%>
</table>

<table border=0 class="inlineTable1">

							<%
								
							ArrayList<Object> extra = NewIncomeTax.invest_col();
							System.out.println(extra.size());
							if(extra.size()>0)	{
								for(int l=0;l < extra.size();l++){
									String eve = extra.get(l).toString();
									String evearr[] = eve.split("\\'");
									 String type = evearr[0];
										
%>
	
	<tr>
	<td COLSPAN="2" style="text-indent: 3em;" ><%=type%></td>
</tr>
 <%										
}
}

%>

</table>
 

<table class="inlineTable">

							<%
								
							ArrayList<Object> leareq = NewIncomeTax.investment_display();
							System.out.println(leareq.size());
							if (leareq.size() > 0) {
								for (int k = 0; k < leareq.size();k++) {
									String req = leareq.get(k).toString();
									String reqarr[] = req.split("\\'");
									 String type_of_leave = reqarr[0];
							
							

										
%>
	
	<tr>
	<td><%=type_of_leave%></td>
</tr>
 <%										
}
}

%>
 </table>
 
<table class="inlineTable">
							<%
								
							ArrayList<Object> ins_qual = NewIncomeTax.invest_insment_display_qual();
							System.out.println(ins_qual.size());
							if (ins_qual.size() > 0) {
								for (int t = 0; t < ins_qual.size();t++) {
									String qual_req = ins_qual.get(t).toString();
									String qualarr[] = qual_req.split("\\'");
									 String q_tot = qualarr[0];
							
%>
	
	<tr>
	<td><%=q_tot%></td>
</tr>
 <%										
}
}

%>

</table> 


<table  class="inlineTable">
							<%
								
							ArrayList<Object> ins_tot = NewIncomeTax.investment_display_total();
							System.out.println(ins_tot.size());
							if (ins_tot.size() > 0) {
								for (int t = 0; t < ins_tot.size();t++) {
									String tot_req = ins_tot.get(t).toString();
									String totarr[] = tot_req.split("\\'");
									 String i_tot = totarr[0];
										
%>
	
	<tr>
	<td><%=i_tot%></td>
</tr>
 <%										
}
}

%>
</table>

</div>
</body>
</html>	