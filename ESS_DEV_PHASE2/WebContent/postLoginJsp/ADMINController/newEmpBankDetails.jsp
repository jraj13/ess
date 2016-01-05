<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ess.common.action.PayRollBasicInfo"%>

<%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<div id="atndtable" style="height: 150px;margin-top:100px">
						
							<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>Bank Information</I></h2>
						
							<%-- 	<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%> 
							Today Date : <input type="text" value="<%=df.format(new java.util.Date())%>" readonly="readonly" style="background-color: white;color:black; width:9.5%;height:18%" /> 
							<br/> --%>
							<br>
							Select Employee ID No:<select id="choose" class="abc" >
							<option  value="none selected">Select Id </option>
							<% 
Connection con=null;
/* String RegQry="select emp_id from NCSS_EMP_MASTER_INFO where STATUS='Active'"; */

String RegQry=" SELECT m.EMP_ID FROM NCSS_EMP_MASTER_INFO m WHERE m.status='Active' and m.EMP_ID NOT IN (SELECT b.EMP_ID FROM BANKINFO b)";
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

								<br/>	<br/>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Display" id="bankinfoqrybtn" onclick="openPage(id)"></input>
						
	</div>
	<br>
&nbsp;
<div id="qrySuccess">

</div>


</body>
</html>





















<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script>
	
	$(function() {
		$('#submit1').click(
				function() {

					//alert("Am In Btn Click leaverequest");

					
					var empid = $('#empid').val();
					var ename = $('#ename').val();
					var desing = $('#desing').val();
					var dept = $('#dept').val();
					//alert("Am In Btn Click leaverequest1"+date1);
					//alert("Am In Btn Click leaverequest2"+date2);

					
					var loc = $('#loc').val();
					var doj = $('#doj').val();
					var panno = $('#panno').val();
					var bankname = $('#bankname').val();
					var acntno=$('#acntno').val();
					var pfno=$('#pfno').val();
					
					if(empid=="")
					{
						alert("Please Enter Employee ID");
						empid.focus();
						return false;
					}
					if(ename.toString() == ""){
						 alert("Please Enter Employee Name");
						 ename.focus();
					 	 return false;
					  }
					if(desing.toString() == ""){
						 alert("Please Enter Employee Designation");
						 desing.focus();
					 	 return false;
					  }
					if(dept.toString() == ""){
						  alert("Please Enter Department Name");
						  dept.focus();
						  return false;
					  } if(loc.toString() == ""){
						  alert("Please Enter A Types Of Leave");
						  loc.focus();
					 	  return false;
					  }
					  
					  if(doj.toString() == ""){
						  alert("Please Enter Your Contact Number");
						  doj.focus();
						  return false;
						  }
					  if(mob.length<10){
						  alert("You are not Entered 10 Digits Contact Number");
						  return false;
						  }
				      if(date1.toString() == "")
				      {
				    	  alert("Please Select Start Date.");
				    	  date1.focus();
				    	  return false;
				    	  }
				
					else{
					
					var dataString = "&empid=" + empid + "&ename=" + ename
							+ "&desing=" + desing + "&dept=" + dept + "&loc="
							+ loc + "&doj=" + doj + "&panno=" + panno
							+ "&bankname=" + bankname+ "&acntno=" + acntno+ "&pfno=" + pfno;
					
					$.ajax({

						url : 'postLoginJsp/ATND/calendarLeaveApply.jsp',
						type : 'POST',
						data : dataString,
						datatype : 'json',
						success : function(data) {

							alert("successfully leave applied");

							$('#lrmain').html(data).delay(5000).fadeOut();

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


<H3>Employee Bank Details</H3>
<hr>
<table class="tableStyle" >
<tr>
<td><label>EMPLOYEE ID</label></td>
<td><input type="text"  name="empid" value=" " id="empid"  style="background-color: white;color:black" /></td>
</tr>

<tr>
<td><label>EMPLOYEE NAME</label></td>
<td><input type="text" name="ename" value="" id="ename"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DESIGNATION</label></td>
<td><input type="text" class="" name="design" value="" id="desing"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DEPARTMENT</label></td>
<td><input type="text" name="dept" value="" id="dept"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>LOCATION</label></td>
<td><input type="text" name="loc" value="" id="loc"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DOJ</label></td>
<td><input type="text" name="doj" value="" id="doj"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>PAN NO</label></td>
<td><input type="text" name="panno" value="" id="panno"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>BANK NAME </label></td>
<td><input type="text" name="bankname" value="" id="bankname"  style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>ACCOUNT NO</label></td>
<td><input type="text" name="acntno" value="" id="acntno"   style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>PF NO</label></td>
<td><input type="text" name="pfno" value="" id="pfno"   style="background-color: white;color:black"/></td>
</tr>

<!-- <tr>
<td style="float:right"><input type="button"  id="edit" value="Edit"  onclick="return validate()"/> </td>
<td> <input type="submit" id="update" value="update Save" onclick="update()"/> </td>

</tr> -->

</table>
 <input type="button" value="SUBMIT" id="submit"/>

</body>
</html> --%>