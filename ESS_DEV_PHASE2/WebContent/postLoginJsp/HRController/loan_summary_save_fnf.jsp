
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ess.util.GetConnection"%>
<%@page import="com.ess.common.action.GetaxId"%>

<%@page import="java.util.Arrays" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String msg="";
	Connection con = null;
	Statement stmt =null;
/* 	int count=0;
	String max_id=GetaxId.max();
	if(max_id==null)
	{
		count=1;
	}
	else
	{
	count=1+Integer.parseInt(max_id);
	}
	System.out.println("count is"+count);
	

	String empid=(String)session.getAttribute("empid");
	System.out.println("empid for expense entry===="+empid);

	String emp_count=empid+"-"+String.valueOf(count);
	System.out.println("empidentrey number in expense entry===="+emp_count); */
	
	String seq_no=request.getParameter("seq_no");	
	System.out.println("array list in jsp is seq_no"+seq_no);
	
	String arra_entry=request.getParameter("datesArray");	
	System.out.println("array list in jsp is"+arra_entry);
	
		String[] str_els=arra_entry.split(";");
		
		 int size=str_els.length;
			System.out.println("array list in else statement is"+size);

			try{
			 System.out.println("inside if size is 1 condition");
			  con=GetConnection.getConnection();
			stmt=con.createStatement(); 
			con.setAutoCommit(false);
				
			if(size==1){
				 
				for(int i=0;i<str_els.length;i++)
					{
					 
				String[] inner = str_els[i].split(",");
		 
		 		String subtype_bnl2=inner[0].trim();
		 		System.out.println("subtype_bnl2=  ---"+subtype_bnl2);
		 
		  
		  String description_bnl2=inner[1].trim();
		  System.out.println(" description_bnl2 ---"+description_bnl2);
		  
		  String loan_amount_bnl2=inner[2].trim();
		  System.out.println("loan_amount_bnl2  ---"+loan_amount_bnl2);
		   
			
		 	String balance_amount_bnl2=inner[3].trim();
			 System.out.println(" balance_amount_bnl2---"+balance_amount_bnl2);
			
			 String repay_amount_bnl2=inner[4].trim();
			 System.out.println("repay_amount_bnl2 ---"+repay_amount_bnl2);
			 
			/*  String seq_no=inner[5].trim();
			 System.out.println("seq_no ---"+seq_no); */
			 
			  String if_query = "INSERT INTO EMP_FNF_LOAN_SUMMARY(RESIGNATION_NO ,SUB_TYPE,DESCRIPTION,LOAN_AMOUNT,BALANCE_AMOUNT,SPE_REPAYMENT_AMOUNT) VALUES('"+seq_no+"','" +subtype_bnl2+ "','"+description_bnl2+"','" +loan_amount_bnl2 + "','"+balance_amount_bnl2+"', '"+repay_amount_bnl2+"')";
			  System.out.println("query ---"+if_query);
			  
			  stmt.addBatch(if_query);
			 
		 }
				}
					
			
			
		else if(size>1){
			
			
			for(int j=0;j<str_els.length;j++)
			{
			if(j==0)
			{
				
		String[] inner = str_els[j].split(",");
		 
		String subtype_bnl2=inner[0].trim();
 		System.out.println("subtype_bnl2=  ---"+subtype_bnl2);
 
  
  String description_bnl2=inner[1].trim();
  System.out.println(" description_bnl2 ---"+description_bnl2);
  
  String loan_amount_bnl2=inner[2].trim();
  System.out.println("loan_amount_bnl2  ---"+loan_amount_bnl2);
   
	
 	String balance_amount_bnl2=inner[3].trim();
	 System.out.println(" balance_amount_bnl2---"+balance_amount_bnl2);
	
	 String repay_amount_bnl2=inner[4].trim();
	 System.out.println("repay_amount_bnl2 ---"+repay_amount_bnl2);
	 
	/*  String seq_no=inner[5].trim();
	 System.out.println("seq_no ---"+seq_no); */
	 
	  String if_query = "INSERT INTO EMP_FNF_LOAN_SUMMARY(RESIGNATION_NO ,SUB_TYPE,DESCRIPTION,LOAN_AMOUNT,BALANCE_AMOUNT,SPE_REPAYMENT_AMOUNT) VALUES('"+seq_no+"','" +subtype_bnl2+ "','"+description_bnl2+"','" +loan_amount_bnl2 + "','"+balance_amount_bnl2+"', '"+repay_amount_bnl2+"')";
	  System.out.println("query ---"+if_query);
			// msg="Succesfully enxpense entry inserted";
			 stmt.addBatch(if_query);
		 }
			
		else{
			
			String[] inner = str_els[j].split(",");
			 
			String subtype_bnl2=inner[1].trim();
	 		System.out.println("subtype_bnl2=  ---"+subtype_bnl2);
	 
	  
	  String description_bnl2=inner[2].trim();
	  System.out.println(" description_bnl2 ---"+description_bnl2);
	  
	  String loan_amount_bnl2=inner[3].trim();
	  System.out.println("loan_amount_bnl2  ---"+loan_amount_bnl2);
	   
		
	 	String balance_amount_bnl2=inner[4].trim();
		 System.out.println(" balance_amount_bnl2---"+balance_amount_bnl2);
		
		 String repay_amount_bnl2=inner[5].trim();
		 System.out.println("repay_amount_bnl2 ---"+repay_amount_bnl2);
		 
		/*  String seq_no=inner[5].trim();
		 System.out.println("seq_no ---"+seq_no); */
		 
		  String rls_query = "INSERT INTO EMP_FNF_LOAN_SUMMARY(RESIGNATION_NO ,SUB_TYPE,DESCRIPTION,LOAN_AMOUNT,BALANCE_AMOUNT,SPE_REPAYMENT_AMOUNT) VALUES('"+seq_no+"','" +subtype_bnl2+ "','"+description_bnl2+"','" +loan_amount_bnl2 + "','"+balance_amount_bnl2+"', '"+repay_amount_bnl2+"')";
		  System.out.println("query ---"+rls_query);
				 //st.executeUpdate(rls_query);
				 
				 stmt.addBatch(rls_query);
			}
			
		}
			
			
		}
		int[] counter = stmt.executeBatch();
		con.commit();
		msg="Successfully loan details are saved";
		}
		catch(Exception e){
			msg="Please Enter all fields then try Again !";
		}
		finally{
			/* System.out.println("msg is---"+msg);
			if(msg=="Succesfully bond details are saved"){
			out.println("<font color=green>");
            out.println(msg);
            out.println("</font>");
			}else if(msg=="Please Enter all fields then try Again"){
				out.println("<font color=red>");
            out.println(msg);
            out.println("</font>"); */
			out.print(msg);
			/* } */
		}

	%>
	
</body>
</html>


