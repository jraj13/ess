<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>leave attendance query page</title>

<!-- *** FOR DATE PICKER */ -->


<link rel="stylesheet" href="../../date/jquery-ui.css">
<script src="../../date/jquery-1.10.2.js"></script>
<script src="../../date/jquery-ui.js"></script>

<script>
	$(function() {

		$("#datepicker").datepicker({
			numberOfMonths : 3,
			showCurrentAtPos : 1,
			showButtonPanel : false

		});

		/*  $( "#datepicker11" ).datepicker({
		     numberOfMonths: 3,
		     showButtonPanel: false
		   }); */
	});
</script>

<!--  END DATE PICKER -->

<!-- *** FOR DATE PICKER 2*/ -->


<link rel="stylesheet" href="../../datejs/jquery-ui.css">
<script src="datejs/jquery-1.10.2.js"></script>
<script src="datejs/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker1").datepicker();

		$('#submit').click(function() {

			alert("Am In Btn Click");

			var var1 = $('#datepicker').val();
			var var2 = $('#ltype').val();
			var dataString = "var1=" + var1 + "&var2=" + var2;

			$.ajax({

				url : 'leaveapplyresult.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data) {

					alert("Am cumin");

					$('#qryload').html(data).delay(5000).fadeOut();

				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});

		})
	});
</script>

<!--  END DATE PICKER 2 -->



<script>
	
</script>
</head>
<body>

	<div style="background-color: skyblue">
		<h2>
			<b>Leave Request: New</b>
		</h2>
	</div>
	<br>
	<br>
	<form name="myForm">



		<div style="background-color: skyblue">
			<h4>
				<b>Personal Calendar</b>
			</h4>
		</div>

		<br> <input type="text" name="sdate" id="datepicker" /> <br>
		<br> <label for="ltype">Types of Leave : </label> <select
			name="ltype" id="ltype">
			<option value="PL">PL</option>
			<option value="SL">SL</option>
			<option value="CL">CL</option>
			<option value="Advance_PL">Advance PL</option>
			<option value="Advance_SL">Advance SL</option>
			<option value=">Leave_Without_Pay">Leave Without Pay</option>
			<option value="Outdoor_Duty">Outdoor Duty</option>
			<option value="Present_ART_Not_Working">Present-ART Not
				Working</option>
			<option value="Transfer_Leave">Transfer Leave</option>
		</select> <br> <input type="button" value="submit" id="submit" />
	</form>

	<table>
		<tr>
			<td><div id="qryload"></div></td>
		</tr>
	</table>

</body>
</html>