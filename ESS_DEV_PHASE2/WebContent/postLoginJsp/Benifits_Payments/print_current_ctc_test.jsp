<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.CTCStmtMainAction"%>
     <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
    <%@ page import="java.lang.*,java.util.*"%>
    
    <%@ page import="com.ess.common.util.MonthandyearDecide" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
table{
width:100%;
}
/* .inlineTable1 {
            display: inline-block;
            width:26%;
            font-size:10px;
        }
 .inlineTable {
            display: inline-block;
            width:20%;
            font-size:10px;
        } */
.tableStyle2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.tableStyle2 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}
/* td.normal{
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
} */
</style>
<script type="text/javascript">
$(function() {	
		
		 $('#print').show();
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				 $('#print').hide();
				 /*	$('#year').hide();
				$('#qrybtn').hide();
				$('#wp').hide(); */
			 
			})
			
	})
	
	</script>



</head>


 <%
String empPersonalInfo=EmployeeDetailsPersonal.getPersonalInfo();
System.out.println("empPersonalInfo===="+empPersonalInfo);
String empPersonalInfoAry[]=empPersonalInfo.split("\\^");
String empId = empPersonalInfoAry[0];
String empFname =empPersonalInfoAry[1];
String empLname =empPersonalInfoAry[2];
String joiningDate=empPersonalInfoAry[3];
String empDob = empPersonalInfoAry[4];
String empDesig = empPersonalInfoAry[5];
String empEmail =empPersonalInfoAry[6];
String repManager = empPersonalInfoAry[7];
String empCtc = empPersonalInfoAry[8];
/* String panNo = empPersonalInfoAry[9];
String Dept = empPersonalInfoAry[10];
String Location = empPersonalInfoAry[11];
String Role=empPersonalInfoAry[12]; */
%>



<%-- <%

ChoiceFormDetails cfd=new ChoiceFormDetails();
String choiceFormDetails=cfd.getChoiceFormDetails1();

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
 double pf_value=Double.parseDouble(choiceFormDetailsAry[9]); 
 double gratuity_value=Double.parseDouble(choiceFormDetailsAry[10]); 
 double totalbasepay_value=Double.parseDouble(choiceFormDetailsAry[11]); 

 double advbonus=Double.parseDouble(choiceFormDetailsAry[12]); 
 double tmd=Double.parseDouble(choiceFormDetailsAry[13]); 
 double medical=Double.parseDouble(choiceFormDetailsAry[14]);
 double conveyance=Double.parseDouble(choiceFormDetailsAry[15]);
 double spa=Double.parseDouble(choiceFormDetailsAry[16]);
 double totherchoicitems=Double.parseDouble(choiceFormDetailsAry[17]);
 double totalchoicepay=Double.parseDouble(choiceFormDetailsAry[18]);
 double totalctc=Double.parseDouble(choiceFormDetailsAry[19]);
 double pli=Double.parseDouble(choiceFormDetailsAry[20]);
 double overallctc=Double.parseDouble(choiceFormDetailsAry[21]);
 
%>  --%>
<%



/* ArrayList<String> leareq = CTCStmtMainAction.GetBeforeCTC(); */
ArrayList<String> leareq=CTCStmtMainAction.GetBeforeCTC();
if (leareq.size() > 0) {
	for (int i = 0; i < leareq.size(); i++) {
		String req = leareq.get(i).toString();
		String reqarr[] = req.split("\\^");
		String basicpay = reqarr[0];
		String pro_fund = reqarr[1];
		String gratuty = reqarr[2];
		String tot_basepay = reqarr[3];
		String ad_bonus = reqarr[4];
		String tot_man_debits = reqarr[5];
		String medical = reqarr[6];
		String conveyance = reqarr[7];
		String lta = reqarr[8];
		String hra=reqarr[9];
		
		String tot_other_choice = reqarr[10];
		String tot_choice = reqarr[11];
		String tot_ctc = reqarr[12];
		String pli = reqarr[13];
		String overall_ctc = reqarr[14];
		String spa=reqarr[15];
		String esi_value=reqarr[16];
 
		
		MonthandyearDecide mm=new MonthandyearDecide();
		String mm_year=mm.monthyear();
		
		String empPersonalInfoAry11[]=mm_year.split("\\^");
		String fy_start = empPersonalInfoAry11[0];
		String fy_end =empPersonalInfoAry11[1];
		
		
		
%>  


<body style="margin-top:10%">
<div style="float:right;">
  <a onclick="javascript:window.print();" title="print"><input type="button"  name="bprint" value="Print" id="print"/></a>
</div>

 <center> 

<h4 style="margin-top:12%; ">CTC Statement</h4>
 </center> 

<table style=" width:90%; border:1; cellpadding:0px;margin-left: 1%" class ="tableStyle2">
 <tr>
<td colspan="1">
Emp Code:
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="empid" size="40" value="<%=empId%>" readonly="readonly"/>
</td>
<%
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
	%>	
<td>
As On:
</td>
<td colspan="2">
<input style="background-color: #FFFFFF;border:0px;" name="empason"   value="<%=df.format(new java.util.Date())%>" readonly="readonly"/>
</td>
</tr>

 <tr>
<td colspan="1">
Emp Name:
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="empname" size="40" value="<%=empFname %>&nbsp;<%=empLname %>" readonly="readonly"/>
</td>
<td>
Designation:
</td>
<td colspan="2">
<input style="background-color: #FFFFFF;border:0px;" name="empdesign"   value="<%=empDesig%>" readonly="readonly"/>
</td>
</tr>

 <tr>
<td colspan="1">
Designation Code:
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="empdesign" size="40" value="<%=empDesig%>" readonly="readonly"/>
</td>
<td>
Role:
</td>
<td colspan="2">
<input style="background-color: #FFFFFF;border:0px;" name="empdesign"   value="<%=empDesig%>" readonly="readonly"/>
</td>
</tr>
 
 
 </table>

<table style=" width:90%; border:1; cellpadding:0px;margin-left: 1%">
  
  <tr class="headind">
   <!--  <td><h5> </h5></td> -->
    <th><center>CTC Componets</center></th>
    <th><center>For the Year <%=fy_start %>-<%=fy_end %></center></th>
  </tr>
  
  <tr>
    <td class="headind_1"><U><B>BASE PAY</B></U>
    <P>BASIC PAY</P>
    <P>PROVIDENT FUND</P>
    <P>GRATUITY</P>
    <P>ESI</P>
    <P><b>TOTAL BASE PAY :</b></P></td> 
    <td ><p>&nbsp;</p>
    <p><input  name="basicpay" id="basicpay" style="background-color: white;border:0px; border:0px;" value="<%=basicpay %>" readonly="readonly"></input></p>
 	 <p><input  name="pf" id="pf" style="background-color: white;border:0px;" value="<%=pro_fund %>" readonly="readonly"></input></p>
  	 <p><input  name="gratuity" id="gratuity" style="background-color: white;border:0px;" value="<%=gratuty %>" readonly="readonly"></p>
  	 <p><input  name="esi" id="esi" style="background-color: white;border:0px;" value="<%=esi_value %>" readonly="readonly"></input></p>
     <p><b><input  name="tbasepay" id="tbasepay" style="background-color: white;border:0px;" value="<%=tot_basepay %>" readonly="readonly"></input></b></p>
    </td>
  </tr>
  
   <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>CHOICE PAY</B></U>
    <P>&nbsp;</P></td>
    <td ><input  name="ctc" id="ctc" style="background-color: white;border:0px;" value="0.0" readonly="readonly"></input><BR>
    </td>
  </tr>
  
    <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>MANDATORY DEBITS</B></U>
    <P>ADVANCE BONUS</P>
    <P><b>TOTAL MANDATORY DEBITS :</b></P>
    </td>
    <td ><input  name="advbonus" id="advbonus" style="background-color: white;border:0px;" value="<%=ad_bonus %>" readonly="readonly"></input><BR>
    <b><input  name="tmdebits" id="tmdebits" style="background-color: white;border:0px;" value="<%=tot_man_debits %>" readonly="readonly"></input></b></td>
  </tr>
  
  <tr>
    <!-- <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>OTHER CHOICE PAY ITEMS</B></U>
   <!--  <P>FUEL/MAINT. EXPENSES</P> -->
    <P>MEDICAL EXPENSES</P>
    <P>CONVEYANCE </P>
    <P>LTA </P>
    <P>HRA </P>
    <P>SPECIAL PERSONAL ALLOWANCE</P>
    <P><B>TOTAL OTHER CHOICE ITEMS :</B></P>
    
    <P><B>TOTAL CHOICE PAY :</B></P><br>
    <p><b>TOTAL CTC :</b></p>
    </td>
    <td ><p></p>
     <p><input  name="mediexp" id="mediexp" style="background-color: white;border:0px;" value="<%=medical %>" readonly="readonly"></input></p>
     <p> <input  name="con" id="con" style="background-color: white;border:0px;" value="<%=conveyance %>" readonly="readonly"></input></p>
     <p> <input  name="lta" id="lta" style="background-color: white;border:0px;" value="<%=lta %>" readonly="readonly"></input></p>
     <p> <input  name="hra" id="hra" style="background-color: white;border:0px;" value="<%=hra %>" readonly="readonly"></input></p>
     <p> <input  name="spa" id="spa" style="background-color: white;border:0px;" value="<%=spa %>" readonly="readonly"></input></p>
     <p>  <input  name="totherchoicitems" id="totherchoicitems" style="background-color: white;border:0px;" value="<%=tot_other_choice %>" readonly="readonly"></input></p>
     <P>  <input  name="tchoicepay" id="tchoicepay" style="background-color: white;border:0px;" value="<%=tot_choice %>" readonly="readonly"></input></P><br>
     <p> <b><input  name="tctc" id="tctc" style="background-color: white;border:0px;" value="<%=tot_ctc %>" readonly="readonly"></input></b></p>
    </td>
  </tr>
  
   <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>INDIVIDUAL / ONE TIME PAYMENTS</B></U>
    <P><B>TOTAL INDIVIDUAL / ONE TIME PAYMENTS :</B></P><br>
    <P>PERFORMANCE LINKED INCENTIVE</P>
    <P><b>OVERALL CTC :</b></p><BR>
   	</td>
    <td ><BR><BR>
      <input  name="pli" id="pli" style="background-color: white;border:0px;" value="<%=pli %>" readonly="readonly"></input><BR>
      <input  name="oactc" id="oactc" style="background-color: white;border:0px;" value="<%=overall_ctc %>" readonly="readonly"></input><BR>
    </td>
  </tr>
  
   <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>COMMITTED PLI</B></U>
    <P><B>(Included in Choice Pay above)</B></P><br>
   </td>
    <td > <input  name="cpli" id="cpli" style="background-color: white;border:0px;" value="NA" readonly="readonly"></input><BR>
    </td>
  </tr>
  
  <%	} } %>
</table>



</body>
</html>