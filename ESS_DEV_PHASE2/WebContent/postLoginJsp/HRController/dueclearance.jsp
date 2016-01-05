<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ess.common.eseparation.DueClearance"%>
      <%@ page import="java.lang.*,java.util.*,java.io.*"%>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript">
function loadXMLDoc(id)
{
	alert("in side loadXMLDoc");
 var xmlhttp;
 var k=document.getElementById("emp_seq_no").value;
 alert(id);
 alert(k);
 
/*  $( "#dialog-modal" ).dialog({
     height: 140,
     modal: true
     
 }); */
  
 
 //var urls="postLoginJsp/HRController/newModel.jsp?ver="+k "id="+id;  
 var urls="postLoginJsp/HRController/newModel.jsp?ver="+k+"&id="+id;
 
 //param1="+lat+"&param2="+lon);
 
 if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
 else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
	   //$('#dialog-modal p').html(data); 
	   
	   $("div#dialog").dialog ({
		   open : function (event)
		   {
			   document.getElementById("err").innerHTML=xmlhttp.responseText;
		     $(this).load (xmlhttp.responseText); 
			   $(this).load ("postLoginJsp/HRController/newModel.jsp");
		   }
		 });
	  
        
    }
  }
 xmlhttp.open("GET",urls,true);
 xmlhttp.send();
 
  }  

</script>

 <script type="text/javascript">
    $(document).ready(function() {
        $("#button").click(function(){
        	var favorite = [];
        	var emp_seq_no=$('#emp_seq_no').val();
        	var emp_emp_id=$('#emp_emp_id').val();
        	var need="yes";
        	var task_need;
        	var need_mailid;
        	$('#mytable').find('tr').each(function () {
        		
                var row = $(this);
                
              if (row.find('input[type="checkbox"]').is(':checked')){
            	  
                	
                	var task=row.find('input[type="checkbox"]').val();
                	
                    favorite.push(task);
                    var mailid=row.find('select').val();
                    
                    if(mailid===undefined)
                    	{
                    	
                    	need_mailid="nodata";
                    	task_need=task;
                    	}
                    
                    if(mailid=="none selected")
                    	{
                    	task_need=task;
                    	need="no";
                    	}
                    else{
                    	favorite.push(mailid);
                   favorite.push(";");
                    }
                } 
                
            });
        	
        	
        	if(favorite=="")
        		{
        		alert("Please select at least one task");
        		return false;
        		}
        	if(need=="no")
        		{
        		alert("Please Select MailID for "+task_need);
        		return false;
        		}
        	if(need_mailid=="nodata"){
        		alert("Please Select MailID for "+task_need);
        		return false;
        	}
        		
        	var dataString='&emp_seq_no='+emp_seq_no+'&emp_emp_id='+emp_emp_id+'&value=' + favorite;
        	alert(dataString);
        	alert("Don't refresh and wait upto response !");
    				$.ajax({
    					url :'postLoginJsp/Due_Clearance/dueclerance_middlepage.jsp',
    					type : 'POST',
    					data : dataString,
    					datatype : 'json',
    					success : function(data) {
    						
    					/*  $('#qryload').html(data).delay(5000).fadeOut();  */
    						 $('#qryload').html(data); 
    					},
    					error : function(jqXHR, textStatus, errorThrown) {

    					}
    				});
        });
    })
 
</script>

<script>
/* 
function check_status(admctrl)
{
	alert("come in check status");
	// var sid =admctrl; 
	var dapartment =admctrl;
	alert(department);
	 var k=document.getElementById("emp_seq_no").value;
	 alert(k);

	
	 var popupWindow =window.open('postLoginJsp/ADMINController/EmployeeDataEdit.jsp?dapartment='+dapartment+'&k='+k,"_blank","directories=no, status=no, menubar=no, scrollbars=yes, resizable=no,width=600, height=480,top=180,left=200"); 
	} */

	 $( "#dialog-modal" ).dialog({
	     height: 140,
	     modal: true
	     
	 });
</script>


</head>
<body>


<div id="qryload">

<!--  <span id="err"> </span> -->
<!-- <div id="dialog-modal p"></div> -->
<!-- <div id="dialog" title="Window title">
   <p> Content of the dialog box</p>
</div> -->
 
<%


	
	DueClearance hr_module_2=new DueClearance();
	ArrayList<String> arryObj_2=hr_module_2.dqueclearance_personalDetails();
	if (arryObj_2.size() > 0) {
	for(int j=0;j<arryObj_2.size();j++){
		String stringdata_2=arryObj_2.get(j).toString();
		String arrdata_2[]=stringdata_2.split("\\^");
		
		String emp_id=arrdata_2[0];
		System.out.println("empId."+emp_id);
		
		String sequence_num=request.getParameter("sequence_id");
		System.out.println(sequence_num);
%>
 



<div style="background-color: #B0C4DE; margin-top: 5px; margin-left: -3.5%; padding-left: 15px; width: 94%">
		<b>Editing....................<%=sequence_num %></b>
</div>

<table id="mytable">
<tr>
<th>Department</th>
<th>Mail ID</th>

</tr>
<tr>
<td ><input type="checkbox"  name="empid" id="itteam" value="IT SUPPORT TEAM"/>IT SUPPORT TEAM</td>
<td>
<%  
DueClearance hr_module1=new DueClearance();
ArrayList<String> arryObj1=hr_module1.itSupportTeam();


Iterator<String> itr=arryObj1.iterator();
while(itr.hasNext())
		{
	String emp_mail_id=itr.next();
%>


 <select  name="empid" class="mailid1" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id%>"><%=emp_mail_id%></option>
</select> 

<%
}
%>
</td>
<!-- <td><button id="IT SUPPORT TEAM"  value=" " onclick="loadXMLDoc(this.id)">Check Status</button></td>  -->
</tr>
 <tr>
<td ><input type="checkbox"  name="empid" id="itasset" value="IT ASSET" class="check_value2"/>IT ASSET</td>
<td>

<%  
DueClearance hr_module2=new DueClearance();
ArrayList<String> arryObj2=hr_module2.itAsset();

Iterator<String> itr2=arryObj2.iterator();
System.out.println("arrayobje.."+itr2);
while(itr2.hasNext())
		{
	String emp_mail_id2=itr2.next();
	//System.out.println(itr.next());
%>
 <select name="empid" class="mailid2" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id2%>"><%=emp_mail_id2%></option>
</select>  
<%
}
%>

 </td>
 
</tr>
<tr>
<td class="check_value3"><input type="checkbox" name="empid" id="Administration" value="ADMINISTRATION"/>ADMINISTRATION</td>
<td>

<%  
DueClearance hr_module3=new DueClearance();
ArrayList<String> arryObj3=hr_module3.Administration();

Iterator<String> itr3=arryObj3.iterator();
System.out.println("arrayobje.."+itr3);
while(itr3.hasNext())
		{
	String emp_mail_id3=itr3.next();
%>
 <select  class="mailid3" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id3%>"><%=emp_mail_id3%></option>
</select> 
<%
}
%>
</td>


</tr>
<tr>
<td class="check_value4"><input type="checkbox" name="empid" id="medical" value="MEDICAL INSURANCE TEAM"/>MEDICAL INSURANCE TEAM</td>
<td> 
<%  
DueClearance hr_module4=new DueClearance();
ArrayList<String> arryObj4=hr_module4.medical_insurance_team();

Iterator<String> itr4=arryObj4.iterator();
System.out.println("arrayobje.."+itr4);
while(itr4.hasNext())
		{
	String emp_mail_id4=itr4.next();
%>
 <select  class="mailid4" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id4%>"><%=emp_mail_id4%></option>
</select>  
<%
}
%>
</td>

</tr>
<tr>
<td class="check_value5"><input type="checkbox"  name="empid" id="Banking" value="BANKING"/>BANKING</td>
<!-- <td> </td> -->
<td>
<%  
DueClearance hr_module5=new DueClearance();
ArrayList<String> arryObj5=hr_module5.banking_team();

Iterator<String> itr5=arryObj5.iterator();
System.out.println("arrayobje.."+itr5);
while(itr5.hasNext())
		{
	String emp_mail_id5=itr5.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid5" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id5%>"><%=emp_mail_id5%></option>
</select>  
<%
}
%>

</td>

</tr>
<tr>
<td class="check_value6"><input type="checkbox" name="empid" id="idcard" value="ID CARD CELL"/>ID CARD CELL</td>
<td> 
<%  
DueClearance hr_module6=new DueClearance();
ArrayList<String> arryObj6=hr_module6.id_card();

Iterator<String> itr6=arryObj6.iterator();
System.out.println("arrayobje.."+itr6);
while(itr6.hasNext())
		{
	String emp_mail_id6=itr6.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid6" name="empid">
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id6%>"><%=emp_mail_id6%></option>
</select>  
<%
}
%>

</td>

</tr>
<tr>
<td class="check_value7"><input type="checkbox" name="empid" id="payment" value="PAYMENT TEAM"/>PAYMENT TEAM<br/></td>
<!-- <td> </td> -->
<td> 
<%  
DueClearance hr_module7=new DueClearance();
ArrayList<String> arryObj7=hr_module7.payment_Team();

Iterator<String> itr7=arryObj7.iterator();
System.out.println("arrayobje.."+itr7);
while(itr7.hasNext())
		{
	String emp_mail_id7=itr7.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid7" name="empid">
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id7%>"><%=emp_mail_id7%></option>
</select>  
<%
}
%>
</td>
<!-- <td><button id="PAYMENT TEAM"  value=" " onclick="loadXMLDoc(this.id)">Check Status</button></td> -->
</tr>
<tr>
<td class="check_value8"><input type="checkbox" name="empid"  id="payroll" value="PAYROLL TEAM"/>PAYROLL TEAM<br/></td>
<!-- <td> </td> -->
<td>
<%  
DueClearance hr_module8=new DueClearance();
ArrayList<String> arryObj8=hr_module8.payroll_Team();

Iterator<String> itr8=arryObj8.iterator();
System.out.println("arrayobje.."+itr8);
while(itr8.hasNext())
		{
	String emp_mail_id8=itr8.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid8" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id8%>"><%=emp_mail_id8%></option>
</select>  
<%
}
%>
 </td>
 <!-- <td><button id="PAYROLL TEAM"  value=" " onclick="loadXMLDoc(this.id)">Check Status</button></td> -->
</tr>
<tr>
<td class="check_value9"><input type="checkbox"  name="empid" id="hr" value="HR"/>HR <br/></td>
<td>
<%  
DueClearance hr_module9=new DueClearance();
ArrayList<String> arryObj9=hr_module9.hr();

Iterator<String> itr9=arryObj9.iterator();
System.out.println("arrayobje.."+itr9);
while(itr9.hasNext())
		{
	String emp_mail_id9=itr9.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid9" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id9%>"><%=emp_mail_id9%></option>
</select>  
<%
}
%>
 </td>
 	<!-- <td><button id="HR"  value=" " onclick="loadXMLDoc(this.id)">Check Status</button></td> -->
</tr>
<tr>
<td class="check_value10"><input type="checkbox" name="empid" id="employee" value="EMPLOYEE"/>EMPLOYEE<br/></td>
<td>
<%  
DueClearance hr_module10=new DueClearance();
ArrayList<String> arryObj10=hr_module10.employee();

Iterator<String> itr10=arryObj10.iterator();
System.out.println("arrayobje.."+itr10);
while(itr10.hasNext())
		{
	String emp_mail_id10=itr10.next();
	//System.out.println(itr.next());
%>
 <select  class="mailid10" name="empid" >
		  <option  value="none selected">Select Id </option>
          <option  value="<%=emp_mail_id10%>"><%=emp_mail_id10%></option>
</select>  
<%
}
%>
 </td>
 <!-- <td><button id="EMPLOYEE"  value=" " onclick="loadXMLDoc(this.id)">Check Status</button></td> -->
</tr> 
<tr>
<td>
<input type="hidden" id="emp_seq_no" value="<%=sequence_num %>" /><input type="button" name="submit" Value="Submit" id="button" />
</td>
 <td><input type="hidden" id="emp_emp_id" value="<%=emp_id %>" class="emp_id"/><a href="postLoginJsp/HRController/dueClearance_status.jsp?sequence_Id=<%=sequence_num %>"  target="_blank">Check Status</a></td>
</tr>

 <%
}}
	
// }} 
	

%> 

 </table>
 
 </div>
</body>
</html>


