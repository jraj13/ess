<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script>

function edithrsep(hrctrl)
{
	
	/* var sid =admctrl; */
 	var empid =hrctrl;
	alert(empid);
 	/*var empfn = $('#empfn').val();
	var empln = $('#empln').val();
	var doj = $('#doj').val();
	var dob = $('#dob').val();
	var design = $('#design').val();
	var mailid = $('#mailid').val();
	var rtm = $('#rtm').val();
	var ctc = $('#ctc').val();
	 var status=$('#status').val(); 
	 var remarks = $('#remarks').val(); */
	/*  var dor=$('#dor').val();  */
	
	 /*  var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); */
	/*  var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?empid='+empid+'&empfn='+empfn+'&empln='+empln+'&doj='+doj+'&dob='+dob+'&design='+design+'&mailid='+mailid+ '&rtm='+rtm+'&ctc='+ctc+ '&status='+status+ '&remarks='+remarks,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=480,top=180,left=200"); */
	 var popupWindow =window.open('postLoginJsp/HRController/eSep-Approval_Edit_hr.jsp?empid='+empid,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=480,top=180,left=200");
	}

</script>

</head>
<body>
<div  style="height: 150px; margin-top: 10px">

	<div style="background-color: #98c3e2; margin-top: 10px; margin-left: -3.5%; padding-left: 15px">eSeparation-Approval</div>
	<hr>
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -2.5%; padding-left: 15px;font-size:15px;"><b>E-Separation Approval</b></div>
		<div style="background-color: #98c3e2; margin-top: 1.5px; margin-left: -2.5%; padding-left: 15px;">&nbsp;</div>
		<div style="background-color: #98c3e2; margin-top: 19px; margin-left: -0.5%; padding-left: 15px; width: 90%;"> Approval Overview     |    Approval Policy</div>
		<br>


	 <form method="post">

			<table class="authors-list" ID="tblPets"
				style="background-color: #dfecf5; width: 90%; border: 1; cellpadding: 0px; margin-left: -1.5%">

				<tr class="headind">
					 <td><h5> </h5></td>
					<th><!-- <span style="color:red">* </span> -->Edit</th>
					<th><!-- <span style="color:red">* </span> -->Employee Name</th>
					<th><!-- <span style="color:red">* </span> -->Request No.</th>
					<th><!-- <span style="color:red">* </span> -->Incoming Status</th>
					<th><!-- <span style="color:red">* </span> -->Creation Date</th>
					<th><!-- <span style="color:red">* </span> -->Role</th>
					<!-- <th ALIGN="center">&nbsp;</th> -->
				</tr>

				<tr>
					 <td>&nbsp;&nbsp;&nbsp;</td>
					<td class="headind_1">
					 <button type="button" id="reqnumber" onclick="edithrsep(id);" > 
          		    <span style="color:black" class="glyphicon glyphicon-pencil"></span> </button>
					</td>
					<td><input type="text" name="empname" id="empname"
						style="background-color: white; border: 0px;" value="empname" ></input></td>
					<td class="headind_1"><input type="text" name="reqnumber"
						id="reqnumber" style="background-color: white; border: 0px;" value="reqnumber"
						onkeypress="return isamt(event)"></input></td>
					<td><input type="text" name="incomestatus" id="incomestatus"
						style="background-color: white; border: 0px;" value="incomestatus"></input></td>
						<td><input type="text" name="cdate" id="cdate"
						style="background-color: white; border: 0px;" value="cdate"></input></td>
					<td><input type="text" name="role" id="role"
						style="background-color: white; border: 0px;" value="role"></input></td>

				</tr>

			</table>
			<%
				String empid = (String) session.getAttribute("empid");
				System.out.println("empid for expense entry====" + empid);
			%>

			<input type="hidden" name="empid" id="empid" value="<%=empid%>" />

			<!-- <center>
				<input id="expquery" type="button" value="Submit"></input>
				 <INPUT TYPE="Button" onClick="addRow('tblPets')" VALUE="Add Row"></input>
				<input id="clear" type="RESET" value="Clear"></input>
				
			</center> -->
		</form> 
		

<!-- <div style="background-color: #98c3e2;margin-top:5px;margin-left:-1.5%;padding-left:15px; width:40%; ">Summary</div>
<table style="background-color:#dfecf5;width:40%; border:1; cellpadding:0px;margin-left:-1.5%">
  <tr>
  <td class="headind" >Children Education Expenses:</td>
  <td class="headind"><input id="education" type="text" name="education" value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind" >Fuel & Maintenance Expenses:</td>
  <td class="headind"><input id="fuel" type="text" name="fuel" value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
<td class="headind" >Children Hostel Expenses:</td>
  <td class="headind"><input id="hostel" type="text" name="hostel" value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind">Medical Expenses:&nbsp;&nbsp;&nbsp;</td>
  <td class="headind"><input id="medical" type="text" name="medical" value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind" >OWA Expenses:</td>
  <td class="headind"><input id="own" type="text" name="own"  value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr>
  <tr>
  <td class="headind">OWA Maintenance**</td>
  <td><input type="text" id="own1" name="ownmain" value="" style="background-color: #dfecf5;color:black; width:100%;height:150%" readonly="readonly"/></td>
  </tr> 
</table>
		
 -->
 </div>  


</body>
</html>