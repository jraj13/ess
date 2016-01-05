<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.ess.common.action.PayRollBasicInfo"%>

<%@ page import="java.lang.*,java.util.*"%>

<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</head>
<body>

<!-- <div id="atndtable" style="height: 150px;margin-top:100px"> -->
<div id="atndtable" >
<div id="qrySuccess">
						
<h2 style="background-color: skyblue;margin-left:-4%;margin-top:-3%;padding-left:10px"><b>Expense Entry</b></h2>
						
							<%-- 	<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%> 
							Today Date : <input type="text" value="<%=df.format(new java.util.Date())%>" readonly="readonly" style="background-color: white;color:black; width:9.5%;height:18%" /> 
							<br/> --%>
							<br>
					<!-- Expense Entry Item List : <select id="choose_expense_item" class="abc" onchange="openPage(this.id);" >
							<option  value="AARAMEX COURIER">AARAMEX COURIER</option>
							<option  value="AIREX COURIER">AIREX COURIER</option>
							<option  value="FIRST FLIGHT COURIER">FIRST FLIGHT COURIER</option>
							<option  value="TRAINING LUNCH">TRAINING LUNCH</option>
							<option  value="AC AMC CONTRACT">AC AMC CONTRACT</option>
							<option  value="PEST CONTROL AMC">PEST CONTROL AMC</option>
							<option  value="EPBX AMC">EPBX AMC</option>
							<option  value="FAX MACHINE AMC">FAX MACHINE AMC</option>
							<option  value="XEROX MACHINE AMC">XEROX MACHINE AMC</option>
							</select> -->


					<!-- <select id="choose_expense_item" class="abc" onchange="openPage(this.id);" > -->			
Expense Entry Item List : <select id="choose_expense_item" class="abc" >
							<option  value="none selected">Select Item </option>
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
%>
</select>

									Month :  <select name="monthList" id="month" style="background-color: white;color:black;height:18%">
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
							
							 Year: <select id="year" name="year"></select>

	<input type="button" value="Display Form" id="selectitembtn" onclick="openPage(id)"></input>
						
	</div>
	<br>
&nbsp;




</div>


</body>
</html>
