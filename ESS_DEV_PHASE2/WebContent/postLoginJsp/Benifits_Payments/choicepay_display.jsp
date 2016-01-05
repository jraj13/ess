
<%@page import="com.ess.common.action.InvestmentDisplay"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.ess.util.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
border: 0px;
}
.inlineTab1 {
            display: inline-block;
            width:20%;
            font-size:12px;
            border: 0px;
        }
     inlineTab1 tr {
  border-spacing: 0px;  
    border-style:none; 
}
  inlineTab1 td {
  border-spacing: 0px;  
    border-style:none; 
}
 .inlineTab {
            display: inline-block;
            width:30%;
            font-size:12px;
            border: 0px;
        }
  inlineTab tr {
  border-spacing: 0px;  
    border-style:none; 
}
  inlineTab td {
  border-spacing: 0px;  
    border-style:none; 
}


        </style>
<body>
<br/>
<br/>
<table border= 0 class="inlineTab">
<tr><td><b>
Choicepay Declaration </b></td>
</tr>
							<%
								
							ArrayList<Object> data = InvestmentDisplay.choicepay_columns();
							if(data.size()>0)	{
								for(int l=0;l < data.size();l++){
									String eve_data = data.get(l).toString();
									String dataarr[] = eve_data.split("\\'");
									 String type_col = dataarr[0];
										
%>
	
	<tr>
	<td COLSPAN="2"><%=type_col%></td>
</tr>
 <%										
}
}

%>

</table>

<table border= 0 class="inlineTab1">
<tr><td><b>
Opting Amount</b></td>
</tr>
							<%
								
							ArrayList<Object> extra = InvestmentDisplay.choicepay_data();
							System.out.println(extra.size());
							if(extra.size()>0)	{
								for(int l=0;l < extra.size();l++){
									String eve = extra.get(l).toString();
									String evearr[] = eve.split("\\'");
									 String type = evearr[0];
										
%>
	
	<tr>
	<td COLSPAN="2"><%=type%></td>
</tr>
 <%										
}
}

%>

</table>



</body>
</html>









































<%-- <%@ page import=" java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.ess.util.GetConnection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <link rel="stylesheet" href="css/style_choicepay.css">
 <script src="js/ChoicePayCal_update.js"></script>
   
         
    </head>
    

<div style="height:2200px;width:1500px:bg-color:#40e0d0;margin-top:2%">

  

<% 

Connection con = GetConnection.getConnection(); 

Statement st=con.createStatement();
String id=(String) session.getAttribute("empid");
System.out.println(" session id is===="+id);
ResultSet rs=st.executeQuery("SELECT * FROM EMP_DETAIL_TEMP WHERE EMP_ID='"+id+"'");

%>
<body>





<center>
 <h2> EMPLOYEE ChoicePay Details</h2>
 <table border="2" bgcolor="skyblue" >

<% while(rs.next())
	
	{
	%>
<tr><td><b>Employee ID</b></td> <td><%=rs.getObject("EMP_ID") %></td></tr>
<tr><td><b>Total CTC</b></td><td><%=rs.getString("TOTAL_CTC") %></td></tr>
<tr><td><b>Basic</b></td><td><%=rs.getString("BASIC") %></td></tr>
<tr><td><b>Base Pay</b></td><td><%=rs.getString("BASE_PAY") %></td></tr>
<tr><td><b>Performance Linked Incentive</b></td><td><%=rs.getString("PLI") %></td></tr>
<tr><td><b>Choice Pay</b></td><td><%=rs.getString("CHOICE_PAY") %></td></tr>
<tr><td><b>Special Personal Allowance</b></td><td><%=rs.getString("SPA") %></td></tr>
<tr><td><b>Available Choice Pay</b></td><td><%=rs.getString("ACP") %></td></tr>
<tr><td><b>Medical Reimbursement(company)</b></td><td><%=rs.getString("MEDICAL_OLD") %></td></tr>
<tr><td><b>Medical Reimbursement</b></td><td><%=rs.getString("MEDICAL_NEW") %></td></tr>
<tr><td><b>Children Education Allowance(company)</b></td><td><%=rs.getString("CHILDREN_OLD") %></td></tr>
<tr><td><b>Children Education Allowance</b></td><td><%=rs.getString("CHILDREN_NEW") %></td></tr>
<tr><td><b>Conveyance Allowance(company)</b></td><td><%=rs.getString("CONVEYANCE_OLD") %></td></tr>
<tr><td><b>Conveyance Allowance </b></td><td><%=rs.getString("CONVEYANCE_NEW") %></td></tr>
<tr><td><b>Fuel / Maint. Expenses(company)</b></td><td><%=rs.getString("FUEL_OLD") %></td></tr>
<tr><td><b>Fuel / Maint. Expenses</b></td><td><%=rs.getString("FUEL_NEW") %></td></tr>
<tr><td><b>HRA(company)</b></td><td><%=rs.getString("HRA_OLD") %></td></tr>
<tr><td><b>HRA</b></td><td><%=rs.getString("HRA_NEW") %></td></tr>
<tr><td><b>LTA(company)</b></td><td><%=rs.getString("LTA_OLD") %></td></tr>
<tr><td><b>LTA</b></td><td><%=rs.getString("LTA_NEW") %></td></tr>
<tr><td><b>Er.NPS Contribution(company)</b></td><td><%=rs.getString("ER_NPS_OLD") %></td></tr>
<tr><td><b>Er.NPS Contribution</b></td><td><%=rs.getString("ER_NPS_NEW") %></td></tr>
<tr><td><b>Advance Bonus</b></td><td><%=rs.getString("ADVANCE") %></td></tr>
<tr><td><b>Washing Expenses</b></td><td><%=rs.getString("WASHING") %></td></tr>
<tr><td><b>Children Hostel Allowance(company)</b></td><td><%=rs.getString("CHILDREN_H_OLD") %></td></tr>
<tr><td><b>Children Hostel Allowance</b></td><td><%=rs.getString("CHILDREN_H_NEW") %></td></tr>
<tr><td><b>Food Coupons</b></td><td><%=rs.getString("FOOD") %></td></tr>
<tr><td><b>Entertainment Expenses</b></td><td><%=rs.getString("ENTERTAINMENT") %></td></tr>
<tr><td><b>Fuel Expenses</b></td><td><%=rs.getString("FUEL_ONLY") %></td></tr>
<tr><td><b>Utility Bills</b></td><td><%=rs.getString("UTILITY_BILLS") %></td></tr>
<tr><td><b>Gift Coupons</b></td><td><%=rs.getString("GIFT_NEW") %></td></tr>
     <% } %>

</table>
</center>
</div>
</body>

</html> --%>