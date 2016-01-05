<html>
 <%@ page import="java.util.ArrayList"%>
 <%@ page import="com.ess.common.eseparation.E_separation_HR"%>
 
  <%@ page import="com.ess.common.eseparation.IT_Support_Dueclearance"%>
 

 <style type="text/css">
   
   .tab {border-collapse:collapse;}
   
   td, th {
   border:none;
}
 #oldtable table, th, td {
border: 1px; 
}

.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
border-bottom-right-radius: 16px;
}

.element.style {
color: red;
font-size: 15px;
}
   .ui-accordion .ui-accordion-content {
    padding: 0em 0.1em;
    border-top: 0;
  overflow: auto;
width: 1000px;
} 
 
h3 {
  font-weight:bold;
   font-family: Arial;
   font: bold;
   
}

#inlineTab {
            display: inline-block;
           width: 100px;
            font-size:10px;
            border: 0px;
        }
  #inlineTab tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #inlineTab td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
}

#inlineTab_duclear {
            display: inline-block;
           width: -1px;
            font-size:12px;
            border: 0px;
        }
  #inlineTab_duclear tr {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
}
  #inlineTab_duclear td {
  border-spacing: 0px;  
    border-style:none; 
     border: 0px;
    
}

  </style>
 
  <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "content",
      collapsible: true
    });
  });
  </script>
  
  
  <script>
$("#note").on('keydown', function(event) {
    var currentString = $("#note").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >999)  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script>
  
   <script>
$("#comments_approve").on('keydown', function(event) {
    var currentString = $("#comments_approve").val()
    $("Your Div").html(currentString.length);
    if (currentString.length >99 )  {  /*or whatever your number is*/
      return false;
    } else {
       return true;
    }
});

</script>
  
  <script>
  $(function() {
		$("#save").click(function() {
			
			var favorite = [];
			var task_valid_status_none;
			var amount_valid;
			var remarks_valid;
			
		
			 $('#mytable').find("tr.item").each(function () {
				
				var row = $(this);
			    var task_no = row.find("input.task_number").val();
			    //alert("task no"+task_no);
			    
			    
			    
			    favorite.push(task_no);
			      var  task_name = row.find("input.task_name").val();
			    //alert("task name"+task_name);
			    
			    
			    favorite.push(task_name);
			    var  status = row.find("select.status_type").val();
			  	//alert("status"+status);
			    if(status=="none selected")
			    	{
			    	 task_valid_status_none="select_one";
			    	}
			    else{
			    
			    favorite.push(status);
			     }
			    
			    
			    
			    var  amount = parseFloat(row.find("input.amount").val());
			    //alert("amount"+amount);
			  	//alert("status"+status);
			    if((status== "Setteled" || status=="To Be Setteled") && parseFloat(amount) <=parseFloat(0.9) || isNaN(amount) )
			    	{
			    	    //alert("amount column");
			    		amount_valid="enteramount";
			    		
			    	}
			    else{
			    	amount=0.0;
			    favorite.push(amount);
			    }
			    var  remarks = row.find("input.remarks").val();
			    //alert("remarks"+remarks);
			    if(remarks==""){
			    	remarks_valid="no";
			    }
			    favorite.push(remarks+";");
                //favorite.push(";");
			    
			    
			}); 
		     
			 
			 
			 if(task_valid_status_none=="select_one")
				 {
				 alert("Please Select Status");
				 return false;
				 }
			 
			 
			 if(amount_valid=="enteramount")
			 {
				 alert("Please Enter Amount");
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
				  else{
				var t_owner_remarks= $('#t_owner_remarks').val();
				//alert(t_owner_remarks);
			 
			 
			 
			//alert(favorite);
			
			var sequence_no= $('#sequence_no').val();
			//alert(sequence_no);
			
			/* 	if(note=="" || comments_approve=="")
				{
				alert("Please provide at least one remarks");
				return false;
				}*/
			 if (confirm('Are you sure you want process this?')) {  
				
			/* else{ */
				var result_data="&taskstatus=" + taskstatus+ "&t_owner_remarks=" + t_owner_remarks+ "&sequence_no=" +sequence_no+"&favorite="+favorite;
				
				alert(result_data);
				$.ajax({
					url : 'postLoginJsp/Due_Clearance/dueclearance_approve.jsp',
					type : 'POST',
					data : result_data,
					datatype : 'json',
					success : function(data) {
						//$("#qryload").html(data).delay(4000).fadeOut();
						$("#qryload").html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Please try Again");
					}
				});
					 /* } */  
			}
				}
				})
		});
  
  </script>
  
  <script>
  function run1()
  {
	  document.getElementById("comments_approve").value="Recommended";
  }
  </script>
  
  <script>
  function run_not()
  {
	  document.getElementById("comments_approve").value=" ";
	  document.getElementById("comments_approve").focus();
  }
  
  </script>
  
<body>



<%
String uName = (String) session.getAttribute("empid");
String rolename = (String) session.getAttribute("rolesession");
System.out.println("uname for manager"+uName);
System.out.println("rolename for manager"+rolename);
%>

<%
String dept=IT_Support_Dueclearance.dept_desig();
%>

<%
/* String seq_id=request.getParameter("id").trim(); */

E_separation_HR info_basic=new E_separation_HR();

ArrayList<String>  intial_data=info_basic.gettinge_requestDetails();
if (intial_data.size() > 0) {
	for (int i = 0; i < intial_data.size(); i++) {
		String intial_homepage = intial_data.get(i).toString();

String into_data[]=intial_homepage.split("\\^");

String emp_id=into_data[0];
String f_name=into_data[1];
String l_name=into_data[2];
String designation=into_data[3];
String mailid=into_data[4];
String doj=into_data[5];
String ctc=into_data[6];
String rm_name=into_data[7];
String phno=into_data[8];

%>
<%

IT_Support_Dueclearance info_basic2=new IT_Support_Dueclearance();

ArrayList<String> reg_man_process=info_basic2.e_separation_hr();
	if (reg_man_process.size() > 0) {
		for (int j = 0; j < reg_man_process.size(); j++) {
			String reg_data = reg_man_process.get(i).toString();
			
			String reg_arr[] = reg_data.split("\\^");
			String emp_id_sep=reg_arr[0];
			String seq_no = reg_arr[1];
			String creation_date = reg_arr[2];
			String reason_action = reg_arr[3];
			String detailed_reason = reg_arr[4];
			String rileaving_date = reg_arr[5];
			String actual_notice = reg_arr[6];
			String given_notice = reg_arr[7];
			
			String ACTION_TYPE_RM = reg_arr[8];
			String REASON_FOR_ACTION_RM = reg_arr[9];
			String DETAILED_REASON_RM = reg_arr[10];
			String PHY_REL_DATE_RM = reg_arr[11];
			String HR_RELIEVING_DATE = reg_arr[12];
			
			
%> 
 <div class="wrapper">

<div id="accordion" style="width:1000px;">
  <h3 style="background-color: #C0DEF5;"><b>Separation Details</b></h3>
  <div style="background-color: white !important;color: black; ">
  
 <table  class="inlineTab">
 <tr>
 <td colspan="3" style="padding-left:5em;"><u>Reason Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>

 <td colspan="1" style="padding-left:5em;"><u>Approved Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
 <td><input type="hidden" value="<%=seq_no %>" id="sequence_no"/></td>
 </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Personnel Number</td>
  <td colspan="2" style="padding-left:5em;"><input type="text" id="emp_id" style="background-color:#C0DEF5;height:26px;" value="<%=emp_id_sep%>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Action Type(A) </td>
  <td style="padding-left:5em;"> <input id="action" type="text"  value="<%=ACTION_TYPE_RM %>" style="background-color:#C0DEF5;height:26px;" readonly="readonly" /> </td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Reason for Action </td>
  <td colspan="2" style="padding-left:5em;"><input id="reason" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=reason_action%>" readonly="readonly"/> </td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Reason for Action(A) </td>
  <td style="padding-left:5em;"> <input id="reason_a" type="text" value="<%=REASON_FOR_ACTION_RM %>"  style="background-color:#C0DEF5;height:26px;" readonly="readonly" /> </td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Detailed Reason </td>
  <td colspan="2" style="padding-left:5em;"><input id="detailed" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=detailed_reason%>" readonly="readonly"/> </td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Detailed Reason(A) </td>
  <td style="padding-left:5em;"><input id="detailed_a" type="text"  value="<%=DETAILED_REASON_RM %>"  style="background-color:#C0DEF5;height:26px;" readonly="readonly" /></td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(R) </td>
  <td colspan="2" style="padding-left:5em;"><input id="relieving" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=rileaving_date %>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Physical Leaving Date (RM)</td>
  <td style="padding-left:5em;"><input id="relieving_rm" type="text" value="<%=PHY_REL_DATE_RM %>" style="background-color:#C0DEF5;height:26px;" readonly="readonly" /> </td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;">Actual Notice Period </td>
  <td colspan="2" style="padding-left:5em;"><input id="anp" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=actual_notice%>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(HR) </td>
  <td style="padding-left:5em;"><input id="r_date" type="text" value="<%=HR_RELIEVING_DATE %>" style="background-color:#C0DEF5;height:26px;"   readonly="readonly" /> </td>
  </tr>

   <tr>
  <td colspan="3">&nbsp;</td>
  <td style="padding-left:5em;">&nbsp;</td>
  <td style="padding-left:5em;">&nbsp;</td>
  </tr> 
  
<%
								}
								} else {
							%>
							<tr>
								<td colspan="16">No Records Available</td>
							</tr>

							<%
								}
							%>
  </table>
		
 </div>  

  <h3  style="background-color: #C0DEF5;"><b>Due Clearance</b></h3>
  <div style="background-color: white !important;color: black;">
  
  
  <div style="float:left">
   <b>Task/Item Details</b>
    <hr>
    <label style="padding-left:2em;">Created By Role/User :</label><input style="background-color:#C0DEF5;height:26px;" type="text" value="HR"/><br>
   <%--  <label style="padding-left:0em;">Approver Id/Group:</label><input style="background-color:#C0DEF5;height:26px;" type="text" value="<%=uName%>"/><br><br>
      --%>
    </div>
    
       <div style="float:right">
  	 <b style="padding-left:0em;">Task/Status Remarks</b>
    <hr>
   
    <label style="padding-left:2em;">Task Owner Id/Department :</label><input style="background-color:#C0DEF5;height:26px;" type="text" value="<%=dept%>"/><br>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <label style="padding-left:2em;">Task Status :</label>
  <select id="taskstatus">
  <option value="none selected">Select</option>
  <option value="Completed">Completed</option>
  <option value="Inprocess">Inprocess</option>
  <option value="Rejected">Rejected</option>
  </select><br><br>
 <label style="padding-left:0em;">Task Owner Remarks :</label>
 <textarea style="padding-left:10em;"  id="t_owner_remarks" rows="3" cols="30"   placeholder="Enter Comments here"></textarea>  
 
    </div> 
 
  </div>
  

  

    <%
								}
								} else {
							%>
							<!-- <tr>
								<td colspan="16">No Records Available</td>
							</tr> -->

							<%
								}
							%>
<!--   </table>
   
  </div> -->
  

  
  <h3 style="background-color: #C0DEF5"><b>Due Tasks</b></h3>
  <div style="background-color: white !important;color: black;">
  
  <table id="mytable" style="width:100%">
  <tr>
   <!-- <th style="background-color:#dfecf5;">&nbsp;</th> -->
  <th style="background-color:#dfecf5;">Task No</th>
  <th style="background-color:#dfecf5;">Task</th>
  <th style="background-color:#dfecf5;">Status</th>
  <th style="background-color:#dfecf5;">Amount</th>
  <th style="background-color:#dfecf5;">Remarks</th>
  
  </tr>
  
  
  <%
  IT_Support_Dueclearance info_basic2=new IT_Support_Dueclearance();
	ArrayList<String> intial_data2=info_basic2.department_based_department();
	
	if (intial_data2.size() > 0) {
		for (int i = 0; i < intial_data2.size(); i++) {
			String intial_homepage2 = intial_data2.get(i).toString();

	String into_data2[]=intial_homepage2.split("\\^");

	String task_number=into_data2[0];
	String task_name=into_data2[1];
	
	
%>
  <tr class="item">
  <!-- <td  style="background-color:#dfecf5;">&nbsp;</td> -->

  <td><input id="task_number" class="task_number" value="<%=task_number %>" style="background-color:#c0def5;height:26px;"/></td>
  <td><input  class="task_name" value="<%=task_name %>" style="background-color:#c0def5;height:26px;"/></td> 
  <td><select class="status_type">
  <option value="none selected">none seleted</option>
  <option value="Setteled">Setteled</option>
  <option value="To Be Setteled">To Be Setteled</option>
  <option value="Not Applicable">Not Applicable</option>
  </select></td>
  <td><input type="text" class="amount" style="background-color:white;height:26px;" value="0.0" id="dcamnt" onkeypress="return isdcamt(event)"/></td>
  <td><input type="text" class="remarks" style="background-color:white;height:26px;" /></td>
  
  </tr>
  
    
    <%
		}}
    %>
    
    </table>
  </div>

</div>
 </div>
	<input type="submit" id="save" value="submit"/><div id="qryload"></div>
	



 </body>
</html>