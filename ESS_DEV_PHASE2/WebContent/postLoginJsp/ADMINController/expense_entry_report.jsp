<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
 <%@ page import="com.ess.common.util.GettingEmpployeeId" %> 
 <%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="date/jquery-ui.css">
  <script src="date/jquery-1.10.2.js"></script>

  <script src="date/jquery-ui.js"></script>

  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <style>
/*  #h_1{
  text-align: center;
  text-decoration: underline;
  } */
 /*   h6{
  text-align: center;
  } */
  table
  {
  border-style: none;
  width:80%;
  align:center;
  }
 
.tableStyle_2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:3px;
}
.tableStyle_2 td {
  border-spacing: 0px;  
    border-style:none; 
     }
   #month{
 width:150px;   
}

#month option{
 width:100px;   
}
  </style>

<script>
    function addList(){
    var select = document.getElementById("year");
   var myDate = new Date();
  var year = myDate.getFullYear();
  for(var i = 2014; i < year+1; i++) {
    var option = document.createElement('option');
    option.text = option.value = i;
    select.add(option, 0);
      }
     }
    addList();
  </script>
  <script>

</script>

  
  <script>
function raise(){
	
	var type_expense1= $("#type_expense1").val();
	var date1= $("#datepicker").val();
	var date2= $("#datepicker2").val();
	
	if(type_expense1=="none selected")
	{
	alert("Please select type of expense");
	window.setTimeout(function ()
		    {
	document.getElementById('type_expense1').focus();
		    }, 0);
	return false;
	}
	
	if(date1=="" )
	{
	alert("Please Choose Starting date ");
	window.setTimeout(function ()
		    {
	document.getElementById('date1').focus();
		    }, 0);
	return false;
	}

	if(date2=="")
	{
	alert("Please Choose Ending date");
	window.setTimeout(function ()
		    {
	document.getElementById('date2').focus();
		    }, 0);
	return false;
	}
	else
		{
		
		return true;
		}
}

</script>


<script>
function display_info_month()
{
	var type_expense2=document.getElementById("type_expense2").value;
	var month=document.getElementById("month").value;
	var year=document.getElementById("year").value;
	
	if(type_expense2=="none selected")
	{
	alert("Please select type of expense");
	window.setTimeout(function ()
		    {
	document.getElementById('type_expense2').focus();
		    }, 0);
	return false;
	}
	
	if(month=='none selected')
		{
		alert("Please Select Month");
		
		window.setTimeout(function ()
			    {
		document.getElementById('month').focus();
			    }, 0);
		return false;
		}
	
	else
		{
		return true;
		}
}
</script>



</head>
<body>

<div id="h_1" style="margin-top:-3%;"><strong>Expense Entry Reports</strong></div>

<!-- datebased -->


<form action="datebased"  onsubmit="return raise();">
<h6><strong>(Download Report Using Date Basis)</strong></h6><br>

<table class = "tableStyle_2">

<tr><td width="20%">Type of Expense</td>

<td>
 <select id="type_expense1" name="type_expense" class="abc" >
							<option  value="none selected">Select Item </option>
							<option  value="ALL">ALL</option>
							<% 
		Connection con=null;
		

		String RegQry=" SELECT MENU_ITEM FROM EXPENSE_ENTRY_MENU";
		try
		{
		 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String menu = rs.getString("MENU_ITEM");
%>
          <option  value="<%=menu%>"><%=menu%></option>
<%
     }
}catch(Exception e)
{    out.print(e);
}
		finally{
			con.close();
		}
%>
</select>
</td> 
<td width="20%">From Date</td>
<td><input style="height:26px;font-size:12pt;" type="date" name="fromdate" id="datepicker"  /></td>
<td width="20%">To Date</td>
<td><input style="height:26px;font-size:12pt;" type="date" name="todate"  id="datepicker2"  /></td>
</tr>
<tr>
</tr>
<tr>
</tr>
<tr>
<td colspan="4" align="center"><input type="submit" id="submit1" name="dwnld" value="Download" /></td>
</tr>
</table>
</form>



<form action="monthbased" onsubmit="return display_info_month();" >
<%
			java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
			%> 
			<% String var1=df.format(new java.util.Date());
		String[] date=var1.split("/");
								
		%>
<h4>OR</h4>
<h6><strong>(Download Report Using Month Basis)</strong></h6><br>
							
<table class = "tableStyle_2">
<tr>
<td>Type of Expense</td>
<td>

 <select id="type_expense2" name="type_expense" class="abc" >
							<option  value="none selected">Select Item </option>
							<option  value="ALL">ALL</option>
							<% 
Connection con2=null;

String RegQry2=" SELECT MENU_ITEM FROM EXPENSE_ENTRY_MENU";
try
{
	 con2 = GetConnection.getConnection();
	 Statement st2 = con2.createStatement();

		ResultSet rs2 = st2.executeQuery(RegQry2);

     while(rs2.next())
     {
          String menu2 = rs2.getString("MENU_ITEM");
%>
          <option  value="<%=menu2%>"><%=menu2%></option>
<%
     }
}catch(Exception e2)
{    out.print(e2);
}

%>
</select>
</td>
<td>Month :</td>
<td><select  name="month" id="month" >
			<option value="none selected">select month</option>
			<option value="JAN">JAN</option>
			<option value="FEB">FEB</option>
			<option value="MAR">MAR</option>
			<option value="APR">APR</option>
			<option value="MAY">MAY</option>
			<option value="JUN">JUN</option>
			<option value="JUL">JUL</option>
			<option value="AUG">AUG</option>
			<option value="SEP">SEP</option>
			<option value="OCT">OCT</option>
			<option value="NOV">NOV</option>
			<option value="DEC">DEC</option>
		</select>
</td>
<td>Year :</td>
<td><select id="year" name="year" style="height:26px;font-size:12pt;"></select> </td>
</tr>
<tr>
</tr>
<tr>
</tr>

<tr>
<td colspan="4" align="center"><input type="submit" name="dwnld1" value="Download" /></td>
</tr>

</table>
	
</form>


</body>
</html>