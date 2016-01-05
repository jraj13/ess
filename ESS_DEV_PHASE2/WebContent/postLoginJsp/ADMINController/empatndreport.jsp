<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
 <%@ page import="com.ess.common.util.GettingEmpployeeId" %> 
 
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
  width:50%;
  align:center;
  }
 /*  table{
width:50%;
align:center;
} */

.tableStyle_2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
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
  
  $(document).ready(function(){
	  
	  var date = new Date();
	  var currentMonth = date.getMonth();
	  var currentDate = date.getDate();
	  var currentYear = date.getFullYear();
	  
	      $("#datepicker").datepicker({
	    	  maxDate: new Date(currentYear, currentMonth, currentDate),
	          numberOfMonths: 1,
	          onSelect: function(selected) {
	            $("#datepicker2").datepicker("option","minDate", selected)
	          }
	      });
	      $("#datepicker2").datepicker({
	    	  maxDate: new Date(currentYear, currentMonth, currentDate),
	          numberOfMonths: 1,
	          onSelect: function(selected) {
	             $("#datepicker").datepicker("option","maxDate", selected)
	          }
	      }); 
	  });

  </script>
 
  
  <script>
function raise(){
	var date1= $("#datepicker").val();
	var date2= $("#datepicker2").val();
	
	if(date1=="" && date2=="")
		{
		
		alert("Please Choose Starting date and Ending date");
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
	var month=document.getElementById("month1").value;
	
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

<script>
function emp_search_specific()
{
	var emp_Id=document.getElementById("emp_search").value;
	
	var emp_Month=document.getElementById("month_each").value;
	
	var emp_Year=document.getElementById("year_each").value;
	
	
	if(emp_Id=='none selected' && emp_Month=='none selected' && emp_Year=='none selected')
		{
		alert("Please Select All Fields");
		return false;
		}
	
	if(emp_Id=='none selected')
	{
	alert("Please Select Employee ID");
	return false;
	}
	if(emp_Month=='none selected')
	{
	alert("Please Select Month");
	return false;
	}
	if(emp_Year=='none selected')
	{
	alert("Please Select Year");
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
<br>
<div id="h_1"><strong>Employee Attendance Reports</strong></div>

<form action="dummy"  onsubmit="return raise();">
<h6><strong>(Download Report Using Date Basis)</strong></h6><br>
<table class = "tableStyle_2">
<tr>
<td>From Date</td>
<td><input style="height:26px;font-size:12pt;" type="text" name="fromdate" id="datepicker" readonly="readonly" /></td>
<td>To Date</td>
<td><input style="height:26px;font-size:12pt;" type="text" name="todate"  id="datepicker2" readonly="readonly" /></td>
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







<form action="month" onsubmit="return display_info_month();" >
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
<td>
Month :
</td>
<td>
<select  name="month" id="month1" >
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
<td>
Year :
</td>
<td><input style="height:26px;font-size:12pt;" id="year"    name="year" value="<%=date[2] %>"  readonly="readonly" style="background-color:white;color:black; width:5%;height:18%" >
</td>
</tr>
<tr>
</tr>
<tr>
</tr>
<tr>
<td colspan="4" align="center"><input type="submit" name="dwnld1" value="Download" />
</td>
</tr>
</table>
	
</form>


<br>
<h2>Get Report Based on Employee ID</h2>
<form action="each_emp" onSubmit="return emp_search_specific();">
<table>
<tr>
<td>Select EmpID:</td>
<td>

<select name="emp_search" id="emp_search" >
<option value="none selected">select id</option>
<%
GettingEmpployeeId empid=new GettingEmpployeeId();
ArrayList<String> allemp=empid.getEmpid();

Iterator<String> itr=allemp.iterator();

while(itr.hasNext()){
	String ar=itr.next();
	%>
	<option value="<%=ar%>"> <%=ar %></option>
	
	 <%
	}

%> 

</select>
</td>
</tr>
<tr>
<td>Select Month</td>

<td>
<select  name="month_each" id="month_each" >
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
</tr>
<tr>
<td>
Year :
</td>
<td>
<select  name="year_each" id="year_each" >
			<option value="none selected">select year</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			</select>
</td>
</tr>
<tr>
<td>
<td colspan="2" align="center"><input type="submit" name="" value="Download"/>
</td>
</tr>

</table>
</form>


</body>
</html>