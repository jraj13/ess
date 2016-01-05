<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
table caption {
/* 	background-color: #98c3e2; */
	padding: 5px 2%;
	text-align: left;
	height:22px;
}
/* tr,td{
border:0px;
}
 */
 
  .tableStyle_emps tr {
  border-spacing: 0px;  
    border-style:none; 
}
.tableStyle_emps td {
  border-spacing: 0px;  
    border-style:none; 
     font-size: small;
}    

</style>

 <!-- <link rel="stylesheet" type="text/css" href="postloginresource/style.css"/> --> 
 
 <link rel="stylesheet" href="cartian/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="postloginresource/newsrch.css"/>
<script type="text/javascript" src="postloginresource/jquery-1.4.2.min.js"></script>
<script src="postloginresource/jquery.autocomplete.js"></script>
<script>
jQuery(function(){
	
$("#empname").autocomplete("postLoginJsp/WHOSWHO/list.jsp");
});
</script>

 <script>
$(function() {
	$('#empid_search').click(function() {
				var empid1=$('#empid').val();
			
				if (empid1 == "") {
					alert("Please Select Emp Id! ");
					return false;
				}
				else{
				  var dataString = '&empid1=' + empid1 ;
			//	alert(dataString);
				$.ajax({
					url :'postLoginJsp/WHOSWHO/employeesearch_success.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
						$('#lrmain').html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			})
});


$(function() {
	$('#empname_search').click(function() {
				var empname=$('#empname').val();
			
				if (empname == "") {
					alert("Please Select Employee Name! ");
					return false;
				}
				else{
				  var dataString = '&empname=' + empname ;
			//	alert(dataString);
				$.ajax({
					url :'postLoginJsp/WHOSWHO/empsearchbyname.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
						$('#lrmain').html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			})
});


$(function() {
	$('#emp_bgsearch').click(function() {
				var bgroup=$('#bg').val();
			
				if (bgroup == "none selected"|| bgroup =="") {
					alert("Please Select Emp Id! ");
					return false;
				}
				else{
				  var dataString = '&bgroup=' + bgroup;
			//	alert(dataString);
				$.ajax({
					url :'postLoginJsp/WHOSWHO/empsearchbybgroup.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {
						$('#lrmain').html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			})
});

</script> 


</head>
<body>

<div id="mainHeadingId">Employee Search</div>
<hr>
<br>


<div id="titlename" style="background-color: #98c3e2; width:40%;height: 28px; ">&nbsp;&nbsp;Employee Search</div>
 <table border="1"  width="40%"  class = "tableStyle_emps" > 
 
 <tr><td><b>&nbsp;&nbsp;&nbsp;Employee Id</b></td><td><input type="text"  id="empid" value=""  />&nbsp; <input type="button" id="empid_search" value="search"/></td></tr>
<!--  <tr>
 <td colspan="2">
 <input type="button" id="empid_search" value="search"/>
 </td>
 </tr> -->
 

 
 <tr><td><B>&nbsp;&nbsp;&nbsp;Employee Name</b></td><td><input type="text"  id="empname" name="country" value=""  onchange="empinfocheck()"  /><span id="nameinfo"> </span>&nbsp;<input type="button" id="empname_search" value="search"/></td></tr>
  <!-- <tr>
 <td colspan="2">
 <input type="button" id="emp_name" value="search"/>
 </td>
 </tr> -->
 
 
 <tr><td><b>&nbsp;&nbsp;&nbsp;Blood Group</b></td>
 <td><select id="bg" >
 		<option value="none selected">Select</option>
		<option value="A(positive)">A+</option>
		<option value="O(positive)">O+</option>
		<option value="B(positive)">B+</option>
		<option value="AB(positive)">AB+</option>
		<option value="A(negative)">A-</option>
		<option value="O(negative)">O-</option>
		<option value="B(negative)">B-</option>
		<option value="AB(negative)">AB-</option>
 </select>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
 
 <input type="button" value="Search" id="emp_bgsearch"/></td>
 </tr> 

 
 <!-- <tr>
 <td colspan="2">&nbsp;&nbsp;&nbsp;<input type="button" value="Search" id="empsearch"/></td><td>&nbsp;</td>
 </tr> -->
 </table> 
 
 <br><br>
 <div id="lrmain">
 
 </div>


</body>
</html>