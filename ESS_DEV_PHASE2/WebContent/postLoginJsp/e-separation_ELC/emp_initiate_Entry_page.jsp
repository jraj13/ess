
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import= "com.ess.common.eseparation.Eseparation_Basic_Info"%> 
   <%@ page import="java.text.SimpleDateFormat"%>
   <%@ page import="java.text.DateFormat"%>
    <%@ page import="java.util.*,java.text.SimpleDateFormat,java.text.ParseException"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("emp_initiate_Entry_page.jsp");
String empid_mailid=(String)session.getAttribute("loginid");
String empid=(String)session.getAttribute("empid");

	String msg="";
		
		String reasion_action = request.getParameter("reasion_action").trim();
								
		String detailed_reason = request.getParameter("detailed_reason").trim();
		
		String rel_date_before = request.getParameter("rel_date_before").trim();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate=simpleDateFormat.parse(rel_date_before);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
	    String rel_date=outputDateFormat.format(tempDate);
			
		
		String actual_notice = request.getParameter("actual_notice").trim();
		
		String given_notice = request.getParameter("given_notice").trim();
		
		
		Date date = Calendar.getInstance().getTime();
		
		
		 SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");           
		    String cration_date=outputDateFormat.format(date);
		
		
		String note = request.getParameter("note").trim();
		
		String rm=request.getParameter("rm").trim();
		
		Eseparation_Basic_Info eseparation=new Eseparation_Basic_Info();
		
		int count_is=eseparation.get_tot_before_save();
		if(count_is==0)
		{
		
		String result=eseparation.insert_Eseparation_Details(reasion_action,detailed_reason,rel_date,actual_notice,given_notice,cration_date,note,rm);
		
		System.out.println("result in emp resignation page is"+result);
		
				if(result=="Request is submitted to RM Successfully")
				{
					//String mail_result=eseparation.executeMail_eseparation(reasion_action,detailed_reason,rel_date,actual_notice,given_notice,cration_date,note,rm,empid_mailid,empid);
					out.println("<font color=green>");
					msg="Request is submitted to RM Successfully";
					out.println(msg);
					out.println("</font>");
				}
		}
				else 
				{
					msg="Please Delete Previous Requests then Try Again ";
					out.println("<font color=red>");
					out.println(msg);
					out.println("</font>");
				}
				
		
		 %>	
	
	
</body>
</html>
