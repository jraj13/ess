<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.eseparation.DueClearance" %>
    
  <%--   <%@ page import ="java.util.*,java.lang.*,java.io.*" %> --%>
       <%@ page import="java.lang.*,java.util.*,java.io.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ESS-Due Clearance Status</title>
</head>
<body>


<table border="1" >
<tr>
<th>Resignation No</th>
<th>Department</th>
<th>Task </th>
<th>Task Status</th>
<th>Task Assign Date</th>
<th>Amount</th>
<th>Remarks</th>
<th>Approver Mail Id</th>
</tr>


<%
String sequence_Id=request.getParameter("sequence_Id").trim();

DueClearance dc=new DueClearance();

ArrayList<String> arrObj=dc.getDueClearanceStatus(sequence_Id);

if (arrObj.size() > 0) {
for(int i=0;i<arrObj.size();i++){
	
	String strArray=arrObj.get(i).toString();
	
	String[] arrdata=strArray.split("\\^");
	
	String EMP_SEQ_NO=arrdata[0];
	String TASK_LIST=arrdata[1];
	String MANAGER_MAIL_ID=arrdata[2];
	String TASK_TYPE=arrdata[3];
	String REMARKS=arrdata[4];
	String AMOUNT=arrdata[5];
	String TASK_STATUS=arrdata[6];
	String date_assign=arrdata[7];
	%>
	
	<tr>
	<td><%=EMP_SEQ_NO %></td>
	<td><%=TASK_LIST %></td>
	<td><%=TASK_TYPE %></td>
	<td><%=TASK_STATUS %></td>
	<td><%=date_assign %></td>
	<td><%=AMOUNT %></td>
	<td><%=REMARKS %></td>
	<td><%=MANAGER_MAIL_ID %></td>
	</tr>
	
	<%
	
}
}
else{

%>

	<tr>
	<td colspan="14">Record Not Found</td>
	</tr>
	
	<%
}
	%>
</table>
</body>
</html>