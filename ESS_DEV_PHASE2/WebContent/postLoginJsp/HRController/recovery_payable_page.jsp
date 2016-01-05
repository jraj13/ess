<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.ess.common.eseparation.Temporary_saving_Draft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String seq_no=request.getParameter("seq_no_ajax").trim();

System.out.println("the seq number is"+seq_no);
String resig_date=request.getParameter("resig_date");

System.out.println("resig_date"+resig_date);

Temporary_saving_Draft draft_get_payable=new Temporary_saving_Draft();

ArrayList<String> payable=draft_get_payable.getting_recovery_balance(seq_no);

if (payable.size() > 0) {
	for (int i = 0; i < payable.size(); i++) {
		String set_data_payable = payable.get(i).toString();
		
		String set_paya_arr[] = set_data_payable.split("\\^");
		String before_pl = set_paya_arr[0];
		String before_sl = set_paya_arr[1];
		String after_pl = set_paya_arr[2];
		
		String after_sl=set_paya_arr[3];
		String net_pl = set_paya_arr[4];
		String net_sl = set_paya_arr[5];
		
		String short_fall = set_paya_arr[6];
		String cl = set_paya_arr[7];
		
		String net_amt = set_paya_arr[8];




%>
<table id="recovery_pay_table">
						<tr>
							<td><b>Component</b></td>
							<td><b>Upto <%=resig_date %>  (Rs)</b></td>
							<td><b>After <%=resig_date %> (Rs)</b></td>
							<td>&nbsp;</td>
						</tr>
		
						<tr>
							<td>PL</td>
							<td><input value="<%=before_pl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" />
								
								</td>
							<td><input value="<%=after_pl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="<%=net_pl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>SL:</td>
							<td><input value="<%=before_sl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="<%=after_sl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
							<td><input value="<%=net_sl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Short falls in notice:</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="<%=short_fall %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
						</tr>

						<tr>
							<td>CL:</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="<%=cl %>" id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Net Amount<span>*</span>:
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><input value="<%=net_amt %> " id=""
								style="background-color: #dfecf5; height: 28px; width: 160px"
								readonly="readonly" /></td>
						</tr>

					</table> 
					<!-- <span id="err"> </span> -->
					<p>*The Net Amount if(-)ve indicates its recovery else its
						payable to employee.</p>
					<p>**For All the Leave calculation please refer the policy
						document.</p>
					<br />
<%
	}
}
%>
</body>
</html>