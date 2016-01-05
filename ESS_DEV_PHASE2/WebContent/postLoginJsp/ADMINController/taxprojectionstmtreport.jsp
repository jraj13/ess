
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {	
		 
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				/* $('#month').hide();
				$('#year').hide();
				$('#qrybtn').hide();
				$('#wp').hide(); */
			 
			})
			
	})
	
	

$(function() {
	$('#generatectcbtn').click(
			function() {
		//	alert("come in ajax call");
				var empid=$('#empid').val();
				//var year=$('#year1').val();
				
				if (empid == "") {

					alert("Please enter employee id ! ");

					return false;
				}
				else{
				
				  var dataString = '&empid=' + empid;
				//  alert(dataString);
		
				$.ajax({

					url :'postLoginJsp/ADMINController/incomeTaxReport.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {

						//alert("Tax projection generated successfully ");
							/* $('#lrmain').html(data).delay(5000).fadeOut(); */
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
 <div id="lrmain">
<br>

<label>EMPLOYEE ID </label>
<input type="text" id="empid" />&nbsp;&nbsp;

<input type="button" id="generatectcbtn" value="View Tax Project Report"/>&nbsp;
<!-- <input type="button1" id="viewctcbtn" value="View CTC Statement"/> -->

</div>
</body>
</html>














<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script type="text/javascript">
$(function() {	
		 
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				/* $('#month').hide();
				$('#year').hide();
				$('#qrybtn').hide();
				$('#wp').hide(); */
			 
			})
			
	})
	
	

$(function() {
	$('#generatectcbtn').click(
			function() {
			alert("come in ajax call");
				var empid=$('#empid').val();
				//var year=$('#year1').val();
				
				if (empid == "") {

					alert("Please enter employee id ! ");

					return false;
				}
				else{
				
				  var dataString = '&empid=' + empid;
				  alert(dataString);
		
				$.ajax({

					url :'postLoginJsp/ADMINController/genctcstmtsuccess.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {

						alert("CTC generated Entsuccessfully ");
							/* $('#lrmain').html(data).delay(5000).fadeOut(); */
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
<br>

<label>EMPLOYEE ID </label>
<input type="text" id="empid" />&nbsp;&nbsp;
<input type="button" id="generatectcbtn" value="Download Tax Project Report"/>&nbsp;
<!-- <input type="button1" id="viewctcbtn" value="View CTC Statement"/> -->



</body>
</html>
 --%>
