

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Load Page Dynamically inside a jQuery UI Dialog</title>

<script type="text/javascript">

	function openEditForm(atndId){
		
		
		alert('am in openFormEdit========'+atndId);
		
		var atndId=atndId;
		
	$('<div>').dialog({
		modal : true,
		open : function() {
			$(this).load('ATND/leaveOverviewEditSuccess.jsp');
		},
		height : 600,
		width : 450,
		title : '::Leave Edit Form::'
	});
	}
	</script>

</head>
<body>

	
	<table >
		<tr>
			<th>
				<h2>Update here..</h2>
			</th>
		</tr>
		<tr>
			<td>SID:</td>
			<td><input type="text" id="sid" value="" /></td>
		</tr>
		<tr>
			<td>TYPE OF LEAVE :</td>
			<td><input type="text" id="tol" value="" /></td>
		</tr>
		<tr>
			<td>START DATE :</td>
			<td><input type="text" id="sd" value="" /></td>
		</tr>
		<tr>
			<td>START TIME:</td>
			<td><input type="text" id="st" value="" /></td>
		</tr>
		<tr>
			<td>END DATE :</td>
			<td><input type="text" id="ed" value="" /></td>
		</tr>
		<tr>
			<td>END TIME :</td>
			<td><input type="text" id="et" value="" /></td>
		</tr>
		<tr>
			<td>NEXT PROCESSOR :</td>
			<td><input type="text" id="np" value="" /></td>
		</tr>
		<tr>
			<td>STATUS :</td>
			<td><input type="text" id="sts" value=" " /></td>
		</tr>
		<tr>
			<td>USED :</td>
			<td><input type="text" id="used" value="" /></td>
		</tr>

		<tr>
			<td align="center"><input type="button" id="editSub" value="SUBMIT" onclick="openEditForm()" /></td>
		</tr>

		<tr>

			<!-- <td><a href="#" id="anchorID">Click Here</a></td> -->
		</tr>

	</table>

</body>
</html>
