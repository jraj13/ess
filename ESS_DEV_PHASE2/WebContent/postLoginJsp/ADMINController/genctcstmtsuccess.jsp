<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.CTCStmtMainAction"%>
     <%@ page import="java.io.*,java.text.*,java.util.*"%>
     <%@ page import="java.sql.*"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ess.util.GetConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table{
width:90%;
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
.tableStyle2 tr {
  border-spacing: 0px;  
    border-style:none; 
    height:2px;
}
.tableStyle2 td {
  border-spacing: 0px;  
    border-style:none; 
     
    /*  font-size: 0.60em; */
    
}

</style>

<script type="text/javascript">
$(function() {	
		
		 $('#print').show();
		  $("#print").click(function() {
				
			  $('#hidestatus').hide();
				 $('#print').hide();
				 /*	$('#year').hide();
				$('#qrybtn').hide();
				$('#wp').hide(); */
			 
			})
			
	})
	
	</script>
</head>


<body style="margin-top:10%" >
<%

String msg="";
try {
String empid=request.getParameter("empid");
String empid1=empid.toUpperCase();
	
	
	System.out.println("empid1.."+empid1);
	
	Connection con = GetConnection.getConnection(); 
		CallableStatement callableStatement = null;
				
				String callBeforeCTC = "{call BEFOREJOIN_CTC('"+empid1+"')}";
				
				
				//int rs=1;
					
						callableStatement = con.prepareCall(callBeforeCTC);
						System.out.println("calling procedure");
						
						int rs=	callableStatement.executeUpdate();
						System.out.println("rs.."+rs);
						//System.out.println("execute2.."+);
						if(rs>0)
						{
						msg="CTC statement generated successfully";
						}
						else
						{
							msg="CTC already generated ";
						}
						
					} catch (Exception ex) {
						
					
					msg="CTC already generated ";

					}
				finally {
					out.println(msg);
						}
				

	 %>
</body>
</html>