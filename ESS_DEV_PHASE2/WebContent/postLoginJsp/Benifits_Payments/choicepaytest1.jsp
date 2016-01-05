<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="com.ess.common.action.ChoiceFormDetails"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<style>
table caption {
	background-color: #98c3e2;
	padding: 5px 2%;
	text-align: left;
}
</style>

  <link rel="stylesheet" href="css/style_choicepay.css"> 
 <script src="js/ChoicePayCal_update.js"></script>
</head>



<%-- 
 <div id="sidebar" style="margin-top:0.5%;margin-left:-1%;height:1000px;width:215px">
   <div style="height:1000px;width:250px;float:left;margin-left:5%;margin-top:3%">

<ul>
					 <div style="height:20px;width:200px;float:left">	
					<li><a href="<s:url action="personaldetails"/>" style="text-decoration:none;pointer:mouse;color:pink"> Personal Details</a> </li>
	</div>
					<div style="height:20px;width:200px;float:left">	
					
					<li><a href="<s:url action="choicepay"/>" style="text-decoration:none;pointer:mouse;color:orange">Choice pay</a></li></div>
					<div style="height:20px;width:200px;float:left">	
					<li><a href="<s:url action="Emp_InvestmentDetails"/>" style="text-decoration:none;pointer:mouse;color:pink">Investment Declaration</a></li></div>
			     	
					</ul>
					
<!-- --------end hide and expand--- -->

 </div>
    </div> --%>
    
    






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

%>

<body>

<div style="height:1000px;width:750px:bg-color:#40e0d0;margin-top:2%">

<BR>
<h4> Choice Pay Entry</h4>
<form action="choicepay_success" method="post">
<!------------main cocntiner--------------->
<!-- <div class="main"> -->


<!------------conatiner----------->
<!-- <div class="container"> -->



<h6> Effective From: &nbsp;<input name="date" type="text" value="01-APril-2015" style="background-color: white;color:black; width:8%;height:2%" readonly="readonly"/> </h6>




<table width="50%" border="1" summary="Table data" class="table-container" cellpadding="0px;">
  <caption>
   Package Distribution
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
    
      <td><input type="text" name="ctc" style="background-color: #dfecf5;border:0px;" value="<%=ctc %>" readonly></input></td>
       <td class="headind_1">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>

    <td>&nbsp;</td>
    <td>Basic</td>
   <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.basic" style="background-color: #dfecf5;border:0px;" value="<%=basic_value%>" readonly></input></td>
         <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Base Pay</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.basepay" style="background-color: #dfecf5;border:0px;" value="<%=basepay_value %>" readonly></input></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Performance Linked Incentive</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.pli" style="background-color: #dfecf5;border:0px;" value="0" readonly></input></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Choice Pay</td>
    <td>&nbsp;</td>
    <td><input type="text" name="value" style="background-color: #dfecf5;border:0px;" value="<%=acp %>" readonly></input></td>
        <td>&nbsp;</td>
        
        
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>Special Personal Allowance</td>
    <td>&nbsp;</td>
    <td><input type="text" name="choiceBean.spa" style="background-color: #dfecf5;border:0px;" value="0" readonly></input> </td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Available Choice Pay</td>
    <td>&nbsp;</td>
    <td><input id="acp" type="text" name="choiceBean.acp" style="background-color: #dfecf5;border:0px;" value="<%=acp %>" readonly></input></td>
    <%-- <td><s:textfield name="choiceBean.acp" value="%{acp}" id="acp" style="background-color: #dfecf5;border:0px;"/>
    <!-- <input id="acp" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.acp"/> --></td> --%>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Medical Reibursment</td>
    <td><input id="mr1" type="text" style="background-color: #dfecf5;color:black;border:0px;" name="choiceBean.mr1" value="15000.00" readonly="readonly"/></td>
    <td><input id="mr2" type="text" name="choiceBean.mr2" value='0' onkeypress="return ismedical(event)"  maxlength="15" onchange="medical()"/></td>
        <td>Fixed</td>
  </tr>
  <tr>
    <!-- <td>&nbsp;</td>
    <td>Children Education Allowance</td>
    <td><input id="cea1" type="text" name="choiceBean.cea1" onchange="education1()"/></td>
    <td><input id="cea2" type="text" name="choiceBean.cea2" onchange="education()"/></td>
        <td>Rs.1200 per child; max 2 children</td> -->
         <td>&nbsp;</td>
    <td>Children Education Allowance</td>
    <td><input id="cea1" type="text" name="choiceBean.cea1" style="background-color:#dfecf5;border:0px"  value="2400" readonly/></td>
    <td><input id="cea2" type="text" name="choiceBean.cea2" value='0' onkeypress="return iseducation1(event)"  maxlength="15" onchange="education1()"/></td>
        <td>Rs.1200 per child; max 2 children</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>Conveyance Allowance</td>
    <td><input id="coa1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.coa1" value="9600" readonly="readonly"/></td>
    <td><input id="coa2" type="text" name="choiceBean.coa2" value='0' onkeypress="return isconveyance(event)"  maxlength="15" onchange="conveyance()"/></td>
        <td>Fixed</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Fuel / Maint. Expenses</td>
    <td>Any Amount Upto<input id="fme1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.fme1" value="<%=fuel_value%>"readonly="readonly"/></td>
    <td><input id="fme2" type="text" name="choiceBean.fme2" value='0' onkeypress="return isfuel(event)"  maxlength="15" onchange="fuel()"/></td>
        <td>Min of Rs. 3.5 Lac or 25% of CTC</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>HRA</td>
    <td>Any Amount Upto<input id="hra1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.hra" value="<%=hra_value%>"readonly="readonly"/></td>
    <td><input id="hra2" type="text" name="choiceBean.hra2" value='0' onkeypress="return ishra(event)"  maxlength="15" onchange="hra()"/></td>
        <td>50% of Basic for Metro Cities And 40% for Rest</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>LTA</td>
    <td>Any Amount Upto<input id="lta1" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.lta" value="<%=lta_value%>" readonly="readonly"/></td>
    <td><input id="lta2" type="text" name="choiceBean.lta2" value='0' onkeypress="return islta(event)"  maxlength="15" onchange="lta()"/></td>
        <td>2 Times of Monthly Basic</td>
  </tr>
   <tr>
    <%-- <td>&nbsp;</td>
    <td>Er.NPS Contribution</td>
    <td>Any amount from Rs 6000 to<input id="ernc" type="text" style="background-color: #dfecf5;border:0px;"name="choiceBean.ernc" value="<%=ernps%>"readonly="readonly"/></td>
    <td><input id="ernc1" type="text" name="choiceBean.ernc1" onchange="ernps()"/></td>
        <td>Min Rs 6000 upto Max 10% of Basic</td>
  --%> 
  <td>&nbsp;</td>
    <td>Er.NPS Contribution</td>
    <td>Any Amount From Rs 6000 to<input id="ernc" type="text" style="background-color: #dfecf5;border:0px;"name="choiceBean.ernc" value="<%=ernps_new%>"readonly="readonly"/></td>
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
        <td>Rs.3600 per child; max 2 children</td> -->
        <td>&nbsp;</td>
    <td>Children Hostel Allowance</td>
    <td><input id="cha1"  type="text" style="background-color:#dfecf5;border:0px" name="choiceBean.cha1" value="7200" readonly/></td>
    <td><input id="cha2"  type="text" name="choiceBean.cha2" value='0' onkeypress="return ishostel(event)"  maxlength="15" onchange="hostel()"/></td>
        <td>Rs.3600 per child; max 2 children</td>
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

<!------------conatiner----------->

<p> &nbsp;</p>

<!------------ end main cocntiner--------------->
<center><input type="submit"  value="submit" onclick="return validateform()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </center>

</form>
 </div> 
  
</body>

</html>




