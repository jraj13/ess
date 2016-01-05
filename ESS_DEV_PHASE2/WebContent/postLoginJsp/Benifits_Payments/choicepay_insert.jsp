<%@page import="com.ess.util.GetConnection"%>
<%@page import="com.ess.common.action.MailPusherActionChoicePay" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choice pay Insert Page</title>
</head>
<body>
	<%
	
		String ctc = request.getParameter("ctc");
		String basic = request.getParameter("basic");
		String basepay = request.getParameter("basepay");

		String pli = request.getParameter("pli");
		String value = request.getParameter("value");
		String spa = request.getParameter("spa");

		String acp = request.getParameter("acp");
		String mr1 = request.getParameter("mr1");
		String mr2 = request.getParameter("mr2");

		String cea1 = request.getParameter("cea1");
		String cea2 = request.getParameter("cea2");
		String coa1 = request.getParameter("coa1");

		String coa2 = request.getParameter("coa2");
		String fme1 = request.getParameter("fme1");
		String fme2 = request.getParameter("fme2");

		String hra1 = request.getParameter("hra1");
		String hra2 = request.getParameter("hra2");
		String lta1 = request.getParameter("lta1");

		String lta2 = request.getParameter("lta2");
		String ernc = request.getParameter("ernc");
		String ernc1 = request.getParameter("ernc1");

		String ab = request.getParameter("ab");
		String we = request.getParameter("we");
		String cha1 = request.getParameter("cha1");

		String cha2 = request.getParameter("cha2");
		String fc1 = request.getParameter("fc1");
		String fc2 = request.getParameter("fc2");

		String ee = request.getParameter("ee");
		String fe = request.getParameter("fe");
		String ub1 = request.getParameter("ub1");

		String ub = request.getParameter("ub");
		String gf2 = request.getParameter("gf2");
		
		

		String id = (String) session.getAttribute("empid");
		System.out.println("id from choice pay====" + id);
		
		System.out.println("user id in choice pay entry form is==== "
				+ id);
		
		java.sql.Date dt1 = new java.sql.Date(System.currentTimeMillis());
		String dt1Text = dt1.toString();
		System.out.println("Current Date1 : " + dt1Text);
		
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Date tempDate=simpleDateFormat.parse(dt1Text);
	    System.out.println("tempdate.."+tempDate);
	    SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MMM/yyyy");           
	    System.out.println("Output date is = "+outputDateFormat.format(tempDate));
	    String monthdate1=outputDateFormat.format(tempDate);
			 System.out.println(" monthdate1.."+monthdate1); 
		
				
		
		String choicepay = "insert into EMP_DETAIL_TEMP(EMP_ID,TOTAL_CTC,BASIC,BASE_PAY,PLI,CHOICE_PAY,SPA,ACP,MEDICAL_OLD,MEDICAL_NEW,CHILDREN_OLD,CHILDREN_NEW,CONVEYANCE_OLD,CONVEYANCE_NEW,FUEL_OLD,FUEL_NEW,HRA_OLD,HRA_NEW,LTA_OLD,LTA_NEW,ER_NPS_OLD,ER_NPS_NEW,ADVANCE,WASHING,CHILDREN_H_OLD,CHILDREN_H_NEW,FOOD,ENTERTAINMENT,FUEL_ONLY,UTILITY_BILLS,GIFT_NEW,DATE_TIME) VALUES('"
				+ id + "','"+ ctc + "','" + basic + "','" + basepay + "','" + pli
				
				+ "','" + value + "','" + spa + "','" + acp + "','" + mr1
				
				+ "','" + mr2 + "','" + cea1 + "','" + cea2 + "','" + coa1
				
				+ "','" + coa2 + "','" + fme1 + "','" + fme2 + "','" + hra1
				
				+ "','" + hra2 + "','" + lta1 + "','" + lta2 + "','"
				
				+ ernc + "','" + ernc1 + "','" + ab + "','" + we
				
				+ "','" + cha1 + "','" + cha2 + "','" + fc2
				
				+ "','" + ee + "','" + fe + "','" + ub
				
				+ "','" + gf2 + "','" + monthdate1 + "')";
		System.out.println(choicepay);

		String msg = "";
		
		try {

			Connection conn = GetConnection.getConnection();
			Statement st1 = conn.createStatement();

			int rs1 = st1.executeUpdate(choicepay);
			if (rs1 > 0) {
				
				   MailPusherActionChoicePay mp=new MailPusherActionChoicePay();
					mp.executeMail();   
				
				System.out.println("successfully inserted in choice pay form ");
				msg = "Choice pay entry successfully submitted";
				
			} else {

				msg = "Not submitted in choicepay form";
			
			}

		} catch (Exception ex) {

			System.out.println("Not inserted in choicepay form i am in exception block"+ ex.getMessage());

		} finally {
	out.println(msg);
			System.out.println(msg);

		}
	%>

</body>
</html>