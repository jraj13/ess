<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import=" java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ess.util.GetConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String msg="";

	System.out.println("come into bank insert success page");
	
	
	String empid=request.getParameter("empid");
	System.out.println("empid..."+empid);
	
	String ename=request.getParameter("ename");
	System.out.println("ename..."+ename);
	
	String desing=request.getParameter("desing");
	System.out.println("desing..."+desing);
	
	String dept=request.getParameter("dept").toUpperCase();
	System.out.println("dept..."+dept);
	
	String loc=request.getParameter("loc").toUpperCase();
	System.out.println("loc..."+loc);
	
	String doj=request.getParameter("doj");
	System.out.println("doj..."+doj);
	
	
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date tempDate=simpleDateFormat.parse(doj);
    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
    Object doj1=outputDateFormat.format(tempDate);
		 System.out.println("end doj1.."+doj1); 
	
	
	
	String panno=request.getParameter("panno");
	System.out.println("panno..."+panno);
	
	String bankname=request.getParameter("bankname").toUpperCase();
	System.out.println("bankname..."+bankname);
	
	String acntno=request.getParameter("acntno");
	System.out.println("acntno..."+acntno);
	
	String pfno=request.getParameter("pfno").toUpperCase();
	System.out.println("pfno..."+pfno);
	
	
	String RegQry = "update  BANKINFO SET NAME='"+ename+"' ,DESIGNATION='"+desing+"',DEPARTMENT='" +dept + "',LOCATION='"+loc+"',PAN_NO='" +panno + "',PF_NO='" +pfno + "',DOJ='"+doj1+"',BANK_NAME='"+bankname+"',ACC_NO='"+acntno+"' WHERE EMP_ID='" +empid+ "' ";
	
	System.out.println("BANKINFO....."+RegQry);
		try {
					
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			int rs = st.executeUpdate(RegQry);
			if (rs > 0) {
				System.out.println("successfully  Updated ");
				msg = "Bank Info successfully updated";
				
			} else {
				
				msg="not updated";
				
			}

		} catch (Exception ex) {
			
			System.out.println("frm Insertion=="+ex.getMessage());

		} finally {

			out.println(msg);

		}

%>       
</body>
</html>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
