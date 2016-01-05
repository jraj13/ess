
<%@ page import=" java.sql.*" %>
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

/* Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","ESS_DEV","ESS_DEV"); */
//out.println("connection eastabilished");
Statement st=con.createStatement();
/* String id=(String) session.getAttribute("loginid"); */
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
<tr><td><b>EMP ID</b></td> <td><%=rs.getObject(1) %></td></tr>
<tr><td><b>TOTAL CTC</b></td><td><%=rs.getString(2) %></td></tr>
<tr><td><b>BASIC</b></td><td><%=rs.getString(3) %></td></tr>
<tr><td><b>BASE PAY</b></td><td><%=rs.getString(4) %></td></tr>
<tr><td><b>PLI </b></td><td><%=rs.getString(5) %></td></tr>
<tr><td><b>CHOICE PAY</b></td><td><%=rs.getString(6) %></td></tr>
<tr><td><b>SPA</b></td><td><%=rs.getString(7) %></td></tr>
<tr><td><b>ACP</b></td><td><%=rs.getString(8) %></td></tr>
<tr><td><b>MEDICAL OLD</b></td><td><%=rs.getString(9) %></td></tr>
<tr><td><b>MEDICAL NEW</b></td><td><%=rs.getString(10) %></td></tr>
<tr><td><b>CHILDREN OLD</b></td><td><%=rs.getString(11) %></td></tr>
<tr><td><b>CHILDREN NEW</b></td><td><%=rs.getString(12) %></td></tr>
<tr><td><b>CONVENCY OLD</b></td><td><%=rs.getString(13) %></td></tr>
<tr><td><b>CONVENCY NEW </b></td><td><%=rs.getString(14) %></td></tr>
<tr><td><b>FUEL OLD</b></td><td><%=rs.getString(15) %></td></tr>
<tr><td><b>FUEL NEW</b></td><td><%=rs.getString(16) %></td></tr>
<tr><td><b>HRA OLD</b></td><td><%=rs.getString(17) %></td></tr>
<tr><td><b>HRA NEW</b></td><td><%=rs.getString(18) %></td></tr>
<tr><td><b>LTA OLD</b></td><td><%=rs.getString(19) %></td></tr>
<tr><td><b>LTA NEW</b></td><td><%=rs.getString(20) %></td></tr>
<tr><td><b>ER NTS OLD</b></td><td><%=rs.getString(21) %></td></tr>
<tr><td><b>ER NTS NEW</b></td><td><%=rs.getString(22) %></td></tr>
<tr><td><b>ADVANCE </b></td><td><%=rs.getString(23) %></td></tr>
<tr><td><b>WASHING</b></td><td><%=rs.getString(24) %></td></tr>
<tr><td><b>CHILDREN H OLD</b></td><td><%=rs.getString(25) %></td></tr>
<tr><td><b>CHILDREN H NEW</b></td><td><%=rs.getString(26) %></td></tr>
<tr><td><b>FOOD</b></td><td><%=rs.getString(27) %></td></tr>
<tr><td><b>ENTERTAINMENT</b></td><td><%=rs.getString(28) %></td></tr>
<tr><td><b>FUEL ONLY</b></td><td><%=rs.getString(29) %></td></tr>
<tr><td><b>GIFT NEW</b></td><td><%=rs.getString(30) %></td></tr>
<tr><td><b>UTILITY BILLS</b></td><td><%=rs.getString(31) %></td></tr>
 







     <% } %>

</table>


<%-- <% while(rs.next())
	
	{
	%>

<table width="50%" border="1" summary="Table data" class="table-container" cellpadding="0px;">
  <caption>
   Package Distribution
  </caption>
  <tr class="headind">
    <td><h5> </h5></td>
    <th>Salary Componet</th>
    <th>Max elgibility per annum(Rs)</th>
    <th>New Annual amount(RS)</th>
        <th>Policy</th>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td class="headind_1">Total CTC</td>
     <td class="headind_1">&nbsp;&nbsp;&nbsp;</td>
    
      <td><%=rs.getString(1) %></td>
       <td class="headind_1">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>

    <td>&nbsp;</td>
    <td>Basic</td>
   <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
         <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Base Pay</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Performance Linked Incentive</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Choice Pay</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
        
        
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>Special Personal Allowance</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %> </td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Available Choice Pay</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
    <td><s:textfield name="choiceBean.acp" value="%{acp}" id="acp" style="background-color: #dfecf5;border:0px;"/>
    <!-- <input id="acp" type="text" style="background-color: #dfecf5;border:0px;" name="choiceBean.acp"/> --></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>MEDICAL REIMBURSEMENT</td>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Fixed</td>
  </tr>
  <tr>
    <!-- <td>&nbsp;</td>
    <td>Children Education Allowance</td>
    <td><input id="cea1" type="text" name="choiceBean.cea1" onchange="education1()"/></td>
    <td><input id="cea2" type="text" name="choiceBean.cea2" onchange="education()"/></td>
        <td>Rs.1200 per child; max 2 children</td> -->
         <td>&nbsp;</td>
    <td>Children Education Allowance</td>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Rs.1200 per child; max 2 children</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>Conveyance Allowance</td>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Fixed</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>FUEL / MAINT. EXPENSES</td>
    <td>Any Amount upto<%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Min of Rs. 3.5 Lac or 25% of CTC</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>HRA</td>
    <td>Any amount upto<%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>50% of Basic for Metro Cities And 40% for rest</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>LTA</td>
    <td>Any amount upto<%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>2 times of monthly Basic</td>
  </tr>
   <tr>
   
  <td>&nbsp;</td>
    <td>Er.NPS Contribution</td>
    <td>Any amount from Rs 6000 to<%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Min Rs 6000 upto Max 10% of Basic</td>
  
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Advance Bonus</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Washing Expenses</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
   
        <td>&nbsp;</td>
    <td>Children Hostel Allowance</td>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
        <td>Rs.3600 per child; max 2 children</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Food Coupons</td>
    <td>15600 or 30000</td>
    <td><%=rs.getString(1) %></td>
        <td>Fixed;either of two</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Entertainment Expenses</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Fuel Expenses</td>
    <td>&nbsp;</td>
    <td><%=rs.getString(1) %></td>
        <td>&nbsp;</td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
    <td>Gift Coupons</td>
    
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(1) %></td>
    <td>Fixed</td>
  </tr>
</table>
 <% } %> --%>
<br><br><br>
<!-- <div style="height:10%;width:30%;float:left;margin-left:25%">
       <form  method="post" action="personal_menu">
       <button type="submit" >HOME</button>
       
       </form>
      
  -->
     
       
</div>
 <%-- <a href="<s:url action="personal_menu"/>" style="text-decoration:none;pointer:mouse;color:green">MENU</a> --%>
  
  
</center>
</div>
 <div id="footer" style="margin-left:-1%">
    <tiles:insertAttribute name="footer" />
   </div> 
    
</html> 