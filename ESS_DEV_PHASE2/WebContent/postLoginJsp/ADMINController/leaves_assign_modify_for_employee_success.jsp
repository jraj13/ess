<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ess.common.action.LeaveConfigAdmin"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String message = "";

String emp_id=request.getParameter("emp_id").trim();
float opening_pl=Float.parseFloat(request.getParameter("opening_pl").trim());

float ava_pl=Float.parseFloat(request.getParameter("available_pl").trim());
float new_pl=Float.parseFloat(request.getParameter("pl_new").trim());

float opening_sl=Float.parseFloat(request.getParameter("opening_sl").trim());
float ava_sl=Float.parseFloat(request.getParameter("available_sl").trim());
float new_sl=Float.parseFloat(request.getParameter("sl_new").trim());

float opening_cl=Float.parseFloat(request.getParameter("opening_cl").trim());
float ava_cl=Float.parseFloat(request.getParameter("available_cl").trim());
float new_cl=Float.parseFloat(request.getParameter("cl_new").trim());

float opening_adv_pl=Float.parseFloat(request.getParameter("opening_adv_pl").trim());
float ava_adv_pl=Float.parseFloat(request.getParameter("available_adv_pl").trim());
float new_adv_pl=Float.parseFloat(request.getParameter("advpl_new").trim());

float opening_adv_sl=Float.parseFloat(request.getParameter("opening_adv_sl").trim());
float ava_adv_sl=Float.parseFloat(request.getParameter("available_adv_sl").trim());
float new_adv_sl=Float.parseFloat(request.getParameter("advsl_new").trim());

float opening_comoff=Float.parseFloat(request.getParameter("opening_compoff").trim());
float ava_comoff=Float.parseFloat(request.getParameter("available_compoff").trim());
float new_comoff=Float.parseFloat(request.getParameter("compoff_new").trim());

LeaveConfigAdmin leave_update=new LeaveConfigAdmin();

String result_out=leave_update.update_Modified_Leaves(emp_id, new_pl, new_sl, new_cl, new_adv_pl, new_adv_sl, new_comoff, opening_pl, opening_sl, opening_cl, opening_adv_pl, opening_adv_sl, opening_comoff, ava_pl, ava_sl, ava_cl, ava_adv_pl, ava_adv_sl, ava_comoff);


System.out.println("leave modify status.../////" + result_out);

if (result_out.equalsIgnoreCase("Sucessfully modified leave")) {
	message = "Successfully Leave modify";
	out.println("<font color=green>");
	out.println(message);
	System.out.println(message);
	out.println("</font>");
} else {
	message = "Sorry! Please Try Again";
	out.println("<font color=red>");
	out.println(message);
	System.out.println(message);
	out.println("</font>");
}


%>
</body>
</html>