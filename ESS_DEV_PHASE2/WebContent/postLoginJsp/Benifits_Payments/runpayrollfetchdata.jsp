<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.PayRollBasicInfo"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script>
function iseffective(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("eff_days").value;
        var len = document.getElementById("eff_days").value.length; 
        var index = document.getElementById("eff_days").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 
   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }

    } 
    return true; 
 } 
</script>

<script>
function isattdays(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("att_days").value;
        var len = document.getElementById("att_days").value.length; 
        var index = document.getElementById("att_days").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 
                return false; 
            } 
   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }

    } 
    return true; 
 } 

</script>

<script>
function isleaves(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("leave_days").value;
        var len = document.getElementById("leave_days").value.length; 
        var index = document.getElementById("leave_days").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 
   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }

    } 
    return true; 
 } 

</script>

<script>
function islop(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("lop_days").value;
        var len = document.getElementById("lop_days").value.length; 
        var index = document.getElementById("lop_days").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }

    } 
    return true; 
 } 

</script>

<script>

$(function() {
	$('#payslip').click(
			function() {
				
				var eff_days = $('#eff_days').val();
				var att_days = $('#att_days').val();
				var leave_days = $('#leave_days').val();
				var lop_days = $('#lop_days').val();
				
				var empid = $('#empid').val();
				var month = $('#month').val();
				var year = $('#year').val();
				
				var tot_days = $('#tot_days').val();
				
				var bank = $('#bank').val();
				var accno = $('#accno').val();
				
				if(bank=="null" && accno=="null" )
				{
				alert("Please Enter Bank Details");
				return false;
				}
				if(bank=="" && accno=="" )
				{
				alert("Please Enter Bank Detail");
				return false;
				}
				
				if(eff_days=="" && att_days=="" && leave_days=="" &&lop_days=="")
				{
				alert("Please Enter All Feilds");
				return false;
				}
				
				if(parseFloat(eff_days)!=(parseFloat(att_days)+parseFloat(leave_days)+parseFloat(lop_days)))
				{
				alert("Effective days is must be equal to Attandance days,leaves days and LOP");
				return false;
				}
			
				else{
					var dataString = "&eff_days=" + eff_days + "&att_days=" + att_days
							+ "&leave_days=" + leave_days + "&lop_days=" + lop_days
							+ "&empid=" + empid + "&month=" + month+ "&year=" + year+ "&tot_days=" + tot_days;
					alert(dataString);
			
					$.ajax({

						url : 'postLoginJsp/ADMINController/runpayrollSuccess.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							//alert("successfully payslip generated");

							$('#lrmain').html(data).delay(5000).fadeOut();

						},
						error : function(jqXHR, textStatus, errorThrown) {

						}
					});
					
					}

				})
	});
</script>
<body>
<div id="lrmain">
<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">PayRoll Month Information </h2>
<table style="width:80%">
							
							<%
								ArrayList<String> pay_run = PayRollBasicInfo.getPayrollInfo();
								if (pay_run.size() > 0) {
									for (int i = 0; i < pay_run.size(); i++) {
										String req = pay_run.get(i).toString();
										String reqarr[] = req.split("\\^");
										
									 String empid = reqarr[0];
									 String month = reqarr[1];
									 String year = reqarr[2];
									 
										String f_name = reqarr[3];
										String l_name = reqarr[4];
										String tot_days = reqarr[5];
										String eff_days = reqarr[6];
										String att_days = reqarr[7];
										String leave_days = reqarr[8];
										String lop_days = reqarr[9];
										
										String bankname = reqarr[10];
										String accno = reqarr[11];
										
										
							%>
							<input type="hidden" id="month" value="<%=month%>"/>
								<input type="hidden" id="year" value="<%=year%>"/>
							<tr align="center">
								<td>EMPLOYEE ID </td> 
								<td><input type="text" id="empid" value="<%=empid%>" readonly="readonly"/></td>
								
								<tr align="center">
								<td>EMPLOYEE NAME</td>
								<td><input type="text" id="empid" value="<%=f_name%><%=l_name%>" readonly="readonly"/></td>
								</tr>
								
								<tr align="center">
								<td>BANK NAME </td> 
								<td><input type="text" id="bank" value="<%=bankname%>" readonly="readonly"/></td>
								<tr align="center">
								<td>ACCOUNT NUMBER </td> 
								<td><input type="text" id="accno" value="<%=accno%>" readonly="readonly"/></td>
								
								
								<tr align="center">
									<td>TOTAL DAYS</td>
								<td><input type="text" id="tot_days" value="<%=tot_days%>" readonly="readonly"/></td>
								</tr>
								<tr align="center">
								<td>EFFECTIVE DAYS</td>
								
								<td><input type="text" id="eff_days" value="<%=eff_days%>" onkeypress="return iseffective(event)"/></td>
								</tr>
								<tr align="center">
								<td>ATTENDANCE DAYS</td>
								<td><input type="text" id="att_days" value="<%=att_days%>" onkeypress="return isattdays(event)"/></td>
								</tr>
								<tr align="center">
								<td>LEAVE DAYS</td>
								<td><input type="text" id="leave_days" value="<%=leave_days%>" onkeypress="return isleaves(event)"/></td>
								</tr>
								<tr align="center">
								<td>LOP DAYS</td>
								<td><input type="text" id="lop_days" value="<%=lop_days%>" onkeypress="return islop(event)"/></td>
								</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="14">No Records</td>
							</tr>

							<%
								}
							%>
						</table>
<br/>
<center> <input id="payslip" type="button" value="Generate Payslip"/></center>

</div>
</body>
</html>