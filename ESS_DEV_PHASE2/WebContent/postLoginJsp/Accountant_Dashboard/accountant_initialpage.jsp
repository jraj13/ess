<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.WorkSheet_FandF" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#fnf_select_table{
border:1;
    
}
#fnf_select_table tr{
border-spacing: 0px;
	border-style: none;
	border: 0px;
}
#fnf_select_table td{
border-spacing: 0px;
	border-style: none;
	border: 0px;
}

</style>
</head>



 <script>

$(function() {
	$('#search_fnf_req').click(function() {
		
				//getting pl information for column1 
				var fdate = $('#fdate').val();
				var tdate=$('#tdate').val();
				var status = $('#status').val();
				
				if(fdate=="" ||fdate==null){
					alert("Please select from date !");
				}
				
				else if(tdate=="" ||tdate==null){
					alert("Please select to date !");
				}
				else if(status=="none selected" ||status==null){
					alert("Please select status !");
				}
				else{
				var dataString = "&fdate=" + fdate + "&tdate=" + tdate
							+ "&status=" + status;
				//	alert(dataString);
			
					$.ajax({
						url : 'postLoginJsp/HRController/full_final_hr_fetching_display_Main.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							 $('#lrmain_res').html(data); 
							/* $("#result").html('Draft saved successfully!').delay(5000).fadeOut();   */				
						},
						error : function(jqXHR, textStatus, errorThrown) {
							/* $("#result").html('Draft Not saved!').delay(5000).fadeOut(); */
						}
					});
				}
				})
	});
	
	
	
	function open_newpage_fandf(id){
    	//alert(id);
    	
    	var dataString='&seq_no='+id;
    	
				$.ajax({
					//url :'postLoginJsp/SA_Dashbord/fandF_settlement_phase3_hr.jsp',
					url :'postLoginJsp/Accountant_Dashboard/worksheet_controller_ac.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
					 /* $('#qryload').html(data).delay(5000).fadeOut(); */ 
						 $('#qryload').html(data); 
					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
    };

</script> 

<body>
<div id="qryload">



<%
System.out.println("This is the page for full and final fetching page");
		//String from_date=request.getParameter("from_date").trim();
		//String to_date=request.getParameter("to_date").trim();
		
		//String result=f_f.f_f_settlement();
		
		//System.out.println("final result is"+result);
%>





<div id="fnf_hr_table_1"
		style="margin-top: -15px; margin-left: -2.5%; padding-left: 15px; font-size: 15px; width: 102.5%;">

		<div
			style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>Full & Final Settlement</b>
		</div>

		<br>
		<!-- <div
			style="background-color: #98c3e2; margin-top: 5px; margin-left: 0.0%; padding-left: 15px; font-size: 15px; width:101.5%;">
			<b>Full & Final Settlement Module</b>
		</div>
			<table id="fnf_select_table" border="1" style="margin-top: -90px;magrin-left:0.5%;">
				<div id="fnf_hr_table_2" style="width: 93%; margin-left: -0.0%;">
					<br>
					<tr>
						<td style="padding-left: 15px;">From Date:<span style="color:red">*</span></td>
						<td><input type="date" id="fdate" style="height: 26px;" /></td>
						<td >&nbsp;To Date:<span style="color:red">*</span></td>
						<td><input type="date" id="tdate" style="height: 26px;" /></td>
					</tr>

					<tr>
						<td style="padding-left: 15px;">Business:</td>
						<td><select><option value="none selected">Select</option>
						<option value="NCSS">NCSS</option>
						<option value="NCSS_EDU">NCSS EDUCATION</option></select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">Company:</td>
						<td><select><option value="none selected">Select</option>
						<option value="NCSS">NCSS</option>
						<option value="NCSS_EDU">NCSS EDUCATION</option></select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td style="padding-left: 15px;">Status:<span style="color:red">*</span></td>
						<td><select id="status"><option
									value="none selected">Select</option>
								<option value="All">All</option>
								 all fnf cases
								<option value="New">New</option>
								 all new cases
								<option value="Submitted to SA">Submitted to SA</option>
								 HR submits to sanctioning authority
								<option value="Submitted to A/C">Submitted to A/C</option>
								 Sanctioning Authority Submits to A/C
								<option value="Returned to HR">Returned to HR</option>
								 Sanctioning Authority Resends to HR

						</select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td style="padding-left: 15px;"><input type="button" value="Search"
							id="search_fnf_req" style="background-color: #FFFF99; height: 28px; width: 80px;" /></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

				</div>

		<br>&nbsp;<br>
			</table>
			 -->
			
<div id="lrmain_res">

			<div id="fnf_hr_table_3"
			style="margin-top: 5px; margin-left: -0.0%; padding-left: 15px; font-size: 15px; width: 93%;">
			<div
				style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.6%; padding-left: 15px; font-size: 15px; width: 101.5%;">
				<b>Employee Details</b>
			</div>

<!-- 			<div
				style="background-color: #98c3e2; margin-top: 0.66px; margin-left: -1.6%; padding-left: 15px; width: 101.5%;">
				<button type="button" value="Continue" id="fnf_settlement_action" onclick="openPage11(id)"
					style="background-color: #FFFF99; height: 28px; width: 80px;">
					<span class="glyphicon glyphicon-ok"
				style="color: green; padding-left: 0px;"></span>
					Action
				</button>
				<button type="button" value="Continue" id="hrcreatereq"
					onclick="openPage11(id)"
					style="background-color: #FFFF99; height: 28px; width: 80px;">
					<span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span>
					Display
				</button>

			</div>



			<div
				style="background-color: #98c3e2; margin-top: 5px; margin-left: 0%; padding-left: 15px; font-size: 15px; width: 93%;">
				<b><label>View:</label>&nbsp;<select><option
							value="Standard View">[Standard View]</option></select>&nbsp;&nbsp;
					<button type="button" value="Continue" id="hrcreatereq"
						onclick="openPage(id)"
						style="background-color: #FFFF99; height: 28px; width: 80px;">
						<span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span>
						Export
					</button></b> <a href="#" style="float: right; color: blue;">Filter Setting</a>
			</div> -->
			<table border="1" style="width: 93%;">
				<tr style="background-color: #CCCCCC;">
					<th>&nbsp;</th>
					<th>Status</th>
					<th>Employee Number</th>
					<th>Employee Name</th>
					<th>Date Of Leaving</th>
					<th>Joining Date</th>
					<th>Resignation Date</th>
				</tr>
			
 <%
 WorkSheet_FandF f_f=new WorkSheet_FandF();
ArrayList<Object> settelement=f_f.fnfSettelmentInfo_ACC();


	if (settelement.size() > 0) {
		for (int i = 0; i < settelement.size(); i++) {
			String set_data = settelement.get(i).toString();
			
			String set_data_arr[] = set_data.split("\\^");
			String emp_id = set_data_arr[0];
			String fname = set_data_arr[1];
			String lname = set_data_arr[2];
			String emp_jd = set_data_arr[3];
			String leaving = set_data_arr[4];
			String resignation_date = set_data_arr[5];
			String seq_no=set_data_arr[6];
			String HR_CLEARANCE_PROCCESS_STATUS=set_data_arr[7];
%>
			
				<tr>
				<td style="background-color: #CCCCCC;" >
				<button type="button" id="<%=seq_no %>" class="use-address"
						onclick="open_newpage_fandf(id);"
						style="background-color: white; height: 28px; width: 50px;">
						<span class="glyphicon glyphicon-pencil"
				style="color: black; padding-left: 0px;"></span> 
					</button>
				
				</td>
					<td style="background-color: #dfecf5;"><%=HR_CLEARANCE_PROCCESS_STATUS %></td>
					<td style="background-color: #dfecf5;" id="empid"><%=emp_id %></td>
					<td style="background-color: #dfecf5;"><%=fname %><%=lname%></td>
					<td style="background-color: #dfecf5;"><%=leaving %></td>
					<td style="background-color: #dfecf5;"><%=emp_jd %></td>
					<td style="background-color: #dfecf5;"><%=resignation_date %></td>
				</tr>
				
				
 <%
	}
	} else {

%> 
<tr>
	<td colspan="10">No Records</td>
</tr>

 <%
	}
%>  

<!-- <tr>
				<td style="background-color: #CCCCCC;" >
				<button type="button" id="" class="use-address"
						onclick="open_newpage_fandf11(id);"
						style="background-color: white; height: 28px; width: 50px;">
						<span class="glyphicon glyphicon-pencil"
				style="color: black; padding-left: 0px;"></span> 
					</button></b>
				
				<input type="button" id="" class="use-address" value="Show" onclick="open_newpage_fandf(id);"/></td>
					<td style="background-color: #dfecf5;">&nbsp;</td>
					<td style="background-color:#dfecf5;" id="empid">&nbsp;</td>
					<td style="background-color: #dfecf5;">&nbsp;</td>
					<td style="background-color: #dfecf5;">&nbsp;</td>
					<td style="background-color: #dfecf5;">&nbsp;</td>
					<td style="background-color: #dfecf5;">&nbsp;</td>
				</tr>
				 -->
			</table>
			</div>
			</div>

			<br>
		</div>
		<br>

</div>

</body>
</html>