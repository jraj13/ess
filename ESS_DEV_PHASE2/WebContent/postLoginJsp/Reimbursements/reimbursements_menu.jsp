<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="jstest/jquery2-ui.css">
 <link rel="stylesheet" href="cartian/jquery-ui.css">
 
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
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>Detailed Navigation</b></h3>
<div> 

 <ul style="align:left">
<li ><a href="#REIMBURS_ESS" id="REIMBURS_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Reimbursements"><b>Reimbursements</b></a></li>
<li><a href="#LOCAL_CONVE_ESS" id="LOCAL_CONVE_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Local Conveyance"><b>Local Conveyance</b></a></li>
<li><a href="#TELEPHONE_ESS" id="TELEPHONE_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Telephone"><b>Telephone</b></a></li>
<li><a href="#LTA_ESS" id="LTA_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="LTA"><b>LTA</b></a></li>

<li ><a href="#ACCI_REPAIR_ESS" id="ACCI_REPAIR_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Accident Repairs"><b>Accident Repairs</b></a></li>
<li><a href="#OTHER_REIMBURS_ESS" id="OTHER_REIMBURS_ESS" style="text-decoration: None;color:#FFFFFF;"	onclick="openPage(this.id);" title="Other Reimbursements"><b>Other Reimbursements</b></a></li>
<li><a href="#TTD_CLAIM_ESS" id="TTD_CLAIM_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="TTD Claim"><b>TTD Claim</b></a></li>
<li><a href="#CLAIM_PRINT_MEDI_ESS" id="CLAIM_PRINT_MEDI_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Claim Printout - Medical"><b>Claim Printout- Medical</b></a></li>

<li><a href="#CLAIM_PRINT_GEN_ESS" id="CLAIM_PRINT_GEN_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Claim Printout - General"><b>Claim Printout- General</b></a></li>
<li><a href="#REIMBURS_SUMM_ESS" id="REIMBURS_SUMM_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Reimbursement Summary"><b>Reimbursement Summary</b></a></li>
<li><a href="#REIMBURS_CLAIM_STATUS_ESS" id="REIMBURS_CLAIM_STATUS_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Reimbursement Claim Status"><b>Reimbursement Claim Status</b></a></li>
<li><a href="#REIMBURS_SLIP_ESS" id="REIMBURS_SLIP_ESS" style="text-decoration: None;color:#FFFFFF;" onclick="openPage(this.id);" title="Reimbursement Slip"><b>Reimbursement Slip</b></a></li>

</ul>

 </div> 
</div>


<div>

 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left"  style="margin-top:0%;"> 
</div>


</body>
</html>