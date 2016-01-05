<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.eseparation.E_separation_ADMIN"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Resignation Details in ESS</title>

</head>
<body>
<h2 style="background-color: skyblue;margin-left:-3.5%;padding-left:15px">Employee Resignation Status </h2>
<table >
							
							<%
							System.out.println("check_emp_status.jsp");  
							String seq_id=request.getParameter("seq_id");
							
							ArrayList<String> esepObj = E_separation_ADMIN.emp_status_check(seq_id);
							
							
								if (esepObj.size() > 0) {
									for (int i = 0; i < esepObj.size(); i++) {
										String req = esepObj.get(i).toString();
										String reqarr[] = req.split("\\^");
										
										 String empid = reqarr[0];
										 String reason = reqarr[1];
										 String detailed = reqarr[2];
										 String creation_date = reqarr[3];
									     String reliving_date = reqarr[4];
									     
										 String anp = reqarr[5];
										 String gnp = reqarr[6];
										 
										 String emp_note = reqarr[7];
										 
										 String rm_name = reqarr[8];
										 String rm_approve = reqarr[9];
										 String rm_note = reqarr[10];
										 
										 String hr_approve = reqarr[11];
										 String hr_note = reqarr[12];
										
										 String admin_approve = reqarr[13];
										 String admin_note = reqarr[14];
							%>
								
							<tr>
								<td><label>EMPLOYEE ID </label></td> 
								<td><%=empid%></td>
								</tr>
								
								<tr>
								<td><label>REASON FOR RESIGN</label></td>
								<td><%=reason%></td>
								</tr>
								
								<tr>
								<td><label>DETAIL REASON FOR RESIGN</label> </td> 
								<td><%=detailed%></td>
								</tr>
								<tr>
								<td><label>CREATION DATE</label> </td> 
								<td><%=creation_date%></td>
								</tr>
								<tr>
									<td><label>RELEAVING DATE</label> </td>
								<td><%=reliving_date%></td>
								</tr>
								<tr>
								<td><label>ACTUAL NOTICE PERIOD </label></td>
								
								<td><%=anp%></td>
								</tr>
								<tr>
								<td><label>GIVING NOTICE PERIOD</label> </td>
								<td><%=gnp%></td>
								</tr>
								<tr>
								<td><label>EMPLOYEE NOTES</label> </td>
								<td><%=emp_note%></td>
								</tr>
								<tr>
								<td><label>REPORTING MANAGER NAME</label></td>
								<td><%=rm_name%></td>
								</tr>
								<tr>
								<td><label>REPORTING MANAGER STATUS</label> </td>
								<td><%=rm_approve%></td>
								</tr>
								<tr>
								<td><label>REPORTING MANAGER COMMENTS</label> </td>
								<td><%=rm_note%></td>
								</tr>
								
								<tr>
								<td><label>HR STATUS </label></td>
								<td><%=hr_approve%></td>
								</tr>
								<tr>
								<td><label>HR COMMENTS </label></td>
								<td><%=hr_note%></td>
								</tr>
								
								<tr>
								<td><label>ADMIN STATUS </label></td>
								<td><%=admin_approve%></td>
								</tr>
								<tr>
								<td><label>ADMIN COMMENTS </label></td>
								<td> <%=admin_note%></td>
								</tr>

							<%
								}
								} else {
							%>
							<tr>
								<td colspan="20">No Records Available</td>
							</tr>

							<%
								}
							%>
						</table>


</body>
</html>