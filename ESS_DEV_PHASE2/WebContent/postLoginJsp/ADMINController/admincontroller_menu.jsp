
<%@ page import="com.ess.common.eseparation.E_separation_ADMIN" %>

<html>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrapN/css/styles.css">
<script src="bootstrapN/css/script.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<title>CSS MenuMaker</title>
</head>
<body>

<%
E_separation_ADMIN e_ad=new E_separation_ADMIN();
String value=e_ad.geTotla_counts();
%>
	<div id='cssmenu'>
<!-- 	<br> -->
		<ul>
			<li class='has-sub'><a href='#'><span>Company Profile </span></a>
				<ul>
				<li ><a href="#CMPPF_ADCTRL" id="CMPPF_ADCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>About NCSS</b></a></li>
				<!-- <li ><a href="#ESR_ELC1" id="fgdg" style="text-decoration: None;color:#FF1493;" onclick="openPage11(this.id);"><b>exp2</b></a></li> -->
				</ul>
				</li>
				
			<li class='has-sub'><a href='#'><span>Reports</span></a>
				<ul>
					<li ><a href="#EXISTEMP_ADMCTRL" id="EXISTEMP_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Existing Employee</b></a></li>
  					<li ><a href="#NEXISTEMP_ADMCTRL" id="NEXISTEMP_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Non-Existing Employee</b></a></li>
					<li ><a href="#EMPATND_ADMCTRL" id="EMPATND_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Employee Attendance</b></a></li>
					<li ><a href="#GENTAXPROJSTMT_ADMCTRL" id="GENTAXPROJSTMT_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Generate Tax Projection Statement</b></a></li>
					<li ><a href="#TAXPROJSTMTR_ADMCTRL" id="TAXPROJSTMTR_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Tax Projection Statement Report</b></a></li>
					<li ><a href="#SAL_BREAKUP_STMT_ADMCTRL" id="SAL_BREAKUP_STMT_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Salary Breakup Statement</b></a></li>
					<li ><a href="#E_VOUCHER_REPORT_ADMCTRL" id="E_VOUCHER_REPORT_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>e-Voucher Report</b></a></li>
					<li ><a href="#EXPENSE_ENTRY_REPORT_ADMCTRL" id="EXPENSE_ENTRY_REPORT_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Expense Entry Report</b></a></li>
					
				</ul>
			</li>
			
			<li class='has-sub'><a href='#'><span>Information Center</span></a>
				<ul>
					<li ><a href="#NACMPNY_ADCTRL" id="NACMPNY_ADCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Latest News in NCSS</b></a></li>
  					<li ><a href="#NAESS_ADCTRL" id="NAESS_ADCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>News About ESS</b></a></li>
					
				</ul>
			</li>
			
			<li class='has-sub'><a href='#'><span>Employee Profile</span></a>	
		  <ul>  
			<li class='has-sub2'><a href='#'><span>Employee</span></a>
			<ul> 
			<li><a href="#CE_ADMCTRL" id="CE_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Create Employee</b></a></li> 
			<li><a href="#VE_ADMCTRL" id="VE_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>View/Edit Employee</b></a></li>
			<li><a href="#VEMPR_ADMCTRL" id="VEMPR_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>View Employee Who Resigned</b></a></li>
			
			</ul></li>
			</ul></li>
			
			<li class='has-sub'><a href='#'><span>Configuration</span></a>
			<ul>
  				<li ><a href="#PAYCONF_ADMCTRL" id="PAYCONF_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Payslip Configuration</b></a></li>
  				<li ><a href="#LEAVES_CONFIG_ADMCTRL" id="LEAVES_CONFIG_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Leaves Configuration</b></a></li>
  				<li ><a href="#LEAVES_ASSIGN_ADMCTRL" id="LEAVES_ASSIGN_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Leaves Assign</b></a></li>
				<li ><a href="#ATT_CONFIG_ADMCTRL" id="ATT_CONFIG_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Attendance Card Configuration</b></a></li>
				<li ><a href="#RPAYROLE_ADMCTRL" id="RPAYROLE_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Run Payroll</b></a></li>
				<li ><a href="#GENCTCSTMT_ADMCTRL" id="GENCTCSTMT_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Generate CTC Statement</b></a></li>
			</ul>
		</li>
		
			<li class='has-sub'><a href='#'><span>Bank Details</span></a>
				<ul>
					<li ><a href="#NEMPBNKD_ADMCTRL" id="NEMPBNKD_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>New Employee </b></a></li>
  					  <li ><a href="#BNKD_ADMCTRL" id="BNKD_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Update Bank Info</b></a></li> 
				</ul>
			</li>
		
		
		<li class='has-sub'><a href='#'><span>e-Separation Details</span></a>
				<ul>
					<li ><a href="#E_SEP_ADMIN_CONTROLL" id="E_SEP_ADMIN_CONTROLL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>e_Separation<span class="badge"><%=value %></span> </b></a></li>
  					  <!-- <li ><a href="#BNKD_ADMCTRL" id="BNKD_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Update Bank Info</b></a></li> --> 
				</ul>
			</li>
			
			<li class='has-sub'><a href='#'><span>e-Voucher/Expense</span></a>
				<ul>
					<li ><a href="#E_VOUCHER_ADMCTRL" id="E_VOUCHER_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>e-Voucher</b></a></li>
  				    <li ><a href="#EXPENTRYFRM_ADMCTRL" id="EXPENTRYFRM_ADMCTRL" style="text-decoration: None;color:#FF1493;" onclick="openPage(this.id);"><b>Expense Entry Form</b></a></li> 
				</ul>
			</li>
		
			 </ul> 
			
	</div>
<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  margin-top="10%"> 
</div>
</body>
<html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="jstest/jquery2-ui.css">
  <script src="jstest/jquery1-1.10.2.js"></script>
  <script src="jstest/jquery3-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <script>
  $(function() {
    $( "#accordion2" ).accordion({
      collapsible: true
    });
  });
  </script>

</head>
<body>

<div id="accordion2">
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>Career and Job</b></h3>
<div> 
 <ul align="left">
<li ><a href="#CE_ADMC" id="CE_ADMC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Create Employee</b></a></li>
<li><a href="#VE_ADMC" id="VE_ADMC" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);"><b>View /Edit Employee</b></a></li>
<li><a href="#RAF_ELC" id="RAF_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>View Employee who resigned</b></a></li>
<li><a href="#RFUM_ELC" id="RFUM_ELC" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);"><b>Generate Payslip</b></a></li>
</ul>
 </div> 
</div>
<div>
 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  margin-top="10%"> 
</div>
</body>
</html> --%>