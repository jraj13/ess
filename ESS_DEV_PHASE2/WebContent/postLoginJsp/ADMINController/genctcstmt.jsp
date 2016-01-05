<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
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
				
				var empid=$('#empid').val();
				if (empid == "") {

					alert("Please enter employee id ! ");

					return false;
				}
				if(empid=="none selected"){

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
	                // alert("CTC generated successfully");
						
					/*  $('#lrmain').html(data).delay(5000).fadeOut();  */
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

<div id="lrmain">

<label>EMPLOYEE ID </label>
<!-- <input type="text" id="empid" />&nbsp;&nbsp; -->
<!-- <input type="button" id="generatectcbtn" value="Genrate CTC Statement"/>&nbsp; -->
<!-- <input type="button1" id="viewctcbtn" value="View CTC Statement"/> -->

				<select id="empid" class="abc" >
							<option  value="none selected">Select Id </option>
							<% 
Connection con=null;
String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where STATUS='Active'  order by emp_id";
try
{
	 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String name = rs.getString("emp_id");
%>
          <option  value="<%=name%>"><%=name%></option>
<%
     }
}catch(Exception e)
{    out.print(e);
}
%>
</select>

<input type="button" id="generatectcbtn" value="Genrate CTC Statement"/>&nbsp;
<br>
&nbsp;
<br>

<!-- <div id="lrmain"> -->



</div>


</body>
</html>