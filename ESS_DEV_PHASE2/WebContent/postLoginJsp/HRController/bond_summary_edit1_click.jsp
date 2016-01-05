<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement" %>
     <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <script type="text/javascript" src="regjs/fnf_settlement.js"></script>
 
 <script> 
  $(function() {
		$("#update_bnl21").click(function() {
			var favorite = [];
			var task_valid_status_none;
			var amount_valid;
			var remarks_valid;
			
			
			/* DYNAMIC ADDED ROW VALIDATION with Different-2 class name */
		      var requiredFields = $('#bond_loan_table_up').find('.des_bnl1,.begin_date_bnl1,.ending_date_bnl1,.effect_bnl1,.remarks_bnl1');

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
			
			
			
			 $('#bond_loan_table_up').find("tr.item").each(function () {
				
				var row = $(this);
			    var des_bnl1 = row.find("input.des_bnl1").val();
			   // alert("des_bnl1.."+des_bnl1);
			    favorite.push(des_bnl1);
			    
			      var  begin_date_bnl1 = row.find("input.begin_date_bnl1").val();
			  //  alert("begin_date_bnl1..."+begin_date_bnl1);
			    favorite.push(begin_date_bnl1);
			    
			    var  ending_date_bnl1 = row.find("input.ending_date_bnl1").val();
			  //  alert("ending_date_bnl1..."+ending_date_bnl1);
			    
			    favorite.push(ending_date_bnl1);
			    
			    var  effect_bnl1 = row.find("input.effect_bnl1").val();
			   // alert("effect_bnl1..."+effect_bnl1);
			    favorite.push(effect_bnl1);
			    
			    var  remarks_bnl1 = row.find("input.remarks_bnl1").val();
			    //alert("remarks_bnl1..."+remarks_bnl1);
			    favorite.push(remarks_bnl1);
			    
			    var  sid = row.find("input.sid").val();
			  //  alert("sid..."+sid);
			    favorite.push(sid);
			    
			   /*  var  sid = row.find("input.sid").val();
			    //alert("sid..."+sid);
			    favorite.push(sid); */
			    
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
				
				var result_data= "&favorite="+favorite;
				
				alert("dataString .."+result_data);
				$.ajax({
					url : 'postLoginJsp/HRController/bond_summary_update.jsp',
					type : 'POST',
					data : result_data,
					datatype : 'json',
					success : function(data) {
						$("#bond_summary_update").html(data).delay(4000).fadeOut();
						//$("#bond_summary_update").html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Please try Again");
					}
				});
					 /* } */  
			}
			/* 	} */  //else1 close
				})
		});
  
  </script>
</head>
<body>


<div
style="background-color: #98c3e2;color:black; margin-top: 0px; margin-left: -0%; padding-left: 15px; font-size: 15px; width: 102%;">
<b>Bond Summary</b>&nbsp;&nbsp;<div id="bond_summary_update"></div>
</div>
<form method="post">
<table id="bond_loan_table_up"
style="background-color: #dfecf5; margin-left: 0%; width: 100%;">
<tr >
	<th>Description</th>
	<th>Begin Date</th>
	<th>Ending Date</th>
	<th>Effect</th>
	<th>Remarks</th>
</tr>
<%

String sequence_no=request.getParameter("seq_no");

Full_N_Final_Settlement fnf_obj=new Full_N_Final_Settlement();

ArrayList<Object> list=fnf_obj.bond_edit_fetch_details(sequence_no);

if(list.size()>0){
	
	for(int i=0;i<list.size();i++){
		String fnf_data=list.get(i).toString();
	String fnf_arr[]=fnf_data.split("\\^");
	
	String resign_no=fnf_arr[0];
	String description=fnf_arr[1];
	String begg_date=fnf_arr[2];
	String end_date=fnf_arr[3];
	String effect=fnf_arr[4];
	String remarks=fnf_arr[5];
	String sid=fnf_arr[6]; 
	
	%>
	
 <tr class="item">
	<td><input type="text" name="description" id="des_bnl1" class="des_bnl1" value="<%=description %>" MAXLENGTH="30"  STYLE="height:24;width: 233px;border: 1 solid;margin:0;"></td>
	<td><input type="date" name="begin_date"  id="begin_date_bnl1" class="begin_date_bnl1" value="<%=begg_date %>"  MAXLENGTH="5"  STYLE="height:24;width: 145px;border: 1 solid;margin:0;" onchange="checking()"/></td>
	<td><input type="date" name="ending_date" id="ending_date_bnl1"  class="ending_date_bnl1"value="<%=end_date %>" MAXLENGTH="5"  STYLE="height:24;width: 145px;border: 1 solid;margin:0;" onchange="checking()"></td>
	<td><input type="text" name="effect"  id="effect_bnl1" class="effect_bnl1" MAXLENGTH="30" value="<%=effect %>" STYLE="height:24;width: 175px;border: 1 solid;margin:0;"   onkeypress="return isamt(event)"></td>
	<td><input type="text" name="remarks" id="remarks_bnl1" class="remarks_bnl1"  MAXLENGTH="40" value="<%=remarks %>"  STYLE="height:24;border: 1 solid;margin:0;"></td>
	
	<input type="hidden" value="<%=sequence_no %>" id="seq_no" class="seq_no" NAME="seq_no"/>
 <input type="hidden" value="<%=sid %>" id="sid" class="sid" name="sid"/>
</tr>

<%
}
	
}
%>
</table>


<center>
	<input type="button" id="addrow_bnl1" value="Add Row"
		onClick="addRow_bnl21('bond_loan_table_1')" style="width: 75px">&nbsp;<input
		type="button" id="save_bnl1" value="Save" style="width: 75px">&nbsp;<input
		type="button" id="edit_bnl1" value="Edit" style="width: 75px">
	&nbsp;<input type="button" id="update_bnl21" value="Update"
		style="width: 75px">&nbsp;<input type="reset"
		id="clear_bnl1" value="Clear" style="width: 75px"> <!-- &nbsp;<input
		type="button" id="cancel_bnl1" value="Cancel" style="width: 75px"> -->
</center><br><div id="bond_summary_save"></div>


</form>


</body>
</html>