
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="com.ess.common.eseparation.FandFsettlement_HR" %>
	<%@ page import="com.ess.common.eseparation.DueClearance" %>
	<%@ page import="com.ess.common.eseparation.Temporary_saving_Draft" %>
	<%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
th {
	background-color: #CCCCCC;
}

hr {
	color: #999;
}

#tab_esep1 {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep1 td {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep2 {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep2 td {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}
#tab_esep3 {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

#tab_esep3 td {
	border-spacing: 0px;
	border-style: none;
	border: 0px;
}

.btn, .ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ColVis_MasterButton,
	.fc-state-default {
	text-shadow: none;
	font-size: 12px;
	font-weight: bold;
	color: #333333;
	/* font-size: 10px; */
	cursor: pointer;
}

.ui-tabs .ui-tabs-nav {
	margin: 0;
	padding: .1em .2em 0;
}

.tabs {
	tab-size: 16;
}

.ui-widget-header {
	border: 1px solid #aaaaaa;
	background: red url("images/ui-bg_highlight-soft_75_cccccc_1x100.png")
		50% 50% repeat-x;
	color: #222222;
	font-weight: bold;
}

#leave_summary_table {
	width: 100%;
	border:0px;
	color:black;
}
#leave_summary_table td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}
#recovery_pay_table {
	width: 100%;
	border:0px;
	color:black;
}
#recovery_pay_table td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}


#bank_table_1,#bank_table_2,#bank_table_3 {
	width: 100%;
	border:0px;
	color:black;
}
#bank_table_1 td,#bank_table_2 td,#bank_table_3 td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}
#address_table_1,#address_table_2 {
	width: 100%;
	border:0px;
	color:black;
}
#address_table_1 td,#address_table_2 td{
border-spacing: 0px;
	border-style: none;
	border: 1px;
}

p.third_table {
	line-height: 80%;
}



.ui-widget-content {
    border: 0px solid #aaaaaa;
   }

.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited
	{
	color: #161313;
	text-decoration: none;
}


#fnfs_hr_tab-1_2,#fnfs_hr_tab-2_1,#fnfs_hr_tab-4_1,#fnfs_hr_tab_5_1{
border-style: solid;
	border-width: 12px;
	 color:#dfecf5;
	 padding-left: 15px;
	
}

p {
    margin: 5px 10px -1px;
    line-height: 14px;
    color:black;
}

</style>

<script type="text/javascript" src="regjs/fandfscript.js"></script> 
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>



<script>

$(function() {
	$('#leave_summary_draft').click(function() {
		
				//getting pl information for column1 
				var available_pl_hr_col1 = $('#available_pl_hr_col1').val();
				var advance_pl_col1=$('#advance_pl_col1').val();
				
				
				// getting sl informatioin for column1
				
				var available_sl_hr_col1 = $('#available_sl_hr_col1').val();
				var advance_sl_hr_col1 = $('#advance_sl_hr_col1').val();
				
				//getting pl information for column2
				
				var available_pl_hr_col2 = $('#available_pl_hr_col2').val();
				var advance_pl_col2 = $('#advance_pl_col2').val();
				
				//getting sl information for column2
				
				var available_sl_hr_col2= $('#available_sl_hr_col2').val();
				var advance_sl_hr_col2 = $('#advance_sl_hr_col2').val();
				
				
				var short_fall= $('#short_fall').val();
				
				var seq_no=$('#esep_req_no').val();
				
				var cl_days=$('#cl_days').val();
				
		
				var dataString = "&available_pl_hr_col1=" + available_pl_hr_col1 + "&advance_pl_col1=" + advance_pl_col1
							+ "&available_sl_hr_col1=" + available_sl_hr_col1 + "&advance_sl_hr_col1=" + advance_sl_hr_col1 + 
							
							"&available_pl_hr_col2=" + available_pl_hr_col2 + "&advance_pl_col2=" + advance_pl_col2+ 
							"&available_sl_hr_col2=" + available_sl_hr_col2+ "&advance_sl_hr_col2=" +advance_sl_hr_col2 + 
							
							"&short_fall=" +short_fall+"&seq_no=" +seq_no +"&cl_days=" +cl_days ;
					//alert(dataString);
			
					$.ajax({
						url : 'postLoginJsp/HRController/temporary_leave_summary_inserting.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							 $('#lrmain_res').html(data); 
							$("#result").html('Draft saved successfully!').delay(5000).fadeOut();							
						},
						error : function(jqXHR, textStatus, errorThrown) {
							$("#result").html('Draft Not saved!').delay(5000).fadeOut();
						}
					});
				
				})
	});
</script>


<script>

$(function() {
	$('#tab2').click(function() {
		var seq_no_ajax=$('#esep_req_no').val();
		var resig_date=$('#esep_resig_date').val();
		
		dataString="&seq_no_ajax=" +seq_no_ajax+"&resig_date=" +resig_date ;
		
		$.ajax({
			url : 'postLoginJsp/HRController/recovery_payable_page.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				 $('#lrmain_res').html(data); 
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("internal problem");
			}
		});
		
		

		
	})
		
	});

</script>


<script>

$(function() {
	$('#tab4').click(function() {
		var seq_no_ajax=$('#esep_req_no').val();
		
		
		dataString="&seq_no_ajax=" +seq_no_ajax;
		
		$.ajax({
			url : 'postLoginJsp/HRController/bank_Details_fandF.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				 $('#lrma_bank').html(data); 
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("internal problem");
			}
		});
		
		

		
	})
		
	});

</script>

<SCRIPT TYPE="text/javascript">
	var count = "1";
	function addRow_bnl1(in_tbl_name) {
		var tbody = document.getElementById(in_tbl_name).getElementsByTagName(
				"TBODY")[0];

		var row = document.createElement("TR");

		var td2 = document.createElement("TD")
		var strHtml2 = "<INPUT TYPE=\"text\" id=\"des_bnl1\" NAME=\"des_bnl1\" MAXLENGTH=\"30\"  STYLE=\"height:24;width: 233px;border: 1 solid;margin:0;\">";

		td2.innerHTML = strHtml2.replace(/!count!/g, count);
		// create table cell 3
		var td3 = document.createElement("TD")
		var strHtml3 = "<INPUT TYPE=\"date\" NAME=\"begin_date_bnl1\" id=\"begin_date_bnl1\"  MAXLENGTH=\"5\"  STYLE=\"height:24;width: 145px;border: 1 solid;margin:0;\" onchange=\"checking()\">";
		td3.innerHTML = strHtml3.replace(/!count!/g, count);
		// create table cell 4
		var td4 = document.createElement("TD")
		var strHtml4 = "<INPUT TYPE=\"date\" id=\"ending_date_bnl1\"  name=\"ending_date_bnl1\" MAXLENGTH=\"5\"  STYLE=\"height:24;width: 145px;border: 1 solid;margin:0;\" onchange=\"checking()\">";
		td4.innerHTML = strHtml4.replace(/!count!/g, count);
		// create table cell 5
		var td5 = document.createElement("TD")
		var strHtml5 = "<INPUT TYPE=\"text\" NAME=\"effect_bnl1\" id=\"effect_bnl1\" MAXLENGTH=\"30\"  STYLE=\"height:24;width: 175px;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
		td5.innerHTML = strHtml5.replace(/!count!/g, count);
		// create table cell 6
		var td6 = document.createElement("TD")
		var strHtml6 = "<INPUT TYPE=\"text\" NAME=\"remarks_bnl1\" id=\"remarks_bnl1\" MAXLENGTH=\"40\"  STYLE=\"height:24;border: 1 solid;margin:0;\" >";
		td6.innerHTML = strHtml6.replace(/!count!/g, count);

		// create table cell 7
		/*  var td7 = document.createElement("TD")
		 var strHtml7 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\" STYLE=\"height:24;width:55px;\">";
		 td7.innerHTML = strHtml7.replace(/!count!/g,count); */
		// append data to row
		/*   row.appendChild(td1); */
		row.appendChild(td2);
		row.appendChild(td3);
		row.appendChild(td4);
		row.appendChild(td5);
		row.appendChild(td6);
		// row.appendChild(td7);
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

<SCRIPT TYPE="text/javascript">
	var count = "1";
	function addRow_bnl2(in_tbl_name) {
		var tbody = document.getElementById(in_tbl_name).getElementsByTagName(
				"TBODY")[0];

		var row = document.createElement("TR");

		var td2 = document.createElement("TD")
		var strHtml2 = "<INPUT TYPE=\"text\" id=\"subtype_bnl2\" NAME=\"subtype_bnl2\" MAXLENGTH=\"30\"  STYLE=\"height:24;width: 230px;border: 1 solid;margin:0;\">";

		td2.innerHTML = strHtml2.replace(/!count!/g, count);
		// create table cell 3
		var td3 = document.createElement("TD")
		var strHtml3 = "<INPUT TYPE=\"text\" id=\"description_bnl2\" NAME=\"description_bnl2\" MAXLENGTH=\"30\"  STYLE=\"height:24;width:293px;border: 1 solid;margin:0;\">";
		td3.innerHTML = strHtml3.replace(/!count!/g, count);
		// create table cell 4
		var td4 = document.createElement("TD")
		var strHtml4 = "<INPUT TYPE=\"text\" NAME=\"loan_amount_bnl2\"  MAXLENGTH=\"30\"  STYLE=\"height:24;width: 120px;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
		td4.innerHTML = strHtml4.replace(/!count!/g, count);
		// create table cell 5
		var td5 = document.createElement("TD")
		var strHtml5 = "<INPUT TYPE=\"text\" NAME=\"balance_amount_bnl2\"  MAXLENGTH=\"30\"  STYLE=\"height:24;width: 120px;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
		td5.innerHTML = strHtml5.replace(/!count!/g, count);
		// create table cell 6
		var td6 = document.createElement("TD")
		var strHtml6 = "<INPUT TYPE=\"text\" NAME=\"repay_amount_bnl2\"  MAXLENGTH=\"30\"  STYLE=\"height:24;width: 120px;border: 1 solid;margin:0;\"   onkeypress=\"return isamt(event)\">";
		td6.innerHTML = strHtml6.replace(/!count!/g, count);
		// create table cell 7
		/*   var td7 = document.createElement("TD")
		 var strHtml7 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\" STYLE=\"height:24;width:55px;\">";
		 td7.innerHTML = strHtml7.replace(/!count!/g,count); */
		// append data to row
		/*   row.appendChild(td1); */
		row.appendChild(td2);
		row.appendChild(td3);
		row.appendChild(td4);
		row.appendChild(td5);
		row.appendChild(td6);
		//  row.appendChild(td7);
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

<script>
	$(function() {
		$('#save_bnl1')
				.click(
						function() {

							var des_bnl1 = $('#des_bnl1').val();
							var begin_date_bnl1 = $('#begin_date_bnl1').val();
							var ending_date_bnl1 = $('#ending_date_bnl1').val();
							var effect_bnl1 = $('#effect_bnl1').val();
							var remarks_bnl1 = $('#remarks_bnl1').val();
							var seq_no = $('#seq_no').val();
						//	alert(seq_no);

							if (des_bnl1 == "") {
								alert("Please select description !");
								return false;
							} else if (begin_date_bnl1 == "") {
								alert("Please select beginning date !");
								return false;
							} else if (ending_date_bnl1 == "") {
								alert("Please select ending date !");
								return false;
							} else if (effect_bnl1 == "") {
								alert("Please enter effect field !");
								return false;
							} else if (remarks_bnl1 == "") {
								alert("Please enter remarks field !");
								return false;
							}

							else {
								
								var datesArray = [];
								var myTable = document
										.getElementById('bond_loan_table_1').tBodies[0];
								// alert(myTable);
								// first loop for each row	
								for (var r = 1, n = myTable.rows.length; r < n; r++) {
									// this loop is getting each colomn/cells
									for (var c = 0, m = myTable.rows[r].cells.length; c < m; c++) {

										if (myTable.rows[r].cells[c].childNodes[0].value) {

											var marks = myTable.rows[r].cells[c].childNodes[0].value;
											//alert(marks);
											if (marks == "none selected") {
												alert("Please Enter all important Fields")
												return false;
											}
											datesArray.push(marks);
										}

									}
									datesArray.push(";");
								}

								var dataString = '&datesArray=' + datesArray
										+ '&seq_no=' + seq_no;
								alert(dataString);

								$
										.ajax({
											url : 'postLoginJsp/HRController/bond_summary_save_fnf.jsp',
											type : 'POST',
											data : dataString,
											datatype : 'json',
											success : function(data) {
												$('#bond_summary_save').html(
														data).delay(5000)
														.fadeOut();
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
											}
										});
							}
						})
	});
</script>

<script>
	$(function() {
		$('#save_bnl2')
				.click(
						function() {

							var subtype_bnl2 = $('#subtype_bnl2').val();
							var description_bnl2 = $('#description_bnl2').val();
							var loan_amount_bnl2 = $('#loan_amount_bnl2').val();
							var balance_amount_bnl2 = $('#balance_amount_bnl2')
									.val();
							var repay_amount_bnl2 = $('#repay_amount_bnl2')
									.val();
							alert(remarks_bnl1);
							var seq_no = $('#seq_no').val();
							alert(seq_no);

							if (subtype_bnl2 == "") {
								alert("Please enter subtype !");
								return false;
							} else if (description_bnl2 == "") {
								alert("Please enter description!");
								return false;
							} else if (loan_amount_bnl2 == "") {
								alert("Please enter loan amount !");
								return false;
							} else if (balance_amount_bnl2 == "") {
								alert("Please enter balance amount!");
								return false;
							} else if (repay_amount_bnl2 == "") {
								alert("Please enter special repayment !");
								return false;
							}

							else {
								//alert(" ctype==="+ctype);
								var datesArray = [];
								var myTable = document
										.getElementById('bond_loan_table_2').tBodies[0];
								// alert(myTable);
								// first loop for each row	
								for (var r = 1, n = myTable.rows.length; r < n; r++) {
									// this loop is getting each colomn/cells
									for (var c = 0, m = myTable.rows[r].cells.length; c < m; c++) {

										if (myTable.rows[r].cells[c].childNodes[0].value) {

											var marks = myTable.rows[r].cells[c].childNodes[0].value;
											//alert(marks);
											if (marks == "none selected") {
												alert("Please Enter all important Fields")
												return false;
											}
											datesArray.push(marks);
										}

									}
									datesArray.push(";");
								}

								var dataString = '&datesArray=' + datesArray
										+ '&seq_no=' + seq_no;
								alert(dataString);

								$
										.ajax({
											url : 'postLoginJsp/HRController/loan_summary_save_fnf.jsp',
											type : 'POST',
											data : dataString,
											datatype : 'json',
											success : function(data) {
												$('#loan_summary_save').html(
														data).delay(5000)
														.fadeOut();
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
											}
										});
							}
						})
	});
	/* var url = 'postLoginJsp/Benifits_Payments/expense_entry_success11.jsp'; 
	var dataString = '&datesArray=' + datesArray;
	alert("data String ..."+bond_loan_table_1);
	qryPage(url, dataString);

	return true;
	}
	
		});
		
	}); */
</script>

<script>
	$(function() {
		$('#edit_bnl1').click(function() {
			alert("edit fetch details for bond");

			var seq_no = $('#seq_no').val();

			//alert(seq_no);

			var dataString = '&seq_no=' + seq_no;
			alert("fetch to.." + dataString);

			$.ajax({
				url : 'postLoginJsp/HRController/bond_summary_edit1_click.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data) {
					$('#edit_fetch_data_bond').html(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});

		})
	});
</script>

<script>
	$(function() {
		$('#edit_bnl2').click(function() {
			alert("edit fetch details for loan");

			var seq_no = $('#seq_no').val();

			//	alert(seq_no);

			var dataString = '&seq_no=' + seq_no;
			alert(dataString);

			$.ajax({
				url : 'postLoginJsp/HRController/loan_summary_edit1_click.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data) {
					$('#edit_fetch_data_loan').html(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});

		})
	});
</script>

<script type="text/javascript">
	function edit_per_addr() {
		// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
		x = document.getElementById("per_street")
		x.disabled = !x.disabled;
		x = document.getElementById("per_addr")
		x.disabled = !x.disabled;
		x = document.getElementById("per_addr_city")
		x.disabled = !x.disabled;
		x = document.getElementById("per_addr_distt")
		x.disabled = !x.disabled;
		x = document.getElementById("per_add_pcode")
		x.disabled = !x.disabled;
		x = document.getElementById("per_cont_no")
		x.disabled = !x.disabled;

	}
</script>
<script type="text/javascript">
	function edit_curr_addr() {
		// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
		x = document.getElementById("curr_street")
		x.disabled = !x.disabled;
		x = document.getElementById("curr_addr")
		x.disabled = !x.disabled;
		x = document.getElementById("curr_addr_city")
		x.disabled = !x.disabled;
		x = document.getElementById("curr_addr_distt")
		x.disabled = !x.disabled;
		x = document.getElementById("curr_add_pcode")
		x.disabled = !x.disabled;
		x = document.getElementById("curr_cont_no")
		x.disabled = !x.disabled;
	}
</script>

<script>
	$(function() {
		$('#update_peradd').click(
				function() {
					alert("permanant address update");

					var per_street = $('#per_street').val();
					var per_addr = $('#per_addr').val();
					var per_addr_city = $('#per_addr_city').val();
					var per_addr_distt = $('#per_addr_distt').val();
					var per_add_pcode = $('#per_add_pcode').val();
					var per_cont_no = $('#per_cont_no').val();
					var per_emp_id = $('#per_emp_id').val();

					//	alert(seq_no);

					var dataString = '&per_street=' + per_street + '&per_addr='
							+ per_addr + '&per_addr_city=' + per_addr_city
							+ '&per_addr_distt=' + per_addr_distt
							+ '&per_add_pcode=' + per_add_pcode
							+ '&per_cont_no=' + per_cont_no + '&per_emp_id='
							+ per_emp_id;

					alert("p_addr.." + dataString);

					$.ajax({
						url : 'postLoginJsp/HRController/per_addr_update.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#per_addr_resp').html(data).delay(5000)
									.fadeOut();
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});

				})
	});

	$(function() {
		$('#update_curradd').click(
				function() {
					alert("permanant address update");

					var curr_street = $('#curr_street').val();
					var curr_addr = $('#curr_addr').val();
					var curr_addr_city = $('#curr_addr_city').val();
					var curr_addr_distt = $('#curr_addr_distt').val();
					var curr_add_pcode = $('#curr_add_pcode').val();
					var curr_cont_no = $('#curr_cont_no').val();
					var curr_emp_id = $('#curr_emp_id').val();

					//	alert(seq_no);
					var dataString = '&curr_street=' + curr_street
							+ '&curr_addr=' + curr_addr + '&curr_addr_city='
							+ curr_addr_city + '&curr_addr_distt='
							+ curr_addr_distt + '&curr_add_pcode='
							+ curr_add_pcode + '&curr_cont_no=' + curr_cont_no
							+ '&curr_emp_id=' + curr_emp_id;
					alert(dataString);

					$.ajax({
						url : 'postLoginJsp/HRController/curr_addr_update.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#curr_addr_resp').html(data).delay(5000)
									.fadeOut();
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});

				})
	});

	$(function() {
		$('#cancel_bnl1')
				.click(
						function() {
							alert("goto back button");

							/* 	var curr_street=$('#curr_street').val();
								var curr_addr=$('#curr_addr').val();
								var curr_addr_city=$('#curr_addr_city').val();
								var curr_addr_distt=$('#curr_addr_distt').val();
								var curr_add_pcode=$('#curr_add_pcode').val();
								var curr_cont_no=$('#curr_cont_no').val();
								var curr_emp_id=$('#curr_emp_id').val();
							 */

							//	alert(seq_no);
							var dataString = '&curr_street=' + curr_street
									+ '&curr_addr=' + curr_addr
									+ '&curr_addr_city=' + curr_addr_city
									+ '&curr_addr_distt=' + curr_addr_distt
									+ '&curr_add_pcode=' + curr_add_pcode
									+ '&curr_cont_no=' + curr_cont_no
									+ '&curr_emp_id=' + curr_emp_id;
							alert(dataString);

							$
									.ajax({
										url : 'postLoginJsp/HRController/curr_addr_update11.jsp',
										type : 'POST',
										data : dataString,
										datatype : 'json',
										success : function(data) {
											$('#curr_addr_resp').html(data)
													.delay(5000).fadeOut();
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
										}
									});

						})
	});
</script>

</head>

<body>
<div id="qryload">
<%
String seq_no=request.getParameter("sequence_id").trim();

System.out.println("sequence number in full and final hr");

FandFsettlement_HR settelement_initial=new FandFsettlement_HR();

ArrayList<String> settelement=settelement_initial.setlement_info(seq_no);

	if (settelement.size() > 0) {
		for (int i = 0; i < settelement.size(); i++) {
			String set_data = settelement.get(i).toString();
			
			String set_data_arr[] = set_data.split("\\^");
			String emp_id = set_data_arr[0];
			String fname = set_data_arr[1];
			String lname = set_data_arr[2];
			String designation=set_data_arr[3];
			String emp_jd = set_data_arr[4];
			String resignation_date = set_data_arr[5];
			String hold_sal_Date = set_data_arr[6];
			String ctc = set_data_arr[7];
			String basic = set_data_arr[8];
			String tot_exp = set_data_arr[9];
			String reason=set_data_arr[10];
			String hr_real_date=set_data_arr[11];
			
%> 
		
  <div id="qrySuccess">  

	<div id="fnf_hr_table_f1"
		style="margin-top: -15px; margin-left: -2.5%; padding-left: 15px; font-size: 15px; width: 102%;">

		<div
			style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>Employee Detail</b>
		</div>

		<div
			style="background-color: #98c3e2; margin-top: 0.66px; margin-left: -1.5%; padding-left: 15px; width: 101.5%;">
			<button type="button" value="<%=seq_no %>" id="returntoMain_screen" onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				Return to Main screen                  
			</button>
			<button type="button" value="<%=seq_no %>" name="seq" id="fnfworksheet" onclick="openPage(id)"
				
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				FNF Worksheets
			</button>

			<button type="button" value="Continue" id="hrcreatereq"
				onclick="openPage(id)"
				style="background-color: #FFFF99; height: 26px; width: 162px;">
				
				Due Clearance Details
			</button>

			<button type="button" value="Continue" id="hrcreatereq"
				onclick="javascript:window.print();" title="print" 
				style="background-color: #FFFF99; height: 26px; width: 216px; float: right">
				 <span class="glyphicon glyphicon-print"
				style="color: black; padding-left: 0px;"></span> 
				Print Full and Final Settlement
			</button>

		</div>
		
		<br>
	<div style="background-color: #dfecf5;margin-left: -1.5%; padding-left: 15px;margin-top: -30px;height: 395px;">

		 <label>Eseparation Request No:</label>&nbsp;<input  id="esep_req_no" style="background-color: #dfecf5;height:26px;"readonly="readonly" value="<%=seq_no %>"/>
		<hr>

		<table id="tab_esep1">
			<tr>
				<td>Personal no.:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=emp_id %>"/></td>
				<td><input id="esep_req_no" value="<%=fname %>&nbsp;<%=lname %>"
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly"/></td>
				<!-- <td>Business HR:&nbsp;</td>
				<td><input id="esep_req_no" value="emp_name"
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly"/></td> -->
			</tr>

			<tr>
				<td>Company.:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="NCSS"/></td>
				<td><input id="esep_req_no" 
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly"/></td>
				<td>Location:&nbsp;</td>
				<td><input id="esep_req_no" 
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly" value="Bangalore"/></td>
			</tr>

			<tr>
				<td>Level/Desg.:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly"/></td>
				<td><input id="esep_req_no" 
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly" value="<%=designation %>"/></td>
				<td>Employment Type:&nbsp;</td>
				<td><input id="esep_req_no" 
					style="background-color: #dfecf5;height: 28px; width: 260px" readonly="readonly" value="permanent"/></td>
			</tr>

		</table>

		<hr>
		
		
		<table id="tab_esep2">
			<tr>
				<td>Joining Date:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=emp_jd %>"/></td>
					<td>Resignation Date:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly"  value="<%=resignation_date %>" /></td>
					
					<td>Date of Leaving:&nbsp;</td>
				<td><input  id="esep_resig_date"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=hr_real_date %>"/></td>
				
			</tr>

			<tr>
				<td>Confirmation Date:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=emp_jd %>"/></td>
					<td>Hold Salary Date:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=hold_sal_Date %>"/></td>
					
					<td>PDC Error Date:&nbsp;</td>
				<td><input value="&nbsp;" id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly"/></td>
			</tr>

			<tr>
				<td>Reason:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=reason %>"/></td>
					
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

		</table>
		
		<hr>
		
		<table id="tab_esep3">
			<tr>
				<td>Basic Salary:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=basic %>"/></td>
				<td>CTC (Rs):&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 160px" readonly="readonly" value="<%=ctc %>"/></td>
					
				<td>Total Experience:&nbsp;</td>
				<td><input  id="esep_req_no"
					style="background-color: #dfecf5;height: 28px; width: 180px" readonly="readonly" value="<%=tot_exp%>"/></td>
				
			</tr>
<%
		}
	}
	 %>	
			
		</table>
		</div>
		<!-- <div id="qrySuccess" >  -->  <!-- for fnf worksheet results -->
		<div
			style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>&nbsp;&nbsp;</b>
		</div>
		
		<!-- FOR TAB OPTION -->
		<div id="tabs">
		<ul style="width: 90%;">
			<li><a href="#tabs-1" id="tab1" style="width: 140px;">Leave Summary</a></li>
			<li><a href="#tabs-2" id="tab2" style="width: 140px;">Recovery/Paybles </a></li>
			<li><a href="#tabs-3" style="width: 140px;">Bond and Loans</a></li>
			<li><a href="#tabs-4" id="tab4" style="width: 140px;">Bank Details</a></li>
			<li><a href="#tabs-5" style="width: 140px;">Address</a></li>
			<li><a href="#tabs-6" style="width: 140px;">Clearance</a></li>

		</ul>
<!-- 	tab-1 start -->
			<div id="tabs-1">
					<center><div id="result"></div></center>
				<div id="fnfs_hr_tab-1_2"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2;color:black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Leave and Notice-detailed information</b>
					</div>
					
					
					 <%
					Temporary_saving_Draft draft_getting_acc=new Temporary_saving_Draft();
					ArrayList<String> getting_draft_data=draft_getting_acc.getting_leave_balance(seq_no);


					if (getting_draft_data.size() > 0) {
						for (int j = 0; j < getting_draft_data.size(); j++) {
							String leave_data_draft = getting_draft_data.get(j).toString();
							
							String leave_data_draft_arr[] = leave_data_draft.split("\\^");
							
							String ava_pl_before_draft = leave_data_draft_arr[0];
							String adv_pl_before_draft = leave_data_draft_arr[1];
							
							String ava_sl_before_draft = leave_data_draft_arr[2];
							String adv_sl_before_draft=leave_data_draft_arr[3];
							
							String ava_pl_after_draft = leave_data_draft_arr[4];
							String adv_pl_after_draft = leave_data_draft_arr[5];
							
							String ava_sl_after_draft = leave_data_draft_arr[6];
							String adv_sl_after_draft= leave_data_draft_arr[7];
							
							String cl_days_draft= leave_data_draft_arr[8];
							
							
							/* String final_data=ava_pl_before+"^"+adv_pl_before+"^"+ava_sl_before+"^"+adv_sl_before+"^"+ava_pl_after+"^"+adv_pl_after+
									"^"+ava_sl_after+"^"+adv_sl_after+"^"+cl_days; */
												
					
					
							 %>
							 
					
					
					
					<%
					ArrayList<String> leave_info=settelement_initial.leave_info(seq_no);


					if (leave_info.size() > 0) {
						for (int i = 0; i < leave_info.size(); i++) {
							String leave_data = leave_info.get(i).toString();
							
							String leave_data_arr[] = leave_data.split("\\^");
							String creation_date = leave_data_arr[0];
							String ava_pl = leave_data_arr[1];
							String adv_pl = leave_data_arr[2];
							String ava_sl=leave_data_arr[3];
							String adv_sl = leave_data_arr[4];
							String given_np = leave_data_arr[5];
							String short_fall = leave_data_arr[6];
							String available_pl_after= leave_data_arr[7];
							String advance_pl_after= leave_data_arr[8];
							String available_sl_after= leave_data_arr[9];
							String advance_sl_after= leave_data_arr[10];
							
							
				%> 
					
					<table id="leave_summary_table">
						<tr>
							<td>Leave Balance</td>
							<td colspan="2">As on <%=creation_date%></td>
							<td colspan="2">After <%=creation_date %></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>(S)**</td>
							<td>(A)**</td>
							<td>(S)**</td>
							<td>(A)**</td>
							
						</tr>
						<tr>
							<td>Available PL:</td>
	<td><input value="<%=ava_pl %>" id="ava_pl_first_tab" style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly" /></td>
	
	<td><input value="<%=ava_pl_before_draft %>" id="available_pl_hr_col1" style="background-color: white; height: 28px; width: 160px" onkeypress="return ava_pl_before(event)" onchange="calculate_pl_before_first()"/></td>
	<td><input value="<%=available_pl_after %>" id="ava_pl_second_tab" style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
	<td><input value="<%=ava_pl_after_draft %>" id="available_pl_hr_col2" style="background-color: white; height: 28px; width: 160px" onkeypress="return ava_pl_after(event)" onchange="calculate_pl_after()"/></td>
						</tr>
						<tr>
							<td>Advance PL:</td>
							<td><input value="<%=adv_pl %>" id="adv_pl_first_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td><input value="<%=adv_pl_before_draft %>" id="advance_pl_col1"
								style="background-color: white; height: 28px; width: 160px" onkeypress="return advance_pl_before(event)" onchange="calculate_pl_before_first()"/></td>
							<td><input value="<%=advance_pl_after %>" id="adv_pl_second_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td><input value="<%=adv_pl_after_draft %>" id="advance_pl_col2"
								style="background-color: white; height: 28px; width: 160px"  onkeypress="return adv_pl_after_script(event)"  onchange="calculate_pl_after()"/></td>
						</tr>

						<tr>
							<td>Net PL:</td>
							<td>&nbsp;</td>
							<td><input value="0.0" id="net_pl_col1"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td><input value="0.0" id="net_pl_col2"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
						</tr>
						<tr>
							<td>Available SL:</td>
							<td><input value="<%=ava_sl %>" id="ava_sl_first_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly" /></td>
							<td><input value="<%=ava_sl_before_draft %>" id="available_sl_hr_col1"
								style="background-color: white; height: 28px; width: 160px"  onkeypress="return avai_sl_before(event)" onchange="calculate_sl_before()"/></td>
							<td><input value="<%=available_sl_after %>" id="ava_sl_second_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td><input value="<%=ava_sl_after_draft %>" id="available_sl_hr_col2"
								style="background-color: white; height: 28px; width: 160px" onkeypress="return available_sl_after_script(event)" onchange="calculate_sl_after()"/></td>
						</tr>
						<tr>
							<td>Advance SL:</td>
							<td><input value="<%=adv_sl %>" id="adv_sl_first_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td><input value="<%=adv_sl_before_draft %>" id="advance_sl_hr_col1"
								style="background-color: white; height: 28px; width: 160px" onkeypress="return advance_sl_before(event)" onchange="calculate_sl_before()" /></td>
							<td><input value="<%=advance_sl_after %>" id="adv_sl_second_tab"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td><input value="<%=adv_sl_after_draft %>"  id="advance_sl_hr_col2"
								style="background-color: white; height: 28px; width: 160px" onkeypress="return advance_sl_after_script(event)" onchange="calculate_sl_after()"/></td>
						</tr>

						<tr>
							<td>Net SL:</td>
							<td>&nbsp;</td>
							<td><input value="0.0" id="net_sl1"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td><input value="0.0" id="net_sl2"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Notice Period(as per Policy):</td>
							<td colspan="4"><input value="30.0" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
						</tr>

						<tr>
							<td>Given Notice Period:</td>
							<td colspan="4"><input value="<%=given_np %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
						</tr>

						<tr>
							<td>Short fall in notice period:</td>
							<td colspan="4"><input value="<%=short_fall %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							
						</tr>

						<tr>
							<td><input type="checkbox" />Short fall in notice period:</td>
							<td><input value="&nbsp;" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td colspan="3"><input value="&nbsp;" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							
						</tr>

						<tr>
							<td>Balance Recoverable:</td>
							<td><input value="<%=short_fall %>" id="short_fall"
								style="background-color: #dfecf5; height: 28px; width: 160px" readonly="readonly"/></td>
							<td>&nbsp;</td>
							<td>Excess CL availed:</td>
						 <td><input value="<%=cl_days_draft %>" id="cl_days"
								style="background-color: white; height: 28px; width: 160px" /></td> 
								
								
						</tr>


					</table>
					
					
					<p>*All values indicated above are in "Days".</p>
					<p>**(S) indicated system generated value, (A) indicats the
						adjusted value by HR.</p>
						
						<input type="button" id="leave_summary_draft" value="Save As Draft"/>
					<br />
				</div>
						
				<br /> 
				
			</div>
			
		<!-- 	tab-1 end -->

			<!-- 	tab-2 start -->
			<div id="tabs-2">

				<div id="fnfs_hr_tab-2_1"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					<div
						style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>&nbsp;</b>
					</div>
					<div id="lrmain_res">
					
					</div> 
				</div>
<%
					}
					}
						}
					}%>

			</div>

			<!-- tab-2 end -->

			<!-- tab-3 start -->
			
				<div id="tabs-3" style="background-color: #dfecf5; width: 943px;">

					<div id="edit_fetch_data_bond">
						<div
							style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 102%;">
							<b>Bond Summary</b>&nbsp;&nbsp;<div id="bond_summary_save"></div>
						</div>
						<form method="post">
							<table id="bond_loan_table_1"
								style="background-color: #dfecf5; margin-left: 0%; width: 100%;">
								<tr>
									<th>Description</th>
									<th>Begin Date</th>
									<th>Ending Date</th>
									<th>Effect</th>
									<th>Remarks</th>
									<!-- <th>...</th> -->
								</tr>

								<tr>
									<td><INPUT TYPE="text" NAME="description" id="des_bnl1"
										value="" MAXLENGTH="30"
										STYLE="height: 24; width: 233px; border: 1 solid; margin: 0;"></td>
									<td><INPUT TYPE="date" NAME="begin_date"
										id="begin_date_bnl1" value="" MAXLENGTH="5"
										STYLE="height: 24; width: 145px; border: 1 solid; margin: 0;"
										onchange="checking()" /></td>
									<td><INPUT TYPE="date" NAME="ending_date"
										id="ending_date_bnl1" value="" MAXLENGTH="5"
										STYLE="height: 24; width: 145px; border: 1 solid; margin: 0;"
										onchange="checking()"></td>
									<td><INPUT TYPE="text" NAME="effect" id="effect_bnl1"
										MAXLENGTH="30" value=""
										STYLE="height: 24; width: 175px; border: 1 solid; margin: 0;"
										onkeypress="return isamt(event)"></td>
									<td><INPUT TYPE="text" NAME="remarks" id="remarks_bnl1"
										MAXLENGTH="40" value=""
										STYLE="height: 24; border: 1 solid; margin: 0;"></td>

								</tr>
								<input type="hidden" value="<%=seq_no%>" id="seq_no"
									NAME="seq_no" />

								<!-- 		<tr>
							<td colspan="6"><input type="button" id="add_bnl1"
								value="Add">&nbsp;<input type="button" id="edit_bnl1"
								value="Edit"> &nbsp;<input type="button"
								id="update_bnl1" value="Update">&nbsp;<input
								type="button" id="clear_bnl1" value="Clear"> &nbsp;<input
								type="button" id="cancel_bnl1" value="Cancel"></td>
						</tr> -->
							</table>

							<center>
								<input type="button" id="addrow_bnl1" value="Add Row"
									onClick="addRow_bnl1('bond_loan_table_1')" style="width: 75px">&nbsp;<input
									type="button" id="save_bnl1" value="Save" style="width: 75px">&nbsp;<input
									type="button" id="edit_bnl1" value="Edit" style="width: 75px">
								&nbsp;<input type="button" id="update_bnl1" value="Update"
									style="width: 75px">&nbsp;<input type="reset"
									id="clear_bnl1" value="Clear" style="width: 75px">
								&nbsp;<input type="button" id="cancel_bnl1" value="Cancel"
									style="width: 75px">
							</center>
							<br>
							
							<br>
						</form>
					</div>


					<div id="edit_fetch_data_loan">
						<div
							style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 102%;">
							<b>Loan Summary</b>&nbsp;&nbsp;<div id="loan_summary_save"></div>
						</div>
						<form method="post">
							<table id="bond_loan_table_2"
								style="background-color: #dfecf5; margin-left: 0%; width: 100%;">
								<tr>
									<th>Sub Type</th>
									<th>Description</th>
									<th>Loan Amount</th>
									<th>Balance Amount</th>
									<th>Special Repayment</th>
									<!-- <th>&nbsp;</th> -->
								</tr>

								<tr>
									<td><INPUT TYPE="text" NAME="subtype" id="subtype_bnl2"
										MAXLENGTH="30"
										STYLE="height: 24; width: 230px; border: 1 solid; margin: 0;"></td>
									<td><INPUT TYPE="text" NAME="description"
										id="description_bnl2" MAXLENGTH="30"
										STYLE="height: 24; width: 293px; border: 1 solid; margin: 0;"></td>
									<td><INPUT TYPE="text" NAME="loan_amount"
										id="loan_amount_bnl2" MAXLENGTH="30"
										STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
										onkeypress="return isLoanAmt(event)"></td>
									<td><INPUT TYPE="text" NAME="balance_amount"
										id="balance_amount_bnl2" MAXLENGTH="30"
										STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
										onkeypress="return isBalAmt(event)"></td>
									<td><INPUT TYPE="text" NAME="repay_amount"
										id="repay_amount_bnl2" MAXLENGTH="30"
										STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
										onkeypress="return isRepayAmt(event)"></td>
									<!-- 	<td>&nbsp;</td> -->
								</tr>
								<input type="hidden" value="<%=seq_no%>" id="seq_no"
									NAME="seq_no" />
							</table>

							<center>
								<input type="button" id="add_bnl2" value="Add Row"
									onClick="addRow_bnl2('bond_loan_table_2')" style="width: 75px">&nbsp;<input
									type="button" id="save_bnl2" value="Save" style="width: 75px">&nbsp;<input
									type="button" id="edit_bnl2" value="Edit" style="width: 75px">
								&nbsp;<input type="button" id="update_bnl2" value="Update"
									style="width: 75px">&nbsp;<input type="reset"
									id="clear_bnl2" value="Clear" style="width: 75px">
								&nbsp;<input type="button" id="cancel_bnl2" value="Cancel"
									style="width: 75px">
							</center>
							<br>

						</form>
					</div>
					<!-- <input id="conclusion" type="button" value="Conclusion"/> -->

				</div>
				<!-- tab-3 end -->



			<!-- 	tab-4 start -->
			<div id="tabs-4">
			
			

				<div id="fnfs_hr_tab-4_1"
					style="width: 93%; margin-left: -2%; margin-top: -12px;">
					
					<div
						style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Employee Account Information</b>
					</div>
					<div id="lrma_bank">

					<br />
				</div>
</div>
				<!-- <input id="reason" type="button" value="Reason"/> -->
			</div>

			<!-- tab-4 end -->


	<!-- 	tab-5 start -->
				<div id="tabs-5">

					<div id="fnfs_hr_tab_5_1"
						style="width: 93%; margin-left: -2%; margin-top: -12px;">
						<div
							style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
							<b>Permanent Address</b>
						</div>

						<%
							String sequence_no_main = request.getParameter("sequence_id")
									.trim();

							Full_N_Final_Settlement address_initial = new Full_N_Final_Settlement();
							ArrayList<String> add_list = address_initial
									.empAddress_info(sequence_no_main);

							if (add_list.size() > 0) {
								for (int m = 0; m < add_list.size(); m++) {
									String addr_data = add_list.get(m).toString();

									String addr_data_arr[] = addr_data.split("\\^");
									String emp_id = addr_data_arr[0];

									String emp_per_street1 = addr_data_arr[1];
									String emp_per_add1r = addr_data_arr[2];
									String emp_per_addr_city1 = addr_data_arr[3];
									String emp_per_addr_dist1 = addr_data_arr[4];
									String emp_per_pcode1 = addr_data_arr[5];
									String emp_emg_con1 = addr_data_arr[6];

									String emp_curr_street1 = addr_data_arr[7];
									String emp_curr_addr1 = addr_data_arr[8];
									String emp_curr_addr_city1 = addr_data_arr[9];
									String emp_curr_addr_dist1 = addr_data_arr[10];
									String emp_curr_pcode1_main = addr_data_arr[11];
						%>
						<table id="address_table_1" style="background-color: white;">

							<tr>
								<td>Street/House:<span style="color: red">*</span></td>
								<td><input value="<%=emp_per_street1%>" id="per_street"
									style="background-color: #dfecf5; height: 28px; width: 360px"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>Address:<span style="color: red">*</span></td>
								<td><input value="<%=emp_per_add1r%>" id="per_addr"
									style="background-color: #dfecf5; height: 28px; width: 360px"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>City:<span style="color: red">*</span></td>
								<td><input value="<%=emp_per_addr_city1%>"
									id="per_addr_city"
									style="background-color: #dfecf5; height: 28px; width: 260px"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>District:<span style="color: red">*</span></td>
								<td><input value="<%=emp_per_addr_dist1%>"
									id="per_addr_distt"
									style="background-color: #dfecf5; height: 28px; width: 260px"
									disabled="true" /></td>
							</tr>
							<tr>
								<td>Postal Code:</td>
								<td><input value="<%=emp_per_pcode1%>" id="per_add_pcode"
									style="background-color: #dfecf5; height: 28px; width: 100px" 
									disabled="true" onkeypress="return postalCode1(event)"/></td>

							</tr>
							<tr>
								<td>Contact Number:<span style="color: red">*</span></td>
								<td><input value="<%=emp_emg_con1%>" id="per_cont_no"
									style="background-color: #dfecf5; height: 28px; width: 160px"
									disabled="true" onchange="verifyPh_Per()"
									/></td>

							</tr>

							<input type="hidden" id="per_emp_id" value="<%=emp_id%>" />

						</table>

						<input type="button" id="edit_peradd" value="Edit"
							onclick="return edit_per_addr()" style="width: 75px">
						&nbsp;<input type="button" id="update_peradd" value="Update"
							style="width: 75px"><br>
						<div id="per_addr_resp"></div>

						<hr style="height: 30px; margin-left: -1.7%; width: 101.8%;">

						<div
							style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
							<b>Present Address</b>
						</div>
						<table id="address_table_2" style="background-color: white;">

							<tr>
								<td>Street/House:<span style="color: red">*</span></td>
								<td><input value="<%=emp_curr_street1%>" id="curr_street"
									style="background-color: #dfecf5; height: 28px; width: 360px;"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>Address:<span style="color: red">*</span></td>
								<td><input value="<%=emp_curr_addr1%>" id="curr_addr"
									style="background-color: #dfecf5; height: 28px; width: 360px"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>City:<span style="color: red">*</span></td>
								<td><input value="<%=emp_curr_addr_city1%>"
									id="curr_addr_city"
									style="background-color: #dfecf5; height: 28px; width: 260px"
									disabled="true" /></td>

							</tr>
							<tr>
								<td>District:<span style="color: red">*</span></td>
								<td><input value="<%=emp_curr_addr_dist1%>"
									id="curr_addr_distt"
									style="background-color: #dfecf5; height: 28px; width: 260px"
									disabled="true" /></td>
							</tr>
							<tr>
								<td>Postal Code:</td>
								<td><input value="<%=emp_curr_pcode1_main%>"
									id="curr_add_pcode" maxlength="6"
									style="background-color: #dfecf5; height: 28px; width: 100px"
									disabled="true" onkeypress="return postalCode2(event)"/></td>

							</tr>
							<tr>
								<td>Contact Number:<span style="color: red">*</span></td>
								<td><input value="<%=emp_emg_con1%>" id="curr_cont_no"
									style="background-color: #dfecf5; height: 28px; width: 160px"
									disabled="true" onchange="verifyPh_Curr()" /></td>

							</tr>
							<input type="hidden" id="curr_emp_id" value="<%=emp_id%>" />

						</table>
						<%
							}
							}
						%>
						<input type="button" id="edit_preadd" value="Edit"
							onclick="return edit_curr_addr()" style="width: 75px">
						&nbsp;<input type="button" id="update_curradd" value="Update"
							style="width: 75px"> <br />
						<div id="curr_addr_resp"></div>


					</div>

					<!--  <input id="reason" type="button" value="Reason"/>  -->
				</div>

				<!-- tab-5 end -->


<!-- tab-6 start -->
		<div id="tabs-6" style="background-color: #dfecf5; width:890px;" >

				<table id="clearance_table" 
					style="background-color: #dfecf5; margin-left: 2%; width: 100%;">
						<tr>
							<th>&nbsp;</th>

<!-- <th>Department</th>
<th>Task </th>
<th>Task Status</th>
<th>Task Assign Date</th>
<th>Amount</th>
<th>Remarks</th>
<th>Approver Mail Id</th> -->

							<th>Creation Date</th>
							<th>Task Owner Id</th>
							<th>Short Description</th>
							<th>Task Status</th>
						</tr>
					<%-- 	<%

DueClearance dc=new DueClearance();

ArrayList<String> arrObj=dc.getDueClearanceStatus(seq_no);
if (arrObj.size() > 0) {
for(int i=0;i<arrObj.size();i++){
	
	String strArray=arrObj.get(i).toString();
	String[] arrdata=strArray.split("\\^");
	
	String EMP_SEQ_NO=arrdata[0];
	String TASK_LIST=arrdata[1];
	String MANAGER_MAIL_ID=arrdata[2];
	String TASK_TYPE=arrdata[3];
	String REMARKS=arrdata[4];
	String AMOUNT=arrdata[5];
	String TASK_STATUS=arrdata[6];
	String date_assign=arrdata[7];
	%> --%>
	
		<%

DueClearance dc=new DueClearance();

ArrayList<String> arrObj=dc.getDueClearanceStatusfor_fnf(seq_no);

if (arrObj.size() > 0) {
for(int i=0;i<arrObj.size();i++){
	
	String strArray=arrObj.get(i).toString();
	String[] arrdata=strArray.split("\\^");
	
	String EMP_SEQ_NO=arrdata[0];
	String TASK_LIST=arrdata[1];
	String MANAGER_MAIL_ID=arrdata[2];
	String TASK_ASSIGN_DATE=arrdata[3];
	String TASK_STATUS=arrdata[4];
	String TASK_OWNER_REMARKS=arrdata[5];
	
	%>
	
	<tr>
	<td style="background-color: #CCCCCC;">&nbsp;</td>
	
	<td><%=TASK_ASSIGN_DATE %></td>
	<td><%=MANAGER_MAIL_ID %></td>
	<td><%=TASK_OWNER_REMARKS %></td>
	<td><%=TASK_STATUS %></td>
	</tr>
	
	<%
	
}
}
else{

%>

	<tr>
	<td colspan="5">Record Not Found</td>
	</tr>
	
	<%
}
	%>
</table>
				<br>
				
				
			
		</div>




		</div>
		
		</div>
		
		
		<br><br>

	<!-- </div> -->
	
	 </div> 
	 </div>
</body>
</html>