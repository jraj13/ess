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
  for(var i = 2015; i < year+1; i++) {
    var option = document.createElement('option');
    option.text = option.value = i;
    select.add(option, 0);
      }
     }
    addList();
  </script>
  
</head>
<body>
<div id="atndtable" style="height: 150px;margin-top:100px">
	
					
						
							<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>PayRoll Query</I></h2>

						
								<%
									java.text.DateFormat df = new java.text.SimpleDateFormat(
											"dd/MM/yyyy");
								%> 
							Today Date : <input type="text" value="<%=df.format(new java.util.Date())%>" readonly="readonly" style="background-color: white;color:black; width:9.5%;height:18%" /> 
							<br/>
							Select Employee ID No : <select id="choose" class="abc" >
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
</select>
							Month : <select name="monthList" id="month" style="background-color: white;color:black;height:18%">
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
								<% String var1=df.format(new java.util.Date());
								String[] date=var1.split("/");
								//out.println("year======="+date[2]);
								
								%>
							Year :<select id="year" name="year"></select>
							<%--  <input type="text" id="year" size="3"   name="year" value="<%=date[2] %>"  readonly="readonly" style="background-color: white;color:black; width:5%;height:18%" > --%>
						<br/>	<br/>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Display" id="payrollqryBtn" onclick="openPage(id)"></input>
						
	</div>
	<br>

<div id="qrySuccess">

</div>


</body>
</html>