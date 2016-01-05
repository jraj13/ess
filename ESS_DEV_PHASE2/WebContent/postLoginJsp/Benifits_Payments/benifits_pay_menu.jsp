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
  <h3 style="color:#FFFFFF;font-size:15px;BACKGROUND-COLOR:#FF1493;"><b>BENEFITS AND PAYMENTS </b></h3>
<div> 

 <ul align="left"  >
<!-- <li ><a href="#B_PAY" id="B_PAY" style="text-decoration: None;color:#FFFFFF;" title="Benifits and Payments" onclick="openPage(this.id);"><b>Benifits and Payments</b></a></li> -->
<li><a href="#PAY" id="PAY" style="text-decoration: None;color:#FFFFFF;"title="Payslip"	onclick="openPage(this.id);"><b>Payslip</b></a></li>
<li><a href="#CTC" id="CTC" style="text-decoration: None;color:#FFFFFF;" title="General CTC Statement" onclick="openPage(this.id);"><b>General CTC Statement</b></a></li>
<li><a href="#PCTC" id="PCTC" style="text-decoration: None;color:#FFFFFF;" title="Print Currnet CTC Statement" onclick="openPage(this.id);"><b>Print Current CTC Statement</b></a></li>

<li><a href="#TAXPRO" id="TAXPRO" style="text-decoration: None;color:#FFFFFF;" title="Tax Projection Statement" onclick="openPage(this.id);"><b>Tax Projection Statement</b></a></li>
<li><a href="#INVESTDEC" id="INVESTDEC" style="text-decoration: None;color:#FFFFFF;" title="Investment Declaration" onclick="openPage(this.id);"><b>Investment Declaration</b></a></li>
<li><a href="#IDECPRINT" id="IDECPRINT" style="text-decoration: None;color:#FFFFFF;" title="Investment Declaration Print" onclick="openPage(this.id);"><b>Investment Declaration Print</b></a></li>
<li ><a href="#INTHOME" id="INTHOME" style="text-decoration: None;color:#FFFFFF;" title="Interest On Home loan" onclick="openPage(this.id);"><b>Interest On Home loan</b></a></li>
<li><a href="#EXP" id="EXP" style="text-decoration: None;color:#FFFFFF;" title="Expense Entry"	onclick="openPage(this.id);"><b>Expense Entry</b></a></li>
<li><a href="#EXPGEN" id="EXPGEN" style="text-decoration: None;color:#FFFFFF;" title="Expense Form Generation/Deletion" onclick="openPage(this.id);"><b>Expense Form Generation/Deletion</b></a></li>
<li><a href="#EXPPRINT" id="EXPPRINT" style="text-decoration: None;color:#FFFFFF;" title="Expense Form Printing"  onclick="openPage(this.id);"><b>Expense Form Printing</b></a></li>
<li><a href="#FUEL" id="FUEL" style="text-decoration: None;color:#FFFFFF;" title="Fuel And Maintainance Details"  onclick="openPage(this.id);"><b>Fuel And Maintenance Details</b></a></li>
<li><a href="#CHOICEPAYSOP" id="CHOICEPAYSOP" style="text-decoration: None;color:#FFFFFF;" title="Choice Pay SOP" class='last' onclick="openPage(this.id);"><b>Choice Pay SOP</b></a></li>
<li><a href="#CHOICEPAY" id="CHOICEPAY" style="text-decoration: None;color:#FFFFFF;" title="Choice Pay Entry" onclick="openPage(this.id);"><b>Choice Pay Entry</b></a></li>
<li><a href="#CHOICEPAY_DISPLAY" id="CHOICEPAY_DISPLAY" style="text-decoration: None;color:#FFFFFF;" title="Choice Pay Display" onclick="openPage(this.id);"><b>Choice Pay Display</b></a></li>
<li><a href="#F16" id="F16" style="text-decoration: None;color:#FFFFFF;" title="Form 16" onclick="openPage(this.id);"><b>Form 16</b></a></li>
<li><a href="#GUIDEF16" id="GUIDEF16" style="text-decoration: None;color:#FFFFFF;" title="Guidelines Of Form 16" class='last' onclick="openPage(this.id);"><b>Guidelines Of Form 16</b></a></li>

</ul>

 </div> 
</div>


<div>

<!--  <img src="D:\eimages\unite2.jpg" alt="Unite2" width="45%" height="30%" align="left" margin-top:10%> --> 
<!-- <img src="postLoginJsp/images/sidebar_menu_img.PNG" alt="Unite2" width="90%" height="30%" align="left" margin-top:10%> -->
 <img src="postLoginJsp/images/sidebar_menu_img.PNG"  width="99%" height="45%" align="left" style="margin-top:0%"> 
</div>


</body>
</html>