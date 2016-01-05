
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
            width:50%;
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
Investment Declaration </b></td>
</tr>
							<%
								
							ArrayList<Object> data = InvestmentDisplay.invest_col();
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
								
							ArrayList<Object> extra = InvestmentDisplay.investment_display();
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
ResultSet rs=st.executeQuery("SELECT * FROM EMP_INVESTMENT_DECLARATION WHERE EMP_ID='"+id+"'");

%>
<center>
 <h2> Investment Declaration Details</h2>
<table border="2"  >

<% while(rs.next())
	
	{
	%>

<tr><td><b>EMP ID</b></td><td><%=rs.getObject(69) %></td></tr>
<tr><td><b>LIP 80C PROPOSED AMOUNT </b></td><td><%=rs.getString(1) %></td></tr>
<tr><td><b>LIP 8OC ACTUAL AMOUNT</b></td><td><%=rs.getString(2) %></td></tr>
<tr><td><b>LIP 8OC APROVED AMOUNT</b></td><td><%=rs.getString(3) %></td></tr>
<tr><td><b>PPF 8OC PROPOSED AMOUNT</b></td><td><%=rs.getString(4) %></td></tr>
<tr><td><b>PPF 8OC ACTUAL AMOUNT </b></td><td><%=rs.getString(5) %></td></tr>
<tr><td><b>PPF 8OC APROVED AMOUNT</b></td><td><%=rs.getString(6) %></td></tr>
<tr><td><b>NSS 8OC PROPOSED AMOUNT</b></td><td><%=rs.getString(7) %></td></tr>
<tr><td><b>NSS 8OC ACTUAL AMOUNT</b></td><td><%=rs.getString(8) %></td></tr>
<tr><td><b>NSS 8OC APROVEDL AMOUNT</b></td><td><%=rs.getString(9) %></td></tr>
<tr><td><b>NSC 8OC PROPOSED AMOUNT</b></td><td><%=rs.getString(10) %></td></tr>
<tr><td><b>NSC 8OC ACTUAL AMOUNT</b></td><td><%=rs.getString(11) %></td></tr>
<tr><td><b>NSC 8OC APROVED AMOUNT</b></td><td><%=rs.getString(12) %></td></tr>

<tr><td><b>GOVT INFRA 80CCF PROPOSED AMOU</b></td><td><%=rs.getString(13) %></td></tr>
<tr><td><b>GOVT INFRA 80CCF ACTUAL AMOU </b></td><td><%=rs.getString(14) %></td></tr>
<tr><td><b>GOVT INFRA 80CCF APROVED AMOU</b></td><td><%=rs.getString(15) %></td></tr>
<tr><td><b>LIC 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(16) %></td></tr>
<tr><td><b>LIC 8OC ACTUAL AMOUNT</b></td><td><%=rs.getString(17) %></td></tr>
<tr><td><b>LIC 8OC APROVED AMOUNT </b></td><td><%=rs.getString(18) %></td></tr>
<tr><td><b>ELSS 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(19) %></td></tr>
<tr><td><b>ELSS 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(20) %></td></tr>
<tr><td><b>ELSS 80C APROVED AMOUNT</b></td><td><%=rs.getString(21) %></td></tr>
<tr><td><b>NPF 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(22) %></td></tr>
<tr><td><b>NPF 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(23) %></td></tr>
<tr><td><b>NPF 80C APROVED AMOUNT</b></td><td><%=rs.getString(24) %></td></tr>
<tr><td><b>DSNHB 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(25) %></td></tr>
<tr><td><b>DSNHB 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(26) %></td></tr>

<tr><tr><td><b>DSNHB 80C APROVED AMOUNT </b></td><td><%=rs.getString(27) %></td></tr>
<tr><td><b>HLR 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(28) %></td></tr>
<tr><td><b>HLR 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(29) %></td></tr>
<tr><td><b>HLR 80C APROVED AMOUNT</b></td><td><%=rs.getString(30) %></td></tr>
<tr><td><b>ISES 80C PROPOSED AMOUNT </b></td><td><%=rs.getString(31) %></td></tr>
<tr><td><b>ISES 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(32) %></td></tr>
<tr><td><b>ISES 80C APROVED AMOUNT</b></td><td><%=rs.getString(33) %></td></tr>
<tr><td><b>IMF 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(34) %></td></tr>
<tr><td><b>IMF 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(35) %></td></tr>
<tr><td><b>IMF 80C APROVED AMOUNT</b></td><td><%=rs.getString(36) %></td></tr>
<tr><td><b>TFFC 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(37) %></td></tr>
<tr><td><b>TFFC 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(38) %></td></tr>
<tr><td><b>TFFC 80C APROVED AMOUNT</b></td><td><%=rs.getString(39) %></td></tr>

<tr><td><b>LIC JSF 80CCC PROPOSED AMOUNT </b></td><td><%=rs.getString(40) %></td></tr>
<tr><td><b>LIC JSF 80CCC ACTUAL AMOUNT</b></td><td><%=rs.getString(41) %></td></tr>
<tr><td><b>LIC JSF 80CCC APROVED AMOUNT</b></td><td><%=rs.getString(42) %></td></tr>
<tr><td><b>MCNSC 80D PROPOSED AMOUNT</b></td><td><%=rs.getString(43) %></td></tr>
<tr><td><b>MCNSC 80D ACTUAL AMOUNT </b></td><td><%=rs.getString(44) %></td></tr>
<tr><td><b>MCNSC 80D APROVED AMOUNT</b></td><td><%=rs.getString(45) %></td></tr>
<tr><td><b>MCSC 80D PROPOSED AMOUNT</b></td><td><%=rs.getString(46) %></td></tr>
<tr><td><b>MCSC 80D ACTUAL AMOUNT</b></td><td><%=rs.getString(47) %></td></tr>
<tr><td><b>MCSC 80D APROVED AMOUNT</b></td><td><%=rs.getString(48) %></td></tr>
<tr><td><b>MCS SC 80D PROPOSED AMOUNT</b></td><td><%=rs.getString(49) %></td></tr>
<tr><td><b>MCS SC 80D ACTUAL AMOUNT</b></td><td><%=rs.getString(50) %></td></tr>
<tr><td><b>MCS SC 80D APROVED AMOUNT</b></td><td><%=rs.getString(51) %></td></tr>
<tr><td><b>MTHD SC 80DD PROPOSED AMOUNT</b></td><td><%=rs.getString(52) %></td></tr>

<tr><td><b>MTHD SC 80DD ACTUAL AMOUNT </b></td><td><%=rs.getString(53) %></td></tr>
<tr><td><b>MTHD SC 80DD APROVED AMOUNT</b></td><td><%=rs.getString(54) %></td></tr>
<tr><td><b>MTSD SD 80DDB PROPOSED AMOUNT</b></td><td><%=rs.getString(55) %></td></tr>
<tr><td><b>MTSD SD 80DDB ACTUAL AMOUNT</b></td><td><%=rs.getString(56) %></td></tr>
<tr><td><b>MTSD SD 80DDB APROVED AMOUNT </b></td><td><%=rs.getString(57) %></td></tr>
<tr><td><b>MTSDS SC 80DDB PROPOSED AMOUNT</b></td><td><%=rs.getString(58) %></td></tr>
<tr><td><b>AMTSDSC SC 80DDB ACTUAL AMOUNT</b></td><td><%=rs.getString(59) %></td></tr>
<tr><td><b>MTSDSC SC 80DDB APROVED AMOUNT</b></td><td><%=rs.getString(60) %></td></tr>
<tr><td><b>TOTAL 80C PROPOSED AMOUNT</b></td><td><%=rs.getString(61) %></td></tr>
<tr><td><b>TOTAL 80C ACTUAL AMOUNT</b></td><td><%=rs.getString(62) %></td></tr>
<tr><td><b>TOTAL 80C APROVED AMOUNT</b></td><td><%=rs.getString(63) %></td></tr>
<tr><td><b>TOTAL 80 PROPOSED AMOUNT</b></td><td><%=rs.getString(64) %></td></tr>
<tr><td><b>TOTAL 80 ACTUAL AMOUNT</b></td><td><%=rs.getString(65) %></td></tr>

<tr><td><b>TOTAL 80 APROVED AMOUNT</b></td><td><%=rs.getString(66) %></td></tr>
<tr><td><b>UPLOADE INVESTMENT PROOFS</b></td><td><%=rs.getString(67) %></td></tr>
<tr><td><b>UPLOADE HOUSERENT RECEIPTS</b></td><td><%=rs.getString(68) %></td></tr>
  <% } %>
</table>
<br>
</center>
</div>
</body>

</html> --%>