<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

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
	
	
	String ltype = request.getParameter("ltype");
		System.out.println("ltype..."+ltype);
		
	String desc1 = request.getParameter("desc1");
		System.out.println("desc1..."+desc1);
	String date1 = request.getParameter("date1");
		System.out.println("date1...."+date1);
		
	    SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
		Date date11 = format1.parse(date1);
	Object startDate=format2.format(date11);
		 System.out.println("start date.."+startDate); 
		 
		 
	String date2 = request.getParameter("date2");
		   
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date tempDate=simpleDateFormat.parse(date2);
    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
    Object endDate=outputDateFormat.format(tempDate);
		
	String mob = request.getParameter("mob");
		System.out.println("mob...."+mob);
	String absence = request.getParameter("absence");
	
	String calendar = request.getParameter("calendar");
	String txtarea = request.getParameter("txtarea");
		
					/* new code for inserting calendar */
				String mailid=(String)session.getAttribute("empid");
								System.out.println("id from jsp===="+mailid); 
								
					String status="pending";
	String nextprocessor="NA";
	float total=Float.parseFloat(request.getParameter("availed"));
	System.out.println("Available balance is"+total);
	System.out.println("selected days  balance is"+absence);
	
	float less=(total-Float.parseFloat(absence));
	System.out.println("final avilable balance balance is"+less);
	
	
	String from_ses=request.getParameter("from_ses").trim();
	String to_ses=request.getParameter("to_ses").trim();
	
	 String f_ses="Session 1";
	String t_ses="Session 2"; 
	
	System.out.println(" from_ses is in jsp:"+from_ses);
	System.out.println(" to_ses is in jsp:"+to_ses);
	String RegQry = "INSERT INTO CALENDAR_LEAVE_APPLY_TEST(MAILID,TYPE_OF_LEAVE,PHNO,START_DATE,END_DATE,ABSENCE_DAY,NOTE,NEXTPROCESSOR,STATUS,CALENDAR_DAY) VALUES('"+mailid+"','" + ltype+ "','"+mob+"','" + startDate + "','"+endDate+"', '"+absence +"','"+txtarea +"','"+nextprocessor+"','"+status+"','"+calendar+"')";
	System.out.println("RegQry..."+RegQry);
	
	//String getDBUSERByUserIdSql = "{call calendar('"+mailid+"','"+ltype+"','"+mob+"','"+startDate+"','"+calendar+"','"+txtarea+"')}";
	//System.out.println("getDBUSERByUserIdSql procedure..."+getDBUSERByUserIdSql);
	
		String balUpdat="update NCSS_ATTENDANCE_TIME_ACCOUNTS set AVAILABLE_BALANCE='"+less+"' 	where TYPE_OF_LEAVE='"+ltype+"' and EMP_ID='"+mailid+"'";	
		System.out.println("balUpdat..."+balUpdat);
		
		String msg = "";
			
		try {
					
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();
			Connection con1 = GetConnection.getConnection();
			Statement st1 = con.createStatement();
			
			int rs = st.executeUpdate(RegQry);
			//callableStatement = con.prepareCall(getDBUSERByUserIdSql);
			
			//callableStatement.executeUpdate();
			 if (rs > 0) {
				 int rs2=st1.executeUpdate(balUpdat);
				 if(rs2>0)
				 {
					 System.out.println("successfully leave upadated ");
				 }
				System.out.println("successfully leave apply ");
				msg = "successfully Applied";
				
			} else {

				msg = "please enter empty fields";
				System.out.println("please enter empty fields");
			} 

		} catch (Exception ex) {
			
			System.out.println("frm Insertion=="+ex.getMessage());

		} finally {

			out.println(msg);

		}
		Connection con_proc=null;
		 CallableStatement callableStatement = null;
		String case1 = "{call case1_procedure('"+mailid+"','"+startDate+"','"+calendar+"','"+absence+"','"+status+"','"+ltype+"')}";
		String case2 = "{call case2_procedure('"+mailid+"','"+startDate+"','"+calendar+"','"+absence+"','"+status+"','"+ltype+"')}";
		String case3 = "{call case3_procedure('"+mailid+"','"+startDate+"','"+calendar+"','"+absence+"','"+status+"','"+ltype+"')}";
		String case4 = "{call case4_procedure('"+mailid+"','"+startDate+"','"+calendar+"','"+absence+"','"+status+"','"+ltype+"')}";
	if( from_ses.equals(f_ses) && to_ses.equals(t_ses))
	{
	System.out.println("first if condition 1 2 ");
	try{
	con_proc= GetConnection.getConnection();
	callableStatement = con_proc.prepareCall(case1);
	callableStatement.executeUpdate();
	System.out.println("inserted through case1 procedure");
		}catch(Exception e){
			
			e.printStackTrace();
			System.out.println("not inserted through case1 procedure");
		}
	finally{
		con_proc.close();
		callableStatement.close();
	}
	}
	
	else if(from_ses.equals(t_ses) && to_ses.equals(t_ses))
	{
	System.out.println("second if condition 2 2");
	try{
		con_proc= GetConnection.getConnection();
		callableStatement = con_proc.prepareCall(case2);
		callableStatement.executeUpdate();
		System.out.println("inserted through case2 procedure");
			}catch(Exception e){
				
				e.printStackTrace();
				System.out.println("not inserted through case2 procedure");
			}
		finally{
			con_proc.close();
			callableStatement.close();
		}
	}
	
	else if(from_ses.equals(f_ses) && to_ses.equals(f_ses))
	{
	System.out.println("third if condition 1 1");
	try{
		con_proc= GetConnection.getConnection();
		callableStatement = con_proc.prepareCall(case3);
		callableStatement.executeUpdate();
		System.out.println("inserted through case3 procedure");
			}catch(Exception e){
				
				e.printStackTrace();
				System.out.println("not inserted through case3 procedure");
			}
		finally{
			con_proc.close();
			callableStatement.close();
		}
	}
	
	else if(from_ses.equals(t_ses) && to_ses.equals(f_ses))
	{
	System.out.println("fourth if condition 2 1 ");
	try{
		con_proc= GetConnection.getConnection();
		callableStatement = con_proc.prepareCall(case4);
		callableStatement.executeUpdate();
		System.out.println("inserted through case4 procedure");
			}catch(Exception e){
				
				e.printStackTrace();
				System.out.println("not inserted through case4 procedure");
			}
		finally{
			con_proc.close();
			callableStatement.close();
		}
		
	} 
	else{
		System.out.println("problem in geeting data in leave overview");
	}
	
	%>
	
</body>
</html>