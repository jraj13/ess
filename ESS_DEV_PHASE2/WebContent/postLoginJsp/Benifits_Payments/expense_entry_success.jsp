
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
	int count=0;
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
	System.out.println("empidentrey number in expense entry===="+emp_count);
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
		 
		 		String ctype=inner[0].trim();
		 		System.out.println("ctype  ---"+ctype);
		 
		  
		  String bill_no=inner[1].trim().toUpperCase();
		  System.out.println("after bill no ---"+bill_no);
		  
		  
		  String bdate=inner[2].trim();
		  System.out.println("bill date  ---"+bdate);
		  
		  
		  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date tempDate=simpleDateFormat.parse(bdate);
		    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
		    //System.out.println("Output date is = "+outputDateFormat.format(tempDate));
		    Object bdate1=outputDateFormat.format(tempDate);
				 System.out.println("end Date.."+bdate1); 
			
		 	float exp_amount=Float.parseFloat(inner[3].trim());
			 System.out.println("exp aount---"+exp_amount);
			
			 String remarks=inner[4].trim();
			 System.out.println("remarks ---"+remarks);
			 
			  String if_query = "INSERT INTO ESS_EXPENSE_ENTRY(CLAIM_TYPE ,BILL_NO,BILL_DATE,EXP_AMOUNT,REMARKS,EMP_ID,count,emp_count) VALUES('"+ctype+"','" +bill_no+ "','"+bdate1+"','" +exp_amount + "','"+remarks+"', '"+empid+"','"+count+"','"+emp_count+"')";
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
		 
		 String ctype=inner[0].trim();
		 System.out.println("ctype else ---"+ctype);
		 
		  
		  String bill_no=inner[1].trim().toUpperCase();
		  System.out.println("after bill no else---"+bill_no);
		  
		  
		  String bdate=inner[2].trim();
		  System.out.println("bill date else ---"+bdate);
		  
		  
		  
		  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date tempDate=simpleDateFormat.parse(bdate);
		    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
		    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
		    Object bdate1=outputDateFormat.format(tempDate);
				 System.out.println("end Date.."+bdate1); 
		  
			
		 	float exp_amount=Float.parseFloat(inner[3].trim());
			 System.out.println("exp aount  else---"+exp_amount);
			
			 String remarks=inner[4].trim();
			 System.out.println("remarks else ---"+remarks);
			 
			  String if_query = "INSERT INTO ESS_EXPENSE_ENTRY(CLAIM_TYPE ,BILL_NO,BILL_DATE,EXP_AMOUNT,REMARKS,EMP_ID,count,emp_count) VALUES('"+ctype+"','" +bill_no+ "','"+bdate1+"','" +exp_amount + "','"+remarks+"', '"+empid+"','"+count+"','"+emp_count+"')";
			 //st.executeUpdate(if_query);
			 System.out.println(if_query);
			// msg="Succesfully enxpense entry inserted";
			 stmt.addBatch(if_query);
		 }
			
		else{
			
			String[] inner = str_els[j].split(",");
			 
			 String ctype=inner[1].trim();
			 System.out.println("ctype else ---"+ctype);
			 
			  
			  String bill_no=inner[2].trim();
			  System.out.println("after bill no else---"+bill_no);
			  
			  
			  String bill_date=inner[3].trim();
			  System.out.println("bill date else ---"+bill_date);
				
			  
			  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			    Date tempDate=simpleDateFormat.parse(bill_date);
			    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
			    //System.out.println("Output date is = "+outputDateFormat.format(tempDate));
			    Object bdate1=outputDateFormat.format(tempDate);
					 System.out.println("end Date.."+bdate1); 
			  
			  String exp_amount=inner[4].trim();
				 System.out.println("exp aount  else---"+exp_amount);
				
				 String remarks=inner[5].trim();
				 System.out.println("remarks else ---"+remarks);
				 String rls_query = "INSERT INTO ESS_EXPENSE_ENTRY(CLAIM_TYPE ,BILL_NO,BILL_DATE,EXP_AMOUNT,REMARKS,EMP_ID,count,emp_count) VALUES('"+ctype+"','" +bill_no+ "','"+bdate1+"','" +exp_amount + "','"+remarks+"', '"+empid+"','"+count+"','"+emp_count+"')";
				 System.out.println(rls_query);
				 //st.executeUpdate(rls_query);
				 
				 stmt.addBatch(rls_query);
			}
			
		}
			
			
		}
		int[] counter = stmt.executeBatch();
		con.commit();
		msg="Succesfully enxpense entry details are submitted";
		}
		catch(Exception e){
			msg="Please Enter all fields then try Again..";
		}
		finally{
			System.out.println("msg is---"+msg);
			if(msg=="Succesfully enxpense entry details are submitted"){
			out.println("<font color=green>");
            //out.println(msg);
            out.println("</font>");
			}else
				out.println("<font color=red>");
            out.println(msg);
            out.println("</font>");
			//out.print(msg);
			
		}
			
		

	%>
	
</body>
</html>





























<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

	String empid=(String)session.getAttribute("empid");
	System.out.println("empid for expense entry===="+empid);

	/* String empid=request.getParameter("empid".t);
	System.out.println("sid<><><><>"+empid); */
	
	String ctype = request.getParameter("ctype");
		System.out.println("ctype..."+ctype);
		
	String bnum = request.getParameter("bnum");
		System.out.println("bnum..."+bnum);
		
	String bdate = request.getParameter("bdate");
		System.out.println("bdate...."+bdate);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempDate=simpleDateFormat.parse(bdate);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/YYYY");           
	    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
	    Object bdate1=outputDateFormat.format(tempDate);
			 System.out.println("end Date.."+bdate1); 
		
		float eamount = Float.parseFloat(request.getParameter("eamount"));
		System.out.println("Amount is...."+eamount);
		
		String remarks = request.getParameter("remarks");
		
		System.out.println("remarks is ...."+remarks);
		
		
 /*  SimpleDateFormat format1 = new SimpleDateFormat("yyyy-mm-dd");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
	Date date1 = format1.parse(bdate);
		//  System.out.println(format2.format(date11)); 
	Object bdate1=format2.format(date1);
	 System.out.println("bill date.."+bdate1);   */
	
	String RegQry = "INSERT INTO ESS_EXPENSE_ENTRY(CLAIM_TYPE ,BILL_NO,BILL_DATE,EXP_AMOUNT,REMARKS,EMP_ID) VALUES('"+ctype+"','" +bnum+ "','"+bdate1+"','" +eamount + "','"+remarks+"', '"+empid+"')";
	 System.out.println("expense entry....."+RegQry);
		String msg = "";
		try {
					
			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			int rs = st.executeUpdate(RegQry);
			if (rs > 0) {
				System.out.println("successfully expense entry ");
				msg = "Expense Entry successfully inserted";
				
			} else {
				
				msg="not inserted";
				
			}

		} catch (Exception ex) {
			
			System.out.println("frm Insertion=="+ex.getMessage());

		} finally {

			out.println(msg);

		}
	%>
	
</body>
</html> --%>