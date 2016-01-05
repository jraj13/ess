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

<style>

#telephone_table tr td{
/* width:200%; */
font-size:12px;
}


</style>
</head>
   <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>

<!-- <script>
	$(function() {
		$('#submit111').click(function() {
			alert("telephone expense entry");
					
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
					alert(pfno);
					
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
						
					else{
					var dataString = "&empid=" + empid + "&ename=" + ename
							+ "&desing=" + desing + "&dept=" + dept + "&loc="
							+ loc + "&doj=" + doj + "&panno=" + panno
							+ "&bankname=" + bankname+ "&acntno=" + acntno+ "&pfno=" + pfno;
					
				//	alert(dataString);
					$.ajax({
						url : 'postLoginJsp/ADMINController/bankInfoInsertSuccess.jsp',
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
	
</script> -->


<script>
	$(function() {
		$('#submit').click(function() {
			//alert("telephone expense entry");
							var month = $('#month').val();
							var period = $('#period').val();
							var bill_no = $('#bill_no').val();
							var bill_date = $('#bill_date').val();
							var duedate = $('#duedate').val();
							
							//var before_duedate = $('#before_duedate').val();
							//var after_duedate = $('#after_duedate').val();
							
							var amount = $('#amount').val();
							var remarks = $('#remarks').val();
							//var cheque_from_acc_date = $('#cheque_from_acc_date').val();
							//var cheque_no = $('#cheque_no').val();
							
							//var bank = $('#bank').val();
							//var cheque_date = $('#cheque_date').val();
							//var cheque_amount = $('#cheque_amount').val();
							//var cheque_vendor_date = $('#cheque_vendor_date').val();
							

							if (bill_date == "") {
								alert("Please enter bill date !");
								return false;
							} else if (duedate == "") {
								alert("Please duedate !");
								return false;
							} 

							else {
								
								/* DYNAMIC ADDED ROW VALIDATION */
							      var requiredFields = $('#telephone_table').find('.requiredField');
							   
							       var allFieldsComplete = true;
							        var str=requiredFields.each(function(index) {
							            if (this.value.length == 0) {
							                $(this).addClass('requiredIncomplete');
							                //allFieldsComplete = false;
							                alert("Please fill all new added field values !");
							                /* return false; */
							                allFieldsComplete = false;
							                return allFieldsComplete;
							                
							            } else {
							                $(this).removeClass('requiredIncomplete');
							               // alert("some values");
							            }
							        });
							       /*  if(!allFieldsComplete){
							            alert("Please complete more experience required fields");
							        }
							        return allFieldsComplete; */
								
								//alert("Required fileds id flag is.."+allFieldsComplete);
								if(allFieldsComplete==false)
									{
									//alert("false condition");
									return false;
									}
								
								
								var datesArray = [];
								var myTable = document
										.getElementById('telephone_table').tBodies[0];
								// first loop for each row	
								for (var r = 1, n = myTable.rows.length; r < n; r++) {
									// this loop is getting each colomn/cells
									for (var c = 0, m = myTable.rows[r].cells.length-1; c < m; c++) {

										if (myTable.rows[r].cells[c].childNodes[0].value) {

											var marks = myTable.rows[r].cells[c].childNodes[0].value;
											//alert(marks);
											if (marks == "none selected" || marks=="") {
												alert("Please Enter all important Fields")
												return false;
											}
											datesArray.push(marks);
										}

									}
									datesArray.push(";");
								}

								var dataString = '&datesArray=' + datesArray + '&selected_item='+selected_item ;
								alert(dataString);

								$.ajax({
											url : 'postLoginJsp/ADMINController/courier_expense_ee_save.jsp',
											type : 'POST',
											data : dataString,
											datatype : 'json',
											success : function(data) {
												//$('#lrmain').html(data).delay(5000).fadeOut();
												$('#lrmain').html(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
											}
										});
							}
						})
	});
</script>

<body>
<div id="lrmain">

<%
String selected_item=request.getParameter("select_item");
String selected_item_month=request.getParameter("select_item_month");
String selected_item_year=request.getParameter("select_item_year");

System.out.println(selected_item+" "+ selected_item_month+" "+ selected_item_year);


%>

<SCRIPT TYPE="text/javascript">
	var count = "1";
	function addRow_tt(in_tbl_name) {
		var tbody = document.getElementById(in_tbl_name).getElementsByTagName(
				"TBODY")[0];

		var row = document.createElement("TR");

		var td2 = document.createElement("TD")
		var strHtml2 = "<input type=\"text\" name=\"month\" id=\"month\" value=\"<%=selected_item_month %>-<%=selected_item_year%>\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" readonly=\"readonly\" />";
		td2.innerHTML = strHtml2.replace(/!count!/g, count);
		// create table cell 3
		var td3 = document.createElement("TD")
		var strHtml3 = "<input type=\"text\" name=\"period\" id=\"period\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td3.innerHTML = strHtml3.replace(/!count!/g, count);
		// create table cell 4
		var td4 = document.createElement("TD")
		var strHtml4 = "<input type=\"text\" name=\"courier_type\" id=\"courier_type\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td4.innerHTML = strHtml4.replace(/!count!/g, count);
		// create table cell 5
		var td5 = document.createElement("TD")
		var strHtml5 = "<input type=\"text\" name=\"bill_no\" id=\"bill_no\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td5.innerHTML = strHtml5.replace(/!count!/g, count);
		// create table cell 6
		var td6 = document.createElement("TD")
		var strHtml6= "<input type=\"date\" name=\"bill_date\" id=\"bill_date\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td6.innerHTML = strHtml6.replace(/!count!/g, count);
		// create table cell 7
		var td7 = document.createElement("TD")
		var strHtml7 = "<input type=\"date\" name=\"duedate\" id=\"duedate\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td7.innerHTML = strHtml7.replace(/!count!/g, count);

		/* // create table cell 7
		var td7 = document.createElement("TD")
		var strHtml7 = "<input type=\"text\" name=\"before_duedate\" id=\"before_duedate\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td7.innerHTML = strHtml7.replace(/!count!/g, count);
		// create table cell 8
		var td8 = document.createElement("TD")
		var strHtml8 = "<input type=\"text\" name=\"after_duedate\" id=\"after_duedate\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td8.innerHTML = strHtml8.replace(/!count!/g, count); */
		// create table cell 9
		var td8 = document.createElement("TD")
		var strHtml8 = "<input type=\"text\" name=\"amount\" id=\"amount\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td8.innerHTML = strHtml8.replace(/!count!/g, count);
		/* // create table cell 10
		var td10 = document.createElement("TD")
		var strHtml10 = "<input type=\"date\" name=\"cheque_from_acc_date\" id=\"cheque_from_acc_date\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td10.innerHTML = strHtml10.replace(/!count!/g, count);
		// create table cell 11
		var td11 = document.createElement("TD")
		var strHtml11 = "<input type=\"text\" name=\"cheque_no\" id=\"cheque_no\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td11.innerHTML = strHtml11.replace(/!count!/g, count);
		// create table cell 12
		var td12 = document.createElement("TD")
		var strHtml12 = "<input type=\"text\" name=\"bank\" id=\"bank\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td12.innerHTML = strHtml12.replace(/!count!/g, count);
		// create table cell 13
		var td13 = document.createElement("TD")
		var strHtml13 = "<input type=\"date\" name=\"cheque_date\" id=\"cheque_date\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td13.innerHTML = strHtml13.replace(/!count!/g, count);
		// create table cell 14
		var td14 = document.createElement("TD")
		var strHtml14 = "<input type=\"text\" name=\"cheque_amount\" id=\"cheque_amount\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td14.innerHTML = strHtml14.replace(/!count!/g, count);
		// create table cell 15
		var td15 = document.createElement("TD")
		var strHtml15 = "<input type=\"date\" name=\"cheque_vendor_date\" id=\"cheque_vendor_date\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td15.innerHTML = strHtml15.replace(/!count!/g, count); */
		
		// create table cell 16
		var td9 = document.createElement("TD")
		var strHtml9 = "<input type=\"text\" name=\"remarks\" id=\"remarks\" value=\"\"   style=\"background-color: white;width:100%;\" class=\"requiredField\" />";
		td9.innerHTML = strHtml9.replace(/!count!/g, count);
		// create table cell 10
		 var td10 = document.createElement("TD")
		 var strHtml10 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\" STYLE=\"height:24;width:55px;\">";
		 td10.innerHTML = strHtml10.replace(/!count!/g,count); 
		// append data to row
		/*   row.appendChild(td1); */
		row.appendChild(td2);
		row.appendChild(td3);
		row.appendChild(td4);
		row.appendChild(td5);
		row.appendChild(td6);
	 	row.appendChild(td7);
		row.appendChild(td8);
		row.appendChild(td9);
		 row.appendChild(td10);
		 /*row.appendChild(td11);
		row.appendChild(td12);
		row.appendChild(td13);
		row.appendChild(td14);
		row.appendChild(td15); 
		
		 row.appendChild(td16);
		 row.appendChild(td17);*/
		// add to count variable
		count = parseInt(count) + 1;
		// append row to table
		tbody.appendChild(row);
	}

	function delRow() {
		var current = window.event.srcElement;
		//here we will delete the line
		while ((current = current.parentElement) && current.tagName != "TR")
			;
		current.parentElement.removeChild(current);
	}
</SCRIPT>




<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px;width:929px;"><b><%=selected_item %> Detail Insertion form</b></h2>
<br>
<div id="main" style="width:1000px;">
<table id="telephone_table" style="margin-left:-3.5%;width:500px;" >
<caption style="background-color: ;margin-left:-3.5%;width:929px;"></caption>


<tr style="background-color:#B0C4DE;">

<td width="10%"><b>Month</b></td>
<td width="10%"><b>Period</b></td>
<td width="10%"><b>Courier Type</b></td>
<td width="10%"><b>Bill No.</b></td>
<td width="1%"><b>Bill Date</b></td>
<td width="1%"><b>Due Date</b></td>
<!-- <td width="10%"><b>Bill Amount before due date</b></td>
<td width="10%"><b>Bill Amount after due date</b></td> -->
<td width="10%"><b>Amount</b></td>
<!-- <td width="1%"><b>Cheque Received from Accounts (date)</b></td>
<td width="12%"><b>Cheque No.</b></td>
<td width="14%"><b>Bank</b></td>
<td width="1%"><b>Cheque Date</b></td>
<td width="20%"><b>Cheque Amount</b></td>
<td width="8%"><b>Cheque submit to vendor on (Date)</b></td> -->
<td width="10%"><b>Remarks</b></td>
</tr>

							<%-- 
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
										
							%> --%>
						
								
						<tr>
								<td width="10%"><input type="text" name="month" id="month" value="<%=selected_item_month %>-<%=selected_item_year %>"   style="background-color: white;width:100%" readonly="readonly"/></td>
								<td width="10%"><input type="text" name="period" id="period" value=""  style="background-color: white;width:100%"/></td>
								<td width="10%"><input type="text" name="courier_type" id="courier_type" value=""  style="background-color: white;width:100%"/></td>
								<td width="10%"><input type="text" name="bill_no" id="bill_no" value=""  style="background-color: white;width:100%"/></td>
								<td width="1%"><input type="date"  name="bill_date" id="bill_date" value=""  style="background-color: white;width:100%"/></td>
								<td width="1%"><input type="date"  name="duedate" id="duedate" value=""  style="background-color: white;width:100%"/></td>
								<!-- <td width="10%"><input type="text" name="before_duedate" id="before_duedate" value=""  style="background-color: white;width:100%"/></td>
								<td width="10%"><input type="text" name="after_duedate" id="after_duedate" value=""  style="background-color: white;width:100%"/></td> -->
								<td width="10%"><input type="text" name="amount" id="amount" 	value=""  style="background-color: white;width:100%"/></td>
								<!-- <td width="1%"><input type="date"  name="cheque_from_acc_date" id="cheque_from_acc_date" value=""  style="background-color: white;width:100%"/></td>
								<td width="12%"><input type="text" name="cheque_no" id="cheque_no"	 value=""  style="background-color: white;width:100%"/></td>
								<td width="14%"><input type="text" name="bank" id="bank" 		value=""  style="background-color: white;width:100%"/></td>
								<td width="1%"><input type="date"  name="cheque_date" id="cheque_date"	value=""  style="background-color: white;width:100%"/></td>
								<td width="20%"><input type="text" name="cheque_amount" id="cheque_amount" value=""  style="background-color: white;width:100%"/></td>
								<td width="8%"><input type="date"  name="cheque_vendor_date" id="cheque_vendor_date" value=""  style="background-color: white;width:100%"/></td>
								<td style="border-spacing: 0px;border-style: none;"width="8%"><input type="hidden"  name="hiddenfield" id="hiddenfield" value=""  style="background-color: white;width:100%"/></td> -->
								<td width="10%"><input type="text" name="remarks" id="remarks" 	value=""  style="background-color: white;width:100%"/></td>
								</tr> 

<input type="hidden" value="<%=selected_item %>" id="selected_item">
						<%-- 	<%
								}
								} else {
							%>
							<tr>
								<td colspan="14">No Records</td>
							</tr>

							<%
								}
							%> --%>
						</table>
<br/>
<!-- <center> <input id="payslip" type="button" value="Generate Payslip"/></center> -->
<center><input type="button" value="Submit" id="submit"/>
<input type="button" value="Add new row" id="addRow_tt" onClick="addRow_tt('telephone_table')"/>
<!-- <input type="button" id="addrow_bnl1" value="Add Row"
									onClick="addRow_bnl1('telephone_table')" style="width: 75px"> -->
</center>
</div>


</div><br>

</body>
</html>