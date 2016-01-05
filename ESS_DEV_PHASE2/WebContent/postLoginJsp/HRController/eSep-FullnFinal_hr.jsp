<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Full and Final Settlement</title>

<style>
th {
	background-color: #CCCCCC;
}

#fnf_hr_table_1 {
	border-style: solid;
	border-width: 1px;
}

#fnf_hr_table_2 {
	border-style: solid;
	border-width: 1px;
}

#fnf_hr_table_3 {
	border-style: solid;
	border-width: 1px;
}

#fnf_hr_table_4 {
	border-style: solid;
	border-width: 1px;
}


</style>

 <script type="text/javascript">
    $(document).ready(function() {
        $("#fetch").click(function(){
        	alert("hai");
        	var fdate=$('#fdate').val();
        	var tdate=$('#tdate').val();
        	var dataString='&from_date='+fdate+'&to_date='+tdate;
        	
    				$.ajax({
    					url :'postLoginJsp/HRController/full_final_hr_fetching_display.jsp',
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
        });
    })
 
</script>



</head>
<body>
	
	<div id="fnf_hr_table_1"
		style="margin-top: -15px; margin-left: -2.5%; padding-left: 15px; font-size: 15px; width: 102%;">

		<div
			style="background-color: #98c3e2; margin-top: 0px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
			<b>Full and Final Settlement</b>
		</div>
		<div
			style="background-color: #98c3e2; margin-top: 5px; margin-left: -0.0%; padding-left: 15px; font-size: 15px; width: 93%;">
			<b>Full and Final Settlement Module</b>
		</div>
		<table border="1">
			<div id="fnf_hr_table_2" style="width: 93%; margin-left: -0.0%;">
				<br> &nbsp;
				<label>From Date:</label>&nbsp;<input type="date" id="fdate" style="height: 26px;" />&nbsp;
				<label>To</label>&nbsp;<input type="date" id="tdate" style="height: 26px;" /><br> &nbsp;
				<label>Business:</label>&nbsp;<select>
				<option value="none selected">Select</option>
				<option value="IT Development">IT Development</option>
				<option value="IT Operations">IT Operations</option>
				<option value="HR">HR</option>
				<option value="Administration">Administration</option>
				
				</select><br> &nbsp;
				
				<label>Company:</label>&nbsp;<select>
				<option value="none selected">Select</option>
				<option value="NCSS">NCSS</option></select>
				<br> &nbsp;
				<label>Status:</label>&nbsp;<select id="status"><option value="none selected">Select</option>
					<option value="All">All</option>
					<option value="New">New</option>
					
				</select><br> <br> &nbsp;
				<input type="button" id="fetch" value="Search" style="background-color: #FFFF99; height: 28px; width: 80px;" />
				<br>&nbsp;<br>
			</div>
		</table>
		<br>
		<div id="qryload"> 
		
		
		</div>
		
		
	</div>
</body>
</html>