
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <%@page import="com.ess.common.action.ExpenseEntryAction"%> --%>
    <%@page import="com.ess.common.action.ExpenseEntryAction" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function isamt(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("eamnt").value;
        var len = document.getElementById("eamnt").value.length; 
        var index = document.getElementById("eamnt").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 3) { 

                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >2) {
   return false;
   }

    } 
    return true; 
 } 		
</script>
<script>
$(function() {
	$('#expquery').click(
			function() {
				var ctype=$('#ctype').val();
				alert(ctype);
				var bnum=$('#bill_num').val();
				var bdate=$('#bill_date').val();
				var eamount=$('#eamnt').val();
				var remarks=$('#remarks').val();
				var empid=$('#empid').val();
			
				if (ctype == "none selected") {
					alert("Please Select claim type ! ");
					return false;
				}else if(bnum == "") {
				alert("Please fill Bill number ! ");
				return false;
				}else if (bdate == "") {
				alert("Please fill bill date ! ");
				return false;
				}else if (eamount == "") {
				alert("Please fill expense amount ! ");
				return false;
				}
				
				else{
				
				
				  var dataString = '&ctype=' + ctype + '&bnum=' + bnum + '&bdate=' + bdate + '&eamount=' + eamount + '&remarks=' +remarks;
		alert(dataString);
				$.ajax({

					url :'postLoginJsp/Benifits_Payments/expense_entry_success11.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {

						//alert("Expense Entry successfully inserted ");
							/* $('#lrmain').html(data).delay(5000).fadeOut(); */
						$('#lrmain').html(data);

					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
				}

			})
});

/* jQuery(function(){
	alert("call add row");
    var counter = 1;
    jQuery('a.add-author').click(function(event){
        event.preventDefault();
        counter++;
        var newRow = jQuery('<tr><td><input type="text" name="ctype' +
            counter + '"/></td><td><input type="text" name="bill_num' +
            counter + '"/></td><td><input type="date" name="bill_date' +
            counter + '"/></td><td><input type="text" name="eamnt' +
            counter + '"/></td><td><input type="text" name="remarks' +
            counter + '"/></td></tr>');
        jQuery('table.authors-list').append(newRow);
    });
});
 */

	$(document).ready(function () {
        $('#btnAdd').click(function () {
           $('#FirstRow').clone().appendTo('.authors-list');
        });
    });
    
/*  $(".del_ExpenseRow").live("click", function(){ 
	    $('#FirstRow').closest('tr').remove();
	    $lastChar = $lastChar-2;
	}); */
	
	$('.authors-list').on('click', 'input[type="button"]', function () {
	    $(this).closest('tr').remove();
	})
	

</script>

</head>

<body>

 <div id="lrmain" style="height: 150px;margin-top:130px">

<div style="background-color: #B0C4DE;margin-top:10px;margin-left:-5.5%;padding-left:15px ">Expense Entry</div>
<div style="background-color: #B0C4DE;margin-top:5px;margin-left:-5.5%;padding-left:15px ">Employee Details</div>
<div style="background-color: #B0C4DE;margin-top:5px;margin-left:-3.5%;padding-left:15px;width:90%; ">Employee Information</div>
 <div style="background-color: #dfecf5;margin-top:3px;margin-left:-3.5%;padding-left:15px ;width:90%;"> 
<!-- <table style="background-color:#dfecf5;width:40%; border:1; cellpadding:0px;margin-left:-3.5%"> -->
					
								<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%> 
								<!-- out.println("today date;.."+df.format(new java.util.Date())); -->
								
					<% String var1=df.format(new java.util.Date());
					String[] date=var1.split("/");
					//out.println("year======="+date[2]);
						%>
&nbsp;&nbsp;Year : <input type="text" id="year" size="5"  name="year" value="<%=date[2] %>"  style="background-color: #dfecf5;color:black; width:7%;height:20%"  readonly="readonly">
					
Period From : <input type="text" value="01/04/<%=date[2] %>"  style="background-color: #dfecf5;color:black; width:12%;height:20%" readonly="readonly"/>&nbsp;  To: <input type="text" value="31/03/2016"  style="background-color: #dfecf5;color:black; width:12%;height:20%" readonly="readonly"/><br>
 </div> <!-- </table> --><br>

<div style="background-color: #B0C4DE;margin-top:5px;margin-left:-5.5%;padding-left:15px ">Expense Entry Sheet</div>

<!-- <div style="height:1000px;width:750px:bg-color:#40e0d0;margin-top:2%"> -->

<form method="post">

<div style="background-color: #B0C4DE;margin-top:3px;margin-left:-3.5%;padding-left:15px; width:90% ">Expense Entry</div>
 <table  class="authors-list" style="background-color:#dfecf5; width:90%; border:1; cellpadding:0px;margin-left:-3.5%"> 

  <tr class="headind">
    <th>Claim Type</th>
    <th>Bill No</th>
    <th>Bill Date</th>
    <th>Expense Amount</th>
     <th>Remarks</th>
     <th>&nbsp;</th>
  </tr> 
  
   <tr id="FirstRow">
    <td class="headind_1"><select name="ctype" id="ctype" style="background-color: white;color:black; width:100.5%;height:112%">
									<option value="none selected">SELECT CLAIM TYPE</option>
									<option value="CHILDREN EDUCATION EXPENSES">CHILDREN EDUCATION EXPENSES</option>
									<option value="FUEL AND MAINTENANCE EXPENSES">FUEL AND MAINTENANCE EXPENSES</option>
									<option value="CHILDREN HOSTEL EXPENSE">CHILDREN HOSTEL EXPENSE</option>
									<option value="MEDICAL EXPENSES">MEDICAL EXPENSES</option>
									<option value="OWA EXPENSES">OWA EXPENSES</option>
									<option value="OWA MAINTENANCE **">OWA MAINTENANCE **</option>
								
							</select></td>
    <td class="headind_1"><input type="text" name="bill_num" id="bill_num" style="background-color: white;border:0px;" value="" ></input></td>
    <td><input type="date" name="bill_date" id="bill_date" style="background-color: white;border:0px;" value=""></input></td>
    <td class="headind_1"><input type="text" name="eamnt" id="eamnt" style="background-color: white;border:0px;" value="" onkeypress="return isamt(event)"></input></td>
     <td><input type="text" name="remarks" id="remarks" style="background-color: white;border:0px;" value="" ></input></td>
	  <td><input type='button' value='Delete' class='del_ExpenseRow' /></td>
  </tr> 
<!--   
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><input type="text"  id="basic" style="background-color: #dfecf5;border:0px;" value=" " readonly="readonly"></input></td>
    <td>&nbsp;</td>
     <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><input type="text"  id="basepay" style="background-color: #dfecf5;border:0px;" value=" " readonly="readonly"></input></td>
    <td>&nbsp;</td>
     <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><input type="text"  id="pli" style="background-color: #dfecf5;border:0px;" value="" readonly="readonly"></input></td>
    <td>&nbsp;</td>
     <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><input type="text" name="value" id="value" style="background-color: #dfecf5;border:0px;" value=" " readonly="readonly"></input></td>
    <td>&nbsp;</td>   
     <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
   <tr>
    <td></td>
    <td>&nbsp;</td>
    <td><input type="text"  id="spa" style="background-color: #dfecf5;border:0px;" value="" readonly="readonly"></input> </td>
    <td>&nbsp;</td>
     <td>&nbsp;&nbsp;&nbsp;</td>
  </tr> -->
  
 
 </table> 
<%

String empid=(String)session.getAttribute("empid");
System.out.println("empid for expense entry===="+empid);
%>

<input type="hidden" name="empid" id="empid" value="<%=empid %>" />

<center>
<input id="expquery" type="button"  value="Submit" onclick="ExpEntry(id)"></input>
<input id="clear" type="RESET"  value="Clear"></input>
<!--  <input id="submit" type="button"  value="Add"/>  -->
<!--  <a href="#" title="" class="add-author"><input type="button" value="Add New Row" /></a>  -->
   <a href="#" id="btnAdd"><input type="button" value="Add New Row" /></a>
<!-- <input id="expquery" type="button"  value="Save" onclick="ExpEntry(id)"></input> -->

<!-- <a href="#"  class="add-author1" onclick="deleteRow(this)"><input type="button" value="Delete Row" /></a> -->
<!-- <input id="submit" type="button"  value="Delete"/>  -->
</center>
</form>


<!--  </div>  -->
<!--   <div id="lip"></div> -->

<%
String leareq1 = ExpenseEntryAction.getLeaveDaysPaternity1();
System.out.println(leareq1);
if(leareq1==null)
{
	leareq1="0.00";
}
String leareq2 = ExpenseEntryAction.getLeaveDaysPaternity2();
if(leareq2==null)
{
leareq2="0.00";
}
String leareq3 = ExpenseEntryAction.getLeaveDaysPaternity3();
if(leareq3==null)
{
leareq3="0.00";
}
String leareq4 = ExpenseEntryAction.getLeaveDaysPaternity4();
if(leareq4==null)
{
leareq4="0.00";
}
String leareq5 = ExpenseEntryAction.getLeaveDaysPaternity5();
if(leareq5==null)
{
leareq5="0.00";
}
String leareq6 = ExpenseEntryAction.getLeaveDaysPaternity6();
if(leareq6==null)
{
leareq6="0.00";
}

%>
		



<div style="background-color: #B0C4DE;margin-top:5px;margin-left:-5.5%;padding-left:15px ">Summary Details</div>

<div style="background-color: #B0C4DE;margin-top:5px;margin-left:-3.5%;padding-left:15px; width:40%; ">Summary</div>
<!-- <div style="background-color: #dfecf5;margin-top:3px;margin-left:-3.5%;padding-left:15px; width:40%;cellpadding:0px; "> -->
<table style="background-color:#dfecf5;width:40%; border:1; cellpadding:0px;margin-left:-3.5%">
  <tr>
  <td class="headind" >Children Education Expenses:</td>
  <td class="headind"><input id="education" type="text" name="education" value="<%=leareq1 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind" >Fuel & Maintenance Expenses:</td>
  <td class="headind"><input id="fuel" type="text" name="fuel" value="<%=leareq2 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
<td class="headind" >Children Hostel Expenses:</td>
  <td class="headind"><input id="hostel" type="text" name="hostel" value="<%=leareq3 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind">Medical Expenses:&nbsp;&nbsp;&nbsp;</td>
  <td class="headind"><input id="medical" type="text" name="medical" value="<%=leareq4 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind" >OWA Expenses:</td>
  <td class="headind"><input id="own" type="text" name="own"  value="<%=leareq5 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind">OWA Maintenance**</td>
  <td><input type="text" id="own1" name="ownmain" value="<%=leareq6 %>" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr> 
</table>

</div>
</body>
</html>