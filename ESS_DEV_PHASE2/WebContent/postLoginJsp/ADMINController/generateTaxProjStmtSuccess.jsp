<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
   <%@page import="java.sql.*" %>
   <%@page import="com.ess.util.GetConnection"%>
   
   <%@page import="com.ess.common.action.PayRollBasicInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String msg="";

String pro_id=null;
String pro_month=null;
String pro_year=null;

java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
String var1=df.format(new java.util.Date());
String[] date=var1.split("/");
System.out.println("year======="+date[2]);

Connection con = null;
CallableStatement callableStatement = null;

System.out.println("come in success page");

String values=request.getParameter("value");
System.out.println("values..."+values);

 String[] str1=values.split(";");
 int size = str1.length;
 System.out.println("size..."+size);
 
 String str11=Arrays.toString(str1);
 System.out.println("str11..."+str11);
 
 
 String empid="";
 String month="";
 
 PayRollBasicInfo restric=new PayRollBasicInfo();
 
 
 if(size==1)
 {
	 System.out.println("insideif condition");
	/*  String[] str2=str11.split(",");
	 System.out.println("size..."+size);
	
	 empid=str2[0];
	 month=str2[1]; */
	 
		String[] str_els=values.split(";");
	 
	 System.out.println("inside if condition");
	 
		 String[] inner = str_els[0].split(",");
		 System.out.println("after trim if ---"+inner[0]);
		 pro_id=inner[0].trim();
		  System.out.println("after trim month if---"+inner[1]);
		  pro_month=inner[1].trim();
		  
  int restric_value=restric.restric_taxprojection(pro_id, pro_month, date[2]);
		  
		  if(restric_value==0)
		  {
		  
		  String getDBUSERByUserIdSql = "{call TAXPROJECTION('"+pro_id+"','"+pro_month+"','"+date[2]+"')}";
			try {
				System.out.println("inside if condition ====="+getDBUSERByUserIdSql);
				con=GetConnection.getConnection();
				callableStatement = con.prepareCall(getDBUSERByUserIdSql);
				
			int rs=	callableStatement.executeUpdate();
			if(rs>0){
				
				msg="Tax Projection Generated successfully";
				
				System.out.println("Successfully inserted the record");
			}
			else{
				msg="Tax Projection Not  Generated";
			}

			}catch(Exception e)
			{
				e.printStackTrace();
			}

			finally{
				out.println(msg);
			}
			
		  }
		  else
		  {
			  out.println("Tax Projection statement is Allready Generated for this Month");
		  }
 }
 
	 

 else
 {
		try {
	 String[] str_els=values.split(";");
	 
	 System.out.println("inside else condition");
	 for(int i=0;i<str_els.length;i++)
		{
		 String[] inner = str_els[i].split(",");
		 
			 System.out.println("after trim else ---"+inner[0]);
			 pro_id=inner[0].trim();
			  System.out.println("after trim month else---"+inner[1]);
			  pro_month=inner[1].trim();
		
int restric_value=restric.restric_taxprojection(pro_id, pro_month, date[2]);
			  
			  if(restric_value==0)
			  {
			
				  String getDBUSERByUserIdSql = "{call TAXPROJECTION('"+pro_id+"','"+pro_month+"','"+date[2]+"')}";
					
					System.out.println("inside try====="+getDBUSERByUserIdSql);
					con=GetConnection.getConnection();
					callableStatement = con.prepareCall(getDBUSERByUserIdSql);
					
				int rs=	callableStatement.executeUpdate();
							
					if(rs>0){
						
						msg="Tax Projection Generated successfully";
						
						System.out.println("Successfully inserted the record");
					}
					else{
						msg="Tax Projection Not  Generated";
					}
							
			  }
			  
			  else
			  {
				 System.out.println("Tax Projection statement is Allready Generated for this Month"); 
				 msg="Tax Projection statement is Allready Generated for this Month";
			  }
		}
		}
	 catch(Exception e)
	 {
		 System.out.println("The problem exist in tax projection statement");
	 }
		
		finally{
			
		}
}
     %>
</body>
</html>