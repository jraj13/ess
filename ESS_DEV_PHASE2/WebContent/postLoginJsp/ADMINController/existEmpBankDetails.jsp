

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
						
							<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>Bank Info For Updation</I></h2>
						
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
/* String RegQry="select emp_id from BANKINFO where STATUS='Active'"; */
String RegQry="select emp_id from BANKINFO ";
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
	<input type="button" value="Display" id="bankinfoqryupdatebtn" onclick="openPage(id)"></input>
						
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

<style>
table{
width:35%;
}
/* .inlineTable1 {
            display: inline-block;
            width:26%;
            font-size:10px;
        }
 .inlineTable {
            display: inline-block;
            width:20%;
            font-size:10px;
        } */
.tableStyle tr {
  border-spacing: 0px;  
    border-style:none; 
    height:1px;
}
.tableStyle td {
  border-spacing: 0px;  
    border-style:none;
    border: 0px;
     
    /*  font-size: 0.60em; */
    
}
/* td.normal{
text-indent: 1em;
font-size:10px;
font-weight: bold;
height:2px;
}
td.small{
font-size:10px;
text-indent: 3em;
height:2px;
}
br {
  content: " ";
  display: block;
  margin: 0.5em;
}
.fontst
{
font-size: 10px;
text-indent: 3em;
height: 2px;
} */
</style>

<script type="text/javascript">
function validate() {
	// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
    x=document.getElementById("empid")
    x.disabled = !x.disabled;
    x=document.getElementById("ename")
    x.disabled = !x.disabled;
    x=document.getElementById("desing")
    x.disabled = !x.disabled;
    
    x=document.getElementById("dept")
    x.disabled = !x.disabled;
    x=document.getElementById("loc")
    x.disabled = !x.disabled;
    x=document.getElementById("doj")
    x.disabled = !x.disabled;
    
    x=document.getElementById("panno")
    x.disabled = !x.disabled;
    x=document.getElementById("bankname")
    x.disabled = !x.disabled;
    x=document.getElementById("acntno")
    x.disabled = !x.disabled;
    x=document.getElementById("pfno")
    x.disabled = !x.disabled;

}
</script>

<script>
function update()
{
		var empid=document.getElementById("empid").value;
		var ename=document.getElementById("ename").value;
		var design=document.getElementById("desing").value;
		
		var dept=document.getElementById("dept").value;
		var loc=document.getElementById("loc").value;
		var doj=document.getElementById("doj").value;
		
		var panno=document.getElementById("panno").value;
		var bankname=document.getElementById("bankname").value;
		var acntno=document.getElementById("acntno").value;
		var pfno=document.getElementById("pfno").value;
		
		 window.location = "NominiesUpdate?empid=" +empid+ "&ename=" +ename+ "&design=" +design+ "&dept=" +dept+ "&loc=" +loc+ "&doj=" +doj+ "&panno=" +panno+ "&bankname=" +bankname+ "&acntno=" +acntno+ "&pfno=" +pfno;
		// document.getElementById('update').style.visibility = 'hidden';
		// document.getElementById('edit').style.visibility = 'visible'; 
		
		 alert("Recored Updated Successfully ");
		}

</script>

</head>
<body>
<H3>Employee Bank Details</H3>
<hr>
<table class="tableStyle" >
<tr>
<td><label>EMPLOYEE ID</label></td>
<td><input type="text"  name="empid" value=" " id="empid" disabled="true" style="background-color: white;color:black" /></td>
</tr>

<tr>
<td><label>EMPLOYEE NAME</label></td>
<td><input type="text" name="ename" value="" id="ename" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DESIGNATION</label></td>
<td><input type="text" class="" name="design" value="" id="desing" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DEPARTMENT</label></td>
<td><input type="text" name="dept" value="" id="dept" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>LOCATION</label></td>
<td><input type="text" name="loc" value="" id="loc" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>DOJ</label></td>
<td><input type="text" name="doj" value="" id="doj" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>PAN NO</label></td>
<td><input type="text" name="panno" value="" id="panno" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>BANK NAME </label></td>
<td><input type="text" name="bankname" value="" id="bankname" disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>ACCOUNT NO</label></td>
<td><input type="text" name="acntno" value="" id="acntno"  disabled="true" style="background-color: white;color:black"/></td>
</tr>

<tr>
<td><label>PF NO</label></td>
<td><input type="text" name="pfno" value="" id="pfno"  disabled="true" style="background-color: white;color:black"/></td>
</tr>
<tr>
<td style="float:right"><input type="button"  id="edit" value="Edit"  onclick="return validate()"/> </td>
<td> <input type="submit" id="update" value="update Save" onclick="update()"/> </td>
</tr>

</table>


</body>
</html> --%>