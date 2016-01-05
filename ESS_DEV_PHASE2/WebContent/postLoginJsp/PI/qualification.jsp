<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
}

</style>

<script type="text/javascript">
function validate() {
	
	var cc=document.getElementById("count1").value;
	//alert(cc);
	if(cc>1){
		alert("Updation Not Possible please contact HR Team");
		document.getElementById('update').style.visibility ='hidden';
		 document.getElementById('edit').style.visibility = 'hidden';
		return false;
	}
	else{
		alert("Please Update Now ");
		document.getElementById('update').style.visibility ='visible';
		 document.getElementById('edit').style.visibility = 'hidden';
	/*  x=document.getElementById("empId")
	    x.disabled = !x.disabled; */
    x=document.getElementById("empQual1")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual1Perc")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual1passout")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual2")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual2Perc")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual2passout")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual3")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual3Perc")
    x.disabled = !x.disabled;
    x=document.getElementById("empQual3passout")
    x.disabled = !x.disabled;
    x=document.getElementById("cert1")
    x.disabled = !x.disabled;
    x=document.getElementById("cert2")
    x.disabled = !x.disabled;
    x=document.getElementById("cert3")
    x.disabled = !x.disabled;
}
}
</script>

<script>
function update(cnt)
{
	var empId=document.getElementById("empId").value;
	alert(empId);
	var empQual1=document.getElementById("empQual1").value;
	var empQual1Perc=document.getElementById("empQual1Perc").value;
	var empQual1passout=document.getElementById("empQual1passout").value;
	var empQual2=document.getElementById("empQual2").value;
	var empQual2Perc=document.getElementById("empQual2Perc").value;
	var empQual2passout=document.getElementById("empQual2passout").value;
	var empQual3=document.getElementById("empQual3").value;
	var empQual3Perc=document.getElementById("empQual3Perc").value;
	var empQual3passout=document.getElementById("empQual3passout").value;
	var cert1=document.getElementById("cert1").value;
	var cert2=document.getElementById("cert2").value;
	var cert3=document.getElementById("cert3").value;
	var count1=document.getElementById("count1").value;
	var id=document.getElementById("count1").value;
	//alert("id..count.."+id);
	if(id>1)
		{
		alert("Not Possible Updation ! Pls Contact Admin");
		 document.getElementById('update').style.visibility ='hidden';
		 document.getElementById('edit').style.visibility = 'hidden';
		}
	else if(empQual1==""||empQual2=="" ||empQual3==""){
		alert("Please enter Qualification ");
	}
	else if(empQual1Perc>100)
	{
	alert("you entered wrong percentage");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual1Perc').focus();
		    }, 0);
	document.getElementById('empQual1Perc').value="";
	return false;
	} 
	else if(empQual2Perc>100)
	{
	alert("you entered wrong percentage");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual2Perc').focus();
		    }, 0);
	document.getElementById('empQual2Perc').value="";
	return false;
	} 
	else if(empQual3Perc>100)
	{
	alert("you entered wrong percentage");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual3Perc').focus();
		    }, 0);
	document.getElementById('empQual3Perc').value="";
	return false;
	} 
	else
		{
		//alert("possible");
		 document.getElementById('edit').style.visibility = 'hidden'; 
		
		
		var count=2;
		alert(count);
		
		window.location = "QualificationUpdate?empId=" +empId+ "&empQual1=" +empQual1+ "&empQual1Perc=" +empQual1Perc+ "&empQual1passout=" +empQual1passout+ "&empQual2=" +empQual2+ "&empQual2Perc=" +empQual2Perc+ "&empQual2passout=" +empQual2passout+ "&empQual3=" +empQual3+ "&empQual3Perc=" +empQual3Perc+ "&empQual3passout=" +empQual3passout+ "&cert1=" +cert1+ "&cert2=" +cert2+ "&cert3=" +cert3+ "&count=" +count;
		
		document.getElementById('update').style.visibility = 'hidden';
		}
}
</script>


<script>

	 function yearValidation1(year,ev) {

		  var text = /^[0-9]+$/;
		  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
		    if (year != 0) {
		        if ((year != "") && (!text.test(year))) {
		        	
		            alert("Please Enter Numeric Values Only");
		            document.getElementById('empQual1passout').value="";
		            document.getElementById("empQual1passout").focus();
					 
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual1passout').focus();
							    }, 0);
					
					 document.getElementById('empQual1passout').value="";
		            return false;
		            
		        }

		        if (year.length != 4) {
		            alert("Year is not proper. Please check");
		            document.getElementById('empQual1passout').value="";
		            document.getElementById("empQual1passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual1passout').focus();
							    }, 0);
					 
							    return false;
		        }
		        var current_year=new Date().getFullYear();
		        if((year < 1920) || (year > current_year))
		            {
		            alert("Year should be in range 1920 to current year");
		            document.getElementById('empQual1passout').value="";
		            document.getElementById("empQual1passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual1passout').focus();
							    }, 0);
		            
		            return false;
		            }
		        return true;
		    } }
		}
	 
	 
	 </script>
	
	 
	 
	 <script>
	
	 function yearValidation2(year,ev) {

		  var text = /^[0-9]+$/;
		  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
		    if (year != 0) {
		        if ((year != "") && (!text.test(year))) {
		        	
		            alert("Please Enter Numeric Values Only");
		            document.getElementById('empQual2passout').value="";
		            document.getElementById("empQual2passout").focus();
					 
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual2passout').focus();
							    }, 0);
					
					 document.getElementById('empQual2passout').value="";
		            return false;
		            
		        }

		        if (year.length != 4) {
		            alert("Year is not proper. Please check");
		            document.getElementById('empQual2passout').value="";
		            document.getElementById("empQual2passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual2passout').focus();
							    }, 0);
					 
							    return false;
		        }
		        var current_year=new Date().getFullYear();
		        if((year < 1920) || (year > current_year))
		            {
		            alert("Year should be in range 1920 to current year");
		            document.getElementById('empQual2passout').value="";
		            document.getElementById("empQual2passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual2passout').focus();
							    }, 0);
					 
		            
		            return false;
		            }
		        return true;
		    } }
		}
	 </script>
	 <script>
	 
	 function yearValidation3(year,ev) {

		  var text = /^[0-9]+$/;
		  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
		    if (year != 0) {
		        if ((year != "") && (!text.test(year))) {
		        	
		            alert("Please Enter Numeric Values Only");
		            document.getElementById('empQual3passout').value="";
		            document.getElementById("empQual3passout").focus();
					 
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual3passout').focus();
							    }, 0);
					
					 document.getElementById('empQual3passout').value="";
		            return false;
		            
		        }

		        if (year.length != 4) {
		            alert("Year is not proper. Please check");
		            document.getElementById('empQual3passout').value="";
		            document.getElementById("empQual3passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual3passout').focus();
							    }, 0);
					 
							    return false;
		        }
		        var current_year=new Date().getFullYear();
		        if((year < 1920) || (year > current_year))
		            {
		            alert("Year should be in range 1920 to current year");
		            document.getElementById('empQual3passout').value="";
		            document.getElementById("empQual3passout").focus();
					 window.setTimeout(function ()
							    {
						document.getElementById('empQual3passout').focus();
							    }, 0);
					 
		            
		            return false;
		            }
		        return true;
		    } }
		}
	 
	 </script>

</head>
<body><br>
<%-- <%
	String empQualification=EmployeeDetailsPersonal.getQualificationInfo();
System.out.println("empPersonalInfo===="+empQualification);

String empPersonalInfoAry[]=empQualification.split("\\^");

String empId = empPersonalInfoAry[0];
String empQual1 = empPersonalInfoAry[1];
String empQual1Perc = empPersonalInfoAry[2];
String empQual1passout =empPersonalInfoAry[3];
String empQual2 = empPersonalInfoAry[4];
String empQual2Perc =empPersonalInfoAry[5];
String empQual2passout =empPersonalInfoAry[6];
String empQual3 = empPersonalInfoAry[7];
String empQual3Perc = empPersonalInfoAry[8];
String empQual3passout = empPersonalInfoAry[9];
String cert1 = empPersonalInfoAry[10];
String cert2 = empPersonalInfoAry[11];
String cert3 = empPersonalInfoAry[12];
%> --%>


<%
	String empQualification=EmployeeDetailsPersonal.getQualificationInfo();
System.out.println("empPersonalInfo===="+empQualification);

String empPersonalInfoAry[]=empQualification.split("\\^");

String empId = empPersonalInfoAry[0];
String empQual1 = empPersonalInfoAry[1];
String empQual1Perc = empPersonalInfoAry[2];
String empQual1passout =empPersonalInfoAry[3];
String empQual2 = empPersonalInfoAry[4];
String empQual2Perc =empPersonalInfoAry[5];
String empQual2passout =empPersonalInfoAry[6];
String empQual3 = empPersonalInfoAry[7];
String empQual3Perc = empPersonalInfoAry[8];
String empQual3passout = empPersonalInfoAry[9];
String cert1 = empPersonalInfoAry[10];
String cert2 = empPersonalInfoAry[11];
String cert3 = empPersonalInfoAry[12];
String count1 = empPersonalInfoAry[13];
%>


 <table align="center" >

 <tr>
 <col width="130">
	<col width="130">


<td><b>EMP ID</b></td> <td><input type="text" value="<%=empId %>" id="empId" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Qualification1</b></td><td><input type="text" value="<%=empQual1 %>" id="empQual1" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Percentage(%)</b></td><td><input type="text" value="<%=empQual1Perc %>" id="empQual1Perc" disabled="true" style="background-color: white;color:black" maxlength="4" onkeypress="return percentValidate4(event)" onchange="percentValidate4()"></td></tr>
<%-- <tr><td><b>Passout</b></td><td><input type="text" value="<%=empQual1passout %>" id="empQual1passout" disabled="true" style="background-color: white;color:black" onkeypress="return onlyNum(event);" onchange="verify1();"></td></tr> --%>

<tr><td><b>Passout</b></td><td><input type="text" value="<%=empQual1passout %>" id="empQual1passout" disabled="true" style="background-color: white;color:black" onblur="yearValidation1(this.value,event)" 
        onkeypress="yearValidation1(this.value,event)"></td></tr>


<tr><td><b>Qualification2 </b></td><td><input type="text" value="<%=empQual2 %>" id="empQual2" disabled="true" style="background-color: white;color:black" ></td></tr>
<tr><td><b>Percentage(%)</b></td><td><input type="text" value="<%=empQual2Perc %>" id="empQual2Perc" disabled="true" style="background-color: white;color:black" maxlength="4" onkeypress="return percentValidate5(event)" onchange="percentValidate5()"></td></tr>

<%-- <tr><td><b>Passout</b></td><td><input type="text" value="<%=empQual2passout %>" id="empQual2passout" disabled="true" style="background-color: white;color:black" onkeypress="return onlyNum1(event);" onchange="verify2();"></td></tr> --%>

<tr><td><b>Passout</b></td><td><input type="text" value="<%=empQual2passout %>" id="empQual2passout" disabled="true" style="background-color: white;color:black" onblur="yearValidation2(this.value,event)" 
        onkeypress="yearValidation2(this.value,event)"></td></tr>

<tr><td><b>Qualification3</b></td> <td><input type="text" value="<%=empQual3 %>" id="empQual3" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Percentage(%)</b></td><td><input type="text" value="<%=empQual3Perc %>" id="empQual3Perc" disabled="true" style="background-color: white;color:black" maxlength="4" onkeypress="return percentValidate6(event)" onchange="percentValidate6()"></td></tr>
<tr><td><b>Passout</b></td><td><input type="text" value="<%=empQual3passout %>" id="empQual3passout" disabled="true" style="background-color: white;color:black" onblur="yearValidation3(this.value,event)" 
        onkeypress="yearValidation3(this.value,event)"></td></tr>


<tr><td><b>Certification1</b></td><td><input type="text" value="<%=cert1 %>" id="cert1" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Certification2</b></td> <td><input type="text" value="<%=cert2 %>" id="cert2" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Certification3</b></td><td><input type="text" value="<%=cert3 %>" id="cert3" disabled="true" style="background-color: white;color:black"></td></tr>
<input type="hidden" value="<%=count1 %>" id="count1"/>

</table>

<center>
 <input type="button"  id="edit" value="Edit"  onclick="return validate()"/> 
 <input type="submit" id="update" value="Submit" onclick="update(<%=count1 %>)"/> 
 
 </center>

</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
</head>
<body><br>
<%
	String empQualification=EmployeeDetailsPersonal.getQualificationInfo();
System.out.println("empPersonalInfo===="+empQualification);

String empPersonalInfoAry[]=empQualification.split("\\^");

String empId = empPersonalInfoAry[0];
String empQual1 = empPersonalInfoAry[1];
String empQual1Perc = empPersonalInfoAry[2];
String empQual1passout =empPersonalInfoAry[3];
String empQual2 = empPersonalInfoAry[4];
String empQual2Perc =empPersonalInfoAry[5];
String empQual2passout =empPersonalInfoAry[6];
String empQual3 = empPersonalInfoAry[7];
String empQual3Perc = empPersonalInfoAry[8];
String empQual3passout = empPersonalInfoAry[9];
String cert1 = empPersonalInfoAry[10];
String cert2 = empPersonalInfoAry[11];
String cert3 = empPersonalInfoAry[12];
%>


 <table align="center" >

 <tr>
 <col width="130">
			<col width="130">
 <td><b>EMP ID</b></td> <td><%=empId %></td></tr> 
<tr><td><b>Qualification1</b></td><td><%=empQual1 %></td></tr>
<tr><td><b>Percentage(%)</b></td><td><%=empQual1Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual1passout %></td></tr>
<tr><td><b>Qualification1 </b></td><td><%=empQual2 %></td></tr>
<tr><td><b>Percentage(%)</b></td><td><%=empQual2Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual2passout %></td></tr>
<tr><td><b>Qualification3</b></td><td><%=empQual3 %></td></tr>
<tr><td><b>Percentage(%)</b></td><td><%=empQual3Perc %></td></tr>
<tr><td><b>Passout</b></td><td><%=empQual3passout %></td></tr>
<tr><td><b>Certificate1</b></td><td><%=cert1 %></td></tr>

<tr><td><b>Certificate2</b></td><td><%=cert2 %></td></tr>
<tr><td><b>Certificate3</b></td><td><%=cert3 %></td></tr>



</table>




</body>
</html> --%>