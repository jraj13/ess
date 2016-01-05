<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ess.common.action.Attendance_card_configuration"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
	$(function() {
		$('#save_att')
				.click(
						function() {
							var full_id = $('#emp_full_id').val();

							var short_id = $('#short_id').val();

							if (full_id == "Select Emp ID") {
								alert("Select Employee Id");
								return false;
							}

							if (short_id == "") {
								alert("Enter card number for Register");
								return false;
							} else {

								var dataString = "&full_id=" + full_id
										+ "&short_id=" + short_id;

								$
										.ajax({

											url : 'postLoginJsp/ADMINController/inserting_att_card_details.jsp',
											type : 'POST',
											data : dataString,
											datatype : 'json',
											success : function(data) {

												//alert("successfully Save Bank info");
										$('#lrmain').html(data);
												
										/* $('#lrmain').html(data).delay(
														5000).fadeOut(); */

											},
											error : function(jqXHR, textStatus,
													errorThrown) {

											}
										});

							}

						})
	});
</script>




</head>
<body>
	<div id="lrmain">
		<h2 style="color: green">Employee Attendance Card Configuration</h2>
		<hr>
		Select Employee ID: <select id="emp_full_id">

			<option value="Select Emp ID">Select Emp ID</option>
			<%
				Attendance_card_configuration card = new Attendance_card_configuration();
				ArrayList<String> specific_empid = card.getEmployee_id();
				Iterator<String> itr = specific_empid.iterator();
				while (itr.hasNext()) {
					String emp_id = itr.next();
			%>

			<option value="<%=emp_id%>"><%=emp_id%></option>
			<%
				}
			%>


		</select> Registration Card ID: <input type="text" id="short_id" style="height:28px;" />
		<p>

			<input type="button" value="save" id="save_att" style="width:75px"/>
	</div>
</body>
</html>
