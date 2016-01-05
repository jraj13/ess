<html>
 <%@ page import="java.util.ArrayList"%>
 <%@ page import="com.ess.common.eseparation.E_separation_HR"%>
 
 <%@ taglib prefix="s" uri="/struts-tags" %>

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
 


  </style>

 
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
			var emp_id = $('#emp_id').val();
			var action= $('#action').val();
			var reason_a= $('#reason_a').val();
			var detailed_a = $('#detailed_a').val();
			var relieving_rm= $('#relieving_rm').val();
			var r_date = $('#r_date').val();
			var sequence_no= $('#sequence_no').val();
			//alert(sequence_no);
			
			var recomended_status;
			var hr_withdraw_action="No";
			
			if(document.getElementById('check').checked) {
				hr_withdraw_action = document.getElementById('check').value;
			}
			//alert(hr_withdraw_action);
			
			if (document.getElementById('rec').checked) {
				recomended_status = document.getElementById('rec').value;
				}
			if (document.getElementById('notrec').checked) {
				recomended_status = document.getElementById('notrec').value;
				}
			var comments_approve = $('#comments_approve').val();
			var note=$('#note').val();
			
			if(action==""){
				alert("Please Enter Action Type");
				$('#action').focus();
				return false;
			}
			
			if(reason_a==""){
				alert("Please Enter Reason for Action");
				$('#reason_a').focus();
				return false;
			}
			if(detailed_a==""){
				alert("Please Enter Detailed Reason");
				$('#detailed_a').focus();
				return false;
			}
			
			if(relieving_rm==""){
				alert("Please select physical leaving date(RM)");
				$('#relieving_rm').focus();
				return false;
			}
			
			if(r_date==""){
				alert("Please select relieving date(HR)");
				$('#r_date').focus();
				return false;
			}
			
			if(recomended_status==undefined)
				{
				alert("Select approver decision");
				
				return false;
				}
			if(note=="" || comments_approve=="")
				{
				alert("Please provide at least one remarks");
				return false;
				}
			 if (confirm('Are you sure you want process this?')) {
				
				var result_data="&emp_id=" + emp_id+ "&action=" + action+ "&reason_a=" +reason_a+"&detailed_a=" + detailed_a
				+ "&relieving_rm=" + relieving_rm  + "&r_date=" + r_date+ "&recomended_status=" + recomended_status+ "&comments_approve=" + comments_approve
				+ "&note=" + note + "&hr_withdraw_action=" +hr_withdraw_action+ "&sequence_no=" +sequence_no;
				
				alert(result_data);
				$.ajax({
					url : 'postLoginJsp/HRController/hr_level_status_updated.jsp',
					type : 'POST',
					data : result_data,
					datatype : 'json',
					success : function(data) {
						$("#qryload").html(data).delay(2000).fadeOut();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Please try Again");
					}
				});
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
String seq_pdf_id=request.getParameter("SEQUENCE_NO").trim();
String rolename = (String) session.getAttribute("rolesession");
System.out.println("uname for manager"+uName);
System.out.println("rolename for manager"+rolename);
session.setAttribute("pdfseqid", seq_pdf_id);		
		
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
ArrayList<String> reg_man_process=info_basic.hr_overview();
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
			String HR_RELIEVING_DATE=reg_arr[12];
			
%> 




 <div class="wrapper">

<div id="accordion" style="width:1000px;">
  <h3 style="background-color: #C0DEF5;">Separation Details</h3>
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
  <td style="padding-left:5em;"><input id="r_date" type="date" style="background-color:#C0DEF5;height:26px;" value="<%=HR_RELIEVING_DATE %>" readonly="readonly" /> </td>
  </tr>
  

  </table>
		
	
 </div>  

  <h3  style="background-color: #C0DEF5;">Tasks List </h3>
  <div style="background-color: white !important;color: black;">
    <div style="float:left">
  <p>Plese tell me the task list</p>
    </div>
    
    
  </div>
  <h3 style="background-color: #C0DEF5">Correspondence Letters</h3>
  <div style="background-color: white !important;color: black;">
    <!-- <table  class="inlineTab"> -->
    <table width="80%">
	<tr>
	<td>Delete</td>
	<td>Details</td>
	<td>Email</td>
	<td>Letter Type</td>
	<td>Creation Date</td>
	<td>Issued Date</td>
	<td>Created By Role</td>
	</tr>
	<tr>
	<td>delete</td>
	<%-- <td><a href="<url action="downloadPdf"> Click here</a> "></a></td> --%>
	<!-- <td><a href="downloadPdf">Download PDF Document</a></td> -->
	<td><a href="<s:url action="pdf_dynamic"/>">click here</a></td>
	<!-- <td><a href="postLoginJsp/HRController/correspondance_letters.jsp" target=_blank style="background-color:red;">show</a></td> -->
	<!-- <td><a href="GuidelinesForm.pdf" download="GuidelinesForm.pdf">Download</a> -->
	<!-- <td><a href="postLoginJsp/HRController/correspondance_letters.jsp" download="GuidelinesFormhello.pdf">Download</a> -->
	<td>Email</td>
	<td>Acceptance of Resignation</td>
	<td><%=creation_date %></td>
	<td><%=HR_RELIEVING_DATE %></td>
	<td>System</td>
  </tr>
 
  </table>
   
  </div>
   <h3 style="background-color: #C0DEF5">Employee Details</h3>
  <div style="background-color: white !important;color: black;">
    <table  class="inlineTab">

  <tr>
  <td style="padding-left:5em;">Employee ID:</td>
  <td colspan="2" style="padding-left:5em;"><%=emp_id %></td>
  <td style="padding-left:5em;">Employee Name </td>
  <td style="padding-left:5em;"><%=f_name %><%=l_name %>  </td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;">Employee MailID: </td>
  <td colspan="2" style="padding-left:5em;"><%=mailid %> </td>
  <td style="padding-left:5em;">Designation </td>
  <td style="padding-left:5em;"><%=designation %>  </td>
  </tr>
  <tr>
  <td style="padding-left:5em;">Date of Join </td>
  <td colspan="2" style="padding-left:5em;"><%=doj %> </td>
  <td style="padding-left:5em;">CTC</td>
  <td style="padding-left:5em;"><%=ctc %></td>
  </tr>
  <tr>
  <td style="padding-left:5em;">Reporting Manager Name Mail ID</td>
  <td colspan="2" style="padding-left:5em;"><%=rm_name %> </td>
  <td style="padding-left:5em;">Contact Number</td>
  <td style="padding-left:5em;"><%=phno %></td>
  </tr>
  
  <tr>
    <%
								}
								} 
}
}
							%>
							
  </table>
  </div>

<h3 style="background-color: #C0DEF5">Administrative Data</h3>
  <div style="background-color: white !important;color: black;">
    <textarea id="note" rows="3" cols="150" placeholder="Enter Notes/Remarks Here"></textarea>
  </div>
  <h3 style="background-color: #C0DEF5">Notes/ Remarks</h3>
  <div style="background-color: white !important;color: black;">
    <textarea id="note" rows="3" cols="150" placeholder="Enter Notes/Remarks Here"></textarea>
  </div>

</div>

 </div>
	<input type="submit" id="save" value="submit"/>



 </body>
</html>