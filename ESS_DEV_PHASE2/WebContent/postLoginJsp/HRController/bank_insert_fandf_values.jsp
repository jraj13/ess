<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.ess.common.eseparation.Temporary_saving_Draft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String bank_emp=request.getParameter("bank_emp").trim();

String acc_no_emp=request.getParameter("acc_no_emp").trim();

String micr_no_emp=request.getParameter("micr_no_emp").trim();

String cheque_adv=request.getParameter("cheque_adv").trim();

String bank_acc_adv=request.getParameter("bank_acc_adv").trim();

String bank_name_adv=request.getParameter("bank_name_adv").trim();

float amout_adv=Float.parseFloat(request.getParameter("amout_adv").trim());

String date_adv=request.getParameter("date_adv").trim();

//System.out.println("date in bank ::::::::::::::::::::"+date_adv);



String seq_no=request.getParameter("seq_no").trim();
Object bank_date;




if(date_adv!=""){
	//System.out.println("date in bank if condition::::::::::::::::::::"+date_adv);
	
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate=simpleDateFormat.parse(date_adv);
SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
 bank_date=outputDateFormat.format(tempDate);
	 //System.out.println("bank date is.."+bank_date); 
	 
}
else
{
	//System.out.println("date in bank else condition::::::::::::::::::::"+date_adv);
	bank_date=null;
}
	 
	 
Temporary_saving_Draft bank_insert_draft=new Temporary_saving_Draft();
	 
	 

String final_bank_res=bank_insert_draft.inserting_bank_details(bank_emp,acc_no_emp,micr_no_emp,cheque_adv,bank_acc_adv,bank_name_adv,amout_adv,bank_date,seq_no);

//System.out.println("dresult msg ::::::"+final_bank_res);
if(final_bank_res.equalsIgnoreCase("insert"))
{
	out.println("bank details drafted successfuly");
}
else if(final_bank_res.equalsIgnoreCase("update"))
{
	out.println("bank details updated successfuly");
}
else
{
	out.println("sorry try again....");
}
%>
</body>
</html>