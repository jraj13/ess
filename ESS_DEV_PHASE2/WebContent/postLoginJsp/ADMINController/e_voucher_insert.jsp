<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>

<%@ page import="com.ess.common.action.E_Voucher_Expense" %>
<%@ page import="com.servlet.Cash_Voucher_pdf_generation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String paid_to_name=request.getParameter("paid_to_name");
String reason_paid_amount=request.getParameter("reason_paid_amount");
String payment_type=request.getParameter("payment_type");
String cash_cheque_no=request.getParameter("cash_cheque_no");
float cash_cheque_amount=Float.parseFloat(request.getParameter("cash_cheque_amount"));

String date=request.getParameter("date");

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date tempDate=simpleDateFormat.parse(date);
System.out.println("tempdate.."+tempDate);
SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
System.out.println("Output date is = "+outputDateFormat.format(tempDate));
/*  String doj=outputDateFormat.format(tempDate11); */
Object date1=outputDateFormat.format(tempDate);
System.out.println(" date1.."+date1); 
	 

String sysdate=request.getParameter("sysdate");
System.out.println("sysdate.."+sysdate);

SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
Date tempDate1=simpleDateFormat1.parse(sysdate);
System.out.println("tempDate1.."+tempDate1);
SimpleDateFormat outputDateFormat1 = new SimpleDateFormat("dd/MMM/YYYY");           
System.out.println("Output sysdate is = "+outputDateFormat1.format(tempDate1));
/*  String doj=outputDateFormat.format(tempDate11); */
Object sysdate1=outputDateFormat1.format(tempDate1);
System.out.println(" sysdate1.."+sysdate1); 


String prepared_by=request.getParameter("prepared_by");


E_Voucher_Expense eve=new E_Voucher_Expense();
/* String result= */eve.e_voucher_entry(paid_to_name,reason_paid_amount,payment_type,cash_cheque_no,cash_cheque_amount,date1,sysdate1,prepared_by);
/* System.out.println(result);
if(result=="E_Voucher entry successfully done")
{
	out.println(result);
	 */
	//Cash_Voucher_pdf_generation  vv=new Cash_Voucher_pdf_generation();
	//String resul_pdf=vv.report_eoucher();
	//System.out.println("pdffffffffffffffffffffffffffffffffffffffffffffreply"+resul_pdf);
	
	
/* }
/* else{ */
	
	/* out.println(result);
}  */
System.out.println("this inserted successfully in e voucjer voucher");  

%>
</body>
</html>