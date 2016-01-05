<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="regjs/fnf_settlement.js"></script> -->

<script>
	$(function() {
		$("#update_bnl22")
				.click(
						function() {
							var favorite = [];
							var task_valid_status_none;
							var amount_valid;
							var remarks_valid;

							
							/* DYNAMIC ADDED ROW VALIDATION with Different-2 class name */
						      var requiredFields = $('#bond_loan_table_down').find('.subtype_bnl2,.description_bnl2,.loan_amount_bnl2,.balance_amount_bnl2,.repay_amount_bnl2');

							var allFieldsComplete = true;
						        var str=requiredFields.each(function(index) {
						            if (this.value.length == 0) {
						                $(this).addClass('requiredIncomplete');
						                //allFieldsComplete = false;
						                alert("Please fill all values !");
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
							$('#bond_loan_table_down').find("tr.item").each(function() {

								var row = $(this);
							var subtype_bnl2 = row.find("input.subtype_bnl2").val();
							//alert("subtype_bnl2.."+ subtype_bnl2);
							favorite.push(subtype_bnl2);

							var description_bnl2 = row.find("input.description_bnl2").val();
												//alert("description_bnl2..."+ description_bnl2);
							favorite.push(description_bnl2);

							var loan_amount_bnl2 = row.find("input.loan_amount_bnl2").val();
												//alert("loan_amount_bnl2..."+ loan_amount_bnl2);

							favorite.push(loan_amount_bnl2);

							var balance_amount_bnl2 = row.find("input.balance_amount_bnl2").val();
												//alert("balance_amount_bnl2..."+ balance_amount_bnl2);
						    favorite.push(balance_amount_bnl2);

							var repay_amount_bnl2 = row.find("input.repay_amount_bnl2").val();
												//alert("repay_amount_bnl2..."+ repay_amount_bnl2);
							favorite.push(repay_amount_bnl2);

							var sid = row.find("input.sid").val();
												//alert("sid..." + sid);
							favorite.push(sid);

												/* 		   
														    var  remarks = row.find("input.remarks").val();
														    //alert("remarks"+remarks);
														    if(remarks==""){
														    	remarks_valid="no";
														    }
														    favorite.push(remarks+";"); */
								favorite.push(";");

											});

							/* 		 if(task_valid_status_none=="select_one")
										 {
										 alert("Please Select Status");
										 return false;
										 }
									
									 if(remarks_valid=="no")
										 {
										 alert("Please Enter Remarks");
										 return false;
										 }
									 
									 var taskstatus = $('#taskstatus').val();
										//alert(taskstatus);
										  if(taskstatus=="none selected")
											{
											alert("Please select status from Due Clearance");
											return false;
											} 
										  else{      //else1
										var t_owner_remarks= $('#t_owner_remarks').val();
										//alert(t_owner_remarks);
									//alert(favorite);
							 */
							/* 	var sid= $('#sid').val();
								alert("sid..."+sid); */

							if (confirm('Are you sure you want process this?')) {

								/* else{ */
								/* var result_data="&sid=" + sid+ "&favorite="+favorite; */

								var result_data = "&favorite=" + favorite;

								alert("dataString .." + result_data);

								$
										.ajax({
											url : 'postLoginJsp/HRController/loan_summary_update.jsp',
											type : 'POST',
											data : result_data,
											datatype : 'json',
											success : function(data) {
												$("#loan_summary_update").html(
														data).delay(4000)
														.fadeOut();
												//$("#bond_summary_update").html(data);
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												alert("Please try Again");
											}
										});
								/* } */
							}
							/* 	} *///else1 close
						})
	});
</script>

<!--  <script src="jstest/jquery1-1.10.2.js"></script>
  <script src="jstest/jquery3-ui.js"></script>
  <script type="text/javascript">
  $(document).ready(function () {
  var unsaved = false;

  $(":input").change(function(){ //trigers change in all input fields including text type
      unsaved = true;
  });

  function unloadPage(){ 
      if(unsaved){
          return "You have unsaved changes on this page. Do you want to leave this page and discard your changes or stay on this page?";
      }
  }

  window.onbeforeunload = unloadPage;
  });
  </script> -->

</head>
<body>


	<div
		style="background-color: #98c3e2; color: black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 102%;">
		<b>Bond Summary</b>&nbsp;&nbsp;<div id="loan_summary_update"></div>
	</div>
	<form method="post">
		<table id="bond_loan_table_down"
			style="background-color: #dfecf5; margin-left: 0%; width: 100%;">
			<tr>
				<th>Sub Type</th>
				<th>Description</th>
				<th>Loan Amount</th>
				<th>Balance Amount</th>
				<th>Special Repayment</th>
				<!-- <th>...</th> -->
			</tr>
			<%
				String sequence_no = request.getParameter("seq_no");

				Full_N_Final_Settlement fnf_obj = new Full_N_Final_Settlement();

				ArrayList<Object> list = fnf_obj
						.loan_edit_fetch_details(sequence_no);

				if (list.size() > 0) {

					for (int i = 0; i < list.size(); i++) {
						String fnf_data = list.get(i).toString();
						String fnf_arr[] = fnf_data.split("\\^");

						String resign_no = fnf_arr[0];
						String sub_type = fnf_arr[1];
						String des_loan = fnf_arr[2];
						String loan_amount = fnf_arr[3];
						String bal_amount = fnf_arr[4];
						String spe_repay_amount = fnf_arr[5];
						String sid = fnf_arr[6];
			%>




			<tr class="item">
				<td><input type="text" NAME="subtype" id="subtype_bnl2"
					class="subtype_bnl2" value="<%=sub_type%>" MAXLENGTH="30"
					STYLE="height: 24; width: 230px; border: 1 solid; margin: 0;"></td>
				<td><input type="text" NAME="description" id="description_bnl2"
					class="description_bnl2" value="<%=des_loan%>" MAXLENGTH="30"
					STYLE="height: 24; width: 293px; border: 1 solid; margin: 0;"></td>
				<td><input type="text" NAME="loan_amount" id="loan_amount_bnl2"
					class="loan_amount_bnl2" value="<%=loan_amount%>" MAXLENGTH="30"
					STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
					onkeypress="return isLoanAmt(event)"></td>
				<td><input type="text" NAME="balance_amount"
					id="balance_amount_bnl2" class="balance_amount_bnl2"
					value="<%=bal_amount%>" MAXLENGTH="30"
					STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
					onkeypress="return isBalAmt(event)"></td>
				<td><input type="text" NAME="repay_amount"
					id="repay_amount_bnl2" class="repay_amount_bnl2" MAXLENGTH="30"
					value="<%=spe_repay_amount%>"
					STYLE="height: 24; width: 120px; border: 1 solid; margin: 0;"
					onkeypress="return isRepayAmt(event)"></td>

				<input type="hidden" value="<%=sequence_no%>" id="seq_no"
					class="seq_no" NAME="seq_no" />
				<input type="hidden" value="<%=sid%>" id="sid" class="sid"
					name="sid" />

			</tr>

			<%
				}

				}
			%>
		</table>


		<center>
			<input type="button" id="add_bnl2" value="Add Row"
				onClick="addRow_bnl2('bond_loan_table_2')" style="width: 75px">&nbsp;<input
				type="button" id="save_bnl2" value="Save" style="width: 75px">&nbsp;<input
				type="button" id="edit_bnl2" value="Edit" style="width: 75px">
			&nbsp;<input type="button" id="update_bnl22" value="Update"
				style="width: 75px">&nbsp;<input type="reset"
				id="clear_bnl2" value="Clear" style="width: 75px"><!--  &nbsp;<input
				type="button" id="cancel_bnl2" value="Cancel" style="width: 75px"> -->
		</center>
		<br>
		<div id="loan_summary_save"></div>
		

	</form>



</body>
</html>