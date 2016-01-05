<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String message = "";

		System.out.println("come in loan update succes page");

		/* String taskstatus=request.getParameter("taskstatus").trim();
		 System.out.println("taskstatus.."+taskstatus);

		 String t_owner_remarks=request.getParameter("t_owner_remarks").trim();
		 System.out.println("t_owner_remarks.."+t_owner_remarks);

		 String sequence_no=request.getParameter("sequence_no").trim(); 
		 */

		String favorite = request.getParameter("favorite");

		System.out.println("total favourate is.." + favorite);

		/* total favourate is..  wrwer,2015-11-17,2015-11-10,werewr,rwer,4,;,a2,2015-11-02,2015-11-18,e2,r2,5,;
		 */

		Full_N_Final_Settlement fnf_update = new Full_N_Final_Settlement();

		String loan_update_result = fnf_update.loan_update_save(favorite);

		System.out
				.println("status in loan update succes page:::::::::::::::::::"
						+ loan_update_result);

		message = "Successfully Updated";
		out.println(message);

		/* if(status.equalsIgnoreCase("Successfully Bond summary updated"))
		 {
		 //man_sta.mail_from_manager(emp_id,given_notice,comments_text);
		
		 message="Successfully Updated Status ";
		 out.println("<font color=green>");
		 out.println(message);
		 out.println("</font>");
		 }
		 else
		 {
		 message="Sorry! Please Try Again";
		 out.println("<font color=red>");
		 out.println(message);
		 out.println("</font>");
		 }   */
	%>

</body>
</html>

