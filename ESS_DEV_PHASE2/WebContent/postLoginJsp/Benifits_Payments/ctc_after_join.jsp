<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.CTC_Columns"%>
     <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
     <%@ page import="java.io.*,java.text.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

Table,th,td{
border:0px;
}

  .inlineTable1 {
            display: inline-block;
            width:46%;
            font-size:15px;
            border:0px;
        } 
 .inlineTable {
            display: inline-block;
            width:40%;
            font-size:15px;
            border:0px;
        } 
 .tableStyle22 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
    border:0px;
}
 

 .tableStyle22 td {
  border-spacing: 0px;  
    border-style:none; 
    border:0px;
} 
.tableStyle22 table{
width:80%;
border:0px;
}
.inlineTable table{
width:100%;border:0px;
}
.tableStyle22 table{
width:73%;border:0px;
}
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
<body>
<div style="float:right;">
  <a onclick="javascript:window.print();" title="print"><input type="button"  name="bprint" value="Print" id="print"/></a>
</div>
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

%>

<%

String choiceFormDetails=CTC_Columns.Ctc_cal();

String choiceFormDetailsAry[]=choiceFormDetails.split("\\^");

String basic_pay=choiceFormDetailsAry[0];
String provident=choiceFormDetailsAry[1];
String gratuty=choiceFormDetailsAry[2];
String total_base=choiceFormDetailsAry[3];
String bonus=choiceFormDetailsAry[4];

String man_debits=choiceFormDetailsAry[5];
String medical=choiceFormDetailsAry[6];
String convey=choiceFormDetailsAry[7];
String lta=choiceFormDetailsAry[8];
String hra=choiceFormDetailsAry[9];
String spa=choiceFormDetailsAry[10];
String oth_choice=choiceFormDetailsAry[11];
String tot_choice=choiceFormDetailsAry[12];
String tot_ctc=choiceFormDetailsAry[13];
String pli=choiceFormDetailsAry[14];
String overall_ctc=choiceFormDetailsAry[15];
 String esi_pay=choiceFormDetailsAry[16]; 


%> 

<center ><h2>CTC STATEMENTS</h2></center>
<div class="tableStyle22">
<table>

<tr>
<td>
Emp Code:
</td>

<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" size="40" value="<%=empId%>" readonly="readonly"/>
</td>
<%
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
	%>	
<td>
AS On :
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp"   value="<%=df.format(new java.util.Date())%>" readonly="readonly"/>
</td>

</tr>

<tr>
<td>
Emp Name: 
</td>
<td>
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=empFname %>&nbsp;<%=empLname %>" readonly="readonly"/>
</td>

</tr>

<tr>
<td>
Designation
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp"   value="<%=empDesig%>" readonly="readonly"/>
</td>
<td align="left"> 
Designation Code
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=empDesig%>" readonly="readonly"/>
</td>
<td>
</td>
</tr>

<tr>
<td>
Role
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp"   value="<%=empDesig%>" readonly="readonly"/>
</td>
<td align="left"> 
Role Code
</td>
<td align="left"> 
<input style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=empDesig%>" readonly="readonly" />
</td>
<td>
</td>
</tr>
</table>
</div>
 <hr width="80%" > 

<div class="tableStyle22">
<table>
<tr>
<td>
<b><u>BASE PAY</u></b>
</td>
<td>
</td >
</tr>

<tr>
<td>
BASIC PAY
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=basic_pay%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
PROVIDENT FUND
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=provident%>" readonly="readonly"/>
</td>
</tr>

<tr>
<td>
GRATUTY
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=gratuty%>" readonly="readonly"/>
</td>
</tr>

 <tr>
<td>
ESI
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=esi_pay%>" readonly="readonly"/>
</td>
</tr>
 

<tr>
<td><b>
TOTAL BASE PAY</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=total_base%>" readonly="readonly"/>
</td>
</tr>
</table>
</div>

<table border=0 class="inlineTable1">
<tr><td> <b>
<u>CHOICE PAY</u></b></td>
</tr>
							<%
								
							ArrayList<Object> extra = CTC_Columns.ChoicepayColuns();
							System.out.println(extra.size());
							if(extra.size()>0)	{
								for(int l=0;l < extra.size();l++){
									String eve = extra.get(l).toString();
									String evearr[] = eve.split("\\'");
									 String type = evearr[0];
										
%>
	
	<tr>
	<td  style="text-indent: 3em;" ><%=type%></td>
</tr>
 <%										
}
}

%>

</table>

<table class="inlineTable1">
<tr><td>
</td>
</tr>
							<%
								
							ArrayList<Object> leareq = CTC_Columns.ChoicepayValues();
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
<div class=ghi>
<table>
<tr>
<td><b><u>
MANDATORY DEBITS</u></b>
</tr>
<tr>
<td>
ADVANCE BONUS
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=bonus%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td><b>
TOTAL MANDATORY DEBITS</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=man_debits%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td><b><u>
OTHER CHOICE PAY ITEMS</u></b>
</td>
<td>

</td>
</tr>

<tr>
<td>
MEDICAL
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=medical%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
CONVEYANCE
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=convey%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
LTA
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=lta%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
HRA
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=hra%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
SPECIAL PERSONAL ALLOWANCE
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=spa%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td><b>
TOTAL OTHER CHOICE ITEMS</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=oth_choice%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td><b>
TOTAL CHOICE PAY</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=tot_choice%>" readonly="readonly"/>
</td>
</tr>

<tr>
<td><b>
TOTAL CTC</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=tot_ctc%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
<b><u>INDIVIDUAL/ ONE TIME PAYMENTS</u></b><br>
<b>TOTAL INDIVIDUAL/ONETIME PAYMENTS</b>
</td>

</tr>
<tr>
<td>
PERFORANCE LINKED INCENTIVES
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=pli%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td><b>
OVERALL CTC</b>
</td>
<td>
<input  style="background-color: #FFFFFF;border:0px;" name="emp" value="<%=overall_ctc%>" readonly="readonly"/>
</td>
</tr>
<tr>
<td>
<b><u>COMMITED PLI</u><br>
(included in choice pay above)</b>
</td>

</tr>
</table>
</div>

</body>
</html>