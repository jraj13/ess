

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--  <%@page import="com.ess.common.action.ExpenseEntryAction"%> --%>
<%@page import="com.ess.common.action.ExpenseEntryAction"%>
  <%@ page import="com.ess.common.util.MonthandyearDecide" %>

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
 function checkdate()
{
	 //alert("hai");
	 var val = firstCell.find('INPUT').val();
	 alert(val); 
	 var today = new Date().toISOString().split('T')[0];
		//alert(today);

 var start = document.getElementById("bill_date").value;

 var stDate = new Date(start);
 var enDate = new Date(today);
 var compDate = enDate - stDate;
	//alert(compDate)
 if(compDate >= 0)
 return true;
 else
 {
 alert("Please Enter the correct date ");
 return false;
 }

 
}
 
 
</script>
<script>
 function checking(){
	 var today = new Date().toISOString().split('T')[0];
	 //alert(today);
	 var selectdate=document.getElementById('bill_date1').value;
	 alert(selectdate);
	 var stDate = new Date(selectdate);
	 var enDate = new Date(today);
	 var compDate = enDate - stDate;
		alert(compDate)
	 if(compDate >= 0)
	 return true;
	 else
	 {
	 alert("Please Enter the correct date ");
	 return false;
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
    $('#bill_date').attr('max', maxDate);
  
});

</script>


<script>
 $(function() {
		$('#expquery').click(
				function() {
	//alert("going to expese entry");
	
		var ctype=$('#ctype').val();
		var bnum=$('#bill_num').val();
		var bdate=$('#bill_date').val();
		var eamount=$('#eamnt').val();
		var remarks=$('#remarks').val();
		var empid=$('#empid').val();

		if (ctype == "none selected") {
			alert("Please Select claim type ! ");
			return false;
		}
		else if(bnum == "") {
		alert("Please fill Bill number ! ");
		return false;
		}else if (bdate == "") {
		alert("Please fill bill date ! ");
		return false;
		}else if (eamount == "") {
		alert("Please fill expense amount ! ");
		return false;
		}
 
		else {
			//alert(" ctype==="+ctype);
			var datesArray=[];
			var myTable = document.getElementById('tblPets').tBodies[0];
	        // alert(myTable);
	         // first loop for each row	
	        for (var r=1, n = myTable.rows.length; r < n; r++) {
	                       // this loop is getting each colomn/cells
				for (var c = 0, m = myTable.rows[r].cells.length-1; c < m; c++) {
	              
				   if(myTable.rows[r].cells[c].childNodes[0].value){
					   	
				   		var marks = myTable.rows[r].cells[c].childNodes[0].value;
				   		//alert(marks);
				   		if(marks=="none selected")
				   			{
				   			alert("Please Enter all important Fields")
				   			return false;
				   			}
				   	  datesArray.push(marks);
			            }
				   }
				  datesArray.push(";");
	            }
	        
			var url = 'postLoginJsp/Benifits_Payments/expense_entry_success.jsp'; 
			var dataString = '&datesArray=' + datesArray;
			qryPage(url, dataString);

			return true;
		}
		
				});
				
    });



</script>

<SCRIPT TYPE="text/javascript"> 
var count = "1";
function addRow(in_tbl_name)
{
  var tbody = document.getElementById(in_tbl_name).getElementsByTagName("TBODY")[0];

  var row = document.createElement("TR");
  
  var td2 = document.createElement("TD")
  var strHtml2 = "<SELECT NAME=\"Claim Type\" id=\"ctype1\"><OPTION VALUE=\"none selected\">SELECT CLAIM TYPE<OPTION VALUE=\"CHILDREN EDUCATION EXPENSES\">CHILDREN EDUCATION EXPENSES<OPTION VALUE=\"FUEL AND MAINTENANCE EXPENSES\">FUEL AND MAINTENANCE EXPENSES   <OPTION VALUE=\"CHILDREN HOSTEL EXPENSE\">CHILDREN HOSTEL EXPENSE  <OPTION VALUE=\"MEDICAL EXPENSES\">MEDICAL EXPENSES  <OPTION VALUE=\"OWA EXPENSES\">OWA EXPENSES  <OPTION VALUE=\"OWA MAINTENANCE **\">OWA MAINTENANCE **</SELECT>";
	 
  td2.innerHTML = strHtml2.replace(/!count!/g,count);
  // create table cell 3
  var td3 = document.createElement("TD")
  var strHtml3 = "<INPUT TYPE=\"text\" NAME=\"bill_num\"  MAXLENGTH=\"30\"  STYLE=\"height:24;border: 1 solid;margin:0;\">";
  td3.innerHTML = strHtml3.replace(/!count!/g,count);
  // create table cell 4
  var td4 = document.createElement("TD")
  var strHtml4 = "<INPUT TYPE=\"date\" id=\"bill_date1\"  name=\"bill_date1\" MAXLENGTH=\"5\"  STYLE=\"height:24;border: 1 solid;margin:0;\" onchange=\"checking()\">";
  td4.innerHTML = strHtml4.replace(/!count!/g,count);
  // create table cell 5
  var td5 = document.createElement("TD")
  var strHtml5 = "<INPUT TYPE=\"text\" NAME=\"eamnt\"  MAXLENGTH=\"30\"  STYLE=\"height:24;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
  td5.innerHTML = strHtml5.replace(/!count!/g,count);
  // create table cell 6
  var td6 = document.createElement("TD")
  var strHtml6 = "<INPUT TYPE=\"text\" NAME=\"remarks\"  MAXLENGTH=\"40\"  STYLE=\"height:24;border: 1 solid;margin:0;\" >";
  td6.innerHTML = strHtml6.replace(/!count!/g,count);
  // create table cell 7
  var td7 = document.createElement("TD")
  var strHtml7 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\">";
  td7.innerHTML = strHtml7.replace(/!count!/g,count);
  // append data to row
/*   row.appendChild(td1); */
  row.appendChild(td2);
  row.appendChild(td3);
  row.appendChild(td4);
  row.appendChild(td5);
  row.appendChild(td6);
  row.appendChild(td7);
  // add to count variable
  count = parseInt(count) + 1;
  // append row to table
  tbody.appendChild(row);
	}

function delRow()
{
  var current = window.event.srcElement;
  //here we will delete the line
  while ( (current = current.parentElement)  && current.tagName !="TR");
       current.parentElement.removeChild(current);
}

</SCRIPT>





</head>

<body>
  <div id="qrySuccess">
	<!-- <div class="row" id="lrmain" style="border:2px solid #F5F5F5;  margin-top:15%;"> -->
	<div  style="height: 150px; margin-top: 130px">

	<div style="background-color: #98c3e2; margin-top: 10px; margin-left: -3.5%; padding-left: 15px">Expense Entry</div>
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -3.5%; padding-left: 15px">Employee Details</div>
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -1.5%; padding-left: 15px; width: 90%;">Employee Information</div>
		<div style="background-color: #dfecf5; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; width: 90%;">
			<!-- <table style="background-color:#dfecf5;width:40%; border:1; cellpadding:0px;margin-left:-3.5%"> -->
			<%
				java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
			%>

			<%
				String var1 = df.format(new java.util.Date());
				String[] date = var1.split("/");
				//out.println("year======="+date[2]);
			%>
			
			<%
			MonthandyearDecide mm=new MonthandyearDecide();
			String mm_year=mm.monthyear();
			
			String empPersonalInfoAry11[]=mm_year.split("\\^");
			String fy_start = empPersonalInfoAry11[0];
			String fy_end =empPersonalInfoAry11[1];
			
			
			%>
			&nbsp;&nbsp;Year : <input type="text" id="year" size="5" name="year"
				value="<%=date[2]%>"
				style="background-color: #dfecf5; color: black; width: 7%; height: 20%"
				readonly="readonly"> Period From : <input type="text"
				value="01/04/<%=fy_start%>"
				style="background-color: #dfecf5; color: black; width: 12%; height: 20%"
				readonly="readonly" />&nbsp; To: <input type="text"
				value="31/03/<%=fy_end%>"
				style="background-color: #dfecf5; color: black; width: 12%; height: 20%"
				readonly="readonly" /><br>
		</div>
		<!-- </table> -->
		<br>

		<div
			style="background-color: #98c3e2; margin-top: 5px; margin-left: -3.5%; padding-left: 15px">Expense
			Entry Sheet</div>


		<form method="post">

			<div
				style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; width: 90%">Expense
				Entry</div>
			<table class="authors-list" ID="tblPets"
				style="background-color: #dfecf5; width: 90%; border: 1; cellpadding: 0px; margin-left: -1.5%">

				<tr class="headind">
					<!--  <td><h5> </h5></td> -->
					<th><span style="color:red">* </span>Claim Type</th>
					<th><span style="color:red">* </span>Bill No</th>
					<th><span style="color:red">* </span>Bill Date</th>
					<th><span style="color:red">* </span>Expense Amount</th>
					<th><span style="color:red">* </span>Remarks</th>
					<th ALIGN="center">&nbsp;</th>
				</tr>

				<tr>
					<!--   <td>&nbsp;&nbsp;&nbsp;</td> -->
					<td class="headind_1"><select name="ctype" id="ctype"
						style="background-color: white; color: black; width: 100.5%; height: 112%">
							<option value="none selected">SELECT CLAIM TYPE</option>
							<option value="CHILDREN EDUCATION EXPENSES">CHILDREN
								EDUCATION EXPENSES</option>
							<option value="FUEL AND MAINTENANCE EXPENSES">FUEL AND
								MAINTENANCE EXPENSES</option>
							<option value="CHILDREN HOSTEL EXPENSE">CHILDREN HOSTEL
								EXPENSE</option>
							<option value="MEDICAL EXPENSES">MEDICAL EXPENSES</option>
							<option value="OWA EXPENSES">OWA EXPENSES</option>
							<option value="OWA MAINTENANCE **">OWA MAINTENANCE **</option>

					</select></td>
					<td class="headind_1"><input type="text" name="bill_num"
						id="bill_num" style="background-color: white; border: 0px;"
						value=""></input></td>
					<td><input type="date" name="bill_date" id="bill_date"
						style="background-color: white; border: 0px;" value="" ></input></td>
					<td class="headind_1"><input type="text" name="eamnt"
						id="eamnt" style="background-color: white; border: 0px;" value=""
						onkeypress="return isamt(event)"></input></td>
					<td><input type="text" name="remarks" id="remarks"
						style="background-color: white; border: 0px;" value=""></input></td>
					<td><INPUT TYPE="Button" CLASS="Button" onClick="delRow()"
						VALUE="Delete Row"></TD>

				</tr>

			</table>
			<%
				String empid = (String) session.getAttribute("empid");
				System.out.println("empid for expense entry====" + empid);
			%>

			<input type="hidden" name="empid" id="empid" value="<%=empid%>" />

			<center>
				<input id="expquery" type="button" value="Submit"></input>
				 <INPUT TYPE="Button" onClick="addRow('tblPets')" VALUE="Add Row"></input>
				<input id="clear" type="RESET" value="Clear"></input>


				
			</center>
		</form>
		
		
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
		



<div style="background-color: #98c3e2;margin-top:5px;margin-left:-3.5%;padding-left:15px ">Summary Details</div>

<div style="background-color: #98c3e2;margin-top:5px;margin-left:-1.5%;padding-left:15px; width:40%; ">Summary</div>
<!-- <div style="background-color: #dfecf5;margin-top:3px;margin-left:-3.5%;padding-left:15px; width:40%;cellpadding:0px; "> -->
<table style="background-color:#dfecf5;width:40%; border:1; cellpadding:0px;margin-left:-1.5%">
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
		
		 </div> 
</body>
</html>


























<%-- 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.ExpenseEntryAction"%>
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
<!-- <script>
function ExpEntry(id)
{
	if (id == "expquery") {
		//alert(ctype);
		var ctype=$('#ctype').val();
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
		}/* else if (bill_date == "mon/dd/yyyy") {
			alert("Please fill expense amount ! ");
			return false;
		} */
 
		else {
			alert(" ctype==="+ctype);

			var url = 'postLoginJsp/Benifits_Payments/expense_entry_success.jsp'; 
			var dataString = '&ctype=' + ctype + '&bnum=' + bnum + '&bdate=' + bdate + '&eamount=' + eamount + '&remarks=' +remarks;
			qryPage(url, dataString);

			return true;
		}
	}
}

</script>
 -->

<script>
$(function() {
	$('#expquery').click(
			function() {
			alert("come in ajax call 2");
				var ctype=$('#ctype').val();
				var bnum=$('#bill_num').val();
				var bdate=$('#bill_date').val();
				var eamount=$('#eamnt').val();
				var remarks=$('#remarks').val();
				var empid=$('#empid').val();
				var ctype1=$('#ctypt1').val();
				
				alert(ctype1 + "and" +strHtml2);
			
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

					url :'postLoginJsp/Benifits_Payments/expense_entry_success111.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
					//	alert("Expense Entry successfully inserted ");
							// $('#lrmain').html(data).delay(5000).fadeOut(); 
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
            counter + '"/></td><td><input type="text" name="bill_date' +
            counter + '"/></td><td><input type="text" name="eamnt' +
            counter + '"/></td><td><input type="text" name="remarks' +
            counter + '"/></td></tr>');
        jQuery('table.authors-list').append(newRow);
    });
});
 */

<!-- </script>


<SCRIPT TYPE="text/javascript"> -->
var count = "1";
function addRow(in_tbl_name)
{
	alert("addRow");
  var tbody = document.getElementById(in_tbl_name).getElementsByTagName("TBODY")[0];
  // create row
  var row = document.createElement("TR");
  // create table cell 1
 /*  var td1 = document.createElement("TD")
  var strHtml1 = "<FONT SIZE=\"+3\">*</FONT>";
  td1.innerHTML = strHtml1.replace(/!count!/g,count); */
  // create table cell 2
  var td2 = document.createElement("TD")
  var strHtml2 = "<SELECT NAME=\"Claim Type\" id=\"ctype1\"><OPTION VALUE=\"none selected\">SELECT CLAIM TYPE<OPTION VALUE=\"CHILDREN EDUCATION EXPENSES\">CHILDREN EDUCATION EXPENSES<OPTION VALUE=\"FUEL AND MAINTENANCE EXPENSES\">FUEL AND MAINTENANCE EXPENSES   <OPTION VALUE=\"CHILDREN HOSTEL EXPENSE\">CHILDREN HOSTEL EXPENSE  <OPTION VALUE=\"MEDICAL EXPENSES\">MEDICAL EXPENSES  <OPTION VALUE=\"OWA EXPENSES\">OWA EXPENSES  <OPTION VALUE=\"OWA MAINTENANCE **\">OWA MAINTENANCE **</SELECT>";
	 
  td2.innerHTML = strHtml2.replace(/!count!/g,count);
  // create table cell 3
  var td3 = document.createElement("TD")
  var strHtml3 = "<INPUT TYPE=\"text\" NAME=\"bill_num\"  MAXLENGTH=\"30\"  STYLE=\"height:24;border: 1 solid;margin:0;\">";
  td3.innerHTML = strHtml3.replace(/!count!/g,count);
  // create table cell 4
  var td4 = document.createElement("TD")
  var strHtml4 = "<INPUT TYPE=\"date\" NAME=\"bill_date\" MAXLENGTH=\"5\"  STYLE=\"height:24;border: 1 solid;margin:0;\">";
  td4.innerHTML = strHtml4.replace(/!count!/g,count);
  // create table cell 5
  var td5 = document.createElement("TD")
  var strHtml5 = "<INPUT TYPE=\"text\" NAME=\"eamnt\"  MAXLENGTH=\"30\"  STYLE=\"height:24;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
  td5.innerHTML = strHtml5.replace(/!count!/g,count);
  // create table cell 6
  var td6 = document.createElement("TD")
  var strHtml6 = "<INPUT TYPE=\"text\" NAME=\"remarks\"  MAXLENGTH=\"40\"  STYLE=\"height:24;border: 1 solid;margin:0;\" >";
  td6.innerHTML = strHtml6.replace(/!count!/g,count);
  // create table cell 7
  var td7 = document.createElement("TD")
  var strHtml7 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\">";
  td7.innerHTML = strHtml7.replace(/!count!/g,count);
  // append data to row
/*   row.appendChild(td1); */
  row.appendChild(td2);
  row.appendChild(td3);
  row.appendChild(td4);
  row.appendChild(td5);
  row.appendChild(td6);
  row.appendChild(td7);
  // add to count variable
  count = parseInt(count) + 1;
  // append row to table
  tbody.appendChild(row);
}
function delRow()
{
  var current = window.event.srcElement;
  //here we will delete the line
  while ( (current = current.parentElement)  && current.tagName !="TR");
       current.parentElement.removeChild(current);
}



var cells = document.querySelectorAll('#tblPets td');
var cells = Array.prototype.slice.call(document.getElementById("tblPets").getElementsByTagName("td"));
alert(cells);
alert(i);
for(var i in cells){
    
    alert("My contents is \"" + cells[i].innerHTML + "\"");
    
}


</SCRIPT>


</head>

<body>
<!-- <div class="row" id="lrmain" style="border:2px solid #F5F5F5;  margin-top:15%;"> -->
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
<table  class="authors-list" ID="tblPets" style="background-color:#dfecf5; width:90%; border:1; cellpadding:0px;margin-left:-3.5%">

  <tr class="headind">
   <!--  <td><h5> </h5></td> -->
    <th>Claim Type</th>
    <th>Bill No</th>
    <th>Bill Date</th>
    <th>Expense Amount</th>
     <th>Remarks</th>
      <th ALIGN="center">&nbsp;</th>
  </tr>
  
  <tr>
  <!--   <td>&nbsp;&nbsp;&nbsp;</td> -->
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
  <td> <INPUT TYPE="Button" CLASS="Button" onClick="delRow()" VALUE="Delete Row"></TD>
 
  </tr>
 
</table>
<%

String empid=(String)session.getAttribute("empid");
System.out.println("empid for expense entry===="+empid);
%>

<input type="hidden" name="empid" id="empid" value="<%=empid %>" />

<center>
<input id="expquery" type="button"  value="Submit" ></input>
<INPUT TYPE="Button" onClick="addRow('tblPets')" VALUE="Add Row">
<input id="clear" type="RESET"  value="Clear"></input>


<!-- <a href="#" title="" class="add-author"><input type="button" value="Add New Row" /></a> -->
<!-- <input id="expquery" type="button"  value="Save" onclick="ExpEntry(id)"></input> -->
<!-- <input id="submit" type="button"  value="Upload"/>  -->
</center>
</form>


<!--  </div>  -->
<!--   <div id="lip"></div> -->


</body>
</html> --%>