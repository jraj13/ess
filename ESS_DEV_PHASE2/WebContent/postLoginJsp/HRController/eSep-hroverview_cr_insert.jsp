<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*" %>

<%@page import="com.ess.util.GetConnection"%>
<%@page import="com.ess.common.eseparation.E_separation_HR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String msg="";

String empid=request.getParameter("empid");
String reason_action=request.getParameter("reason_action");
String dreason=request.getParameter("dreason");
String rel_date=request.getParameter("rel_date");
System.out.println("rel_date.."+rel_date);

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate=simpleDateFormat.parse(rel_date);
SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
Object rel_date2=outputDateFormat.format(tempDate);
System.out.println(" rel_date2.."+rel_date2); 


String actual_np=request.getParameter("actual_np");
String given_np=request.getParameter("given_np");
String pre_sep_date=request.getParameter("pre_sep_date");
System.out.println("pre_sep_date.."+pre_sep_date);

SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate2=simpleDateFormat2.parse(pre_sep_date);
SimpleDateFormat outputDateFormat2 = new SimpleDateFormat("dd/MMM/YYYY");           
Object pre_sep_date2=outputDateFormat2.format(tempDate2);
System.out.println(" pre_sep_date2.."+pre_sep_date2); 

String emp_rm=request.getParameter("emp_rm");
System.out.println("emp_rm.."+emp_rm);

String emp_mailid=request.getParameter("emp_mailid");
System.out.println("emp_mailid.."+emp_mailid);

String hr_approve="Inprocess";
String rm_approve="Inprocess";
String emp_approvel="Initiate";
String admin_approve="Pending";

	 		 Statement st=null;
			 Connection con=null;
			
			/*  String qry="insert into E_SEP_REQ_BY_HR(EMP_ID,REASION_RESIGN,DETAILED_REASON,RELIEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,PRE_SEP_DATE,HR_APPROVE,RM_APPROVE,EMP_APPROVEL) values('"+empid+"', '"+reason_action+"', '"+dreason+"', '"+rel_date2+"', '"+actual_np+"', '"+given_np+"', '"+pre_sep_date2+"', '"+hr_approve+"','"+rm_approve+"','"+emp_approvel+"')"; */
			
			 String qry="insert into E_SEPARATION_EMP(EMP_ID,REASION_RESIGN,DETAILED_REASON,HR_RELIEVING_DATE,ACTUAL_NOTICE_PERIOD,GIVEN_NOTICE_PERIOD,CREATION_DATE,HR_APPROVE,RM_APPROVE,EMP_APPROVEL,ADMIN_APPROVE) values('"+empid+"', '"+reason_action+"', '"+dreason+"', '"+rel_date2+"', '"+actual_np+"', '"+given_np+"', '"+pre_sep_date2+"', '"+hr_approve+"','"+rm_approve+"','"+emp_approvel+"','"+admin_approve+"')";
			 try{
				 con=GetConnection.getConnection();
				 st=con.createStatement();
				 int i=st.executeUpdate(qry);
				 System.out.println("i.."+i);
				 
				 if(i>0)
				 {
					 System.out.println("Request submitted successfully");
					 msg="Request was saved successfully";
					 
					 E_separation_HR mp=new E_separation_HR();
						mp.sending_empterminate_byhr_mail(empid, reason_action,dreason, rel_date2, actual_np, given_np,pre_sep_date2,emp_rm,emp_mailid);  
						
				 }
				 else if(i==0)
				 {
					 System.out.println("Request not submitted ");
					 msg="Request was not saved";
				 }
				 else
				 {
					 System.out.println("Request not submitted else ");
					 msg="Request was not saved ";
					 
				 }
			 }catch(Exception e)
			 {
				 msg="Request was allready submitted";
				 System.out.println("Request not submitted (catch block)");
				 e.printStackTrace();
			 }
			 finally
			 {
				 if(msg=="Request was saved successfully")
				 {
					 out.println("<font color=green>");
					 out.println(msg);
					 out.println("</font>");
					 System.out.println("Request not submitted (if of finally)");
				 }
				 else if(msg=="Request was not saved")
			 	{
					 out.println("<font color=red>");
					 out.println(msg);
					 out.println("</font>");
					 System.out.println("Request not submitted (else if of finally)");
				 }
				 else if(msg=="Request was allready submitted")
				 {
					 out.println("<font color=red>");
					 out.println(msg);
					 out.println("</font>");
					 System.out.println("Request not submitted (else3 of finally)");
			 	}
				 
			 }
	 
%>

</body>
</html>


