<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.ess.common.action.E_Voucher_Expense" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String datesArray=request.getParameter("datesArray");
String selected_item=request.getParameter("selected_item");

System.out.println("datesArray..."+datesArray);

//DEC-2015,2015-16,123123,2015-12-01,2015-12-01,500,500,nothing,2015-12-01,456456,icici,2015-12-01,500,2015-12-01,;,DEC-2015,2015-16,321321,2015-12-25,2015-12-25,1000,1000,ok,2015-12-25,654654,hdfc,2015-12-25,1000,2015-12-25,;



 E_Voucher_Expense eve_tele_save=new E_Voucher_Expense();

String save_status=eve_tele_save.couriear_expenseentry_save(datesArray,selected_item);

System.out.println("Save status.."+save_status);

out.println(save_status);


%>
</body>
</html>