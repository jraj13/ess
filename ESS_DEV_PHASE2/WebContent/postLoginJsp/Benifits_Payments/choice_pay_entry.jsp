<%@page import="com.ess.common.action.ChoiceFormDetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%-- <%@page import="com.ess.common.action.ChoiceFormDetails"%> --%>
  <%@ page import="com.ess.common.util.MonthandyearDecide" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>

table caption {
	background-color: #98c3e2;
	padding: 5px 2%;
	text-align: left;
}
.myHoverButton:hover { 
background-color: #9999ff;
/* background-color: #dfecf5 */


 } 
 span.tab{
    padding: 450px; /* Or desired space*/
}
</style>
<link rel="stylesheet" href="investmentjs/style_choicepay.css"/>
 <script src="investmentjs/ChoicePayCal_update.js"></script>
 <script src="investmentjs/jquery-1.10.2.js"></script>
 <script>
$(function() {
	$('#submit2').click(function() {
				var ctc = $('#ctc').val();
				var basic=$('#basic').val();
				var basepay=$('#basepay').val();
				var pli=$('#pli').val();
				var value=$('#value').val();
				
				var spa=$('#spa').val();
				var acp=$('#acp').val();
				var mr1=$('#mr1').val();
				var mr2=$('#mr2').val();
				var cea1=$('#cea1').val();
				
				var cea2=$('#cea2').val();
				var coa1=$('#coa1').val();
				var coa2=$('#coa2').val();
				var fme1=$('#fme1').val();
				var fme2=$('#fme2').val();
				
				
				var hra1=$('#hra1').val();
				var hra2=$('#hra2').val();
				var lta1=$('#lta1').val();
				var lta2=$('#lta2').val();
				var ernc=$('#ernc').val();
				
				var ernc1=$('#ernc1').val();
				var ab=$('#ab').val();
				var we=$('#we').val();
				
				var cha1=$('#cha1').val();
				var cha2=$('#cha2').val();
				var fc1=$('#fc1').val();
				
				var fc2=$('#fc2').val();
				var ee=$('#ee').val();
				var fe=$('#fe').val();
				
				var ub1=$('#ub1').val();
				var ub=$('#ub').val();
				var gf2=$('#gf2').val();
				var count=$('#count').val();
 
	 var dataString2="&ctc="+ctc+"&basic="+basic+"&basepay="+basepay+"&pli="+pli+"&value="+value+"&spa="+spa+
	 "&acp="+acp+"&mr1="+mr1+"&mr2="+mr2+"&cea1="+cea1+"&cea2="+cea2+"&coa1="+coa1+"&coa2="+coa2+"&fme1="+fme1+
	 "&fme2="+fme2+"&hra1="+hra1+"&hra2="+hra2+"&lta1="+lta1+"&lta2="+lta2+"&ernc="+ernc+"&ernc1="+ernc1+
	 "&ab="+ab+"&we="+we+"&cha1="+cha1+"&cha2="+cha2+"&fc1="+fc1+"&fc2="+fc2+"&ee="+ee+"&fe="+fe+"&ub1="+ub1+"&ub="+ub+"&gf2="+gf2;
	 if(count>0){
		 alert("You allready submitted choice pay entry ! please contact HR");
		 return false;
	 }
	 
	 else if((mr2<1) && (cea2<1) && (coa2<1) && (fme2<1) && (hra2<1) && (lta2<1) && (ernc1<6000) && (cha2<1) && (fc2<1) && (ab<1) && (we<1) && (gf2<1)&& (ub<1))
		{
		alert("Please Enter at least one field value")
			return false;
	}
	
 	else{
	 $.ajax({

			url :'postLoginJsp/Benifits_Payments/choicepay_insert.jsp',
		
			type : 'POST',
			data : dataString2,
			datatype : 'json',
			datatype: "script",
			cache: false,
			success : function(data) {

			//	alert("CHOICE PAY details are successfully inserted ");
				/* document.getElementById("submit2").disabled = true; */
	
				$('#lip').html(data);

			},
			error : function(jqXHR, textStatus, errorThrown) {

			}
		});
		
 	}
	})
});
 
 </script>
 <script>
 $(function($) {
	 $(document).ready(function(){
		 check();
	 });
 });
 function check()
 {
	 var ctc=parseFloat(document.getElementById("ctc").value);
	 if(ctc<250000)
	 {
		 alert("You are not eligible for Choice Pay Entry");
		 document.getElementById('submit2').disabled = true;
	 }
 }
 </script>

</head>

<%

ChoiceFormDetails cfd=new ChoiceFormDetails();
String choiceFormDetails=cfd.getChoiceFormDetails();

String choiceFormDetailsAry[]=choiceFormDetails.split("\\^");
 double ctc=Double.parseDouble(choiceFormDetailsAry[0]);
 double basic_value=Double.parseDouble(choiceFormDetailsAry[1]);
 double basepay_value=Double.parseDouble(choiceFormDetailsAry[2]);
 /* double pli =Double.parseDouble(choiceFormDetailsAry[3]);
 double choicepay=Double.parseDouble(choiceFormDetailsAry[4]);
  */
 double acp=Double.parseDouble(choiceFormDetailsAry[3]);
 double fuel_value=Double.parseDouble(choiceFormDetailsAry[4]);
 double hra_value=Double.parseDouble(choiceFormDetailsAry[5]);
 double lta_value=Double.parseDouble(choiceFormDetailsAry[6]);
 double ernps=Double.parseDouble(choiceFormDetailsAry[7]);
/*  double value=Double.parseDouble(choiceFormDetailsAry[10]); */
 double ernps_new=Double.parseDouble(choiceFormDetailsAry[8]); 

	MonthandyearDecide mm=new MonthandyearDecide();
	String mm_year=mm.monthyear();
	
	String empPersonalInfoAry11[]=mm_year.split("\\^");
	String fy_start = empPersonalInfoAry11[0];
	String fy_end =empPersonalInfoAry11[1];

%> 

<%
String id = (String) session.getAttribute("empid");
System.out.println("id from choice pay====" + id);

int isExistOrNot=cfd.isExistChoicePay(fy_start,fy_end,id);    
System.out.println("isExistOrNot from choice pay====" + isExistOrNot);

%>
<body  >
<div id="lip">
<!-- <div class="row" id="lrmain" style="border:2px solid #F5F5F5;  margin-top:15%;"> -->
<div class="row" style="height:1000px;width:750px:bg-color:#40e0d0;margin-top:100px">

<form name="hello" method="post">

<br/>
<h4> CHOICE PAY ENTRY <!-- <span class="tab"><a href="Form16/Choice Pay.pdf" target="_new"><font color="#0000FF">Click Here to View Choice Pay Guidelines </font></a></span> --></h4>
<h6> Effective From: &nbsp;<input name="date" type="text" value="01-Apr-<%=fy_start %>" style="background-color: white;color:black; width:10%;height:2%" readonly="readonly"/> </h6>


<table style="background-color:#dfecf5; width:90%; border:1; cellpadding:0px">
<input type="hidden" id="count" value="<%=isExistOrNot%>"></input>
  <caption>
   PACKAGE DISTRIBUTION
  </caption>
  <tr class="headind">
    <td><h5> </h5></td>
    <th>Salary Componet</th>
    <th>Max Elgibility Per Annum(Rs)</th>
    <th>New Annual Amount(RS)</th>
    <th>Policy</th>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td class="headind_1">Total CTC</td>
    <td class="headind_1">&nbsp;&nbsp;&nbsp;</td>
    <td><input type="text" name="ctc" id="ctc" style="background-color: #dfecf5;border:0px;" value="<%=ctc %>" readonly="readonly"></input></td>
    <td class="headind_1">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Basic</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.basic" id="basic" style="background-color: #dfecf5;border:0px;" value=" <%=basic_value%>" readonly="readonly"></input></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Base Pay</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.basepay" id="basepay" style="background-color: #dfecf5;border:0px;" value=" <%=basepay_value %>" readonly="readonly"></input></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Performance Linked Incentive</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.pli" id="pli" style="background-color: #dfecf5;border:0px;" value="0" readonly="readonly"></input></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Choice Pay</td>
    <td>&nbsp;</td>
    <td><input type="text" name="value" id="value" style="background-color: #dfecf5;border:0px;" value=" <%=acp %>" readonly="readonly"></input></td>
    <td>&nbsp;</td>   
  </tr>
  
   <tr>
    <td>&nbsp;</td>
    <td>Special Personal Allowance</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.spa" id="spa" style="background-color: #dfecf5;border:0px;" value="0" readonly="readonly"></input> </td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Available Choice Pay</td>
    <td>&nbsp;</td>
    <td><input id="acp" type="text" name="choiceBean.acp" id="acp" style="background-color: #dfecf5;border:0px;" value=" <%=acp %>" readonly="readonly"></input></td>
    <%-- <td><s:textfield name="choiceBean.acp" value="%{acp}" id="acp" style="background-color: #dfecf5;border:0px;"/>
    <!-- <input id="acp" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.acp"/> --></td> --%>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Medical Reimbursement</td>
    <td><input id="mr1" type="text" style="background-color: #dfecf5;color:black;border:0px;" name="choiceBean.mr1" id="mr1" value="15000.00" readonly="readonly"/></td>
    <td><input id="mr2" type="text" name="choiceBean.mr2" id="mr2" value='0' onkeypress="return ismedical(event)"  maxlength="15" onchange="medical()"/></td>
    <td>Fixed</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Children Education Allowance</td>
    <td><input id="cea1" type="text" name="choiceBean.cea1" id="cea1"  style="background-color:#dfecf5;border:0px"  value="2400" readonly="readonly"/></td>
    <td><input id="cea2" type="text" name="choiceBean.cea2" id="cea2" value='0' onkeypress="return iseducation1(event)"  maxlength="15" onchange="education1()"/></td>
    <td>Rs.1200 Per Child; Max 2 Children</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>Conveyance Allowance</td>
    <td><input id="coa1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.coa1" id="coa1" value="9600" readonly="readonly"/></td>
    <td><input id="coa2" type="text" name="choiceBean.coa2" id="coa2" value='0' onkeypress="return isconveyance(event)"  maxlength="15" onchange="conveyance()"/></td>
    <td>Fixed</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Fuel / Maint. Expenses</td>
    <td>Any Amount Upto<input id="fme1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.fme1" value="<%=fuel_value%> "readonly="readonly"/></td>
    <td><input id="fme2" type="text" name="choiceBean.fme2" value='0' onkeypress="return isfuel(event)"  maxlength="15" onchange="fuel()"/></td>
    <td>Min of Rs. 3.5 Lac or 25% of CTC</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>HRA</td>
    <td>Any Amount Upto<input id="hra1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.hra" value="<%=hra_value%> "readonly="readonly"/></td>
    <td><input id="hra2" type="text" name="choiceBean.hra2" value='0' onkeypress="return ishra(event)"  maxlength="15" onchange="hra()"/></td>
    <td>50% of Basic for Metro Cities And 40% for Rest</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>LTA</td>
    <td>Any Amount Upto<input id="lta1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.lta" value=" <%=lta_value%>" readonly="readonly"/></td>
    <td><input id="lta2" type="text" name="choiceBean.lta2" value='0' onkeypress="return islta(event)"  maxlength="15" onchange="lta()"/></td>
    <td>2 Times of Monthly Basic</td>
  </tr>
  
  <tr>
    <%-- <td>&nbsp;</td>
    <td>Er.NPS Contribution</td>
    <td>Any Amount from Rs 6000 to<input id="ernc" type="text" style="background-color: #dfecf5;border:0px;"name="choiceBean.ernc" value="<%=ernps%>"readonly="readonly"/></td>
    <td><input id="ernc1" type="text" name="choiceBean.ernc1" onchange="ernps()"/></td>
        <td>Min Rs 6000 Upto Max 10% of Basic</td>
  --%> 
    <td>&nbsp;</td>
    <td>Er.NPS Contribution</td>
    <td>Any Amount from Rs 6000 to<input id="ernc" type="text" style="background-color: #dfecf5;border:0px;"name="choiceBean.ernc" value=" <%=ernps_new%>"readonly="readonly" size="10"/></td>
    <td><input id="ernc1" type="text" name="choiceBean.ernc1" value='0' onkeypress="return isernps(event)"  maxlength="15" onchange="ernps()"/></td>
    <td>Min Rs 6000 Upto Max 10% of Basic</td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Advance Bonus</td>
    <td>&nbsp;</td>
    <td><input id="ab" type="text" name="choiceBean.ab" value='0' onkeypress="return isadvance(event)"  maxlength="15" onchange="advance()"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Washing Expenses</td>
    <td>&nbsp;</td>
    <td><input id="we" type="text" name="choiceBean.we" value='0' onkeypress="return iswashing(event)"  maxlength="15" onchange="washing()"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <!-- <td>&nbsp;</td>
    <td>Children Hostel Allowance</td>
    <td><input id="cha1"  type="text" name="choiceBean.cha1" onchange="hostel1()"/></td>
    <td><input id="cha2"  type="text" name="choiceBean.cha2" onchange="hostel()"/></td>
        <td>Rs.3600 Per Child; Max 2 Children</td> -->
        <td>&nbsp;</td>
    <td>Children Hostel Allowance</td>
    <td><input id="cha1"  type="text" style="background-color:#dfecf5;border:0px" name="choiceBean.cha1" value="7200" readonly="readonly"/></td>
    <td><input id="cha2"  type="text" name="choiceBean.cha2" value='0' onkeypress="return ishostel(event)"  maxlength="15" onchange="hostel()"/></td>
    <td>Rs.3600 Per Child; Max 2 Children</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Food Coupons</td>
    <td><input id="fc1" type="text" name="choiceBean.fc1" style="background-color: #dfecf5;border:0px;"value="15600 or 30000" readonly="readonly"/></td>
    <td><input id="fc2" type="text" name="choiceBean.fc2" value='0' onkeypress="return isfood(event)"  maxlength="15" onchange="food()"/></td>
    <td>Fixed;either of two</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Entertainment Expenses</td>
    <td>&nbsp;</td>
    <td><input id="ee" type="text" name="choiceBean.ee" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>Fuel Expenses</td>
    <td>&nbsp;</td>
    <td><input id="fe" type="text" name="choiceBean.fe" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
  <td>&nbsp;</td>
    <td>Utility Bills</td>
    <td><input id="ub1" type = "text" style="background-color: #dfecf5;border:0px;" value = "2500.00" readonly="readonly"/></td>
    <td><input id="ub" type="text" name="choiceBean.ub" value='0' onkeypress="return isub(event)"  maxlength="15" onchange="ubills()" /></td>
    <td>Fixed</td>
  </tr>
  
  <tr>
  	<td>&nbsp;</td>
    <td>Gift Coupons</td>
    <td><input type = "text" style="background-color: #dfecf5;border:0px;" value = "5000.00" readonly="readonly"/></td>
    <td><input id="gf2" type="text" name="choiceBean.gf2" value='0' onkeypress="return isgift(event)"  maxlength="15" onchange="gift()"/></td>
    <td>Fixed</td>
  </tr>
  
</table>
<br/>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <input id="submit2" type="button" class="myHoverButton" value="SAVE" onclick="this.disabled='disabled'"> </input> -->
<input id="submit2" type="button" class="myHoverButton" value="SAVE" > </input>
</form>
 </div> 
 <!--  <div id="lip"> --></div>
</body>    
</html>
