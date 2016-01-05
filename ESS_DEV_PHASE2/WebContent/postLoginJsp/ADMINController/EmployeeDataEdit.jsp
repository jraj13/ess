<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
    
<head>
<title>Load Page Dynamically inside a jQuery UI Dialog</title>

<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
	
<link rel="stylesheet" href="../../date/jquery-ui.css"/> 
<script src="../../date/jquery-1.10.2.js"></script>
<script src="../../date/jquery-ui.js"></script>


<script>

function verify1()
{
	//alert("alert");
	 var name=document.getElementById("empfn").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('empfn').focus();
				    }, 0);
		 document.getElementById('empfn').value="";
				    return false;
	     }  
	}  


function verify2()
{
	//alert("alert2");
	 var name=document.getElementById("empln").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('empln').focus();
				    }, 0);
		 document.getElementById('empln').value="";
				    return false;
	     }  
	}  
 
function verify3()
{
	//alert("alert2");
	 var name=document.getElementById("design").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('design').focus();
				    }, 0);
		 document.getElementById('design').value="";
				    return false;
	     }  
	}  
	
function verify4()
{
	 var name=document.getElementById("remarks").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('remarks').focus();
				    }, 0);
		 document.getElementById('remarks').value="";
				    return false;
	     }  
	}  
	
</script>

 <!-- 
<script>
$(function() {
 //  $( "#doj" ).datepicker({ dateFormat: 'yy-mm-dd' });
//});

var date = new Date();
var currentMonth = date.getMonth();
var currentDate = date.getDate();
var currentYear = date.getFullYear();
$('#doj').datepicker({
	dateFormat: 'yy-mm-dd',
maxDate: new Date(currentYear, currentMonth, currentDate)
});
});

$(function() {
	//   $( "#dob" ).datepicker({ dateFormat: 'yy-mm-dd' });
	//}); 
	
var date = new Date();
var currentMonth = date.getMonth();
var currentDate = date.getDate();
var currentYear = date.getFullYear();
$('#dob').datepicker({
	 dateFormat: 'yy-mm-dd', 
maxDate: new Date(currentYear, currentMonth, currentDate)
});
});
	
</script>

 -->
<script>

$(function() {
	
	var date = new Date();
	var currentMonth = date.getMonth();
	var currentDate = date.getDate();
	var currentYear = date.getFullYear();
	
  $( "#doj" ).datepicker({
       dateFormat: 'yy-mm-dd', 
    changeMonth: true,
    changeYear: true,
    maxDate: new Date(currentYear, currentMonth, currentDate),
      yearRange: "-80:+0"
  });
});





$(function() {
	var date = new Date();
	var currentMonth = date.getMonth();
	var currentDate = date.getDate();
	var currentYear = date.getFullYear();
	
  $( "#dob" ).datepicker({
       dateFormat: 'yy-mm-dd', 
    changeMonth: true,
    changeYear: true,
    maxDate: new Date(currentYear, currentMonth, currentDate),
      yearRange: "-100:+0"
  });
});

</script>

  
<!--  <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script> -->
   <script>
   /* MAIL ID VALIDATION  */

   function echeck(str) {
   	var at="@";
   	var dot=".";
   	var lat=str.indexOf(at);
   	var lstr=str.length;
   	var ldot=str.indexOf(dot);
   	if (str.indexOf(at)==-1){
   	   alert("Invalid E-mail ID");
   	   emailid.focus();
   	 //  emailid="";
   	   document.getElementById('emailid').value="";
   	   return false;
   		}
   	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
   	   alert("Invalid E-mail ID");
   	   emailid.focus();
   	 //  emailid="";
   	   document.getElementById('emailid').value="";
   	   return false;
   		}
   	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
   	    alert("Invalid E-mail ID");
   	    emailid.focus();
   	  //  emailid="";
   	    document.getElementById('emailid').value="";
   	    return false;
   		}
   	 if (str.indexOf(at,(lat+1))!=-1){
   	    alert("Invalid E-mail ID");
   	    emailid.focus();
   	   // emailid="";
   	    document.getElementById('emailid').value="";
   	    return false;
   		 }
   	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
   	    alert("Invalid E-mail ID");
   	    emailid.focus();
   	  //  emailid="";
   	    document.getElementById('emailid').value="";
   	    return false;
   		 }
   	 if (str.indexOf(dot,(lat+2))==-1){
   	    alert("Invalid E-mail ID");
   	    emailid.focus();
   	   // emailid="";
   	    document.getElementById('emailid').value="";
   	    return false;
   		 }
   	 if (str.indexOf(" ")!=-1){
   	    alert("Invalid E-mail ID");
   	    emailid.focus();
   	  //  emailid="";
   	    document.getElementById('emailid').value="";
   	    return false;
   		 }
     }
   /* CTC Validation  */

   function isamt(evt) { 
       var charCode = (evt.charCode) ? evt.which : event.keyCode


       if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
           return false; 
       else { 
       var input = document.getElementById("ctc").value;
           var len = document.getElementById("ctc").value.length; 
           var index = document.getElementById("ctc").value.indexOf('.'); 

           if (index > 0 && charCode == 46) { 
               return false; 
           } 
           if (index >0 || index==0) { 
               var CharAfterdot = (len + 1) - index; 
               if (CharAfterdot > 3) { 

                   return false; 
               } 
      }
   if (charCode == 46 && input.split('.').length >2) {
      return false;
      }

       } 
       return true; 
    } 		

   
   
   </script>
   
<script>

	$(function() {

		$('#submit').click(function() {

			//alert("Am In Btn new  Click update");
			
		 var empid = $('#empid').val();
		var empfn = $('#empfn').val();
		var empln = $('#empln').val();
		var doj = $('#doj').val();
		var dob = $('#dob').val();
		var design = $('#design').val();
		var mailid = $('#emailid').val();
		var rtm = $('#rtm').val();
		var ctc = $('#ctc').val();
		 var status = $('#status').val(); 
		var remarks=$('#remarks').val();
		
		if(empid=="")
		{
			alert("Please Enter the Employee id.");
			 window.setTimeout(function ()
					    {
				document.getElementById('empid').focus();
					    }, 0);
			 document.getElementById('empid').value="";
					    return false;
		    
			}
		if(empfn=="")
		{
		alert("Please Enter the First Name.");
		 window.setTimeout(function ()
				    {
			document.getElementById('empfn').focus();
				    }, 0);
		 document.getElementById('empfn').value="";
				    return false;
		}
		if(empln=="")
		{
		alert("Please Enter the Last Name.");
		 window.setTimeout(function ()
				    {
			document.getElementById('empln').focus();
				    }, 0);
		 document.getElementById('empln').value="";
				    return false;
		}
		if(doj.toString()=="")
		{
		alert("Please Enter the DOJ.");
		doj.focus();
    	  return false;
		}
		if(dob.toString()=="")
		{
		alert("Please Enter the DOB.");
		dob.focus();
    	  return false;
		}
		if(design=="" || design==null)
		{
		alert("Please Enter the Designation");
		 window.setTimeout(function ()
				    {
			document.getElementById('design').focus();
				    }, 0);
		 document.getElementById('design').value="";
				    return false;
		}
		if(mailid=="")
		{
		alert("Please Enter the MailId");
		 window.setTimeout(function ()
				    {
			document.getElementById('mailid').focus();
				    }, 0);
		 document.getElementById('mailid').value="";
				    return false;
		}
		if(rtm=="" || rtm=="none selected" )
		{
		alert("Please Enter the reporting manager name");
		 window.setTimeout(function ()
				    {
			document.getElementById('rtm').focus();
				    }, 0);
		 document.getElementById('rtm').value="";
				    return false;
		}
		if(ctc=="" || ctc==null)
		{
		alert("Please Enter the CTC");
		 window.setTimeout(function ()
				    {
			document.getElementById('ctc').focus();
				    }, 0);
		 document.getElementById('ctc').value="";
				    return false;
		}
			
	else{
			
	  var dataString ="&empid=" +empid+ "&empfn=" +empfn+ "&empln=" +empln+  "&doj=" +doj+  "&dob=" +dob+ "&design=" +design+ "&mailid=" +mailid+ "&rtm=" +rtm+ "&ctc=" +ctc+ "&status="+status+ "&remarks="+ remarks; /* + "&status=" +status; */  
			
		//alert("Updated Successfully");
			$.ajax({
				
				url : 'EmployeeDataEditSuccess.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data)
				{
					//alert("Am cumin"); 

					$('#qryload').html(data).delay(6000).fadeOut();
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		}
		})
	});
</script>
<script>
$(function() {

	$('#submit').click(function() {

	popupWindow.close(); window.location.href='postLoginJsp/ATND/leaveoverview.jsp';
	});
	});
</script>


<!-- 
<script>
 function checkDate11(){
    //alert("today")
var name=document.getElementById("dob").value;
   // alert(name);//yyyy-mm-dd
   
   // GET CURRENT DATE
var date = new Date();
 
// GET YYYY, MM AND DD FROM THE DATE OBJECT
var yyyy = date.getFullYear().toString();
var mm = (date.getMonth()+1).toString();
var dd  = date.getDate().toString();
 
// CONVERT mm AND dd INTO chars
var mmChars = mm.split('');
var ddChars = dd.split('');
 
// CONCAT THE STRINGS IN YYYY-MM-DD FORMAT
var datestring = yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]);
  // alert(datestring);
   
  if(name>datestring)
	   {
	   alert("It is Future Date");
	   window.setTimeout(function ()
			    {
		document.getElementById('dob').focus();
			    }, 0);
	document.getElementById('dob').value="";
	// document.getElementById('datewarn').value=""; 
			    return false;
	   }

} 
</script>

<script>

function isFutureDate(idate){
    var today = new Date().getTime(),
        idate = idate.split("/");
    
    idate = new Date(idate[2], idate[1] - 1, idate[0]).getTime();
    return (today - idate) < 0 ? true : false;
}


// your function
function checkDate1(){
	//alert("date validation");
    var idate = document.getElementById("dob"),
    alert(idate);
        resultDiv = document.getElementById("datewarn"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        //dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
        
        dateReg = /201[4-9]|20[2-9][0-9][\/](0[1-9]|1[012])[\/](0[1-9]|[12][0-9]|3[01])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } 
        else {
            resultDiv.innerHTML = "It's a valid date";
            resultDiv.style.color = "green";
        }
    } else {
        resultDiv.innerHTML = "Invalid date!";
        resultDiv.style.color = "red";
       /* window.setTimeout(function ()
			    {
		document.getElementById('datepicker').focus();
			    }, 0);*/
	/* document.getElementById('datepicker').value="";*/
			    return false;
    }
}



</script>

 -->

</head>
<body>

 <%
String message="";
String empid = request.getParameter("empid"); 

System.out.println("empid===="+empid);  
		
		String RegQry ="select * from NCSS_EMP_MASTER_INFO where EMP_ID='"+empid+"'";
		
		System.out.println("Edit Query...."+RegQry);
	
		Connection con = GetConnection.getConnection(); 

		Statement st = con.createStatement();
			
			 ResultSet rs = st.executeQuery(RegQry);
	
	if(rs.next()) {
                
              %>
       
<table>
				<tr>
					<th>
						<h2>Please Update Here..</h2>
					</th>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" id="empid" value="<%=empid %>" /></input></td>
				</tr>
				<tr>
					<td>EMP_FNAME :</td>
					<td><input type="text" id="empfn" value="<%=rs.getString("EMP_FNAME") %>" onchange="verify1()" /></input></td>
				</tr>
				<tr>
					<td>EMP_LNAME :</td>
					<td><input  id="empln" value="<%=rs.getString("EMP_LNAME") %>" onchange="verify2()" ></input></td>
				</tr>
				
				<tr>
					<td>EMP_JOINING_DATE :</td>
					<td><input type="text" id="doj" value="<%=rs.getDate("EMP_JOINING_DATE") %> "  placeholder="dd-mmm-yyyy" readonly="readonly"/></input></td>
				</tr>
				
				<tr>
					<td>EMP_DOB:</td>
					<td><input type="text" id="dob" value="<%=rs.getDate("EMP_DOB") %>" readonly="readonly"></td>
					<%-- <td><input type="text" id="dob" value="<%=rs.getDate("EMP_DOB") %>" placeholder="dd-mmm-yyyy" onkeyup="checkDate1()" onchange="checkDate11()" /></input><div id="datewarn"></div></td> --%>
				</tr>
				<tr>
					<td>EMP_DESIGN :</td>
					<td><input type="text" id="design" value="<%=rs.getString("EMP_DESIG") %> " onchange="verify3()"/></input></td>
				</tr>
				<tr>
					<td>EMP_MAILID :</td>
					<td><input type="text" id="emailid" value="<%=rs.getString("EMP_MAILID") %> " onchange="echeck(this.value)" /></input></td>
				</tr>
				<tr>
					<td>EMP_RM :</td>
					<%-- <td><input type="text" id="rtm" value="<%=rs.getString("EMP_RM") %> " /></input></td> --%>
					
					<td><select id="rtm"  >
							<option  value="none selected">Select Id </option>
        <% 
Connection con1=null;
String basic="select emp_mailid from NCSS_EMP_MASTER_INFO where role_id in(2,3,1)";
try
{
	    con1 = GetConnection.getConnection();
		Statement st1 = con.createStatement();

		ResultSet rs1 = st1.executeQuery(basic);

     while(rs1.next())
     {
          String name = rs1.getString("emp_mailid");
%>
          <option  value="<%=name%>"><%=name%></option>
<%
     }
     
     
}catch(Exception e)
{    out.print(e);
}
%>
</select>
					
	</td>				
					
					
				</tr>
				<tr>
					<td>EMP_CTC :</td>
					<td><input type="text" id="ctc" value="<%=rs.getString("EMP_CTC") %> " onkeypress="return isamt(event)" /></input></td>
				</tr>

				 <tr>
					<td>STATUS :</td>
				<%-- 	<td><input type="text" id="status" value="<%=rs.getString("STATUS") %> " /></input></td> --%>
				<td><select  id="status">
						<option value="Active">Active</option>
						<option value="Resign">Resign</option>
					</select>
				</td>
				</tr> 
				
				<tr>
					<td>REMARKS :</td>
					<td><input type="text" id="remarks" value="<%=rs.getString("REMARKS") %> "   onchange="verify4()"/></input></td>
				</tr> 
				<tr>
					<td align="center">
					<input type="button" value="Submit" id="submit" title="Submit"/></input>
					</td >
					<td align="center">   
					<input type="submit" name="Close" value="Close Window" title="Close Window" onClick="javascript:window.close();"/>
					</td>
				</tr>
	<tr>

		</tr>

	</table>
	 <% } %>
	 
	 <div id="qryload" style="color:green"></div>
	 

</body>
</html>
