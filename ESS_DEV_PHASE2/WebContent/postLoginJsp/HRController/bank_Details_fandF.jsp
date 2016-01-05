<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.Temporary_saving_Draft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="regjs/fandfscript.js"></script> 
<script>
$(function() {
	$('#bank_draft').click(function() {
		
		
		var bank_emp=$('#bank_emp').val();
		//alert("bank emp"+bank_emp);
		var acc_no_emp=$('#acc_no_emp').val();
		//alert("acc_no_emp"+acc_no_emp);
		
		
		
		var micr_no_emp=$('#micr_no_emp').val();
		//alert("micrno"+micr_no_emp);
		
		var cheque_adv=$('#cheque_adv').val();
		
		//alert("cheque_adv"+cheque_adv);
		
		
		var bank_acc_adv=$('#bank_acc_adv').val();
		//alert("bank_acc_adv"+bank_acc_adv);
		
		
		var bank_name_adv=$('#bank_name_adv').val();
		//alert("bank_name_adv"+bank_name_adv);
		
		var amout_adv=$('#amout_adv').val();
		//alert("amout_adv"+amout_adv);
		
		var date_adv=$('#date_adv').val();
		//alert("date_adv"+date_adv);
		
		var seq_no=$('#seq_no').val();
		//alert("seq_no"+seq_no);
		
		dataString="&bank_emp=" +bank_emp+"&acc_no_emp=" +acc_no_emp+"&micr_no_emp=" +micr_no_emp+"&cheque_adv=" +cheque_adv+"&bank_acc_adv=" +bank_acc_adv+"&bank_name_adv=" +bank_name_adv+"&amout_adv=" +amout_adv+"&date_adv="+date_adv+"&seq_no=" +seq_no;
		
		$.ajax({
			url : 'postLoginJsp/HRController/bank_insert_fandf_values.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				$('#bank_info').html(data).delay(5000).fadeOut(); 
				 //$("#bank_info").html('bank details successfully ------------------------!').delay(5000).fadeOut();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("internal problem");
			}
		});
		
		

		
	})
		
	});



</script>

<script>

function amount(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("amout_adv").value;
        var len = document.getElementById("amout_adv").value.length; 
        var index = document.getElementById("amout_adv").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>10)
        	{
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


<body>
<%
String Seq_no=request.getParameter("seq_no_ajax").trim();

Temporary_saving_Draft bank_draft=new Temporary_saving_Draft();

ArrayList<String> bank_info_new=bank_draft.bank_info_fandf_settlement(Seq_no);

if (bank_info_new.size() > 0) {
	for (int i = 0; i < bank_info_new.size(); i++) {
		String set_data_bank_new = bank_info_new.get(i).toString();
		
		String bank_arr_new[] = set_data_bank_new.split("\\^");
		String BANK_EMP = bank_arr_new[0];
		String ACC_NO_EMP = bank_arr_new[1];
		
		
		
		String MICR_NO_EMP = bank_arr_new[2];
		String CHEQUE_ADV = bank_arr_new[3];
		
		String BANK_ACC_ADV = bank_arr_new[4];
		String BANK_NAME_ADV = bank_arr_new[5];
		
		String AMOUNT_ADV = bank_arr_new[6];
		String DATE_ADV = bank_arr_new[7];
		
		String seq_no=bank_arr_new[8];
		
		System.out.println("in jsp date is"+DATE_ADV);
		if(DATE_ADV.equalsIgnoreCase("null"))
		{
			DATE_ADV="";
		}
		
		

%>
<div id="bank_info"></div>

<table id="bank_table_1" style="background-color: white;">
						<tr>
							<td>Bank Account Details:</td>
							<td><b>Saving</b></td>
							<td>Types of Bank Account:</td>
							<td><b>Salary Account</b></td>
						</tr>
						<tr>
							<td>Bank Name:</td>
							<td><input value="<%=BANK_EMP %>" id="bank_emp"
								style="background-color: white; height: 28px; width: 160px" /></td>
							<td>Bank Account No</td>
							<td><input value="<%=ACC_NO_EMP %>" id="acc_no_emp"
								style="background-color: white; height: 28px; width: 160px"
								onkeypress="return accNo(event)" /></td>
						</tr>
						<tr>
							<td>MICR No.:</td>

							<td><input value="<%=MICR_NO_EMP %>" id="micr_no_emp"
								style="background-color: white; height: 28px; width: 160px"
								 /></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

					</table>
					<hr style="height: 30px; margin-left: -1.7%; width: 101.8%;">

					<div
						style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Advance Details</b>
					</div>
					<table id="bank_table_2">
						<tr>
							<td>Cheque no.:<span style="color: red">*</span></td>
							<td><input value="<%=CHEQUE_ADV %>" id="cheque_adv"
								style="background-color: white; height: 28px; width: 160px"
								 /></td>
							<td>Bank Account:<span style="color: red">*</span></td>
							<td><input value="<%=BANK_ACC_ADV %>" id="bank_acc_adv"
								style="background-color: white; height: 28px; width: 160px"
								 onkeypress="return accNoAdv(event)"/></td>
							<td>Bank Name:<span style="color: red">*</span></td>
							<td><input value="<%=BANK_NAME_ADV %>" id="bank_name_adv"
								style="background-color: white; height: 28px; width: 160px"
								 /></td>
						</tr>
						<tr>
							<td>Amount:<span style="color: red">*</span></td>
							<td><input value="<%=AMOUNT_ADV %>" id="amout_adv"
								style="background-color: white; height: 28px; width: 160px"
								 onkeypress="return amount(event)" /></td>
							<td>Date:<span style="color: red">*</span></td>
							<td><input type="date" value="<%=DATE_ADV %>" id="date_adv"
								style="background-color: white; height: 28px; width: 160px"
								 /></td>
							<td>&nbsp;</td>
							<td><input type="hidden" id="seq_no" value="<%=seq_no %>"/></td>
				
						</tr>

					</table>
					<%
					}
					}
					%>



					<hr style="height: 30px; margin-left: -1.7%; width: 101.8%;">

					<div
						style="background-color: #98c3e2; color: black; margin-top: -46px; margin-left: -1.7%; padding-left: 15px; font-size: 15px; width: 101.8%;">
						<b>Payment Details</b>
					</div>
					<table id="bank_table_3">
					<%
					ArrayList<String> bank_info=bank_draft.bank_retrieval(Seq_no);

					if (bank_info.size() > 0) {
						for (int i = 0; i < bank_info.size(); i++) {
							String set_data_bank = bank_info.get(i).toString();
							
							String bank_arr[] = set_data_bank.split("\\^");
							String bank_name = bank_arr[0];
							String acc_no = bank_arr[1];
					%>
						<tr>
							<td><input type="checkbox" value="checked">Payment
								to Salary Account</td>
							<td>&nbsp;</td>

						</tr>
						<tr>

							<td>Bank Account:</td>
							<td><input value="<%=acc_no %>" id="ac_no3"
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
							<td>Bank Name:</td>
							<td><input value="<%=bank_name %>" id="bank_name3"
								style="background-color: #dfecf5; height: 28px; width: 160px"
								 readonly="readonly"/></td>
						</tr>
						

					</table>
					<input type="button" id="bank_draft" value="Save As Draft"/>
<%
	}
}
%>
</body>
</html>