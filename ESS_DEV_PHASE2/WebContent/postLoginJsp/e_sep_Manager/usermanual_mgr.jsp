<html>
 <%@ page import="java.util.ArrayList"%>
 <%@ page import="com.ess.common.eseparation.Managerseparation"%>
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
<script >
function fileUpload(form, action_url, div_id) {
    // Create the iframe...
    var iframe = document.createElement("iframe");
    iframe.setAttribute("id", "upload_iframe");
    iframe.setAttribute("name", "upload_iframe");
    iframe.setAttribute("width", "0");
    iframe.setAttribute("height", "0");
    iframe.setAttribute("border", "0");
    iframe.setAttribute("style", "width: 0; height: 0; border: none;");
 
    // Add to document...
    form.parentNode.appendChild(iframe);
    window.frames['upload_iframe'].name = "upload_iframe";
 
    iframeId = document.getElementById("upload_iframe");
 
    // Add event...
    var eventHandler = function () {
 
            if (iframeId.detachEvent) iframeId.detachEvent("onload", eventHandler);
            else iframeId.removeEventListener("load", eventHandler, false);
 
            // Message from server...
            if (iframeId.contentDocument) {
                content = iframeId.contentDocument.body.innerHTML;
            } else if (iframeId.contentWindow) {
                content = iframeId.contentWindow.document.body.innerHTML;
            } else if (iframeId.document) {
                content = iframeId.document.body.innerHTML;
            }
 
            document.getElementById(div_id).innerHTML = content;
 
            // Del the iframe...
            setTimeout('iframeId.parentNode.removeChild(iframeId)', 250);
        }
 
    if (iframeId.addEventListener) iframeId.addEventListener("load", eventHandler, true);
    if (iframeId.attachEvent) iframeId.attachEvent("onload", eventHandler);
 
    // Set properties of form...
    form.setAttribute("target", "upload_iframe");
    form.setAttribute("action", "UploadServlet");
    form.setAttribute("method", "post");
    form.setAttribute("enctype", "multipart/form-data");
    form.setAttribute("encoding", "multipart/form-data");
 
    // Submit the form...
    form.submit();
 
    document.getElementById(div_id).innerHTML = "Uploading...";
}
</script>
 
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
			
			
			var rate_value;
			if (document.getElementById('rec').checked) {
				  rate_value = document.getElementById('rec').value;
				}
			if (document.getElementById('notrec').checked) {
				  rate_value = document.getElementById('notrec').value;
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
				alert("Please select Physical Leaving Date(RM)");
				$('#relieving_rm').focus();
				return false;
			}
			
			if(r_date==""){
				alert("Please Select Relieving Date(HR)");
				$('#r_date').focus();
				return false;
			}
			
			if(rate_value==undefined)
				{
				alert("select Approver Decision");
				
				return false;
				}
			if(note=="" || comments_approve=="")
				{
				alert("Please provide at least one remarks");
				return false;
				}
			 if (confirm('Are you sure you want process this?')) {
				
				var result_data="&emp_id=" + emp_id+ "&action=" + action+ "&reason_a=" +reason_a+"&detailed_a=" + detailed_a
				+ "&relieving_rm=" + relieving_rm  + "&r_date=" + r_date+ "&rate_value=" + rate_value+ "&comments_approve=" + comments_approve
				+ "&note=" + note;
				$.ajax({
					url : 'postLoginJsp/e-separation_ELC/manager_level_status_accept.jsp',
					type : 'POST',
					data : result_data,
					datatype : 'json',
					success : function(data) {
						
						$("#qryload").html(data);
						
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
<!-- index.php could be any script server-side for receive uploads. -->
<body>
<form>


<%
String uName = (String) session.getAttribute("empid");
String rolename = (String) session.getAttribute("rolesession");
System.out.println("uname for manager"+uName);
System.out.println("rolename for manager"+rolename);
%>
<%
/* String seq_id=request.getParameter("id").trim(); */

Managerseparation info_basic=new Managerseparation();

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


%>
<%
ArrayList<String> reg_man_process=info_basic.e_separation_manager();
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
%> 
 <div class="wrapper">

<div id="accordion" style="width:1000px;">
  <h3 style="background-color: #C0DEF5;">Separation Details</h3>
  <div style="background-color: white !important;color: black; ">
  
 <table  class="inlineTab">
  <tr>
  
  <td colspan="3" style="padding-left:5em;"><u>Reason Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  <td colspan="2" style="padding-left:5em;"><u>Approved Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
 
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Personnel Number</td>
  <td colspan="2" style="padding-left:5em;"><input type="text" id="emp_id" style="background-color:#C0DEF5;height:26px;" value="<%=emp_id_sep%>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Action Type(A) </td>
  <td style="padding-left:5em;"> <input id="action" type="text" style="background-color:white;height:26px;" /> </td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Reason for Action </td>
  <td colspan="2" style="padding-left:5em;"><input id="reason" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=reason_action%>" readonly="readonly"/> </td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Reason for Action(A) </td>
  <td style="padding-left:5em;"> <input id="reason_a" type="text" style="background-color:white;height:26px;" /> </td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Detailed Reason </td>
  <td colspan="2" style="padding-left:5em;"><input id="detailed" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=detailed_reason%>" readonly="readonly"/> </td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Detailed Reason(A) </td>
  <td style="padding-left:5em;"><input id="detailed_a" type="text" style="background-color:white;height:26px;" /></td>
  </tr>
  <tr>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(R) </td>
  <td colspan="2" style="padding-left:5em;"><input id="relieving" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=rileaving_date %>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Physical Leaving Date (RM)</td>
  <td style="padding-left:5em;"><input id="relieving_rm" type="date" style="background-color:white;height:26px;" /> </td>
  </tr>
  
  <tr>
  <td style="padding-left:5em;">Actual Notice Period </td>
  <td colspan="2" style="padding-left:5em;"><input id="anp" type="text" style="background-color:#C0DEF5;height:26px;" value="<%=actual_notice%>" readonly="readonly"/></td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Relieving Date(HR) </td>
  <td style="padding-left:5em;"><input id="r_date" type="date" style="background-color:white;height:26px;"   /> </td>
  </tr>
  <br>
  <tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
    <tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
  
  <!-- <tr>
  <td colspan="3">&nbsp;</td>
  <td style="padding-left:5em;"><span style="color:red">*</span>Withdrawal Allowed </td>
  <td style="padding-left:5em;"><input type="checkbox" value=" " /></td>
  </tr> -->
  
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

  <h3  style="background-color: #C0DEF5;">Approval</h3>
  <div style="background-color: white !important;color: black;">
    <div style="float:left">
   <b>Approver Decision</b>
    <hr>
    <label style="padding-left:2em;">Approver Role :</label><input style="background-color:#C0DEF5;height:26px;" type="text" value="<%=rolename%>"/><br>
    <label style="padding-left:0em;">Approver Id/Group:</label><input style="background-color:#C0DEF5;height:26px;" type="text" value="<%=uName%>"/><br><br>
    <div id="rates">
    <label>Approver Action:</label> <input type="radio" name="rb"  id="rec" onClick="run1()" value="Inprocess"/>Recommended 
    								<input type="radio" name="rb"  id="notrec"  onClick="run_not()" value="Reject"/>Not Recommended
    </div>
    </div>
   
    
       <div style="float:right">
   <b style="padding-left:2em;">Approver Remarks</b>
    <hr>
    <!-- <input type="text" id="appr_remarks" name="appr_remarks" value=""/> -->
    <input type="hidden" id="appr_remarks1" name="appr_remarks1" value="Recommended"/>
    <input type="hidden" id="appr_remarks2" name="appr_remarks2" value="Not Recommended"/>
 <textarea style="padding-left:10em;"  id="comments_approve" rows="3" cols="30"   placeholder="Enter Comments here"></textarea>  
    </div> 
    
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
  <h3 style="background-color: #C0DEF5">Notes/ Remarks</h3>
  <div style="background-color: white !important;color: black;">
    <textarea id="note" rows="3" cols="150" placeholder="Enter Notes/Remarks Here"></textarea>
  </div>
  <h3 style="background-color: #C0DEF5">Attachments</h3>
  <div style="background-color: white !important;color: black;">
   <input type="file" name="datafile" /><br/>
<input type="button" value="upload"
        onClick="fileUpload(this.form,'/UploadServlet','upload'); return false;" >
<div id="upload"></div>
  </div>
</div>
 </div>
	<input type="submit" id="save" value="submit"/>
	
<%
Object file_name=request.getAttribute("path");
System.out.println("attribute of the "+file_name);
%>
<a href="/DownloadServlet" target="_new">Click to download</a>
<a href="Form16/Choice Pay.pdf" target="_new">download</a>


</form>
 </body>
</html>