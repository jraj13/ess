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


   <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>

<script>
	
	$(function() {
		$('#submit').click(
				function() {
		//	alert("Am In Btn Click bank details insert");
					
					var empid = $('#empid').val();
					var ename = $('#ename').val();
					var desing = $('#desing').val();
					var dept = $('#dept').val();
					var loc = $('#loc').val();
					var doj = $('#doj').val();
					var panno = $('#panno').val();
					var bankname = $('#bankname').val();
					var acntno=$('#acntno').val();
					var pfno=$('#pfno').val();
					
					if(desing.toString() == ""){
						 alert("Please Enter Employee Designation");
						 window.setTimeout(function ()
								    {
							document.getElementById('desing').focus();
								    }, 0);
							document.getElementById('desing').value="";
								    return false;
					  }
					if(dept.toString() == ""){
						  alert("Please Enter Department Name");
						  window.setTimeout(function ()
								    {
							document.getElementById('employeeid').focus();
								    }, 0);
							document.getElementById('employeeid').value="";
								    return false;
					  } if(loc.toString() == ""){
						  alert("Please Enter A Types Of Leave");
						  window.setTimeout(function ()
								    {
							document.getElementById('employeeid').focus();
								    }, 0);
							document.getElementById('employeeid').value="";
								    return false;
					  }
					  if(bankname=="")
						{
							alert("Please Enter Bank Name");
							window.setTimeout(function ()
								    {
							document.getElementById('bankname').focus();
								    }, 0);
							document.getElementById('bankname').value="";
								    return false;
						}
						if(acntno.toString() == ""){
							 alert("Please Enter Account No");
							 window.setTimeout(function ()
									    {
								document.getElementById('acntno').focus();
									    }, 0);
								document.getElementById('acntno').value="";
									    return false;

						  }
						if(pfno.toString() == ""){
							 alert("Please Enter PF No");
							 window.setTimeout(function ()
									    {
								document.getElementById('pfno').focus();
									    }, 0);
								document.getElementById('pfno').value="";
									    return false;

						  }
						
				
					else{
					
					var dataString = "&empid=" + empid + "&ename=" + ename
							+ "&desing=" + desing + "&dept=" + dept + "&loc="
							+ loc + "&doj=" + doj + "&panno=" + panno
							+ "&bankname=" + bankname+ "&acntno=" + acntno+ "&pfno=" + pfno;
					
				//	alert(dataString);
					$.ajax({

						url : 'postLoginJsp/ADMINController/bankInfoUpdateSuccess.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							//alert("successfully Save Bank info");

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
<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">Bank Detail Updation form </h2>
<table style="width:80%">
							
							<%
								ArrayList<String> pay_run = PayRollBasicInfo.getEmpBankInfo();
								if (pay_run.size() > 0) {
									for (int i = 0; i < pay_run.size(); i++) {
										String req = pay_run.get(i).toString();
										String reqarr[] = req.split("\\^");
										
									 String empid = reqarr[0];
									 
										String f_name = reqarr[1];
										String l_name = reqarr[2];
										String joiningDate = reqarr[3];
										String empDob = reqarr[4];
										String empDesig = reqarr[5];
										String empEmail = reqarr[6];
										String repManager = reqarr[7];
										String empCtc = reqarr[8];
										String panNo = reqarr[9];
										
							%>
							<%
								ArrayList<String> pay_run1 = PayRollBasicInfo.getEmpBankInfoUpdate();
								if (pay_run1.size() > 0) {
									for (int J = 0; J < pay_run1.size(); J++) {
										String req1 = pay_run1.get(J).toString();
										String reqarr1[] = req1.split("\\^");
										
										String DEPT = reqarr1[0];
										String LOC = reqarr1[1];
										String BANK_NAME = reqarr1[2];
										String ACC_NO = reqarr1[3];
										String PF_NO = reqarr1[4];	
										
							%>
							
							
	<tr>
<td><label>EMPLOYEE ID</label></td>
<td><input type="text"  name="empid" value="<%=empid%>" id="empid"  style="background-color: white;color:black"  readonly="readonly"/></td>
</tr>

<tr>
<td><label>EMPLOYEE NAME</label></td>
<td><input type="text" name="ename" value="<%=f_name%>&nbsp;<%=l_name%>" id="ename"  style="background-color: white;color:black" readonly="readonly"/></td>
</tr>

<tr>
<td><label>DESIGNATION</label></td>
<td><input type="text" class="" name="design" value="<%=empDesig %>" id="desing"  style="background-color: white;color:black" readonly="readonly"/></td>
</tr>

<tr>
<td><label>DEPARTMENT</label><span style="color:red">*</span></td>
<td><input type="text" name="dept" value="<%=DEPT %>" id="dept"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>LOCATION</label><span style="color:red">*</span></td>
<td><input type="text" name="loc" value="<%=LOC %>" id="loc"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DOJ</label></td>
<td><input type="text" name="doj" value="<%=joiningDate %>" id="doj"  style="background-color: white;color:black" readonly="readonly"/></td>
</tr>

<tr>
<td><label>PAN NO</label></td>
<td><input type="text" name="panno" value="<%=panNo %>" id="panno"  style="background-color: white;color:black" readonly="readonly"/></td>
</tr>

<tr>
<td><label>BANK NAME </label><span style="color:red">*</span></td>
<td><input type="text" name="bankname" value="<%=BANK_NAME %>" id="bankname"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>ACCOUNT NO</label><span style="color:red">*</span></td>
<td><input type="text" name="acntno" value="<%=ACC_NO %>" id="acntno"   style="background-color: white;color:black" onchange= "return acntValidation()" /></td>
</tr>

<tr>
<td><label>PF NO</label><span style="color:red">*</span></td>
<td><input type="text" name="pfno" value="<%=PF_NO %>" id="pfno"   style="background-color: white;color:black"/></td>
</tr>


								
					
								<%
								}
								}
								
									}}
								
								else {
							%>
							<tr>
								<td colspan="14">No Records</td>
							</tr>

							<%
								}
							%>
							
						</table>
<br/>
<!-- <center> <input id="payslip" type="button" value="Generate Payslip"/></center> -->
<center></center><input type="button" value="Update Save" id="submit"/></center>

</div><br>
&nbsp;<br>
Note&nbsp;<span style="color:red">*</span> : Only you can update this(*) fields.
</body>
</html>