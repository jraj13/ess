
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Load Page Dynamically inside a jQuery UI Dialog</title>
<link rel="Stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" ></link>
<script type="text/javascript"
	src="
http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.min.js">
	
</script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js">
	
</script>

<script type="text/javascript">
	/* $(function() {

		$('#anchorID').click(function() {

			alert("Am In simple model");

			$('<div>').dialog({
				modal : true,
				open : function() {
					$(this).load('');
				},
				height : 400,
				width : 400,
				title : 'Dynamically Loaded Page'
			});

		})

		$('#sbmtBtn').click(function() {

			alert("Am In sbmtBtn");

		})

	}); */
	
	function parent_disable() {
		if(popupWindow && !popupWindow.closed)
		popupWindow.focus();
		}
		function child_open()
		{ 

		popupWindow =window.open('simpleModal.jsp',"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=280,top=200,left=200");

		}
		function parent_disable() {
		if(popupWindow && !popupWindow.closed)
		popupWindow.focus();
		}
</script>
</head>

<body onFocus="parent_disable();" onclick="parent_disable();">
    <a href="javascript:child_open()">Click me</a>
 
<!-- <table>
				<tr>
					<th>
						<h2>Update here..</h2>
					</th>
				</tr>
				<tr>
					<td>SID:</td>
					<td><input type="text" id="sid" /></td>
				</tr>
				<tr>
					<td>TYPE OF LEAVE :</td>
					<td><input type="text" id="tol" /></td>
				</tr>
				<tr>
					<td>START DATE :</td>
					<td><input type="text" id="sd" /></td>
				</tr>
				<tr>
					<td>START TIME:</td>
					<td><input type="text" id="st" /></td>
				</tr>
				<tr>
					<td>END DATE :</td>
					<td><input type="text" id="ed" /></td>
				</tr>
				<tr>
					<td>END TIME :</td>
					<td><input type="text" id="et" /></td>
				</tr>
				<tr>
					<td>NEXT PROCESSOR :</td>
					<td><input type="text" id="np" /></td>
				</tr>
				<tr>
					<td>STATUS :</td>
					<td><input type="text" id="sts" /></td>
				</tr>
				<tr>
					<td>USED :</td>
					<td><input type="text" id="used" /></td>
				</tr>

				<tr>
					<td align="center"><input type="button" id="used" value="SUBMIT" onsubmit="" /></td>
				</tr>

<tr> 

			<td><a href="#" id="anchorID">Click Here</a></td>
		</tr>

	</table>
 -->
</body>
</html>
 
 
 