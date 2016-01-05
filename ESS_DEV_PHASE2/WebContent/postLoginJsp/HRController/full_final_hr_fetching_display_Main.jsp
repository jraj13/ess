<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ess.common.eseparation.FandFsettlement_HR" %>
    <%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String fdate=request.getParameter("fdate");
String tdate=request.getParameter("tdate");
String status=request.getParameter("status");
System.out.println("1."+fdate+ "2."+tdate+"3."+status);


%>

<div id="fnf_hr_table_3"
			style="margin-top: 5px; margin-left: -0.0%; padding-left: 15px; font-size: 15px; width: 93%;">
			<div
				style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.6%; padding-left: 15px; font-size: 15px; width: 101.5%;">
				<b>Employee Details</b>
			</div>

			<div
				style="background-color: #98c3e2; margin-top: 0.66px; margin-left: -1.6%; padding-left: 15px; width: 101.5%;">
				<button type="button" value="Continue" id="fnf_settlement_action" onclick="openPage(id)"
					style="background-color: #FFFF99; height: 28px; width: 80px;">
					<!-- <span class="glyphicon glyphicon-ok"
				style="color: green; padding-left: 0px;"></span> -->
					Action
				</button>
				<button type="button" value="Continue" id="hrcreatereq"
					onclick="openPage(id)"
					style="background-color: #FFFF99; height: 28px; width: 80px;">
					<!-- <span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span> -->
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
						<!-- <span class="glyphicon glyphicon-remove"
				style="color: red; padding-left: 0px;"></span> -->
						Export
					</button></b> <a href="#" style="float: right; color: blue;">Filter Setting</a>
			</div>
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
FandFsettlement_HR f_f=new FandFsettlement_HR();

ArrayList<String> settelement=f_f.f_f_settlement();


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
					</button></b>
				
				<%-- <input type="button" id="<%=seq_no %>" class="use-address" value="Show" onclick="open_newpage_fandf(id);"/> --%></td>
					<td style="background-color: #dfecf5;"><%=HR_CLEARANCE_PROCCESS_STATUS %></td>
					<td style="background-color:#dfecf5;" id="empid"><%=emp_id %></td>
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

			</table>

			<br>
		</div>
		<br>



</body>
</html>