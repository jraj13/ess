<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.CtcStatementAction"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>





<%

/* ChoiceFormDetails cfd=new ChoiceFormDetails();
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
 double pf_value=Double.parseDouble(choiceFormDetailsAry[9]); 
 double gratuity_value=Double.parseDouble(choiceFormDetailsAry[10]); 
 double totalbasepay_value=Double.parseDouble(choiceFormDetailsAry[11]); 

 double advbonus=Double.parseDouble(choiceFormDetailsAry[12]); 
 double tmd=Double.parseDouble(choiceFormDetailsAry[13]); 
 double medical=Double.parseDouble(choiceFormDetailsAry[14]);
 double conveyance=Double.parseDouble(choiceFormDetailsAry[20]);
 double spa=Double.parseDouble(choiceFormDetailsAry[16]);
 double totherchoicitems=Double.parseDouble(choiceFormDetailsAry[17]);
 double totalchoicepay=Double.parseDouble(choiceFormDetailsAry[18]);
 double totalctc=Double.parseDouble(choiceFormDetailsAry[19]);
 double pli=Double.parseDouble(choiceFormDetailsAry[20]);
 double overallctc=Double.parseDouble(choiceFormDetailsAry[21]); */

 
 CtcStatementAction aa=new CtcStatementAction();
 String choiceFormDetails=aa.generate();

 String choiceFormDetailsAry[]=choiceFormDetails.split("\\^");
  /* double ctc=Double.parseDouble(choiceFormDetailsAry[0]);*/
  
  double basic_value=Double.parseDouble(choiceFormDetailsAry[0]); 
  
 /*  double basepay_value=Double.parseDouble(choiceFormDetailsAry[1]); */
  
  double pf_value=Double.parseDouble(choiceFormDetailsAry[1]);
  double gratuity_value=Double.parseDouble(choiceFormDetailsAry[2]); 
  double totalbasepay_value=Double.parseDouble(choiceFormDetailsAry[3]); 
  double advbonus=Double.parseDouble(choiceFormDetailsAry[4]); 
  double tmd=Double.parseDouble(choiceFormDetailsAry[5]); 
  double medical=Double.parseDouble(choiceFormDetailsAry[6]);
  double conveyance=Double.parseDouble(choiceFormDetailsAry[7]);
  
  double lta_value=Double.parseDouble(choiceFormDetailsAry[8]);
  double hra_value=Double.parseDouble(choiceFormDetailsAry[9]);
  
  double totherchoicitems=Double.parseDouble(choiceFormDetailsAry[10]);
  double totalchoicepay=Double.parseDouble(choiceFormDetailsAry[11]);
  double totalctc=Double.parseDouble(choiceFormDetailsAry[12]);
  double pli=Double.parseDouble(choiceFormDetailsAry[13]);
  double overallctc=Double.parseDouble(choiceFormDetailsAry[14]);

 
 
%> 

<body style="margin-top:10%">
<div style="float:right;">
  <a onclick="javascript:window.print();" title="print"><input type="button"  name="bprint" value="Print"/></a>
</div>
 <center> 

<h4 style="margin-top:12%; ">CTC Statement</h4>
 </center> 

<div style="margin-left:1%;">
 <h6>Emp Code: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="empcode"  value="CSSE200045" style="background-color: white;color:black; width:20%;height:2%" readonly="readonly"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
 As On: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input name="empcode"  value="03-08-2015" style="background-color: white;color:black; width:15%;height:2%" readonly="readonly"/>

<h6>Emp Name: &nbsp;&nbsp;&nbsp;&nbsp;<input name="empcode"  value="YOGESH SHARMA" style="background-color: white;color:black; width:20%;height:2%" readonly="readonly"/>
<h6>Designation: &nbsp;&nbsp;<input name="empcode"  value="Software Engineer" style="background-color: white;color:black; width:20%;height:2%" readonly="readonly"/>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
Designation Code: &nbsp;<input name="empcode"  value="SE" style="background-color: white;color:black; width:15%;height:2%" readonly="readonly"/></h6>
<h6>Role: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="empcode"  value="Developer" style="background-color: white;color:black; width:20%;height:2%" readonly="readonly"/></h6>

 </div>

<table style=" width:90%; border:1; cellpadding:0px;margin-left: 1%">
  
  <tr class="headind">
   <!--  <td><h5> </h5></td> -->
    <th><center>CTC Componets</center></th>
    <th><center>For the Year 2020-16</center></th>
  </tr>
  
  <tr>
    <!-- <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>BASE PAY</B></U>
    <P>BASIC PAY</P>
    <P>PROVIDENT FUND</P>
    <P >GRATUITY</P>
    <P><b>TOTAL BASE PAY :</b></P></td> 
    <td ><p></p><p><input  name="basicpay" id="basicpay" style="background-color: white;border:0px; border:0px;" value="<%=basic_value %>" readonly="readonly"></input></p>
    <p><input  name="pf" id="pf" style="background-color: white;border:0px;" value="<%=pf_value %>" readonly="readonly"></input></p>
    <p> <input  name="gratuity" id="gratuity" style="background-color: white;border:0px;" value="<%=gratuity_value %>" readonly="readonly"></input></p>
    <b><input  name="tbasepay" id="tbasepay" style="background-color: white;border:0px;" value="<%=totalbasepay_value %>" readonly="readonly"></input></p>
    </td>
  </tr>
  
   <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>CHOICE PAY</B></U>
    <P>&nbsp;</P></td>
    <td ><p><input  name="ctc" id="ctc" style="background-color: white;border:0px;" value="" readonly="readonly"></input></p>
    </td>
  </tr>
  
    <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>MANDATORY DEBITS</B></U>
    <P>ADVANCE BONUS</P>
    <P><b>TOTAL MANDATORY DEBITS :</b></P>
    </td>
    <td><p></p><p><input  name="advbonus" id="advbonus" style="background-color: white;border:0px;" value="<%=advbonus %>" readonly="readonly"></input></p>
    <p><input  name="tmdebits" id="tmdebits" style="background-color: white;border:0px;" value="<%=tmd %>" readonly="readonly"></input></p>
    </td>
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
    <p><input  name="con" id="con" style="background-color: white;border:0px;" value="<%=conveyance %>" readonly="readonly"></input></p>
    <p><input  name="lta" id="lta" style="background-color: white;border:0px;" value="<%=lta_value %>" readonly="readonly"></input></p>
    <p><input  name="hra" id="hra" style="background-color: white;border:0px;" value="<%=hra_value %>" readonly="readonly"></input></p>
   <p> <input  name="spa" id="spa" style="background-color: white;border:0px;" value="" readonly="readonly"></input></p>
   <p> <input  name="totherchoicitems" id="totherchoicitems" style="background-color: white;border:0px;" value="<%=totherchoicitems %>" readonly="readonly"></input></p>
   <p> <input  name="tchoicepay" id="tchoicepay" style="background-color: white;border:0px;" value="<%=totalchoicepay %>" readonly="readonly"></input></p><br>
   <p>  <input name="tctc" id="tctc" style="background-color: white;border:0px;" value="<%=totalctc %>" readonly="readonly"></input></p>
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
      <input name="pli" id="pli" style="background-color: white;border:0px;" value="<%=pli %>" readonly="readonly"></input><BR>
      <input  name="oactc" id="oactc" style="background-color: white;border:0px;" value="<%=overallctc %>" readonly="readonly"></input><BR>
    </td>
  </tr>
  
   <tr>
   <!--  <td>&nbsp;</td> -->
    <td class="headind_1"><U><B>COMMITTED PLI</B></U>
    <P><B>(Included in Choice Pay above)</B></P><br>
   </td>
    <td > <input type="" name="cpli" id="cpli" style="background-color: white;border:0px;" value="NA" readonly="readonly"></input><BR>
    </td>
  </tr>
  
  
</table>



</body>
</html>