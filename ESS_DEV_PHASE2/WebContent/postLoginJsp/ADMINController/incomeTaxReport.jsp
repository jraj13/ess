<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 	<%@page import="com.ess.common.action.IncomeTaxReportAction"%>
 	<%@page import="java.util.*" %>
 	
 	  <%@ page import="com.ess.common.util.MonthandyearDecide" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <style>
 .tableit1
 {
  border:0px;
 
 }
.table1 {
    display: table1;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: black;
    border:1px;
}

</style>

</head>


<body>
<br>

<%
								ArrayList<String> leareq = IncomeTaxReportAction.getIncomeTaxReportInfo();
								if (leareq.size() > 0) {
									for (int i = 0; i < leareq.size(); i++) {
										String req = leareq.get(i).toString();
										String reqarr[] = req.split("\\^");
										
									 String empId = reqarr[0];
										String empFname = reqarr[1];
										String empLname = reqarr[2];
										String empDesig = reqarr[3];
										String panno = reqarr[4];
										String doj = reqarr[5];
										String dob = reqarr[6];
										String gender = reqarr[7];
							%>



<%

ArrayList<String> info = IncomeTaxReportAction.getIncomeTaxReportInfo2();
if (info.size() > 0) {
	for (int j = 0; j < info.size(); j++) {

		String employeedata = info.get(j).toString();
		String empDataAry[] = employeedata.split("\\^");
		
		String empid = empDataAry[0];
		String name = empDataAry[1];
		String designation = empDataAry[2];
		String  dept = empDataAry[3];
		String  loc = empDataAry[4];
		
		
		String pan = empDataAry[5];
		String pfno = empDataAry[6];
		String doj1 = empDataAry[7];
		String  bname = empDataAry[8];
		String  accno = empDataAry[9];
		
		
		String eff_days = empDataAry[10];
		String days_mon = empDataAry[11];
		String lop = empDataAry[12];
		String  basic = empDataAry[13];
		float basic_cal=Float.parseFloat(basic);
		String  hra = empDataAry[14];
		float hra_cal=Float.parseFloat(hra);
		String covey = empDataAry[15];
		float covey_cal=Float.parseFloat(covey);
		
		String lta = empDataAry[16];
		float lta_cal=Float.parseFloat(lta);
		String medical = empDataAry[17];
		float medical_cal=Float.parseFloat(medical);
		String  special = empDataAry[18];
		float special_cal=Float.parseFloat(special);
		String  pf = empDataAry[19];
		float pf_cal=Float.parseFloat(pf);
		
		String esi = empDataAry[20];
	//	float esi_cal=Float.parseFloat(esi);
		String gratuty = empDataAry[21];
		String tot_ear = empDataAry[22];
		String  tot_ded = empDataAry[23];
		String  total = empDataAry[24];
		String monthYear=empDataAry[25];
		
		String inWords=empDataAry[26];
	
		
		
		float basic_year=basic_cal*12;
		float hra_year=hra_cal*12;
		float convey_year=covey_cal*12;
		float lta_year=lta_cal*12;
		float medical_year=medical_cal*12;
		float spa_year=special_cal*12;
		
		float income_total_year=basic_year+hra_year+convey_year+lta_year+medical_year+spa_year;
		float income_total_month=basic_cal+hra_cal+covey_cal+lta_cal+medical_cal+special_cal;
	
		
		float pf_year=pf_cal*12;
		float income_tax_cal=0;
		float prof_tax_cal=0;
	
		float income_tax_year=income_tax_cal*12;
		float prof_tax_year=prof_tax_cal*12;
		
		float deduction_total_year=pf_year+income_tax_year+prof_tax_year;
		float deduction_total_month=pf_cal+income_tax_cal+prof_tax_cal;
%>
<%


ArrayList info2 = IncomeTaxReportAction.getIncomeTaxReportInfo3();
if (info2.size() > 0) {
	for (int k = 0; k < info2.size(); k++) {

		String employeedata2 = info2.get(k).toString();
		String empDataAry2[] = employeedata2.split("\\^");
		
		/* int[] numbers = new int[empDataAry2.length];
		for(int l = 0;l < empDataAry2.length;l++)
		{
		   // Note that this is assuming valid input
		   // If you want to check then add a try/catch 
		   // and another index for the numbers if to continue adding the others
		   numbers[i] = Integer.parseInt(empDataAry2[i]); */
		
		
		String BASIC_SALARY_ACT = empDataAry2[0];
		System.out.println("BASIC_SALARY_ACT..."+BASIC_SALARY_ACT);
		String BASIC_SALARY_PRO = empDataAry2[1];
		String BASIC_SALARY_TOT = empDataAry2[2];
		String HRA_ACT = empDataAry2[3];
		String HRA_PRO = empDataAry2[4];
		String HRA_TOT = empDataAry2[5];
		String SA_ACT = empDataAry2[6];
		String SA_PRO = empDataAry2[7];
		String SA_TOT = empDataAry2[8];
		String PLI_ACT = empDataAry2[9];
		String PLI_PRO = empDataAry2[10];
		String PLI_TOT = empDataAry2[11];
		String EARNINGS_TOTAL = empDataAry2[12];
		
		String CHOICEPAY = empDataAry2[13];
		String CHOICEPAY_TOTAL = empDataAry2[14];
		String GROSS_EARNINGS = empDataAry2[15];
		String PER_TOTAL = empDataAry2[16];
		String GROSS_SALARY = empDataAry2[17];
		String INCOME_PREVIOUS = empDataAry2[18];
		String GROSS_PREVIOUS = empDataAry2[19];
		String STD_DEDUCTION = empDataAry2[20];
		String PRO_TAX = empDataAry2[21];
		float PRO_TAX_cal=Float.parseFloat(PRO_TAX);
		String PRO_TAX_PREVIOUS = empDataAry2[22];
		String DED_TOTAL = empDataAry2[23];
		String INCOME_CHARGABLE = empDataAry2[24];
		String INCOME_OTHER = empDataAry2[25];
		
		String PARENT_GROSS = empDataAry2[26];
		String PARENT_QUAL = empDataAry2[27];
		String PARENT_DED = empDataAry2[28];
		String SEC_GROSS = empDataAry2[29];
		String SEC_QUAL = empDataAry2[30];
		String SEC_DED = empDataAry2[31];
		String TOT_GROSS = empDataAry2[32];
		String TOT_QUAL = empDataAry2[33];
		String TOT_DED = empDataAry2[34];
		String MAX_QUAL = empDataAry2[35];
		String TOTAL_TAXABLE = empDataAry2[36];
		String TAX_CREDIT = empDataAry2[37];
		String TAX_PAYABLE = empDataAry2[38];
				   
		String SURCHARGE_ON_TAX = empDataAry2[39];
		String HIGHER_EDU = empDataAry2[40];
		String TOTALTAX = empDataAry2[41];
		String TAX_CURRENT_YEAR = empDataAry2[42];
		String REBATE = empDataAry2[43];
		String TAX_PREVIOUS_YEAR = empDataAry2[44];
		String BALANCE_TAX = empDataAry2[45];
		String ACTUL = empDataAry2[46];
		String PROJECTION = empDataAry2[47];
		String DATE_TIME = empDataAry2[48];
		String EMPID1 = empDataAry2[49];
		String UNDER80D = empDataAry2[50];

%>


<%
			MonthandyearDecide mm=new MonthandyearDecide();
			String mm_year=mm.monthyear();
			
			String empPersonalInfoAry11[]=mm_year.split("\\^");
			String fy_start = empPersonalInfoAry11[0];
			String fy_end =empPersonalInfoAry11[1];
			
			
			%>



<center>
<!-- <table align="center" width="40%" class="tableit1">
  <tr >   
  <td> -->
     <div>
    	 <center><Strong>NALI CLOCK SOFTWARE SOLUTIONS PVT.LTD.</Strong></center>
     </div>
	 <div >
	    <center style="font-size:12px">308/287,2ND FLOOR,NEAR INFOSYS, HOSUR MAIN ROAD,ELECTRONIC CITY,BANGALORE
	    560100</center>
	 
	     <center><strong>Income Tax Computation For The Financial Year <%=fy_start %>-<%=fy_end %></strong></center>
	 </div>   
	 
<!-- </td>
  </tr>
  </table > -->
  </center>
  <br>
  
  <table   align="center" width="90%">
  <tr>
  <td><b>Employee Id :</b></td>
  <td><%=empId %>&nbsp;</td>
  <td><b>Name :</b></td>
  <td><%=empFname %>&nbsp;<%=empLname %></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
  
  <tr>
  <td><b>Pan No. :</b></td>
  <td><%=panno %>&nbsp;</td>
  <td><b>Gender :</td>
  <td><%=gender %>&nbsp;</td>
  <td><b>Location :</b></td>
  <td><%=loc %>&nbsp;</td>
  </tr>
  
  <tr>
  <td><b>Date of Join :</b></b></td>
  <td><%=doj %>&nbsp;</td>
  <td><b>Date of Birth :</b></td>
  <td><%=dob %>&nbsp;</td>
    <td>&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
 
  </table>
  
   <BR>
 <p><b> A) Taxable Income</b></p>
<CAPTION><b>&nbsp;(i) Monthly Income</b></CAPTION>

  <table width="100%" float="left">
  <tr>
     <th>Pay Items</th>
  	 <th>Total</th>
  	 <th>Apr 2015</th>
     <th>May 2015</th>
     <th>Jun 2015</th>
     <th>Jul 2015</th>
     <th>Aug 2015</th>
     <th>Sep 2015</th>
     <th>Oct 2015</th>
     <th>Nov 2015</th>
     <th>Dec 2015</th>
     <th>Jan 2016</th>
     <th>Feb 2016</th>
     <th>Mar 2016</th>
  </tr>
              
        <tr>
              <td>BASIC</td>
               <td><%=basic_year %></td>
                <td><%=basic %></td>
                 <td><%=basic %></td>
                  <td><%=basic %></td>
                   <td><%=basic %></td>
                    <td><%=basic %></td>
                     <td><%=basic %></td>
                      <td><%=basic %></td>
                       <td><%=basic %></td>
                        <td><%=basic %></td>
                         <td><%=basic %></td>
                       	   <td><%=basic %></td>
                       		 <td><%=basic %></td>
              </tr>      
              
                <tr>
              <td>HRA</td>
               <td><%=hra_year %></td>
                <td><%=hra %></td>
                 <td><%=hra %></td>
                  <td><%=hra %></td>
                   <td><%=hra %></td>
                    <td><%=hra %></td>
                     <td><%=hra %></td>
                      <td><%=hra %></td>
                       <td><%=hra %></td>
                        <td><%=hra %></td>
                         <td><%=hra %></td>
                       <td><%=hra %></td>
                        <td><%=hra %></td>
              </tr>    
                <tr>
              <td>CONVEYANE</td>
               <td><%=convey_year %></td>
                <td><%=covey %></td>
                 <td><%=covey %></td>
                  <td><%=covey %></td>
                   <td><%=covey %></td>
                    <td><%=covey %></td>
                     <td><%=covey %></td>
                      <td><%=covey %></td>
                       <td><%=covey %></td>
                        <td><%=covey %></td>
                         <td><%=covey %></td>
                           <td><%=covey %></td>
                             <td><%=covey %></td>
              </tr>      
              
                <tr>
              <td>LTA</td>
               <td><%=lta_year %></td>
                <td><%=lta %></td>
                 <td><%=lta %></td>
                  <td><%=lta %></td>
                   <td><%=lta %></td>
                    <td><%=lta %></td>
                     <td><%=lta %></td>
                      <td><%=lta %></td>
                       <td><%=lta %></td>
                        <td><%=lta %></td>
                         <td><%=lta %></td>
                          <td><%=lta %></td>
                            <td><%=lta %></td>
              </tr>  
                <tr>
              <td>MEDICAL</td>
               <td><%=medical_year %></td>
                <td><%=medical %></td>
                 <td><%=medical %></td>
                  <td><%=medical %></td>
                   <td><%=medical %></td>
                    <td><%=medical %></td>
                     <td><%=medical %></td>
                      <td><%=medical %></td>
                       <td><%=medical %></td>
                        <td><%=medical %></td>
                         <td><%=medical %></td>
                           <td><%=medical %></td>
                             <td><%=medical %></td>
              </tr>       
                <tr>
              <td>SPECIAL ALLOWANCE</td>
               <td><%=spa_year %></td>
                <td><%=special %></td>
                 <td><%=special %></td>
                  <td><%=special %></td>
                   <td><%=special %></td>
                    <td><%=special %></td>
                     <td><%=special %></td>
                      <td><%=special %></td>
                       <td><%=special %></td>
                        <td><%=special %></td>
                         <td><%=special %></td>
                           <td><%=special %></td>
                            <td><%=special %></td>
              </tr>    
                <tr>
              <td><b>TOTAL</b></td>
               <td><b><%=income_total_year %></b></td>
                <td><b><%=income_total_month %></b></td>
                  <td><b><%=income_total_month %></b></td>
                   <td><b><%=income_total_month %></b></td>
                    <td><b><%=income_total_month %></b></td>
                     <td><b><%=income_total_month %></b></td>
                       <td><b><%=income_total_month %></b></td>
                        <td><b><%=income_total_month %></b></td>
                         <td><b><%=income_total_month %></b></td>
                           <td><b><%=income_total_month %></b></td>
                            <td><b><%=income_total_month %></b></td>
                           	  <td><b><%=income_total_month %></b></td>
                                <td><b><%=income_total_month %></b></td>
              </tr>             
  </table>
 <BR>
<CAPTION><b> B) Deduction</b></CAPTION>

  <table width="100%" float="left">
  <tr>
     <th>Pay Items</th>
  	 <th>Total</th>
  	 <th>Apr 2015</th>
     <th>May 2015</th>
     <th>Jun 2015</th>
     <th>Jul 2015</th>
     <th>Aug 2015</th>
     <th>Sep 2015</th>
     <th>Oct 2015</th>
     <th>Nov 2015</th>
     <th>Dec 2015</th>
     <th>Jan 2016</th>
     <th>Feb 2016</th>
     <th>Mar 2016</th>
  </tr>
              
        <tr>
              <td>PF</td>
               <td><%=pf_year %></td>
                <td><%=pf %></td>
                 <td><%=pf %></td>
                  <td><%=pf %></td>
                   <td><%=pf %></td>
                    <td><%=pf %></td>
                     <td><%=pf %></td>
                      <td><%=pf %></td>
                       <td><%=pf %></td>
                        <td><%=pf %></td>
                         <td><%=pf %></td>
                          <td><%=pf %></td>
                            <td><%=pf %></td>
              </tr>      
              
                <tr>
              <td>INCOME TAX</td>
               <td><%=income_tax_year %></td>
                <td><%=income_tax_cal %></td>
                 <td><%=income_tax_cal %></td>
                  <td><%=income_tax_cal %></td>
                   <td><%=income_tax_cal %></td>
                    <td><%=income_tax_cal %></td>
                     <td><%=income_tax_cal %></td>
                      <td><%=income_tax_cal %></td>
                       <td><%=income_tax_cal %></td>
                        <td><%=income_tax_cal %></td>
                         <td><%=income_tax_cal %></td>
                          <td><%=income_tax_cal %></td>
                            <td><%=income_tax_cal %></td>
              </tr>    
                <tr>
              <td>PROF TAX</td>
               <td><%=prof_tax_year %></td>
                <td><%=prof_tax_cal %></td>
                 <td><%=prof_tax_cal %></td>
                  <td><%=prof_tax_cal %></td>
                   <td><%=prof_tax_cal %></td>
                    <td><%=prof_tax_cal %></td>
                     <td><%=prof_tax_cal %></td>
                      <td><%=prof_tax_cal %></td>
                       <td><%=prof_tax_cal %></td>
                        <td><%=prof_tax_cal %></td>
                         <td><%=prof_tax_cal %></td>
                           <td><%=prof_tax_cal %></td>
                             <td><%=prof_tax_cal %></td>
              </tr>      
              
               
                <tr>
              <td><b>TOTAL</b></td>
               <td><b><%=deduction_total_year %></b></td>
                <td><b><%=deduction_total_month %></b></td>
                  <td><b><%=deduction_total_month %></b></td>
                   <td><b><%=deduction_total_month %></b></td>
                    <td><b><%=deduction_total_month %></b></td>
                     <td><b><%=deduction_total_month %></b></td>
                       <td><b><%=deduction_total_month %></b></td>
                        <td><b><%=deduction_total_month %></b></td>
                         <td><b><%=deduction_total_month %></b></td>
                           <td><b><%=deduction_total_month %></b></td>
                            <td><b><%=deduction_total_month %></b></td>
                        	 <td><b><%=deduction_total_month %></b></td>
                              <td><b><%=deduction_total_month %></b></td>
              </tr>             
  </table>
 <BR>
<CAPTION><b> C) Perquisites</b></CAPTION>

  <table width="100%" float="left">
  <tr>
     <th>Pay Items</th>
  	 <th>Total</th>
  	 <th>Apr 2015</th>
     <th>May 2015</th>
     <th>Jun 2015</th>
     <th>Jul 2015</th>
     <th>Aug 2015</th>
     <th>Sep 2015</th>
     <th>Oct 2015</th>
     <th>Nov 2015</th>
     <th>Dec 2015</th>
     <th>Jan 2016</th>
     <th>Feb 2016</th>
     <th>Mar 2016</th>
  </tr>
              
     <tr>
              <td><b>TOTAL</b></td>
               <td><b></b></td>
                <td><b></b></td>
                  <td><b></b></td>
                   <td><b></b></td>
                    <td><b></b></td>
                     <td><b></b></td>
                       <td><b></b></td>
                        <td><b></b></td>
                         <td><b></b></td>
                           <td><b></b></td>
                            <td><b></b></td>
                         <td><b></b></td>
                           <td><b></b></td>
              </tr>             
  </table>
  <BR>
<CAPTION><B>D) Gross Salary (A+C)...................................................</B></CAPTION>  
<BR>

<CAPTION><B>E) Less exemption under Section 10</B></CAPTION> 
<table width="70%" float="left">
<tr>
<td><b>Item</b></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><b>Exemption</b></td>
</tr>

		<tr>     
		    <td>House Rent Allowance : Section 10(13A)</td>
             <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
             <td></td>
             </tr>
            
            <tr>
                 <td>Total Rent Paid p.a</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td></td>
             </tr>
               <tr>  
                  <td>HRA Recieved</td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td></td>
             </tr>
             <tr>
                  
                   <td>40 % of Basic</td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td></td>
             </tr>
             <tr>
                   
                    <td>Rent Paid > 10% Basic</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td></td>
             </tr>
			<tr>                   
                     <td>Leave Travel Assistance : Sec. 10(5)</td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td></td>
             </tr>
             <tr>
                     
                     <td>Conveyance Assistance : Sec. 10(14)</td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td></td>
             </tr>
              <tr>
                     
                     <td>Medical Reimbursement : Sec. 10</td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td></td>
             </tr>
              <tr>
                     
                     <td><b>Total Exemptions</b></td>
                     <td><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
                     <td><b></b></td>
             </tr>


</table>
<br>
<CAPTION><B>F) Income from Previous employer</B></CAPTION> 
<table width="70%" float="left">


<tr>
<td><b>Pay Items</b></td>
<td><b>Amount</b></td>
</tr>

		<tr>     
		    <td>Total Income</td>
             <td>0.00</td>
             </tr>
            
            <tr>
                 <td>Income Tax</td>
                  <td>0.00</td>
             </tr>
               <tr>  
                  <td>Professional Tax</td>
                   <td>0.00</td>
             </tr>
             <tr>
                  
                   <td>Provident Fund</td>
                   <td>0.00</td>
             </tr>

</table>
<br>
<CAPTION><B>G) Income after exemption ( D - E + F ) ...................................................</B></CAPTION> 

<br>
<CAPTION><B>H) Less Deduction under Section 16 .....................................................</B></CAPTION> 
<br><br>

<table width="60%" float="left">

<tr>
<td><b>Sl.No.</b></td>
<td><b>Tax on Employment : Sec 16(iii)</b></td>
<td><b>H) value here</b></td>
</tr>

<tr>
<td>(i)</td>
<td>Sub Total</td>
<td>same above</td>
</tr>

</table>

<br>
<CAPTION><B>I) Income chargeable under the head salaries (G - H) .......................</B></CAPTION> 
<br>
<CAPTION><B>J) Add any other income declared by the employee ..........................</B></CAPTION> 
<br><br>

<table width="60%" float="left">

<tr>
<td><b>Description</b></td>
<td><b>Section</b></td>
<td><b>Amount</b></td>
</tr>

<tr>
<td><b>Sub Total</b></td>
<td><b></b></td>
<td><b>0.00</b></td>
</tr>

</table>

<br>

<CAPTION><B>K) Gross Total Income (I + J) ..........................................................</B></CAPTION> 
<br>
<CAPTION><B>L) Deduction under chapter VI A ...................................................</B></CAPTION> 
<br>
<br>

<table width="80%" float="left">
<tr>
<td><b>Investment</b></td>
<td><b>Section</b></td>
<td><b>Gross</b></td>
<td><b>Qualifying</b></td>
<td><b>Deductible</b></td>

</tr>


<tr>
<td>PF</td>
<td>80C</td>
<td><b></b></td>
<td><b></b></td>
<td><b></b></td>

</tr>
<tr>
<td>Life Insurance Premium</td>
<td>80C</td>
<td><b></b></td>
<td><b></b></td>
<td><b></b></td>

</tr>
<tr>
<td>Medical Insurance Premium</td>
<td>80D</td>
<td><b></b></td>
<td><b></b></td>
<td><b></b></td>
</tr>

<tr>
<td><b>Sub Total</b></td>
<td><b></b></td>
<td><b></b></td>
<td><b></b></td>
<td><b></b></td>
</tr>


</table>

<br>

<CAPTION><B>M) Taxable Income .................................................................................</B></CAPTION> 
<br>

<CAPTION><B>N) Total Tax to be Paid ...........................................................................</B></CAPTION> 
<br><br>

<table width="60%" float="left">
<tr>

<td><b>Raw Tax</b></td>
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>


</tr>

<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>
<br>


<CAPTION><B>O) Tax Paid Till Date ...................................................................................</B></CAPTION> 
<br><br>
<table width="70%" float="left">
<tr>
<td><b></b></td>
<td><b>Raw Tax</b></td>
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>

</tr>

<tr>
<td>Deduction Through Payroll</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Direct TDS</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Previous Employment</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td><b>Total</b></td>
<td><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
<td><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
<td><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
<td><b>&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
</tr>

</table>

<br>
<CAPTION><B>P) Relief Under Section 89 ..............................................................................</B></CAPTION> 
<br><br>

<table width="60%" float="left">
<tr>
<td><b>Raw Tax</b></td>
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>
</tr>

<tr>
<td>0.00</td>
<td>0.00</td>
<td>0.00</td>
<td>0.00</td>
</tr>

</table>

<br>
<CAPTION><B>Q) Annual Tax Balance .................................................................................</B></CAPTION> 
<br><br>

<table width="60%" float="left">
<tr>
<td><b>Raw Tax</b></td>
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>
</tr>

<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>

<br>
<CAPTION><B>R) TDS Recovered in current month ..........................................................</B></CAPTION> 
<br><br>
<caption>i) Monthly tax</caption>
<table width="60%" float="left">
<tr>
<td><b>Raw Tax</b></td>
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>
</tr>

<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>
<br><br>

<caption>ii) Override/Deducted Tax</caption>
<table width="60%" float="left">
<tr>
<td><b>Raw Tax</b></td>s
<td><b>Surcharge</b></td>
<td><b>Edu. Cess</b></td>
<td><b>Total</b></td>
</tr>

<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>

</table>


<br>
<CAPTION><B>S) Balance Payable (in 8 Installments) - Income Tax</B></CAPTION> 
<br><br>









<%
								}
								}  }}   }}else {
							%>
							<tr>
								<td colspan="11">No Records</td>
							</tr>

							<%
								}
							%>





</body>
</html>