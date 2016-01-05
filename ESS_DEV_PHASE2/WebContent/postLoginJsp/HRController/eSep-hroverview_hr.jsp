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

<!--  <script src="../date/jquery-1.10.2.js"></script>
<script src="../date/latest.min.js"></script>
<script src="../date/jquery-ui.js"></script>  -->

<link rel="stylesheet" type="text/css" href="postloginresource/newsrch.css"/>
<script type="text/javascript" src="postloginresource/jquery-1.4.2.min.js"></script>
<script src="postloginresource/jquery.autocomplete.js"></script>

<!-- <script>
				function editFunhrrec(id) 
				{
					alert(id);
					alert("Am In Btn Click leaverequest");
					var dataString = "&sequence_id=" + id ;
					$.ajax({
						url : 'postLoginJsp/e-separation_ELC/usermanual.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {
							$('#qrySuccess').html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
					
					}
</script>
 -->

 <script>
 $(function() {
	$('#searchempdata').click(function() { 
		//alert("call");
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
						$('#lrmain_empsearch').html(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
					}
				});
				}

			} ) 
 });

</script>

</head>
<body>
<div id="qrySuccess">


<div  style="height: 150px; margin-top: 10px">

	<div style="background-color: #98c3e2; margin-top: 10px; margin-left: -3.5%; padding-left: 15px"><b>eSeparation- HR Overview</b></div>
	<hr>
		<div style="background-color: #98c3e2; margin-top: 5px; margin-left: -2.5%; padding-left: 15px;font-size:15px;"><b>HR Overview Search</b></div>
		
		<!-- <input type="button" value="Continue" id="continue"   style="background-color: #98c3e2; margin-top: 10px; margin-left: -2.5%; padding-left: 15px;width:200px"/> -->
		<button type="button"  id="continue"   style="background-color: #98c3e2; margin-top: 0px; margin-left: -2.5%; padding-left: 15px;width:200px" >
		<span class="glyphicon glyphicon-ok" style="color: green;  padding-left: 0px;"></span>&nbsp;&nbsp;Continue </button>
		
		<!-- <input type="button" value="Create Request" id="hrcreatereq" onclick="openPage(id)" style="background-color: #98c3e2; margin-top: 10px; margin-left: -0.8%; padding-left: 15px;width:300px"/> -->
		<button type="button" id="hrcreatereq" onclick="openPage(id)" style="background-color: #98c3e2; margin-top: 0px; margin-left: -0.8%; padding-left: 15px;width:300px">
		<span class="glyphicon glyphicon-file" style="color: #009688;  padding-left: 0px;"></span>&nbsp;&nbsp;Create Request</button>
		
<br><br>
<label>Employee Id : &nbsp;</label><input type="text" value="" id="empid" style="height:26px;"/>&nbsp;<input type="button"  value="Search" id="searchempdata"  style="height:26px;"  />
<br><br> 

<div id="lrmain_empsearch" ></div>

<%-- <label>Employee ID Number : </label>&nbsp;<select id="empid" class="abc" >
							<option  value="none selected">Select Id</option>
							<% 
Connection con=null;
String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where STATUS='Active' order by emp_id";
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
</select> --%>

 </div>  

</div>

</body>
</html>

