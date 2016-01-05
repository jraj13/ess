<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


   <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>
<script type="text/javascript">
function validate() {
	
	var cc=document.getElementById("count1").value;
	var toexp=document.getElementById("totalExp").value;
	//alert(cc);
	if(cc>1){
		alert("Not Possible Updation ! please contact HR Team");
		 document.getElementById('update').style.visibility ='hidden';
		 document.getElementById('edit').style.visibility = 'hidden';
		return false;
	}
	if(toexp=="0" ||toexp=="00"||toexp=="0.0" ||toexp=="0.00" ||toexp=="00.00" || toexp=="Fresher"||toexp=="fresher" || toexp=="FRESHER"){
		alert("You can not update ! please contact HR Team");
		 document.getElementById('update').style.visibility ='hidden';
		 document.getElementById('edit').style.visibility = 'hidden';
		return false;
	}
	else{
		alert("Please Update Now ");
	/*  x=document.getElementById("empId")
	    x.disabled = !x.disabled; */
    x=document.getElementById("totalExp")
    x.disabled = !x.disabled;
    x=document.getElementById("org1Name")
    x.disabled = !x.disabled;
    x=document.getElementById("yearsworked1")
    x.disabled = !x.disabled;
    x=document.getElementById("refname1")
    x.disabled = !x.disabled;
    x=document.getElementById("org1RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("refnumber1")
    x.disabled = !x.disabled;
    x=document.getElementById("org2Name")
    x.disabled = !x.disabled;
    x=document.getElementById("yearsworked2")
    x.disabled = !x.disabled;
    x=document.getElementById("refname2")
    x.disabled = !x.disabled;
    x=document.getElementById("org2RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("refnumber2")
    x.disabled = !x.disabled;
    x=document.getElementById("org3Name")
    x.disabled = !x.disabled;
    x=document.getElementById("yearsworked3")
    x.disabled = !x.disabled;
    x=document.getElementById("refname3")
    x.disabled = !x.disabled;
    x=document.getElementById("org3RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("refnumber3")
    x.disabled = !x.disabled;
    
    
    x=document.getElementById("orgEXT1Name")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT1Exp")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT1RefName")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT1RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT1RefPhone")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT2Name")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT2Exp")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT2RefName")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT2RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT2RefPhone")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT3Name")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT3Exp")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT3RefName")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT3RefMail")
    x.disabled = !x.disabled;
    x=document.getElementById("orgEXT3RefPhone")
    x.disabled = !x.disabled;

}
}
</script>

<script>
function update(cnt)
{
//alert("update");

	var id=document.getElementById("count1").value;
	//alert("id..count.."+id);
	if(id>1)
		{
		alert("Not Possible Updation ! Pls Contact Admin");
		 document.getElementById('update').style.visibility ='hidden';
		 document.getElementById('edit').style.visibility = 'hidden';

		}
	
	else
		{
		//alert("possible");
		 alert("Recored Updated Successfully ");
		 
		 document.getElementById('edit').style.visibility = 'visible'; 
		
		var empId=document.getElementById("empId").value;
		var totalExp=document.getElementById("totalExp").value;
		var org1Name=document.getElementById("org1Name").value;
		var org1Exp=document.getElementById("yearsworked1").value;
		var org1RefName=document.getElementById("refname1").value;
		var org1RefMail=document.getElementById("org1RefMail").value;
		var org1RefPhone=document.getElementById("refnumber1").value;
		var org2Name=document.getElementById("org2Name").value;
		var org2Exp=document.getElementById("yearsworked2").value;
		var org2RefName=document.getElementById("refname2").value;
		var org2RefMail=document.getElementById("org2RefMail").value;
		var org2RefPhone=document.getElementById("refnumber2").value;
		var org3Name=document.getElementById("org3Name").value;
		var org3Exp=document.getElementById("yearsworked3").value;
		var org3RefName=document.getElementById("refname3").value;
		var org3RefMail=document.getElementById("org3RefMail").value;
		var org3RefPhone=document.getElementById("refnumber3").value;
		var count1=document.getElementById("count1").value;
		var count=2;
	
		var orgEXT1Name=document.getElementById("orgEXT1Name").value;
		var orgEXT1Exp=document.getElementById("orgEXT1Exp").value;
		var orgEXT1RefName=document.getElementById("orgEXT1RefName").value;
		var orgEXT1RefMail=document.getElementById("orgEXT1RefMail").value;
		var orgEXT1RefPhone=document.getElementById("orgEXT1RefPhone").value;
		var orgEXT2Name=document.getElementById("orgEXT2Name").value;
		var orgEXT2Exp=document.getElementById("orgEXT2Exp").value;
		var orgEXT2RefName=document.getElementById("orgEXT2RefName").value;
		var orgEXT2RefMail=document.getElementById("orgEXT2RefMail").value;
		var orgEXT2RefPhone=document.getElementById("orgEXT2RefPhone").value;
		var orgEXT3Name=document.getElementById("orgEXT3Name").value;
		var orgEXT3Exp=document.getElementById("orgEXT3Exp").value;
		var orgEXT3RefName=document.getElementById("orgEXT3RefName").value;
		var orgEXT3RefMail=document.getElementById("orgEXT3RefMail").value;
		var orgEXT3RefPhone=document.getElementById("orgEXT3RefPhone").value;
		
		/*  window.location = "PreviousEmployerUpdate?empId=" +empId+ "&totalExp=" +totalExp+ "&org1Name=" +org1Name+ "&org1Exp=" +org1Exp+  "&org1RefName=" +org1RefName+ "&org1RefMail=" +org1RefMail+ "&org1RefPhone=" +org1RefPhone+ "&org2Name=" +org2Name+ "&org2Exp=" +org2Exp+ "&org2RefName=" +org2RefName+ "&org2RefMail=" +org2RefMail+ "&org3Name=" +org3Name+ "&org3Exp=" +org3Exp+ "&org3RefName=" +org3RefName+ "&org3RefMail=" +org3RefMail+ "&count=" +count; */
		
		 window.location = "PreviousEmployerUpdate?empId=" +empId+ "&totalExp=" +totalExp+ "&org1Name=" +org1Name+ "&org1Exp=" +org1Exp+  "&org1RefName=" +org1RefName+ "&org1RefMail=" +org1RefMail+ "&org1RefPhone=" +org1RefPhone+ "&org2Name=" +org2Name+ "&org2Exp=" +org2Exp+ "&org2RefName=" +org2RefName+ "&org2RefMail=" +org2RefMail+ "&org3Name=" +org3Name+ "&org3Exp=" +org3Exp+ "&org3RefName=" +org3RefName+ "&org3RefMail=" +org3RefMail+ "&count=" +count+         "&org2RefPhone=" +org2RefPhone+ "&org3RefPhone=" +org3RefPhone+  "&orgEXT1Name=" +orgEXT1Name+ "&orgEXT1Exp=" +orgEXT1Exp+ "&orgEXT1RefName=" +orgEXT1RefName+ "&orgEXT1RefMail=" +orgEXT1RefMail+ "&orgEXT1RefPhone=" +orgEXT1RefPhone+ "&orgEXT2Name=" +orgEXT2Name+ "&orgEXT2Exp=" +orgEXT2Exp+ "&orgEXT2RefName=" +orgEXT2RefName+  "&orgEXT2RefMail=" +orgEXT2RefMail+ "&orgEXT2RefPhone=" +orgEXT2RefPhone+ "&orgEXT3Name=" +orgEXT3Name+ "&orgEXT3Exp=" +orgEXT3Exp+ "&orgEXT3RefName=" +orgEXT3RefName+ "&orgEXT3RefMail=" +orgEXT3RefMail+  "&orgEXT3RefPhone=" +orgEXT3RefPhone ;
		document.getElementById('update').style.visibility = 'hidden';
		
		}
}

</script>

<!--  <script>
	function checkEmail() {
	    var email = document.getElementById('org1RefMail').value;
	    /* var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	    if (!filter.test(email.value)) {
	    alert('Please provide a valid email address');
	    return false; */
	    
		AtPos = email.indexOf("@")
		StopPos = email.lastIndexOf(".")
		if (AtPos == -1 || StopPos == -1) {
			 window.setTimeout(function ()
					    {
				 alert("please enter Valid Email Address");
					    
				document.getElementById('org1RefMail').focus();
					    }, 0);
			 document.getElementById('org1RefMail').value="";
					    return false;
	}
	    return true;
	 }
	</script> -->

</head>
<body><br>
<%
	String prevOrgDetails=EmployeeDetailsPersonal.getPreviousEmpInfo();

String empPersonalInfoAry[]=prevOrgDetails.split("\\^");

String empId = empPersonalInfoAry[0];
String totalExp = empPersonalInfoAry[1];
String org1Name = empPersonalInfoAry[2];
String org1Exp = empPersonalInfoAry[3];
String org1RefName = empPersonalInfoAry[4];
String org1RefMail = empPersonalInfoAry[5];
String org1RefPhone = empPersonalInfoAry[6];
String org2Name = empPersonalInfoAry[7];
String org2Exp = empPersonalInfoAry[8];
String org2RefName = empPersonalInfoAry[9];
String org2RefMail = empPersonalInfoAry[10];
String org3Name = empPersonalInfoAry[11];
String org3Exp = empPersonalInfoAry[12];
String org3RefName = empPersonalInfoAry[13];
String org3RefMail = empPersonalInfoAry[14];
String count1 = empPersonalInfoAry[15];



String org2RefPhone = empPersonalInfoAry[16];
String org3RefPhone = empPersonalInfoAry[17];

String orgEXT1Name = empPersonalInfoAry[18];
String orgEXT1Exp = empPersonalInfoAry[19];
String orgEXT1RefName = empPersonalInfoAry[20];
String orgEXT1RefMail = empPersonalInfoAry[21];
String orgEXT1RefPhone = empPersonalInfoAry[22];

String orgEXT2Name = empPersonalInfoAry[23];
String orgEXT2Exp = empPersonalInfoAry[24];
String orgEXT2RefName = empPersonalInfoAry[25];
String orgEXT2RefMail = empPersonalInfoAry[26];
String orgEXT2RefPhone = empPersonalInfoAry[27];

String orgEXT3Name = empPersonalInfoAry[28];
String orgEXT3Exp = empPersonalInfoAry[29];
String orgEXT3RefName = empPersonalInfoAry[30];
String orgEXT3RefMail = empPersonalInfoAry[31];
String orgEXT3RefPhone = empPersonalInfoAry[32];



%>

<%-- if(<%=totalExp %>==0){
System.out.println("total exp.."+<%=totalExp %>);
}
else if(<%=totalExp %>=="fresher" || <%=totalExp %>=="Fresher" || <%=totalExp %>=="FRESHER"){
System.out.println("total exp.."+<%=totalExp %>);
} --%>

 <table align="center" >


 <tr><td><b>EMP ID</b></td> <td><input type="text" value="<%=empId %>" id="empId" disabled="true" style="background-color: white;color:black"></td></tr>
 <tr><td><b>Total Experience</b></td> <td><input type="text" value="<%=totalExp %>" id="totalExp" disabled="true" style="background-color: white;color:black" onkeypress="return istotalexp(event)"></td></tr> 
 
<tr><td><b>Organization1</b></td><td><input type="text" value="<%=org1Name %>" id="org1Name" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Organization1 Experience (in year)</b></td><td><input type="text" value="<%=org1Exp %>" id="yearsworked1" disabled="true" style="background-color: white;color:black" onkeypress="return isyow1(event)"></td></tr>
<tr><td><b>Organization1 Reference Name </b></td><td><input type="text" value="<%=org1RefName %>" id="refname1" disabled="true" style="background-color: white;color:black" onchange="verifyn11()"></td></tr>
<tr><td><b>Organization1 Reference Mail</b></td><td><input type="text" value="<%=org1RefMail %>" id="org1RefMail" disabled="true" style="background-color: white;color:black"  onchange="echeckmail4(this.value)" ></td></tr>
<tr><td><b>Organization1 Reference Phone</b></td><td><input type="text" value="<%=org1RefPhone %>" id="refnumber1" disabled="true" style="background-color: white;color:black" onchange="verifyPhref1()"></td></tr>

<tr><td><b>Organization2 </b></td><td><input type="text" value="<%=org2Name %>" id="org2Name" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Organization2 Experience (in year)</b></td><td><input type="text" value="<%=org2Exp %>" id="yearsworked2" disabled="true" style="background-color: white;color:black" onkeypress="return isyow2(event)"></td></tr>
<tr><td><b>Organization2 Reference Name</b></td><td><input type="text" value="<%=org2RefName %>" id="refname2" disabled="true" style="background-color: white;color:black" onchange="verifyn12()"></td></tr>
<tr><td><b>Organization2 Reference Mail</b></td><td><input type="text" value="<%=org2RefMail %>" id="org2RefMail" disabled="true" style="background-color: white;color:black" onchange="echeckmail5(this.value)"></td></tr>
<tr><td><b>Organization2 Reference Phone</b></td><td><input type="text" value="<%=org2RefPhone %>" id="refnumber2" disabled="true" style="background-color: white;color:black" onchange="verifyPhref2()"></td></tr>

<tr><td><b>Organization3</b></td><td><input type="text" value="<%=org3Name %>" id="org3Name" disabled="true" style="background-color: white;color:black"></td></tr>
<%-- <tr><td><b>Organization3 Experience</b></td><td><input type="text" value="<%=org3Exp %>" id="org3Exp" disabled="true" ></td></tr> --%>
<tr><td><b>Organization3 Experience (in year)</b></td><td><input type="text" value="<%=org3Exp %>" id="yearsworked3" disabled="true"  style="background-color: white;color:black" onkeypress="return isyow3(event)"/></td></tr>
<tr><td><b>Organization3 Reference Name</b></td><td><input type="text" value="<%=org3RefName %>" id="refname3" disabled="true" style="background-color: white;color:black" onchange="verifyn13()"></td></tr>
<tr><td><b>Organization3 Reference Mail</b></td><td><input type="text" value="<%=org3RefMail %>" id="org3RefMail" disabled="true" style="background-color: white;color:black" onchange="echeckmail6(this.value)"></td></tr>
<tr><td><b>Organization3 Reference Phone</b></td><td><input type="text" value="<%=org3RefPhone %>" id="refnumber3" disabled="true" style="background-color: white;color:black" onchange="verifyPhref3()"></td></tr>


<tr><td><b>Organization4</b></td><td><input type="text" value="<%=orgEXT1Name %>" id="orgEXT1Name" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Organization4 Experience (in year)</b></td><td><input type="text" value="<%=orgEXT1Exp %>" id="orgEXT1Exp" disabled="true" style="background-color: white;color:black" onkeypress="return isyow1EXT(event)"></td></tr>
<tr><td><b>Organization4 Reference Name </b></td><td><input type="text" value="<%=orgEXT1RefName %>" id="orgEXT1RefName" disabled="true" style="background-color: white;color:black" onchange="verifyn11EXT()"></td></tr>
<tr><td><b>Organization4 Reference Mail</b></td><td><input type="text" value="<%=orgEXT1RefMail %>" id="orgEXT1RefMail" disabled="true" style="background-color: white;color:black"  onchange="echeckmail4EXT(this.value)" ></td></tr>
<tr><td><b>Organization4 Reference Phone</b></td><td><input type="text" value="<%=orgEXT1RefPhone %>" id="orgEXT1RefPhone" disabled="true" style="background-color: white;color:black" onchange="verifyPhref1EXT()"></td></tr>

<tr><td><b>Organization5 </b></td><td><input type="text" value="<%=orgEXT2Name %>" id="orgEXT2Name" disabled="true" style="background-color: white;color:black"></td></tr>
<tr><td><b>Organization5 Experience (in year)</b></td><td><input type="text" value="<%=orgEXT2Exp %>" id="orgEXT2Exp" disabled="true" style="background-color: white;color:black" onkeypress="return isyow2EXT(event)"></td></tr>
<tr><td><b>Organization5 Reference Name</b></td><td><input type="text" value="<%=orgEXT2RefName %>" id="orgEXT2RefName" disabled="true" style="background-color: white;color:black" onchange="verifyn12EXT()"></td></tr>
<tr><td><b>Organization5 Reference Mail</b></td><td><input type="text" value="<%=orgEXT2RefMail %>" id="orgEXT2RefMail" disabled="true" style="background-color: white;color:black" onchange="echeckmail5EXT(this.value)"></td></tr>
<tr><td><b>Organization5 Reference Phone</b></td><td><input type="text" value="<%=orgEXT2RefPhone %>" id="orgEXT2RefPhone" disabled="true" style="background-color: white;color:black" onchange="verifyPhref2EXT()"></td></tr>

<tr><td><b>Organization6</b></td><td><input type="text" value="<%=orgEXT3Name %>" id="orgEXT3Name" disabled="true" style="background-color: white;color:black"></td></tr>
<%-- <tr><td><b>Organization3 Experience</b></td><td><input type="text" value="<%=org3Exp %>" id="org3Exp" disabled="true" ></td></tr> --%>
<tr><td><b>Organization6 Experience (in year)</b></td><td><input type="text" value="<%=orgEXT3Exp %>" id="orgEXT3Exp" disabled="true"  style="background-color: white;color:black" onkeypress="return isyow3EXT(event)"/></td></tr>
<tr><td><b>Organization6 Reference Name</b></td><td><input type="text" value="<%=orgEXT3RefName %>" id="orgEXT3RefName" disabled="true" style="background-color: white;color:black" onchange="verifyn13EXT()"></td></tr>
<tr><td><b>Organization6 Reference Mail</b></td><td><input type="text" value="<%=orgEXT3RefMail %>" id="orgEXT3RefMail" disabled="true" style="background-color: white;color:black" onchange="echeckmail6EXT(this.value)"></td></tr>
<tr><td><b>Organization6 Reference Phone</b></td><td><input type="text" value="<%=orgEXT3RefPhone %>" id="orgEXT3RefPhone" disabled="true" style="background-color: white;color:black" onchange="verifyPhref3EXT()"></td></tr>





<input type="hidden" value="<%=count1 %>" id="count1"/>



</table>

<center>
 <input type="button"  id="edit" value="Edit"  onclick="return validate()"/> 
 <input type="submit" id="update" value="update Save" onclick="update(<%=count1 %>)"/> 
 
 </center>


</body>
</html>


















<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ess.common.action.EmployeeDetailsPersonal"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    width="100";
    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><br>
<%
	String prevOrgDetails=EmployeeDetailsPersonal.getPreviousEmpInfo();

String empPersonalInfoAry[]=prevOrgDetails.split("\\^");

String empId = empPersonalInfoAry[0];
String totalExp = empPersonalInfoAry[1];
String org1Name = empPersonalInfoAry[2];
String org1Exp = empPersonalInfoAry[3];
String org1RefName = empPersonalInfoAry[4];
String org1RefMail = empPersonalInfoAry[5];
String org1RefPhone = empPersonalInfoAry[6];
String org2Name = empPersonalInfoAry[7];
String org2Exp = empPersonalInfoAry[8];
String org2RefName = empPersonalInfoAry[9];
String org2RefMail = empPersonalInfoAry[10];
String org3Name = empPersonalInfoAry[11];
String org3Exp = empPersonalInfoAry[12];
String org3RefName = empPersonalInfoAry[13];
String org3RefMail = empPersonalInfoAry[14];
%>

 <table align="center" >


 <tr><td><b>EMP ID</b></td> <td><%=empId %></td></tr>
 <tr><td><b>Total Experience</b></td> <td><%=totalExp %></td></tr> 
<tr><td><b>Organization1</b></td><td><%=org1Name %></td></tr>
<tr><td><b>Organization1 Experience</b></td><td><%=org1Exp %></td></tr>
<tr><td><b>Organization1 Reference Name </b></td><td><%=org1RefName %></td></tr>
<tr><td><b>Organization1 Reference Mail</b></td><td><%=org1RefMail %></td></tr>
<tr><td><b>Organization1 Reference Phone</b></td><td><%=org1RefPhone %></td></tr>
<tr><td><b>Organization2 </b></td><td><%=org2Name %></td></tr>
<tr><td><b>Organization2 Experience</b></td><td><%=org2Exp %></td></tr>
<tr><td><b>Organization2 Reference Name</b></td><td><%=org2RefName %></td></tr>
<tr><td><b>Organization1 Reference Mail</b></td><td><%=org2RefMail %></td></tr>
<tr><td><b>Organization2</b></td><td><%=org3Name %></td></tr>

<tr><td><b>Organization2 Experience</b></td><td><%=org3Exp %></td></tr>
<tr><td><b>Organization1 Reference Name</b></td><td><%=org3RefName %></td></tr>

<tr><td><b>Organization1 Reference Mail</b></td><td><%=org3RefMail %></td></tr>





</table>


</body>
</html> --%>