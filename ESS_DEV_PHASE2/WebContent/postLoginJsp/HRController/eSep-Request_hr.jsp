 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<!-- eSep-Request_hr.jsp -->

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="com.ess.common.eseparation.Eseparation_Basic_Info" %>
     <%@page import="java.util.ArrayList" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table th {
	background-color: #98c3e2;
	padding: 0px 2%;
	text-align: left;
	height:22px;
}

 .tableStyle1 tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle1 td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    
br {
            display: block; /* makes it have a width */
            content: ""; /* clears default height */
            margin-top: 5px; /* change this to whatever height you want it */
}


#test {

color: blue;
}

</style>
<script>

function editFunction1(admctrl)
{
	var empid =admctrl;
	
	 var popupWindow =window.open('postLoginJsp/e-separation_ELC/esep_requestEdit.jsp?seqid='+empid,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200"); 
	}

</script>

<body>



	<div id="lrmain" style="height: 150px; margin-top: 130px">

<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 95%"><h2>E-Separation</h2></div>

		<form method="post">

			<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
			
		<b>My Separation Requests</b>
			
			 <a href="#New_Separation_EMP_level" id="New_Separation_EMP_level" style="color:black;text-decoration: none;" onclick="openPage(this.id);"><img  src="images/n2.png" style="width: 30px;height: 30px"><b>New</b></a>
			
			<select name="ctype" id="ctype"
						style="background-color: #B0C4DE; color: black; width: 20.5%; " >
							<option value="Other Actions">Other Actions</option>
							<option value="Withdraw">Withdraw</option>
							<option value="Process Overview">Process Overview</option>
							<option value="Display">Display</option>
					</select>	
			<a href="#New_Separation" id="New_Separation" style="color:black;text-decoration: none;" onclick="openPage(this.id);"><b>separation Policy</b></a>
			</div>
			<br>
			<table class="authors-list" ID="tblPets"
				style="background-color: margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 90%">
				<tr class="headind">
					
					<th>Edit</th>
					<th>Request Number</th>
					<th>Status</th>
					<th>Creation Date</th>
					<th>Reporting Manager</th>
					<th>HR Person</th>
				</tr>
		<%
System.out.println("eSeparation_request.jsp");  
Eseparation_Basic_Info initial=new Eseparation_Basic_Info();
ArrayList<String>  intial_data_home=initial.gettinge_requestDetails();
if (intial_data_home.size() > 0) {
	for (int i = 0; i < intial_data_home.size(); i++) {
		String intial_homepage = intial_data_home.get(i).toString();

String into_data[]=intial_homepage.split("\\^");

String sequnce_id=into_data[0];

String emp_approvel=into_data[1];
String creation_date=into_data[2];
//String emp_hr=into_data[3];
String emp_rm=into_data[3];

%>
		<tr>
		<td>&nbsp;&nbsp;&nbsp;
		<button type="button"   id="<%= sequnce_id%>" onclick="editFunction1(id);"> 
         <span class="glyphicon glyphicon-pencil" ></span> </button>
          </td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><a href="postLoginJsp/Admin_e_separation/check_emp_status.jsp" target="_blank" id="test"><%= sequnce_id%></a></u>
	
		</td>
		<td>
		<input type="text" style="border:0px" value="<%= emp_approvel%>" readonly="readonly"/>
		</td>
		<td>
		<input type="text" style="border:0px" value="<%=creation_date %>" readonly="readonly"/>
		</td>
		<td>
		<input type="text" style="border:0px" value="<%=emp_rm %> " readonly="readonly"/>
		</td>
		<td>
		<input type="text" style="border:0px" value=" " readonly="readonly"/>
		</td>
		<%
								
								} 
}else {
							%>
							<tr>
								<td> &nbsp;</td>
								<td> &nbsp;</td>
								<td> &nbsp;</td>
								<td> &nbsp;</td>
								<td> &nbsp;</td>
								<td> &nbsp;</td>
							</tr>

							<%
								}
							%>
		</table>
			
		</form>



 </div>  
		 <div id="qrySuccess">
		 
		 
		 </div>
</body>
</html> --%>
		


 <div  style="height: 100px; margin-top: 10px">
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -2.5%; padding-left: 15px;font-size:15px;"><b>Separation Details</b></div>
		
		<div style="width:90%">
		<div style="float:left;width:40%;">
		<div style="background-color: white; margin-top: 19px; margin-left: -0.5%; padding-left: 0px; width: 40%;">Reason Details</div>
		<hr>
		<div>
		<lable>&nbsp;&nbsp;&nbsp;Personal Number :&nbsp; </lable><input type="text" id="personalnum" value="csse150045" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<lable>&nbsp;&nbsp;&nbsp;Reason for Action :&nbsp; </lable><input type="text" id="personalnum" value="Resignation" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detailed Reason:&nbsp; </lable><input type="text" id="personalnum" value="Family Business" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relieving Date(R):&nbsp; </lable><input type="text" id="personalnum" value="13/10/2015" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<lable>Actual Notice Period: &nbsp;</lable><input type="text" id="personalnum" value="30" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
			</div>
			
	</div>


	<div style="float:right;width:45%;">
		<div style="background-color: white; margin-top: 19px; margin-left: -0.5%; padding-left: 0px; width: 55%;">Approved Details</div>
		<hr>
		<div>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Action Type(A):&nbsp; </lable>
			<input type="text" id="preseparation" value="Pre Separation" style="background-color:white;height:26px;"/><br>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reson for Action(A):&nbsp; </lable>
			<input type="text" id="preseparation" value="Resignation" style="background-color:white;height:26px;"/><br>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detailed Reason(A):&nbsp; </lable>
			<input type="text" id="preseparation" value="Family Business" style="background-color:white;height:26px;"/><br>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Physical Leaving Date(RM):&nbsp; </lable>
			<input type="text" id="preseparation" value="13/10/2015" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relieving Date(HR):&nbsp; </lable>
			<input type="text" id="preseparation" value="13/10/2015" style="background-color:white;height:26px;"/><br>
			<lable>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Withdrawal Allowed:&nbsp; </lable><input type="checkbox" /><br><br>
			<center>
			<input type="button" value="Submit" id="reqsave"/>
			</center>
		</div>
	</div>
	</div>

 </div>  
</body>
</html>