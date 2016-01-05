<%@ page import="com.ess.common.util.MonthandyearDecide" %>
<%@ page import="com.ess.common.util.CheckFuel_mailt" %>

 <%
 session = request.getSession();
	 String uName1 = (String) session.getAttribute("ctcsession"); 
 
/*  System.out.println(uName1); */

%> 

<%@page import="com.ess.common.action.ChoiceFormDetails"%>
   <%@page import="com.ess.common.action.ExpenseEntryAction" %>
        <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%-- <%@page import="com.ess.common.action.ChoiceFormDetails"%> --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
table caption {
	background-color: #98c3e2;
	padding: 5px 2%;
	text-align: left;
	height:22px;
}

 .tableStyle1 tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle1 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    
br{
line-height: 1px;
 
}

</style>
<!-- <link rel="stylesheet" href="css/style_choicepay.css"/> -->
<!--  <script src="js/ChoicePayCal_update.js"></script> -->
<!--  <script src="investmentjs/jquery-1.10.2.js"></script> -->

<link rel="stylesheet" href="investmentjs/style_choicepay.css"/>
 <script src="investmentjs/ChoicePayCal_update.js"></script>
 <script src="investmentjs/jquery-1.10.2.js"></script>

<link rel="stylesheet" href="postloginresource/jquery-ui.css">
<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script> 

<%-- <script type="text/javascript">


/* $(function() {	 */
	$(document).ready(function () {
	
var uName="YOGESH@CLOCKSOFT.INFO";
 var uName1='<%=uName1%>';
 var fnm='<%=fuel_value%>';
/*  alert(uName1);   */

		if (uName1 >=250000.0) {
		 alert("eligible");
			$('#opted').hide();
			
		

		}
		else  {
			 $('#opted').show();
			alert("You are not eligible for this");
	
		} 
		
	})
	
	
	</script> --%>

 
</head>

<%

CheckFuel_mailt ch=new CheckFuel_mailt();
String tot_ct=ch.checkFuel();
System.out.println("fuellllllll"+tot_ct);

if(tot_ct!=null)
{
	out.println("<font color=red>");
	out.println(tot_ct);
	out.println("</font>");
}

%>


<%
String empPersonalInfo=EmployeeDetailsPersonal.getPersonalInfo();
System.out.println("empPersonalInfo===="+empPersonalInfo);
String empPersonalInfoAry[]=empPersonalInfo.split("\\^");
String empId = empPersonalInfoAry[0];
String empFname =empPersonalInfoAry[1];
String empLname =empPersonalInfoAry[2];

%>

<%

ChoiceFormDetails cfd=new ChoiceFormDetails();
String choiceFormDetails=cfd.getChoiceFormDetails();

String choiceFormDetailsAry[]=choiceFormDetails.split("\\^");
 double ctc=Double.parseDouble(choiceFormDetailsAry[0]);
 double basic_value=Double.parseDouble(choiceFormDetailsAry[1]);
 double basepay_value=Double.parseDouble(choiceFormDetailsAry[2]);
 double acp=Double.parseDouble(choiceFormDetailsAry[3]);
 double fuel_value=Double.parseDouble(choiceFormDetailsAry[4]);
 double hra_value=Double.parseDouble(choiceFormDetailsAry[5]);
 double lta_value=Double.parseDouble(choiceFormDetailsAry[6]);
 double ernps=Double.parseDouble(choiceFormDetailsAry[7]);
 double ernps_new=Double.parseDouble(choiceFormDetailsAry[8]); 


	MonthandyearDecide mm=new MonthandyearDecide();
	String mm_year=mm.monthyear();
	
	String empPersonalInfoAry11[]=mm_year.split("\\^");
	String fy_start = empPersonalInfoAry11[0];
	String fy_end =empPersonalInfoAry11[1];
 
 
%> 

<%
/*  String fm1 = ExpenseEntryAction.getExpenseEntryFM1();
	System.out.println(fm1);
String fm2= ExpenseEntryAction.getExpenseEntryFM2();
String fm3= ExpenseEntryAction.getExpenseEntryFM3();*/
 String fm4= ExpenseEntryAction.getExpenseEntryFM4(); 
String fm5= ExpenseEntryAction.getExpenseEntryFM5();
/*String fm6= ExpenseEntryAction.getExpenseEntryFM6();
String fm7= ExpenseEntryAction.getExpenseEntryFM7();
String fm8= ExpenseEntryAction.getExpenseEntryFM8();
String fm9= ExpenseEntryAction.getExpenseEntryFM9(); 
String fm10= ExpenseEntryAction.getExpenseEntryFM10();
 String fm11= ExpenseEntryAction.getExpenseEntryFM11();
String fm12= ExpenseEntryAction.getExpenseEntryFM12(); */

%>



<body onload="disableView()">



<!-- <div id="opted"  style="background-color: #F2F5F7; color:#FF0000;margin-top:3px;float:left;padding-left:15px; width:32% ">FUEL AND MAINTENANCE COMPONENT NOT OPTED</div><br><br></br></br> -->
<div style="background-color: #98c3e2;margin-top:0px;float:left;padding-left:15px; width:80%;">Employee Fuel Maintanance Details</div>
<br>

<table style="background-color:#FFFFFF; width:80%; border:1; cellpadding:0px;float:left;"  class = "tableStyle1" >
  <tr>
   <!--  <td class="headind_1"> -->
   <td> Employee No : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:90%" value="<%=empId %> " readonly="readonly"></input></td>
   <td>Employee Name :</td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:90%;" value="<%=empFname %>&nbsp;<%=empLname %>" readonly="readonly"></input></td>
   </tr>
   
   <tr>
   <td> Eligible Amount : </td><td><input  name="basepay" id="eligibleamt" style="background-color: #FFFFFF;border:0px;width:60%;" value="<%=fuel_value %>" readonly="readonly"></input></td>
   <td> &nbsp; </td><td>&nbsp;</td>
   </tr>
 
 								<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%> 
								<!-- out.println("today date;.."+df.format(new java.util.Date())); -->
								
					<% String var1=df.format(new java.util.Date());
					String[] date=var1.split("/");
					//out.println("year======="+date[2]);
						%>
 <tr>
 <td> Period Name  : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:20%;" value="01-Apr-<%=fy_start %>" readonly="readonly"></input>&nbsp;To:&nbsp; <input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:20%;" value="31-Mar-<%=fy_end %>" readonly="readonly"></input>  </td>
 <td> &nbsp; </td><td>&nbsp;</td>
 </tr>
  
  </table>
<br></br><br></br>


<table style="background-color:#dfecf5; width:80%; border:1; cellpadding:0px;margin-top:-24px" id="fmdetails">
 <!--  <caption>
   PACKAGE DISTRIBUTION
  </caption> -->
  <tr  class="headind">
    <td><h5> </h5></td>
    <th>Month</th>
    <th>Passed Amount</th>
    <th>Paid Amount(Taxable)</th>
    <th>Paid Amount(Non Taxable)</th>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;&nbsp;&nbsp;</td>
    <td class="headind_1"><input id="month1" type="text" style="background-color: #E2BC72;border:0px;" name="month1" value="APR"readonly="readonly"/></td>
    <td class="headind_1"><input id="passedamt1" type="text" style="background-color: #E2BC72;border:0px;" name="month1" value=""readonly="readonly"/></td>
    <td class="headind_1"><input id="paidamttax1" type="text" style="background-color: #E2BC72;border:0px;" name="paidamttax1"" value="0.00"readonly="readonly"/></td>
    <td class="headind_1"><input id="paidamtntax1" type="text" style="background-color: #E2BC72;border:0px;" name="aidamtntax1" value="0.00"readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month2" type="text" style="background-color: #dfecf5;;border:0px;" name="month2" value="MAY"readonly="readonly"/></td>
    <td><input id="passedamt2" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt2" value=""readonly="readonly"/></td>
    <td><input type="text" name="paidamttax2" id="paidamttax2" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input></td>
    <td><input id="paidamtntax2" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax2" value="0.00"readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month3" type="text" style="background-color: #dfecf5;;border:0px;" name="month3" value="JUN"readonly="readonly"/></td>
    <td><input id="passedamt3" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt3" value=" "readonly="readonly"/></td>
    <td><input type="text" name="paidamttax3" id="paidamttax3" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input></td>
    <td><input id="paidamtntax3" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax3" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month4" type="text" style="background-color: #dfecf5;;border:0px;" name="month4" value="JUL"readonly="readonly"/></td>
    <td><input id="passedamt4" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt4" value="<%=fm4 %> "readonly="readonly"/></td>
    <td><input type="text" name="paidamttax4" id="paidamttax4" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input></td>
    <td><input id="paidamtntax4" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax4" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month5" type="text" style="background-color: #dfecf5;;border:0px;" name="month5" value="AUG"readonly="readonly"/></td>
    <td><input id="passedamt5" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt5" value="<%=fm5 %> "readonly="readonly"/></td>
    <td><input type="text" name="paidamttax5" id="paidamttax5" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input></td>
    <td><input id="paidamtntax5" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax5" value="0.00 "readonly="readonly"/></td>   
  </tr>
  
   <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month6" type="text" style="background-color: #dfecf5;;border:0px;" name="month6" value="SEPT"readonly="readonly"/></td>
    <td><input id="passedamt6" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt6" value=" "readonly="readonly"/></td>
    <td><input type="text" name="paidamttax6" id="paidamttax6" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input> </td>
    <td><input id="paidamtntax6" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax6" value="0.00"readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month7" type="text" style="background-color: #dfecf5;;border:0px;" name="month7" value="OCT"readonly="readonly"/></td>
    <td><input id="passedamt7" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt7" value=""readonly="readonly"/></td>
    <td><input id="paidamttax7" type="text" name="paidamttax7" id="acp" style="background-color: #dfecf5;border:0px;" value="0.00" readonly="readonly"></input></td>
    <td><input id="paidamtntax7" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax7" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month8" type="text" style="background-color: #dfecf5;;border:0px;" name="month8" value="NOV"readonly="readonly"/></td>
    <td><input id="passedamt8" type="text" style="background-color: #dfecf5;color:black;border:0px;" name="passedamt8" " value="" readonly="readonly"/></td>
    <td><input id="paidamttax8" type="text" style="background-color: #dfecf5;border:0px;" name="paidamttax8" value="0.00"readonly="readonly"/></td>
    <td><input id="paidamtntax8" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax8" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  <tr>
   <td class="headind">&nbsp;</td>
    <td><input id="month9" type="text" style="background-color: #dfecf5;;border:0px;" name="month9" value="DEC"readonly="readonly"/></td>
    <td><input id="passedamt9" type="text" name="passedamt9"  style="background-color:#dfecf5;border:0px"  value="" readonly="readonly"/></td>
    <td><input id="paidamttax9" type="text" style="background-color: #dfecf5;border:0px;" name="paidamttax9" value="0.00"readonly="readonly"/></td>
    <td><input id="paidamtntax9" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax9" value="0.00 "readonly="readonly"/></td>
  </tr>
  
   <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month10" type="text" style="background-color: #dfecf5;;border:0px;" name="month10" value="JAN"readonly="readonly"/></td>
    <td><input id="passedamt10" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt10" value="" readonly="readonly"/></td>
    <td><input id="paidamttax10" type="text" style="background-color: #dfecf5;border:0px;" name="paidamttax10" value="0.00"readonly="readonly"/></td>
    <td><input id="paidamtntax10" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax10" value="0.00"readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month11" type="text" style="background-color: #dfecf5;;border:0px;" name="month11" value="FEB"readonly="readonly"/></td>
    <td><input id="passedamt11" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt11" value=""readonly="readonly"/></td>
    <td><input id="paidamttax11" type="text" style="background-color: #dfecf5;border:0px;" name="paidamttax11" value="0.00"readonly="readonly"/></td>
    <td><input id="paidamtntax11" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax11" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  <tr>
    <td class="headind">&nbsp;</td>
    <td><input id="month12" type="text" style="background-color: #dfecf5;;border:0px;" name="month12" value="MAR"readonly="readonly"/></td>
    <td><input id="passedamt12" type="text" style="background-color: #dfecf5;border:0px;" name="passedamt12" value=" "readonly="readonly"/></td>
    <td><input id="paidamttax12" type="text" style="background-color: #dfecf5;border:0px;" name="paidamttax12" value="0.00"readonly="readonly"/></td>
    <td><input id="paidamtntax12" type="text" style="background-color: #dfecf5;border:0px;" name="paidamtntax12" value="0.00 "readonly="readonly"/></td>
  </tr>
  
  
  
</table>
<br>
<table style="background-color:#FFFFFF; width:80%; border:1; cellpadding:0px;float:left; margin-top:-24px"  class = "tableStyle1">
  <caption>
   
  </caption> 
  <tr>
   <!--  <td class="headind_1"> -->
   <td> Total Paid Amount : </td><td><input  name="totapa" id="totapa" style="background-color: #FFFFFF;border:0px;width:90%" value="0.00 " readonly="readonly"></input></td>
   <td> Remaining Balance :</td><td><input  name="rembal" id="rembal" style="background-color: #FFFFFF;border:0px;width:45%;" value="0.00" readonly="readonly"></input></td>
   </tr>
   
   <tr>
   <td> &nbsp; </td><td>&nbsp;</td>
   <td> &nbsp; </td><td>&nbsp;</td>
   </tr>
 

  
  </table>

<!-- </form> -->
<!--  </div> --> 
  <div id="lip"></div>
</body>    
</html>
