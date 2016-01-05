<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ess.common.eseparation.DueClearance"%>

<%@ page import="java.lang.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>

#esep_clear_tab {
	border-style: solid;
	border-width: 1px;
}

/* .esep_clear_tab td {

    border-spacing: 0px;  
   border-style:none; 
     border: 0px;
} */
</style>
</head>
<body>

	<!-- <div  style="height: 150px; margin-top: 10px"> -->

	<!-- <div style="background-color: #98c3e2; margin-top: 10px; margin-left: -3.5%; padding-left: 15px"><b>Separation Request</b></div>
	<hr> -->
	<div
		style="background-color: #98c3e2; margin-top: 5px; margin-left: -2.5%; padding-left: 15px; font-size: 15px; width: 102%;">
		<b>Separation Request</b>
	</div>

	<!-- <input type="button" value="Continue" id="continue"   style="background-color: #98c3e2; margin-top: 10px; margin-left: -2.5%; padding-left: 15px;width:200px"/> -->
	<!-- 	<button type="button"  id="continue"   style="background-color: #98c3e2; margin-top: 0px; margin-left: -2.5%; padding-left: 15px;width:200px" >
		<span class="glyphicon glyphicon-ok" style="color: green;  padding-left: 0px;"></span>&nbsp;&nbsp;Submit </button>
		
		<input type="button" value="Create Request" id="hrcreatereq" onclick="openPage(id)" style="background-color: #98c3e2; margin-top: 10px; margin-left: -0.8%; padding-left: 15px;width:300px"/>
		<button type="button" id="hrcreatereq" onclick="openPage(id)" style="background-color: #98c3e2; margin-top: 0px; margin-left: -0.8%; padding-left: 15px;width:300px">
		<span class="glyphicon glyphicon-file" style="color: #009688;  padding-left: 0px;"></span>&nbsp;&nbsp;Cancel</button> -->

	<div
		style="background-color: #98c3e2; margin-top: 1px; margin-left: -2.5%; width: 102%;">
		<button type="button" value="Continue" id="continue"
			style="background-color: #98c3e2;">
			<span class="glyphicon glyphicon-ok"
				style="color: green; padding-left: 0px;"></span>save
		</button>
		<button type="button" value="Continue" id="hrcreatereq"
			onclick="openPage(id)" style="background-color: #98c3e2;">
			<span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span>cancel
		</button>

	</div>

	<!-- </div> -->
	<div
		style="background-color: #98c3e2; margin-top: 1px; margin-left: -0.5%; padding-left: 15px; font-size: 15px; width: 93%;">
		<b>Task List</b>
	</div>
	<div id="esep_clear_tab" style="margin-left: -0.5%; width: 93%;">
		<br>
		<table border="1" class="esep_clear_tab" style="margin-left: 1.5%;">
			<tr>
				<th style="background-color: #CCCCCC;">&nbsp;&nbsp;</th>
				<th style="background-color: #CCCCCC;">Delete</th>
				<th style="background-color: #CCCCCC;">Remind</th>
				<th style="background-color: #CCCCCC;">Object Id</th>
				<th style="background-color: #CCCCCC;">Task Owner</th>
				<th style="background-color: #CCCCCC;">Department</th>
				<th style="background-color: #CCCCCC;">Status</th>
			</tr>

			<%

				ArrayList<String> arrObj = DueClearance
						.getDueClearanceStatusforEmp();

				if (arrObj.size() > 0) {
					for (int i = 0; i < arrObj.size(); i++) {

						String strArray = arrObj.get(i).toString();

						String[] arrdata = strArray.split("\\^");

						String TASK_LIST = arrdata[0];
						String MANAGER_MAIL_ID = arrdata[1];
						String STATUS_HR = arrdata[2];
			%>

			<tr>
				<td style="background-color: #CCCCCC">&nbsp;&nbsp;</td>
				<td><button type="button" value="Continue" id="hrcreatereq"
						onclick="openPage(id)"
						style="background-color: white; width: 60px;">
						<span class="glyphicon glyphicon-trash"
							style="color: black; padding-left: 0px;"></span>
					</button></td>
				<td>&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;</td>
				<td><%=MANAGER_MAIL_ID%></td>
				<td><%=TASK_LIST%></td>
				<td><%=STATUS_HR%></td>

			</tr>
			<%
	
}
}
else{

%>

			<tr>
				<td colspan="7">Record Not Found</td>
			</tr>

			<%
}
	%>

		</table>
		<br>
	</div>



</body>
</html>