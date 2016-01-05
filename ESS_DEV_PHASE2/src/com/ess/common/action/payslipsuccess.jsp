<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.ess.common.action.PayslipAction" %>
 <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
      
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


<link rel="stylesheet" href="postloginresource/jquery-ui.css">
<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script> 

<%-- <script type="text/javascript">
$(function() {	
		
 var uName="YOGESH@CLOCKSOFT.INFO";
 var uName1='<%=uName1%>';
 var fnm='<%=fuel_value%>';
 /* alert(uName1); */
		if (uName1 >=250000) {
			$('#opted').hide();
		}
		else  {
			alert("Yor are not eligible for this");
			$('#opted').show();
		} 
		
		 
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				/* $('#month').hide();
				$('#year').hide();
				$('#qrybtn').hide();
				$('#wp').hide(); */
			 
			})
			
		
	})
	
	$(function() {
	$('#payqryBtn').click(
			function() {
			alert("come in ajax call");
				var month=$('#month1').val();
				var year=$('#year1').val();
				
				if (month == "none selected" || year == "none selected") {

					alert("Please Select Month & Year ! ");

					return false;
				
	
				}
				else{
				
				
				  var dataString = '&month=' + month + '&year=' + year ;
		
				$.ajax({

					url :'postLoginJsp/Benifits_Payments/payslipsuccess.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {

						alert("Expense Entsuccessfully inserted ");
							/* $('#lrmain').html(data).delay(5000).fadeOut(); */
						$('#lrmain1').html(data);

					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
				}

			})
});


	</script> --%>


</head>

<%

ArrayList<String> info = PayslipAction.getPayslipQuery();
if (info.size() > 0) {
	for (int i = 0; i < info.size(); i++) {

		String employeedata = info.get(i).toString();

		String empDataAry[] = employeedata.split("\\^");


		
		String empid = empDataAry[0];
		String name = empDataAry[1];
		String designation = empDataAry[2];
		String  dept = empDataAry[3];
		String  loc = empDataAry[4];
		
		
		String pan = empDataAry[5];
		String pfno = empDataAry[6];
		String doj = empDataAry[7];
		String  bname = empDataAry[8];
		String  accno = empDataAry[9];
		
		
		String eff_days = empDataAry[10];
		String days_mon = empDataAry[11];
		String lop = empDataAry[12];
		String  basic = empDataAry[13];
		String  hra = empDataAry[14];
		
		String covey = empDataAry[15];
		String lta = empDataAry[16];
		String medical = empDataAry[17];
		String  special = empDataAry[18];
		String  pf = empDataAry[19];
		
		String esi = empDataAry[20];
		String gratuty = empDataAry[21];
		String tot_ear = empDataAry[22];
		String  tot_ded = empDataAry[23];
		String  total = empDataAry[24];
		String monthYear=empDataAry[25];
	
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Date tempDate=simpleDateFormat.parse(monthYear);
	    System.out.println("tempdate.."+tempDate);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
	    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
	    String monthdate1=outputDateFormat.format(tempDate);
			 System.out.println(" monthdate1.."+monthdate1); 
			 
		
		String[] date1=monthdate1.split("/");
		System.out.println("day=="+date1[0]);
		System.out.println("month=="+date1[1]);
		System.out.println("year=="+date1[2]);
		
		

%>


<body style="margin-top:10%">
<!-- <div id="lrmain1"> -->

<%-- <br>
<div style="float:left" id="hidestatus">
<%
	java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MMM/yyyy");
	%> 
	Month  : <select name="monthList" id="month" style="background-color: white;color:black; width:30%;height:20%">
									<option value="none selected">select month</option>
									<option value="JAN">JAN</option>
									<option value="FEB">FEB</option>
									<option value="MAR">MAR</option>
									<option value="APR">APR</option>
									<option value="MAY">MAY</option>
									<option value="JUN">JUN</option>
									<option value="JUL">JUL</option>
									<option value="AUG">AUG</option>
									<option value="SEP">SEP</option>
									<option value="OCT">OCT</option>
									<option value="NOV">NOV</option>
									<option value="DEC">DEC</option>
							</select>
						
					<% String var1=df.format(new java.util.Date());
						String[] date=var1.split("/");
						//out.println("year======="+date[2]);
					%>
		Year : <input  id="year"  name="year" value="<%=date[2] %>"  style="background-color: white;color:black; width:15%;height:12%"  readonly="readonly"/>
		 <br> 
					<input type="button" value="Display" id="qryBtn" onclick="openPage(id)" style="color:black; width:20%;height:20%"/>
								<a onclick="javascript:window.print();" title="print" id="wp">
	            <input type="button" value="Print" id="print"  /> </a>
			
</div> --%>
<table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left; margin-top:2%;">
  <tr class="headind">   
  <td>
     <div>	    
	            <img id="imglogo" src="images/clocksoftlogo.jpg" style="height: 106px;    width: 147px;    float: left;    padding: 5px;" />
	          <!--   </a> -->
     </div> 
     <div>
    	 <center><H2>NALI CLOCK SOFTWARE SOLUTIONS PVT.LTD.</H2></center>
     </div>
	 <div >
	    <center style="font-size:12px">308/287,2ND FLOOR,NEAR INFOSYS, HOSUR MAIN ROAD,ELECTRONIC CITY,BANGALORE
	    560100</center>
	 
	     <center>Payslip for the month of <%=date1[1] %>-<%=date1[2] %></center>
	 </div>   
     
</td>
  </tr>
  </table>
   <center>
  <table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left;"  class = "tableStyle1">
  <tr>
   <!--  <td class="headind_1"> -->
   <td> NAME : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:135%" value="<%=name %>&nbsp;[<%=empid  %>] " readonly="readonly"></input></td>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date Of Joining :</td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:75%;" value="<%=doj  %>" readonly="readonly"></input></td>
   </tr>
   
   <tr>
   <td> DESIGNATION : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:60%;" value="<%=designation  %>" readonly="readonly"></input></td>
   <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank Name : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:55%;" value="<%=bname  %>" readonly="readonly"></input></td>
   </tr>
 
 <tr>
 <td> DEPARTMENT : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:50%;" value="<%= dept %>" readonly="readonly"></input></td>
 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank Account No : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=accno %>" readonly="readonly"></input></td>
 </tr>
 
  <tr>
  <td> LOCATION : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:60%;" value="<%=loc  %>" readonly="readonly"></input>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Effective Work Days :</td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=eff_days  %>" readonly="readonly"></input></td>
  </tr>
  
  <tr>
   <td> PAN NO : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=pan  %>" readonly="readonly"></input></td>
   <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Days in Month : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value="<%=days_mon  %>" readonly="readonly"></input></td>
  </tr>
  
  <tr>
  <td>PF NO : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:50%;" value="<%=pfno %>" readonly="readonly"></input></td>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOP : </td><td><input  name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:45%;" value=<%=lop %> readonly="readonly"></input></td>
  </tr>
  
  </table>
   </center>

  <table style="background-color:#FFFFFF; width:49.96%; border:1; cellpadding:0px;float:left;" class = "tableStyle2">
 <tr>
   <!--  <th scope="col">Earning<th>Full</th><th>Actual</th>  -->
    <th scope="col">Earning<th>Actual</th> 
  </tr> 
  <tr>
    <td>BASIC</td>
    <td><%= basic %></td>
    <!-- <td>4000</td> -->
  </tr>
  <tr>
    <td>HRA</td>
    <td><%=hra  %></td>
    <!-- <td>1600</td> -->
  </tr>
  <tr>
    <td>CONVEYANCE</td>
    <td><%=covey %></td>
    <!-- <td>1600</td> -->
  </tr>
  <tr>
    <td>LTA</td>
    <td><%=lta  %></td>
 <!--    <td>333</td> -->
  </tr>
  <tr>
    <td>MEDICAL ALLOWANCE</td>
    <td><%=medical  %></td>
    <!-- <td>1250</td> -->
  </tr>
  <tr>
    <td>SPECIAL ALLOWANCE</td>
    <td><%=special  %></td>
    <!-- <td>4070</td> -->

  </tr>

 <!-- <tr>
    <td>Total Earnings: Rs. </td>
    <td>12852.998599</td>
    <td>12853</td>

  </tr> -->
  
</table>


<TABLE style="background-color:#FFFFFF; width:50.00%; border:1; cellpadding:0px;float:left;" class = "tableStyle3">
<TR><th scope="col">Deduction<th>Actual</th></TR>
<TR><td>PF</td>
    <td><%=pf  %></td>
    </TR>
    <TR>
    <td>ESI</td>
    <td><%=esi  %></td>
    </TR>
    <TR>
     <td>GRATUITY</td>
    <td><%=gratuty %></td>
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
    <td><%=tot_ear %></td>
    <!--  <td>12853</td> -->
    </TR>
</TABLE>

  <TABLE style="background-color:#FFFFFF; width:50.00%; border:1; cellpadding:0px;float:left;margin-top: -0.19%;" class = "tableStyle5">
<TR><td>Total Deductions: Rs. </td>
    <td><%= tot_ded %></td>
    </TR>
</TABLE> 
  
  
  <table style="background-color:#FFFFFF; width:100%; border:1; cellpadding:0px;float:left;" class = "tableStyle6">
  
 <!--  <tr class="headind"> -->
  
     <th>
    Net Pay for the month ( Total Earnings - Total Deductions) : 
    <input type="text" name="basepay" id="basepay" style="background-color: #FFFFFF;border:0px;width:15%;" value="<%=total  %>" readonly="readonly"></input><BR>
   <BR>
    
     </th> 
  
  </tr>
  </table><br>
 <%
 
	}
}
 %>

<!-- </div> -->

</body>
</html>



