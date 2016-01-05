<%@page import="com.ess.util.GetConnection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String lipp1 = request.getParameter("lipp1");
		String lipp2 = request.getParameter("lipp2");
		String lipp3 = request.getParameter("lipp3");

		String ppf1 = request.getParameter("ppf1");
		String ppf2 = request.getParameter("ppf2");
		String ppf3 = request.getParameter("ppf3");

		String nss1 = request.getParameter("nss1");
		String nss2 = request.getParameter("nss2");
		String nss3 = request.getParameter("nss3");

		String nsc1 = request.getParameter("nsc1");
		String nsc2 = request.getParameter("nsc2");
		String nsc3 = request.getParameter("nsc3");

		String cgb1 = request.getParameter("cgb1");
		String cgb2 = request.getParameter("cgb2");
		String cgb3 = request.getParameter("cgb3");

		String lap1 = request.getParameter("lap1");
		String lap2 = request.getParameter("lap2");
		String lap3 = request.getParameter("lap3");

		String elss1 = request.getParameter("elss1");
		String elss2 = request.getParameter("elss2");
		String elss3 = request.getParameter("elss3");

		String npf1 = request.getParameter("npf1");
		String npf2 = request.getParameter("npf2");
		String npf3 = request.getParameter("npf3");

		String db1 = request.getParameter("db1");
		String db2 = request.getParameter("db2");
		String db3 = request.getParameter("db3");

		String hlr1 = request.getParameter("hlr1");
		String hlr2 = request.getParameter("hlr2");
		String hlr3 = request.getParameter("hlr3");

		String ies1 = request.getParameter("ies1");
		String ies2 = request.getParameter("ies2");
		String ies3 = request.getParameter("ies3");

		String imf1 = request.getParameter("imf1");
		String imf2 = request.getParameter("imf2");
		String imf3 = request.getParameter("imf3");

		String tfc1 = request.getParameter("tfc1");
		String tfc2 = request.getParameter("tfc2");
		String tfc3 = request.getParameter("tfc3");

		String jsp1 = request.getParameter("jsp1");
		String jsp2 = request.getParameter("jsp2");
		String jsp3 = request.getParameter("jsp3");

		String mpn1 = request.getParameter("mpn1");
		String mpn2 = request.getParameter("mpn2");
		String mpn3 = request.getParameter("mpn3");

		String mps1 = request.getParameter("mps1");
		String mps2 = request.getParameter("mps2");
		String mps3 = request.getParameter("mps3");

		String ms1 = request.getParameter("ms1");
		String ms2 = request.getParameter("ms2");
		String ms3 = request.getParameter("ms3");

		String mth1 = request.getParameter("mth1");
		String mth2 = request.getParameter("mth2");
		String mth3 = request.getParameter("mth3");

		String mts1 = request.getParameter("mts1");
		String mts2 = request.getParameter("mts2");
		String mts3 = request.getParameter("mts3");

		String mtsc1 = request.getParameter("mtsc1");
		String mtsc2 = request.getParameter("mtsc2");
		String mtsc3 = request.getParameter("mtsc3");

		String tu1 = request.getParameter("tu1");
		String tu2 = request.getParameter("tu2");
		String tu3 = request.getParameter("tu3");

		String tu11 = request.getParameter("tu11");
		String tu12 = request.getParameter("tu12");
		String tu13 = request.getParameter("tu13");
		
		String datafile1=request.getParameter("datafile1");
		String datafile=request.getParameter("datafile");
		//java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
		//date d=new java.sql.Date();
		
		String mailid = (String) session.getAttribute("empid");
		System.out.println("id from jsp====" + mailid);
		String user = (String) session.getAttribute("empid");

		session.setAttribute("user", user);
		String id = (String) session.getAttribute("user");
		System.out.println("user from investment declaration save==== "+ user);
		
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
		
		
		String RegQry = "insert into EMP_INVESTMENT_DECLARATION VALUES('"
				+ lipp1 + "','" + lipp2 + "','" + lipp3 + "','" + ppf1
				+ "','" + ppf2 + "','" + ppf3 + "','" + nss1 + "','" + nss2
				+ "','" + nss3 + "','" + nsc1 + "','" + nsc2 + "','" + nsc3
				+ "','" + cgb1 + "','" + cgb2 + "','" + cgb3 + "','" + lap1
				+ "','" + lap2 + "','" + lap3 + "','" + elss1 + "','"
				+ elss2 + "','" + elss3 + "','" + npf1 + "','" + npf2
				+ "','" + npf3 + "','" + db1 + "','" + db2 + "','" + db3
				+ "','" + hlr1 + "','" + hlr2 + "','" + hlr3 + "','" + ies1
				+ "','" + ies2 + "','" + ies3 + "','" + imf1 + "','" + imf2
				+ "','" + imf3 + "','" + tfc1 + "','" + tfc2 + "','" + tfc3
				+ "','" + jsp1 + "','" + jsp2 + "','" + jsp3 + "','" + mpn1
				+ "','" + mpn2 + "','" + mpn3 + "','" + mps1 + "','" + mps2
				+ "','" + mps3 + "','" + ms1 + "','" + ms2 + "','" + ms3
				+ "','" + mth1 + "','" + mth2 + "','" + mth3 + "','" + mts1
				+ "','" + mts2 + "','" + mts3 + "','" + mtsc1 + "','"
				+ mtsc2 + "','" + mtsc3 + "','" + tu1 + "','" + tu2 + "','"
				+ tu3 + "','" + tu11 + "','" + tu12 + "','" + tu13
				+ "','"+datafile1+"','"+datafile+"','" + id + "','"+monthdate1+"')";

		String msg = "";
		try {

			Connection con = GetConnection.getConnection();
			Statement st = con.createStatement();

			int rs = st.executeUpdate(RegQry);
			if (rs > 0) {
				System.out
						.println("successfully inserted in investment declaration form ");
				msg = "successfully Applied";

			} else {

				msg = "Not inserted in investment declaration form";
				System.out.println("please enter empty fields");
			}

		} catch (Exception ex) {

			System.out
					.println("Not inserted in investment declaration form i am in exception block"
							+ ex.getMessage());

		} finally {

			System.out.println(msg);

		}
	%>




</body>
</html>