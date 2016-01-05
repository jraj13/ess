<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.ess.common.action.PayslipAction"%>
     <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
     <%@ page import="java.io.*,java.text.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

<style>
table{
width:35%;
}
/* .inlineTable1 {
            display: inline-block;
            width:26%;
            font-size:10px;
        }
 .inlineTable {
            display: inline-block;
            width:20%;
            font-size:10px;
        } */
.tablepayconfig tr {
  border-spacing: 0px;  
    border-style:none; 
    height:1px;
}
.tablepayconfig td {
  border-spacing: 0px;  
    border-style:none;
 
     /*   border: 0px; */
    /*  font-size: 0.60em; */
    
}
/* td.normal{
text-indent: 1em;
font-size:10px;
font-weight: bold;
height:2px;
}
td.small{
font-size:10px;
text-indent: 3em;
height:2px;
}
br {
  content: " ";
  display: block;
  margin: 0.5em;
}
.fontst
{
font-size: 10px;
text-indent: 3em;
height: 2px;
} */
</style>

<script src="investmentjs/ChoicePayCal_update.js"></script>
<script type="text/javascript">
function validate() {
	// document.getElementById('edit').style.visibility = 'hidden';
		alert("Please Update Now ");
    x=document.getElementById("basic")
    x.disabled = !x.disabled;
    x=document.getElementById("hra2")
    x.disabled = !x.disabled;
    x=document.getElementById("coa2")
    x.disabled = !x.disabled;
    
    x=document.getElementById("lta2")
    x.disabled = !x.disabled;
    x=document.getElementById("mr2")
    x.disabled = !x.disabled;
  /*   x=document.getElementById("sp")
    x.disabled = !x.disabled; */
    
    x=document.getElementById("pf")
    x.disabled = !x.disabled;
    x=document.getElementById("gratuity")
    x.disabled = !x.disabled;
    x=document.getElementById("esi")
    x.disabled = !x.disabled;
    x=document.getElementById("pli")
    x.disabled = !x.disabled;

}
</script>

<script>
function update()
{
	alert("update save");
		var basic=document.getElementById("basic").value;
		alert(basic);
		var hra=document.getElementById("hra2").value;
		var conv=document.getElementById("coa2").value;
		alert(conv);
		var lta=document.getElementById("lta2").value;
		var ma=document.getElementById("mr2").value;
		/* var sp=document.getElementById("sp").value; */
		
		var pf=document.getElementById("pf").value;
		var gratuity=document.getElementById("gratuity").value;
		var esi=document.getElementById("esi").value;
		var pli=document.getElementById("pli").value;
		alert(pli);
		 window.location = "PayslipConfigUpdate?basic1=" +basic+ "&hra1=" +hra+ "&conv1=" +conv+ "&lta1=" +lta+ "&ma1=" +ma+ "&pf1=" +pf+ "&gratuity1=" +gratuity+ "&esi1=" +esi+ "&pli1=" +pli;
		// document.getElementById('update').style.visibility = 'hidden';
		// document.getElementById('edit').style.visibility = 'visible'; 
		
		 alert("Recored Updated Successfully ");
		}

</script>

</head>
<body>

<%

String choiceFormDetails=PayslipAction.payslipConfig();

String choiceFormDetailsAry[]=choiceFormDetails.split("\\^");

String BASIC=choiceFormDetailsAry[0];
String HRA=choiceFormDetailsAry[1];
String LTA=choiceFormDetailsAry[2];
String PROVIDENT=choiceFormDetailsAry[3];
String GRATUTY=choiceFormDetailsAry[4];

String CONVAY=choiceFormDetailsAry[5];
String PLI=choiceFormDetailsAry[6];
String MEDICAL=choiceFormDetailsAry[7];
String ESI=choiceFormDetailsAry[8];


%> 



<H3>CTC Configuration</H3>
<hr>
<table  >
<tr>
<td><label>BASIC (%)</label></td>
<td><input type="text"  name="basic" value="<%=BASIC %>" id="basic" disabled="true" style="background-color: white;color:black" onkeypress="return isbasic(event)"  onchange="basic()" /></td>
</tr>

<tr>
<td><label>HRA (%)</label></td>
<td><input type="text" name="hra2" value="<%=HRA %>" id="hra2" disabled="true" style="background-color: white;color:black"  onkeypress="return ishra(event)"   onchange="hra()"/></td>
</tr>

<tr>
<td><label>CONVEYANCE (fixed)</label></td>
<td><input type="text" class="" name="conv" value="<%=CONVAY %>" id="coa2" disabled="true" style="background-color: white;color:black"  onkeypress="return isconveyance(event)"  maxlength="15" onchange="conveyance()"/></td>
</tr>

<tr>
<td><label>LTA (%)</label></td>
<td><input type="text" name="lta2" value="<%=LTA %>" id="lta2" disabled="true" style="background-color: white;color:black"  onkeypress="return islta(event)"  maxlength="15" onchange="lta()"/></td>
</tr>

<tr>
<td><label>MEDICAL ALLOWANCE (fixed)</label></td>
<td><input type="text" name="ma" value="<%=MEDICAL %>" id="mr2" disabled="true" style="background-color: white;color:black" onkeypress="return ismedical(event)"  onchange="medical()"/></td>
</tr>
<%--  
<tr>
<td><label>SPECIAL ALLOWANCE (%)</label></td>
<td><input type="text" name="sp" value="<%=BASIC %>" id="sp" disabled="true" style="background-color: white;color:black" onkeypress="return issp(event)"  onchange="sp()" /></td>
</tr> --%>

<tr>
<td><label>PF (% of basic)</label></td>
<td><input type="text" name="pf" value="<%=PROVIDENT %>" id="pf" disabled="true" style="background-color: white;color:black" onkeypress="return ispf(event)"  onchange="pf()"/></td>
</tr>

<tr>
<td><label>GRATUITY (% of basic)</label></td>
<td><input type="text" name="gratuity" value="<%=GRATUTY %>" id="gratuity" disabled="true" style="background-color: white;color:black" onkeypress="return isgratuity(event)"  onchange="gratuity()"/></td>
</tr>

<tr>
<td><label>ESI (% of basic)</label></td>
<td><input type="text" name="esi" value="<%=ESI %>" id="esi"  disabled="true" style="background-color: white;color:black" onkeypress="return isesi(event)"  onchange="esi()"/></td>
</tr>

<tr>
<td><label>PLI (%)</label></td>
<td><input type="text" name="pli" value="<%=PLI %>" id="pli"  disabled="true" style="background-color: white;color:black" onkeypress="return ispli(event)"  onchange="pli()"/></td>
</tr>
<tr>
<td style="float:right"><input type="button"  id="edit" value="Edit"  onclick="return validate()"/> </td>
<td> <input type="submit" id="update" value="update Save" onclick="update()"/> </td>
</tr>

</table>


</body>
</html>