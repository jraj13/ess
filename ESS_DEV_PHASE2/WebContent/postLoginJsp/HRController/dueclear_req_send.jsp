<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.util.GetConnection" %>
    <%@ page import="java.sql.*,java.sql.ResultSet" %>
    
      <%@ page import="com.ess.common.eseparation.DueClearance"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String msg="";


System.out.println("dueclear_req_send.jsp");

String resign_id=request.getParameter("resign_id");
System.out.println("resign_id.."+resign_id);

String check_value1=request.getParameter("check_value1");
System.out.println("check_value1.."+check_value1);

String emp_name1=request.getParameter("emp_name1");
System.out.println("emp_name1.."+emp_name1);

String mailid1=request.getParameter("mailid1");
System.out.println("mailid1.."+mailid1);

String emp_id=request.getParameter("emp_id");
System.out.println("emp_id.."+emp_id);

String status="Inprocess";




Connection con=null;
Statement st=null;

String hr_sql="insert into EMP_DUE_CLEARANCE(RESIGNATION_NO,EMP_ID,EMP_HEAD_ROLENAME,EMP_HEAD_NAME,EMP_HEAD_MAILID,STATUS) VALUES('"+resign_id+"','"+emp_id+"','"+check_value1+"','"+emp_name1 +"' ,'"+mailid1 +"','"+status+"')";

try{


con=GetConnection.getConnection();
			st=con.createStatement();
			int rs=st.executeUpdate(hr_sql);
			
			
			if(rs > 0)
			{
				msg="Due Clearance Request send successfully";
				System.out.println("Due Clearance Request submitted successfully");
				
				DueClearance mp=new DueClearance();
					mp.sending_itsupportteam_mail(mailid1, resign_id,emp_id);  
				
			}
			else
			{
				
				msg="Due Clearance Request not submitted";
				System.out.println("Due Clearance Request not submitted");
			}

}catch(Exception e){
	e.printStackTrace();
	
	msg="internal proble ! Try Again";
	System.out.println("internal problem ! Try Again");
}
finally{
	out.println(msg);
}

			 %>

</body>
</html>