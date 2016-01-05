 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.ess.common.action.SalaryStructure" %>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.middle{
text-align:center;
font-weight:bold;
}

.three {
    border-style: solid;
    border-width: 1px;
}
table {
    border-width: thin;
    border-spacing: 2px;
    border-style: none;
    border-color: black;
}

</style>
</head>
<body>
<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>Salary Break up Statement</I></h2><br>
<table style="border: 1px;">
<tr>
<td class="middle">Salary Components </td>
<td class="middle"> Monthly INR</td>
<td class="middle"> Annual INR</td>
</tr>
<%
ArrayList<String> salary_breakup = SalaryStructure.Breakup();
if (salary_breakup.size() > 0) {
	for (int i = 0; i < salary_breakup.size(); i++) {
		String salar_breakupdata = salary_breakup.get(i).toString();
		
		String salary[] = salar_breakupdata.split("\\^");
		String basic_month = salary[0];
		String hra_month = salary[1];
		String lta_month = salary[2];
		
		String medical_month = salary[3];
		String spa_month = salary[4];
		String gross_tot_month = salary[5];
		
		String pf_month = salary[6];
		String gratuty_month = salary[7];
		String esi_month = salary[8]; 
		String tot_ded_month = salary[9];
		String gross_month = salary[10];
		
		String basic_year = salary[11];
		String hra_year = salary[12];
		String lta_year = salary[13];
		
		String medical_year = salary[14];
		String spa_year = salary[15];
		String gross_tot_year = salary[16];

		String pf_year = salary[17];
		String gratuty_year = salary[18];
		String esi_year = salary[19]; 
		String tot_ded_year = salary[20];
		String gross_year = salary[21];
		
		String ctc=salary[22];
		String month_ctc=salary[23];
		
		String month_conveyance=salary[24];
		String year_conveyance=salary[25];
%>
<tr>
<td >Basic</td>
<td><input type="text" value="<%=basic_month%>"/> </td>
<td><input type="text" value="<%=basic_year%>"/> </td>
</tr>
<tr>
<td>HRA </td>
<td><input type="text" value=" <%=hra_month%>"/>  </td>
<td><input type="text" value="<%=hra_year%>"/>  </td>
</tr>
 <tr>
<td>Conveyance</td>
<td><input type="text" value="<%=month_conveyance%>"/> </td>
<td> <input type="text" value="<%=year_conveyance%>"/> </td>
</tr> 
<tr>
<td>Leave Travel Allowance</td>
<td><input type="text" value="<%=lta_month%>"/>  </td>
<td> <input type="text" value="<%=lta_year%>"/> </td>
</tr>


<tr>
<td>Medical </td>
<td><input type="text" value="<%=medical_month%>"/> </td>
<td> <input type="text" value="<%=medical_year%>"/> </td>
</tr>

<tr>
<td>Special Personal Allowance </td>
<td><input type="text" value="<%=spa_month%>"/>  </td>
<td><input type="text" value="<%=spa_year%>"/>  </td>
</tr>

<tr>
<td class="middle">Gross Total </td>
<td><input type="text" value="<%=gross_tot_month%>"/>  </td>
<td><input type="text" value="<%=gross_tot_year%>"/>  </td>
</tr>
<tr>
<td class="middle" colspan="3"> Less Deductions</td>
<!-- <td> <input type="text" value=""/> </td>
<td> <input type="text" value=""/> </td> -->
</tr>
<tr>
<td> Provident Fund(As per Act)</td>
<td> <input type="text" value="<%=pf_month%>"/> </td>
<td> <input type="text" value="<%=pf_year%>"/> </td>
</tr>
<tr>
<td>Gratuity(As per Act) </td>
<td> <input type="text" value="<%=gratuty_month%>"/> </td>
<td><input type="text" value="<%=gratuty_year%>"/>  </td>
</tr>


<tr>
<td>ESI(as per Act) </td>
<td> <input type="text" value="<%=esi_month%>"/> </td>
<td><input type="text" value="<%=esi_year%>"/>  </td>
</tr>
<tr>
<td class="middle">Total Deductions</td>
<td><input type="text" value="<%=tot_ded_month%>"/>  </td>
<td> <input type="text" value="<%=tot_ded_year%>"/></td>
</tr>
<tr>
<td class="middle"> Gross</td>
<%-- <td> <input type="text" value="<%=gross_tot_month%>"/> </td>
<td> <input type="text" value="<%=gross_tot_month%>"/> </td> --%>
<td> <input type="text" value="<%=gross_month%>"/> </td>
<td> <input type="text" value="<%=gross_year%>"/> </td>

</tr>
<tr>
<td class="middle" colspan="3"> Employer Contribution</td>
<!-- <td> <input type="text" value=""/> </td>
<td> <input type="text" value=""/> </td> -->
</tr>
<tr>
<td>Provident Fund(As per Act) </td>
<td> <input type="text" value="<%=pf_month%>"/> </td>
<td><input type="text" value="<%=pf_year%>"/>  </td>
</tr>

<tr>
<td class="middle">Total </td>
<%-- <td><input type="text" value="<%=gross_month%>"/>  </td>
<td> <input type="text" value="<%=gross_year%>"/> </td> --%>
<td><input type="text" value="<%=pf_month%>"/>  </td>
<td> <input type="text" value="<%=pf_year%>"/> </td>
</tr>
<tr>
<td class="middle">CTC </td>
<td> <input type="text" value="<%=month_ctc%>"/> </td>
<td> <input type="text" value="<%=ctc%>"/></td>
</tr>
<%
	}
}
%>


</table>
</body>
</html>
