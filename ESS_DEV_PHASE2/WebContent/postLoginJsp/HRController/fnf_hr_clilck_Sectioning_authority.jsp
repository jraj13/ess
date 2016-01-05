<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
      <%@ page import="com.ess.common.eseparation.Full_N_Final_Settlement"%>
       <%@ page import="java.lang.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String message="";
String sequence_id=request.getParameter("sequence_id");
System.out.println("fnf_hr_click_senction_authority page..."+sequence_id);
String hr_clearance_process_status="Submitted to SA";

Full_N_Final_Settlement fnf_setttlement=new Full_N_Final_Settlement();
String result=fnf_setttlement.fnf_submit_to_SA(sequence_id,hr_clearance_process_status);

System.out.println("fnf_hr_click_senctioning_authority result..."+result);

if(result.equalsIgnoreCase("Yes")){
	
	message="Submitted to Sectioning Authority successfully";

	 out.println("<font color=green>");
	 out.println(message);
	 out.println("</font>");
}
else{
	
	
	message="not submitted ! Try again";
	 out.println("<font color=red>");
	 out.println(message);
	 out.println("</font>");

}




%>

</body>
</html>