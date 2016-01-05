<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.separation.newly.Hr_task_assign_entry" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="qryload">
<%
String emp_seq_no=request.getParameter("emp_seq_no").trim();
System.out.println("emp_seq_no..."+emp_seq_no);

String emp_emp_id=request.getParameter("emp_emp_id").trim();
System.out.println("emp_emp_id..."+emp_emp_id);

String values=request.getParameter("value");
System.out.println("values..."+values);

String hr_status="Initiate";





Hr_task_assign_entry new_entry=new Hr_task_assign_entry();

int count_task_assign=new_entry.calculateTotal(emp_seq_no);
System.out.println("count in the hr task assing is"+count_task_assign);
if(count_task_assign<1){

String result_hr_entr=new_entry.entry_task_assign(values, emp_emp_id, emp_seq_no,hr_status);

out.println(result_hr_entr);
}
else
{
	out.println("You are already tasks are assigned Plese Check the status");
}
 %>
</div>
</body>
</html>