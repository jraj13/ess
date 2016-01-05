<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expense form generation/deletion</title>
<style type="text/css">
<style>
.abc{
width:120px;
}

</style>

<script>

	
function GenerateExpEntry(id)
{

	if (id == "pdf") {
		var choose=$('#choose').val();
		
		if(choose=="none selected")
		{
		alert("Please Select Form No")
		}
	
	else{
		
		var popupWindow =window.open('postLoginJsp/Benifits_Payments/expense_print_generate.jsp?choose='+choose,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=1350, height=700,top=0,left=0,right=0 ");
		
	// 	  var url = 'postLoginJsp/Benifits_Payments/test.jsp'; 
			//  var url = 'table2pdf';   
		//	var dataString = '&choose=' + choose;
		//	qryPage(url, dataString);
 
			return true;

		} }else {
			
			return false;
		}	

		}
/* 	} */
	
	
	
</script>
</head>
<body style="margin-top:20%">
<br><br>
<label>Select Form No.</label>
<select id="choose" class="abc">
<option  value="none selected">Select </option>
<% 
String empid=(String)session.getAttribute("empid");
System.out.println("empid for expense entry delete form===="+empid);
Connection con=null;
String RegQry="select distinct(emp_count) from ESS_EXPENSE_ENTRY where emp_id='"+empid+"' order by emp_count";
try
{
	 con = GetConnection.getConnection();
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery(RegQry);

     while(rs.next())
     {
          String name = rs.getString("emp_count");
%>
          <option value="<%=name%>"><%=name%></option>
<%
     }
}catch(Exception e)
{    out.print(e);
}
%>
</select> <input id="pdf" type="button" value="print expense form" onclick="GenerateExpEntry(id)"/> 
<!-- <input id="pdf" type="button" value="Generate" onClick="fileUploads(this.form,'UploadServlet','upload1'); return false;"/> -->

<div class=display>
 
</div>

<td colspan="3" align="center"><div id="upload1"></div></td>
</body>
</html>