<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
p1{

margin-left:1%;
margin-top:5%;

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
.tableStyle2 tr  {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle2 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}

.tableStyle3 tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle3 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    

.tableStyle4 tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle4 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    
.tableStyle5 tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle5 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    
</style>
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
String panNo = empPersonalInfoAry[9];
String Dept = empPersonalInfoAry[10];
String Location = empPersonalInfoAry[11];
%>





<body style="margin-top:10%">

<table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left; margin-top:8%;">
  
  <tr class="headind">   
  <td>
     <div>	    
	   		 <a onclick="javascript:window.print();" title="print">
	            <img id="imglogo" src="images/clocksoftlogo.jpg" style="height: 106px;    width: 147px;    float: left;    padding: 5px;" /></a>
    
     </div> 
     
     <div>
    	 <center><H2>NALI CLOCK SOFTWARE SOLUTIONS PVT.LTD.</H2></center>
     </div>
	 <div >
	    <center style="font-size:12px">308/287,2ND FLOOR,NEAR INFOSYS, HOSUR MAIN ROAD,ELECTRONIC CITY,BANGALORE
	    560100</center>
	 
	     <center>Payslip for the month of June 2015</center>
	 </div>   
     
</td>
  </tr>
  </table>
   <center>
  <table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left;"  class = "tableStyle1">
  <tr>
   <!--  <td class="headind_1"> -->
   <td> NAME : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:90%" value="<%=empFname %>&nbsp;<%=empLname %>[<%=empId %>] " readonly="readonly"></input></td>
   <td>Date Of Joining :</td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=joiningDate %>" readonly="readonly"></input></td>
   </tr>
   
   <tr>
   <td> DESIGNATION : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:60%;" value="<%=empDesig %>" readonly="readonly"></input></td>
   <td> Bank Name : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:55%;" value="ICICI Bank" readonly="readonly"></input></td>
   </tr>
 
 <tr>
 <td> DEPARTMENT : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:50%;" value="<%=Dept %>" readonly="readonly"></input></td>
 <td>Bank Account No : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="123654789321606" readonly="readonly"></input></td>
 </tr>
 
  <tr>
  <td> LOCATION : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:60%;" value="<%=Location %>" readonly="readonly"></input>
  <td>Effective Work Days :</td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="30" readonly="readonly"></input></td>
  </tr>
  
  <tr>
   <td> PAN NO : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=panNo %>" readonly="readonly"></input></td>
   <td> Days in Month : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="30" readonly="readonly"></input></td>
  </tr>
  
  <tr>
  <td>PF NO : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:50%;" value="HYGF/54D60DG4" readonly="readonly"></input></td>
  <td>LOP : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="0" readonly="readonly"></input></td>
  </tr>
  
  
  </table>
   </center>

  
  <table style="background-color:#FFFFFF; width:49.96%; border:1; cellpadding:0px;float:left;" class = "tableStyle2">
 <tr>
    <th scope="col">Earning<th>Full</th><th>Actual</th> </th>
  </tr> 
  <tr>
    <td>BASIC</td>
    <td>3999.999</td>
    <td>4000</td>
  </tr>
  <tr>
    <td>HRA</td>
    <td>1599.9996</td>
    <td>1600</td>
  </tr>
  <tr>
    <td>CONVEYANCE</td>
    <td>1600</td>
    <td>1600</td>
  </tr>
  <tr>
    <td>LTA</td>
    <td>333</td>
    <td>333</td>
  </tr>
  <tr>
    <td>MEDICAL ALLOWANCE</td>
    <td>1250</td>
    <td>1250</td>
  </tr>
  <tr>
    <td>SPECIAL ALLOWANCE</td>
    <td>4070</td>
    <td>4070</td>

  </tr>

 <!-- <tr>
    <td>Total Earnings: Rs. </td>
    <td>12852.998599</td>
    <td>12853</td>

  </tr> -->
  
</table>


<TABLE style="background-color:#FFFFFF; width:50.00%; border:1; cellpadding:0px;float:left;" class = "tableStyle3">
<TR><th scope="col">Deduction<th>actual</th></th></TR>
<TR><td>PF</td>
    <td>480</td>
    </TR>
    <TR>
    <td>ESI</td>
    <td>225</td>
    </TR>
    <TR>
     <td>GRATUITY</td>
    <td>192</td>
    </TR>
<TR><td>&nbsp;</td>
    <td>&nbsp;</td>
    </TR>
    <TR>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </TR>
    <TR>
     <td>&nbsp;</td>
    <td>&nbsp;</td>
    </TR>
</TABLE>

<TABLE style="background-color:#FFFFFF; width:49.96%; border:1; cellpadding:0px;margin-top: -0.19%;float:left;" class = "tableStyle4">

<TR><td>Total Earnings: Rs.</td>
    <td>12852.9989</td>
     <td>12853</td>
    </TR>
</TABLE>

  <TABLE style="background-color:#FFFFFF; width:50.00%; border:1; cellpadding:0px;float:left;margin-top: -0.19%;" class = "tableStyle5">
<TR><td>Total Deductions: Rs. </td>
    <td>897</td>
    </TR>
</TABLE> 
  
  
  <table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left;" class = "tableStyle6">
  
 <!--  <tr class="headind"> -->
  
     <th>
    Net Pay for the month ( Total Earnings - Total Deductions) : 
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="11956" readonly="readonly"></input><BR>
  (Rupees Eleven Thousand Nine Hundred Fifty Six)  <BR>
    
     </th> 
  
  </tr>
  </table><br>
 <!--  <table style="background-color:#FFFFFF; width:90%; border:1; cellpadding:0px;margin-left:5.5%">
  
  <tr class="headind">
    <td><h5> </h5></td>
    <th>Earnings &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   Full &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Actual</th>
    <th>Deduction  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actual</th>
  </tr>
  
 <tr>
    <td class="headind_1">
   BASIC :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="3999.999" readonly="readonly"></input>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="4000" readonly="readonly"></input>
   <BR>
   HRA : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px; width:15%" value="1599.9996" readonly="readonly"></input>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="1600" readonly="readonly"></input>
       <BR>
   CONVEYANCE : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="1600" readonly="readonly"></input>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="1600" readonly="readonly"></input>
    <BR>
   LTA : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="333" readonly="readonly"></input>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="333" readonly="readonly"></input>
    <BR>
   
   MEDICAL ALLOWANCE : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="1250" readonly="readonly"></input>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="1250" readonly="readonly"></input>
    <BR>
   
   SPECIAL ALLOWANCE : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="4070" readonly="readonly"></input>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="4070" readonly="readonly"></input>
    <BR>
   
    </td> 
    
   <td class="headind_1">
    PF :   &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="480" readonly="readonly"></input><BR>
    ESI :   &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="225" readonly="readonly"></input><BR>
    GRATUITY :   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="192" readonly="readonly"></input><BR>
    </td>  
  </tr>
  
   
 <tr>
    <td class="headind_1">
   Total Earnings: Rs. : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="12852.998599" readonly="readonly"></input>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="12853" readonly="readonly"></input>
    <BR>
    </td> 
    
     <td class="headind_1">
    Total Deductions: Rs. :  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="897" readonly="readonly"></input><BR>
    </td>  
  </tr>
  
  </table>

  
  <table style="background-color:#FFFFFF; width:90%; border:1; cellpadding:0px;margin-left:5.5%">
  
  <tr class="headind">
  
     <th>
    Net Pay for the month ( Total Earnings - Total Deductions) : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%" value="11956" readonly="readonly"></input><BR>
  (Rupees Eleven Thousand Nine Hundred Fifty Six)  <BR>
    
     </th> 
  
  </tr>
  </table>
   -->




</body>
</html>