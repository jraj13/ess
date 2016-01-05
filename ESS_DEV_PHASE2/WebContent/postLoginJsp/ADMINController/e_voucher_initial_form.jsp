
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@page import="com.ess.common.action.PayRollBasicInfo"%> 

<%@ page import="java.lang.*,java.util.*"%>

 <%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#evoucher_ftable {
	border-spacing: 0px;
	border-style: none;
	border: 0;
	font-size: 13px;
	
}

#evoucher_ftable  td {
	border-spacing: 0px;
	border-style: none;
	border: 0;
	font-size: 13px;
	padding-left: 10px;
}

</style>


<script type="text/javascript" src="regjs/fandfscript.js"></script>

<script>
function validation(){
	var paid_to_name= $("#paid_to_name").val();
	var reason_paid_amount= $("#reason_paid_amount").val();
	
	var cash_cheque_no= $("#cash_cheque_no").val();
	var cash_cheque_amount= $("#cash_cheque_amount").val();
	var date= $("#date").val();
	
	if(paid_to_name=="" || paid_to_name==null)
		{
		
		alert("Please enter paid to field ");
		window.setTimeout(function ()
			    {
		document.getElementById('paid_to_name').focus();
			    }, 0);
		return false;
		}
	if(reason_paid_amount=="" || reason_paid_amount==null)
	{
	
	alert("Please enter reason to paid amount field ");
	window.setTimeout(function ()
		    {
	document.getElementById('reason_paid_amount').focus();
		    }, 0);
	document.getElementById('reason_paid_amount').value="";
	return false;
	}
	
	var radio_value=($('input[name="check"]:checked').val());
	//alert(radio_value);
	
	if(radio_value=="Cheque" && (cash_cheque_no=="" || cash_cheque_no==null))
	{
		alert("Please enter cheque no ");
		window.setTimeout(function ()
			    {
		document.getElementById('cash_cheque_no').focus();
			    }, 0);
		return false;
		} 
	
	/* if(cash_cheque_no=="" || cash_cheque_no==null)
	{
	
	alert("Please enter cheque or cash no field ");
	window.setTimeout(function ()
		    {
	document.getElementById('cash_cheque_no').focus();
		    }, 0);
	return false;
	} */
	
	if(cash_cheque_amount=="" || cash_cheque_amount==null)
	{
	
	alert("Please enter amount field ");
	window.setTimeout(function ()
		    {
	document.getElementById('cash_cheque_amount').focus();
		    }, 0);
	return false;
	}
	
	if(date=="" || date==null)
	{
	
	alert("Please enter date field ");
	window.setTimeout(function ()
		    {
	document.getElementById('date').focus();
		    }, 0);
	return false;
	}

	else
		{
		
		return true;
		}
}


</script>
<script>
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    var maxDate = year + '-' + month + '-' + day;
   // alert(maxDate);
    $('#date').attr('max', maxDate);
    
});
</script>
</head>
<body>

<form action="voucher_report" method="post"  onsubmit="return validation();">
<%
String loginid = (String) session.getAttribute("loginid");

%>
<h2 style="background-color: #00CED1;margin-left:-4%;margin-top:-3%;padding-left:10px"><b>Cash / Voucher</b></h2>
						
	<br>
	 <input type="hidden" id="prepared_by"  name="prepared_by" value="<%=loginid %>" > 
	
	<table id="evoucher_ftable">
	
	<tr>
	<td>Paid To(Full Name) :</td>
	<td><input type="text" id="paid_to_name" name="paid_to_name"  onchange="verifyna1()"></td>
	</tr>
	
	<tr>
	<td>Reason to Pay :</td>
	<td><input type="text" id="reason_paid_amount" name="reason_paid_amount"onchange="verifyna2()" ></td>
	</tr>
	
	<tr>
	<td>Payment Type :</td>
	<td><input type="radio"  name="check" value="Cash" id="check" />Cash&nbsp;
	<input type="radio"  name="check" value="Cheque" id="check"  />Cheque</td>
	</tr>
	
	<tr>
	<!-- <td>Cash/Cheque No. :</td> -->
	<td>Cheque No. :</td>
	<!-- <td><input type="text" id="cash_cheque_no"   name="cash_cheque_no"   onkeypress="javascript:return isNumber (event)"></td> -->
	<td><input type="text" id="cash_cheque_no"   name="cash_cheque_no" onkeypress="return isNumber_check(event)"  ></td>
	</tr>
	
	<tr>
	<td>Amount :</td>
	<!-- <td><input type="text" id="cash_cheque_amount" name="cash_cheque_amount" onkeypress="return amount(event);"></td> -->
	<td><input type="text" id="cash_cheque_amount" name="cash_cheque_amount" onkeypress="return amount_check(event);"></td>
	</tr>
	
	<tr>
	<td>Date</td>
	<td><input type="date" id="date" name="date"></td>
	</tr>
	
	<tr>
	<td><input type="submit" value="Save and Download "  ></input></td>
	<td>&nbsp;</td>
	</tr>
	</table>
	<br>
	&nbsp;


</form>



</body>
</html>










<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ess.common.action.PayRollBasicInfo"%>

<%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#evoucher_ftable {
	border-spacing: 0px;
	border-style: none;
	border: 0;
	font-size: 13px;
	
}

#evoucher_ftable  td {
	border-spacing: 0px;
	border-style: none;
	border: 0;
	font-size: 13px;
	padding-left: 10px;
}

</style>


<script type="text/javascript" src="regjs/fandfscript.js"></script>

<script>
$(function(){
	$("#voucher_cash_entry_btn").click(function(){
		
		var paid_to_name = $('#paid_to_name').val();
		/* 
		if(paid_to_name=="" ||paid_to_name==null){
			alert("Please Enter name");
			$('#paid_to_name').focus();
			return false;
		} */
		var reason_paid_amount= $('#reason_paid_amount').val();
		/* if(reason_paid_amount=="" ||reason_paid_amount==null){
			alert("Please Enter reason to pay ");
			$('#reason_paid_amount').focus();
			return false;
		} */
		var payment_type = $('input[name=check]:checked').val();
		 if(payment_type=="undefined" ||payment_type==null){
				alert("Please select payment type !");
				$('#check').focus();
				return false;
			}
		 
			var cash_cheque_no= $('#cash_cheque_no').val();
			if(cash_cheque_no=="" ||cash_cheque_no==null){
				alert("Please Enter cash/check no. ");
				$('#cash_cheque_no').focus();
				return false;
			}
			
		var cash_cheque_amount= $('#cash_cheque_amount').val();
		if(cash_cheque_amount=="" ||cash_cheque_amount==null){
			alert("Please Enter payment detail ");
			$('#cash_cheque_amount').focus();
			return false;
		}
		
		var sysdate = $('#sysdate').val();
		var prepared_by = $('#prepared_by').val();
		
		var date = $('#date').val();
		if(date=="" ||date==null){
			alert("Please Enter date ");
			$('#date').focus();
			return false;
		}
		
		
		
		else{
			
		var result_data="&paid_to_name=" + paid_to_name+ "&reason_paid_amount=" + reason_paid_amount+ "&payment_type=" +payment_type+ 
						"&cash_cheque_no="+cash_cheque_no +"&cash_cheque_amount=" + cash_cheque_amount + 
						"&date=" + date + "&sysdate="+sysdate + "&prepared_by="+prepared_by;
		
		//alert(result_data);
		$.ajax({
			url : 'postLoginJsp/ADMINController/e_voucher_insert.jsp',
			type : 'POST',
			data : result_data,
			datatype : 'json',
			success : function(data) {
				/* $("#e_voucher_success").html(data).delay(2000).fadeOut(); */
				$("#e_voucher_success").html(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Please try Again");
			}
		});
			} 
		
	})
})


</script>
</head>
<body>
<div id="e_voucher_success">



<%
String loginid = (String) session.getAttribute("loginid");

%>
<!-- <div id="atndtable" style="height: 150px;margin-top:100px"> -->
<div id="atndtable" >
						
<h2 style="background-color: #00CED1;margin-left:-4%;margin-top:-3%;padding-left:10px"><b>Cash / Voucher</b></h2>
		Vr.No : <input type="text" value=""  style="background-color: white;color:black; width:9.5%;height:22%;" />			<br>	
		<%
				java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
			%> 
	Today Date : <input type="text" value="<%=df.format(new java.util.Date())%>"  style="background-color: white;color:black; width:9.5%;height:2%;" /> 
							<br/> 
							
						
	</div>
	<br>
	<table id="evoucher_ftable">
	
	 	<%
			java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		%> 
	 <input type="hidden" id="sysdate" value="<%=df.format(new java.util.Date())%>"  /> 
	 <input type="hidden" id="prepared_by" value="<%=loginid %>" > 
							
	<tr>
	<td>Paid To(Full Name) :</td>
	<td><input type="text" id="paid_to_name"></td>
	</tr>
	
	<tr>
	<td>Reason to Pay :</td>
	<td><input type="text" id="reason_paid_amount" ></td>
	</tr>
	
	<tr>
	<td>Payment Type :</td>
	<td><input type="radio"  name="check" value="Cash" id="check" />Cash&nbsp;<input type="radio"  name="check" value="Cheque" id="check" />Cheque</td>
	</tr>
	
	<tr>
	<td>Cash/Cheque No. :</td>
	<td><input type="text" id="cash_cheque_no" onkeypress="javascript:return isNumber (event)"></td>
	</tr>
	
	<tr>
	<td>Amount :</td>
	<td><input type="text" id="cash_cheque_amount" onkeypress="return amount(event);"></td>
	</tr>
	
	<tr>
	<td>Date</td>
	<td><input type="date" id="date"></td>
	</tr>
	
	<tr>
	<td><input type="button" value="Save" id="voucher_cash_entry_btn" ></input></td>
	<td>&nbsp;</td>
	</tr>
	</table>
	<br>
	&nbsp;

<div id="qrySuccess">

</div>


</div>
</body>
</html>
 --%>