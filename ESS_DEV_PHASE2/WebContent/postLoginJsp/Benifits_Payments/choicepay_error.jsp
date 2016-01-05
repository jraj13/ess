

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
    
    <%@ page import="java.lang.*,java.util.*"%>
<%@ page import="com.ess.common.action.EmployeeDetails"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- ----------new style and script for hide and expand-->

	
<!-- ---------end new style and script -->
</head>



<body bgcolor="#FFFFFF">


 <div id="header">
    <tiles:insertAttribute name="header" />
</div>

<div id="sidebar" style="margin-top:0.5%;margin-left:-1%;height:600px;width:215px">
   <div style="height:1000px;width:250px;float:left;margin-left:5%;margin-top:3%">

<ul>
					 <div style="height:20px;width:200px;float:left">	
					<li><a href="<s:url action="personaldetails"/>" style="text-decoration:none;pointer:mouse;color:pink"> Personal Details</a> </li>
	</div>
					<div style="height:20px;width:200px;float:left">	
					
					<li><a href="<s:url action="choicepay"/>" style="text-decoration:none;pointer:mouse;color:orange">Choice pay</a></li></div>
					<div style="height:20px;width:200px;float:left">	
					<li><a href="<s:url action="Emp_InvestmentDetails"/>" style="text-decoration:none;pointer:mouse;color:pink">Investment Declaration</a></li></div>
			     	
					</ul>
					
<!-- --------end hide and expand--- -->

 </div>
    </div>
 
<body>
<div style="height:1000px;width:750px:bg-color:#40e0d0;margin-top:2%">
<br><br>
<center><font color="red"><b>Employee With ID: "<%=session.getAttribute("empid") %>" already Submitted.Please contact Admin</b></font></center>

</div>
</body>

 <div id="footer" style="margin-left:-1%">
    <tiles:insertAttribute name="footer" />
   </div> 
    
   </body>
</html>