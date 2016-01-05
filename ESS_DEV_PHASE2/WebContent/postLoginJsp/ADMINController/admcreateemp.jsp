<%@ page import="java.sql.*"%>
<%@page import="com.ess.util.GetConnection"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registration Form</title>
<style type="text/css">
#datepicker{
width: 224px;  
}
#rolename{
width: 224px;
}

#visa{
width: 224px;
}

#msstatus{
width: 224px;
}

#motherdob{
width: 224px;
}

#spousedob{
width: 224px;
}

#ch1dob{
width: 224px;
}

#ch2dob{
width: 224px;
}
#cadd{
width: 224px;
}
#padd{
width: 224px;
}

.button-add {
    cursor:pointer;
}

</style>

 <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>
 <script type="text/javascript" src="regjs/panvalidate.js"></script> 
 
 
<!--   <script type="text/javascript" src="js/jquery-1.9.1.js"></script> -->
<script src="investmentjs/jquery-1.10.2.js"></script>
<!-- <link rel="stylesheet" href="date/jquery-ui.css"/>  -->
<!-- <script src="../../date/jquery-1.10.2.js"></script> -->
<script src="date/jquery-ui.js"></script>
 
 
 <script>
 function hiding()
 {
	 var sts=document.getElementById("msstatus").value;
	
	 document.getElementById("spousename").disabled=false;
	 document.getElementById("spousedob").disabled=false;
	 document.getElementById("ch1dob").disabled=false;
	 document.getElementById("ch1name").disabled=false;
	 document.getElementById("ch2dob").disabled=false;
	 document.getElementById("ch2name").disabled=false;
	 
	 document.getElementById("fathername").disabled=false;
	 document.getElementById("mothername").disabled=false;
	 document.getElementById("motherdob").disabled=false;
	 
	 
	 document.getElementById("spousename").value=" ";
	 document.getElementById("spousedob").value=" ";
	 document.getElementById("ch1dob").value=" ";
	 document.getElementById("ch1name").value=" ";
	 document.getElementById("ch2dob").value=" ";
	 document.getElementById("ch2name").value=" ";
	 
	 document.getElementById("fathername").value=" ";
	 document.getElementById("mothername").value=" ";
	 document.getElementById("motherdob").value=" ";

	if(sts=="SINGLE")
	 {
		document.getElementById("spousename").disabled=true;
	 document.getElementById("spousedob").disabled=true;
	 document.getElementById("ch1dob").disabled=true;
	 document.getElementById("ch1name").disabled=true;
	 document.getElementById("ch2dob").disabled=true;
	 document.getElementById("ch2name").disabled=true;
	 document.getElementById("fathername").focus();
	 
 }
	if(sts=="DIVORCED")
		{
		document.getElementById("spousename").disabled=true;
		 document.getElementById("spousedob").disabled=true;
		 document.getElementById("fathername").focus();
		}
	
 }
 
 function hiding2()
 {
	 var totalexpsts=document.getElementById("totalexp").value;
	
	 document.getElementById("preorgname1").disabled=false;
	 document.getElementById("yearsworked1").disabled=false;
	 document.getElementById("refname1").disabled=false;
	 document.getElementById("refmailid1").disabled=false;
	 document.getElementById("refnumber1").disabled=false;
	 document.getElementById("preorgname2").disabled=false;
	 document.getElementById("yearsworked2").disabled=false;
	 document.getElementById("refname2").disabled=false;
	 document.getElementById("refmailid2").disabled=false;
	 document.getElementById("refnumber2").disabled=false;
	 document.getElementById("preorgname3").disabled=false;
	 document.getElementById("yearsworked3").disabled=false;
	 document.getElementById("refname3").disabled=false;
	 document.getElementById("refmailid3").disabled=false;
	 document.getElementById("refnumber3").disabled=false;
	 
	 
	 document.getElementById("preorgname1").value=" ";
	 document.getElementById("yearsworked1").value=" ";
	 document.getElementById("refname1").value=" ";
	 document.getElementById("refmailid1").value=" ";
	 document.getElementById("refnumber1").value=" ";
	 
	 document.getElementById("preorgname2").value=" ";
	 document.getElementById("yearsworked2").value=" ";
	 document.getElementById("refname2").value=" ";
	 document.getElementById("refmailid2").value=" ";
	 document.getElementById("refnumber2").value=" ";
	 
	 document.getElementById("preorgname3").value=" ";
	 document.getElementById("yearsworked3").value=" ";
	 document.getElementById("refname3").value=" ";
	 document.getElementById("refmailid3").value=" ";
	 document.getElementById("refnumber3").value=" ";
	 

	if(totalexpsts=="0" || totalexpsts=="0.0" || totalexpsts=="0.00")
	 {
	 document.getElementById("preorgname1").disabled=true;
	 document.getElementById("yearsworked1").disabled=true;
	 document.getElementById("refname1").disabled=true;
	 document.getElementById("refmailid1").disabled=true;
	 document.getElementById("refnumber1").disabled=true;
	 
	 document.getElementById("preorgname2").disabled=true;
	 document.getElementById("yearsworked2").disabled=true;
	 document.getElementById("refname2").disabled=true;
	 document.getElementById("refmailid2").disabled=true;
	 document.getElementById("refnumber2").disabled=true;
	 document.getElementById("preorgname3").disabled=true;
	 document.getElementById("yearsworked3").disabled=true;
	 document.getElementById("refname3").disabled=true;
	 document.getElementById("refmailid3").disabled=true;
	 document.getElementById("refnumber3").disabled=true;

 }
	
 }
 
 </script>
 
<script type="text/javascript">
function loadXMLDoc()
{
	var name=document.getElementById("employeeid").value;
	 var exp = /^[ A-Za-z]*$/; 
		
	  if((name.match(exp)))
	     {  
		 alert("It should be allowed only Alphanumeric or Numeric");
		     window.setTimeout(function ()
					    {
				document.getElementById('employeeid').focus();
					    }, 0);
			 document.getElementById('employeeid').value="";
			 document.getElementById("err").innerText="";
					    return false; 
	     }  
	  if(name.length < 6 || name.length > 11)
		  {
		  alert("Size should be allowed between 6 to 11");
		     window.setTimeout(function ()
					    {
				document.getElementById('employeeid').focus();
					    }, 0);
			 document.getElementById('employeeid').value="";
			 document.getElementById("err").innerText="";
					    return false; 
		  }
	   else 
	     {  
 var xmlhttp;
 var k=document.getElementById("employeeid").value;

 var urls="postLoginJsp/ADMINController/pass.jsp?ver="+k;
 
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
        document.getElementById("err").innerHTML=xmlhttp.responseText;
        document.getElementById("fname").value=" ";
    }
  }
 xmlhttp.open("GET",urls,true);
 xmlhttp.send();

 
  }  

}
</script>

<!--  <script>
$(function() {
	var date = new Date();
	var currentMonth = date.getMonth();
	var currentDate = date.getDate();
	var currentYear = date.getFullYear();
	
  $( "#datepicker" ).datepicker({
       dateFormat: 'yy-mm-dd', 
    changeMonth: true,
    changeYear: true,
    maxDate: new Date(currentYear, currentMonth, currentDate),
      yearRange: "-80:+0"
  });
});
</script>  -->

<script type="text/javascript">
    function PreviewImage() {
    	//alert("hai");
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);
        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };

</script>
<script>

function checking()
{
	var span_Text = document.getElementById("err").innerText;
	 var name=document.getElementById("fname").value;
	
	if(span_Text=="This ID Already in Use")
		{
		alert("Please Enter Available Employee ID");
		document.getElementById("fname").value=" ";
		document.getElementById("fname").focus();
		}
	else
		{
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
				document.getElementById('fname').focus();
					    }, 0);
			 document.getElementById('fname').value="";
					    return false;
		     }
		
		}
	}
	
	</script>
	

<script>
$(function() {
	$("#submit1").click(function() {
		
		//alert("ajax call");

		var employeeid = $('#employeeid').val();
		var fname = $('#fname').val();
		var lname = $('#lname').val();
		var datepicker = $('#datepicker').val();
		var pannum = $('#pannum').val();
		var passportnum = $('#passportnum').val();
		var uid = $('#uid').val();
		var phnumone = $('#phnumone').val();
		var phnumtwo = $('#phnumtwo').val();
		var designation = $('#designation').val();
		var rmmanager = $('#rmmanager').val();
		var ctc = $('#ctc').val();
		var emailid = $('#emailid').val();
		var visa = $('#visa').val();
		var uploadImage=$('#uploadImage').val();
		var rolename=$('#rolename').val();
		var gender=$('#gender').val();
		var bgroup=$('#bgroup').val();
		
		
		var msstatus = $('#msstatus').val();
		var fathername=$('#fathername').val();
		var mothername = $('#mothername').val();
		var motherdob = $('#motherdob').val();
		var spousename = $('#spousename').val();
		var spousedob = $('#spousedob').val();
		var ch1name = $('#ch1name').val();
		var ch1dob = $('#ch1dob').val();
		var ch2name = $('#ch2name').val();
		var ch2dob = $('#ch2dob').val();
		var cadd = $('#cadd').val();
		var padd = $('#padd').val();
		var emrgcontnum = $('#emrgcontnum').val();
		
		var hiqualdeg1 = $('#hiqualdeg1').val();
		var hiqualpassout1 = $('#hiqualpassout1').val();
		var hiqualperc1 = $('#hiqualperc1').val();
		var hiqualdeg2 = $('#hiqualdeg2').val();
		var hiqualpassout2 = $('#hiqualpassout2').val();
		var hiqualperc2 = $('#hiqualperc2').val();
		var hiqualdeg3 = $('#hiqualdeg3').val();
		var hiqualpassout3 = $('#hiqualpassout3').val();
		var hiqualperc3 = $('#hiqualperc3').val();
		var cert1 = $('#cert1').val();
		var cert2 = $('#cert2').val();
		var cert3 = $('#cert3').val();
		
		var totalexp = $('#totalexp').val();
		var preorgname1 = $('#preorgname1').val();
		var yearsworked1 = $('#yearsworked1').val();
		var refname1 = $('#refname1').val();
		var refmailid1 = $('#refmailid1').val();
		var refnumber1 = $('#refnumber1').val();
		var preorgname2 = $('#preorgname2').val();
		var yearsworked2 = $('#yearsworked2').val();
		var refname2 = $('#refname2').val();
		var refmailid2 = $('#refmailid2').val();
		var refnumber2 = $('#refnumber2').val();
		var preorgname3 = $('#preorgname3').val();
		var yearsworked3 = $('#yearsworked3').val();
		var refname3=$('#refname3').val();
		var refmailid3 = $('#refmailid3').val();
		var refnumber3=$('#refnumber3').val();
		
		/* DYNAMIC ADDED ROW VALIDATION */
	      var requiredFields = $('#tblPets1').find('.requiredField');
	   
	       var allFieldsComplete = true;
	        var str=requiredFields.each(function(index) {
	            if (this.value.length == 0) {
	                $(this).addClass('requiredIncomplete');
	                //allFieldsComplete = false;
	                alert("Please fill all new added more experience values !");
	                /* return false; */
	                allFieldsComplete = false;
	                return allFieldsComplete;
	                
	            } else {
	                $(this).removeClass('requiredIncomplete');
	               // alert("some values");
	            }
	        });
	       /*  if(!allFieldsComplete){
	            alert("Please complete more experience required fields");
	        }
	        return allFieldsComplete; */
		
		//alert("Required fileds id flag is.."+allFieldsComplete);
		if(allFieldsComplete==false)
			{
			//alert("false condition");
			return false;
			}
		
		
		var datesArray=[];
		var myTable = document.getElementById('tblPets1').tBodies[0];
        // alert("my table.."+myTable);
         // first loop for each row	
        for (var r=1, n = myTable.rows.length; r < n; r++) 
        {     // this loop is getting each colomn/cells
			for (var c = 0, m = myTable.rows[r].cells.length-1; c < m; c++)
			{
			   if(myTable.rows[r].cells[c].childNodes[0].value)
			   {
			   		var marks = myTable.rows[r].cells[c].childNodes[0].value;
			   		alert("MARKS.."+marks);
			   		if(marks==" " || marks==null)
			   			{
			   			alert("Please Enter all important Fields")
			   			return false;
			   			}
			   	  datesArray.push(marks);
		            }
			   }
			  datesArray.push(";");
			  
            }
         
		
         
  
         
         if(employeeid=="")
		{
		alert("Please Enter the Employee Id");
		
		window.setTimeout(function ()
			    {
		document.getElementById('employeeid').focus();
			    }, 0);
		document.getElementById('employeeid').value="";
			    return false;
		}
		if(fname=="")
		{
		alert("Please Enter the Employee Name");
		window.setTimeout(function ()
			    {
		document.getElementById('fname').focus();
			    }, 0);
		document.getElementById('fname').value="";
		return false;
		}
		if(lname=="")
		{
		alert("Please Enter the Last Name");
		window.setTimeout(function ()
			    {
		document.getElementById('lname').focus();
			    }, 0);
		document.getElementById('lname').value="";
		return false;
		}
		
		if(datepicker=="")
		{
		alert("Please Enter the Date of Birth");
		window.setTimeout(function ()
			    {
		document.getElementById('datepicker').focus();
			    }, 0);
		document.getElementById('datepicker').value="";
		document.getElementById('datewarn').innerHTML=""; 
		return false;
		}
		if(pannum=="")
		{
		alert("Please Enter the PAN Number");
		window.setTimeout(function ()
			    {
		document.getElementById('pannum').focus();
			    }, 0);
		document.getElementById('pannum').value="";
		return false;
		}
		if(uid=="")
		{
		alert("Please Enter the UID NO");
		window.setTimeout(function ()
			    {
		document.getElementById('uid').focus();
			    }, 0);
		document.getElementById('uid').value="";
		return false;
		}
		if(phnumone=="")
		{
		alert("Please Enter the Contact Number");
		window.setTimeout(function ()
			    {
		document.getElementById('phnumone').focus();
			    }, 0);
		document.getElementById('phnumone').value="";
		return false;
		}
		if(isNaN(phnumone))
		{
		alert("Enter the valid Mobile Number in Numeric value");
		window.setTimeout(function ()
			    {
		document.getElementById('phnumone').focus();
			    }, 0);
		document.getElementById('phnumone').value="";
		return false;
		}
		if((phnumone.length < 10) || (phnumone.length > 10))
		{
		alert(" Your Mobile Number must be 1 to 10 Integers");
		window.setTimeout(function ()
			    {
		document.getElementById('phnumone').focus();
			    }, 0);
		document.getElementById('phnumone').value="";
		
		phnumone.focus();
		return false;
		}
		
		if(designation=="")
		{
		alert("Please Select Designation");
		window.setTimeout(function ()
			    {
		document.getElementById('designation').focus();
			    }, 0);
		document.getElementById('designation').value="";
		return false;
		
		}
		if(designation=="none selected" )
		{
		alert("Please Select Designation");
		window.setTimeout(function ()
			    {
		document.getElementById('designation').focus();
			    }, 0);
		document.getElementById('designation').value="";
		return false;
		
		}
		if(rmmanager=="none selected")
			{
			alert("Please Select Reporting Manager");
			window.setTimeout(function ()
				    {
			document.getElementById('rmmanager').focus();
				    }, 0);
			//document.getElementById('rmmanager').value="";
			return false;
			
			}
		
		if(ctc=="")
		{
		alert("Please Enter the CTC");
		window.setTimeout(function ()
			    {
		document.getElementById('ctc').focus();
			    }, 0);
		document.getElementById('ctc').value="";
		return false;
		}
  		if ((emailid==null)||(emailid=="")){
		alert("Please Enter your Email ID");
		window.setTimeout(function ()
			    {
		document.getElementById('emailid').focus();
			    }, 0);
		document.getElementById('emailid').value="";
		return false;
		}
  		
  		if(rolename=="" || rolename=="none")
		{
		alert("Please Enter the Role Name");
		window.setTimeout(function ()
			    {
		document.getElementById('rolename').focus();
			    }, 0);
		return false;
		}
  		
  		if(gender=="" || gender=="none")
		{
		alert("Please Select Gender");
		window.setTimeout(function ()
			    {
		document.getElementById('gender').focus();
			    }, 0);
		return false;
		}
  		if(bgroup=="" || bgroup=="none")
		{
		alert("Please Select Gender");
		window.setTimeout(function ()
			    {
		document.getElementById('bgroup').focus();
			    }, 0);
		return false;
		}
		if(msstatus=="" || msstatus=="none")
		{
		alert("Please Enter the Marital Status");
		window.setTimeout(function ()
			    {
		document.getElementById('msstatus').focus();
			    }, 0);
		//document.getElementById('msstatus').value="";
		return false;
		}

		if(fathername=="")
		{
		alert("Please Enter Father Name");
		window.setTimeout(function ()
			    {
		document.getElementById('fathername').focus();
			    }, 0);
		document.getElementById('fathername').value="";
		return false;
		}
		
		if(mothername=="")
		{
		alert("Please Enter Mother Name");
		window.setTimeout(function ()
			    {
		document.getElementById('mothername').focus();
			    }, 0);
		document.getElementById('mothername').value="";
		return false;
		}
		
		if(motherdob=="")
			{
			alert("Please Enter the Mother DOB");
			window.setTimeout(function ()
				    {
			document.getElementById('motherdob').focus();
				    }, 0);
			document.getElementById('motherdob').value="";
			document.getElementById('datewarn2').innerHTML=""; 
			return false;
			}
		
		if(hiqualdeg1=="")
		{
		alert("Please Enter the Highest Qualification");
		window.setTimeout(function ()
			    {
		document.getElementById('hiqualdeg1').focus();
			    }, 0);
		document.getElementById('hiqualdeg1').value="";
		return false;
		} 
		
		if(hiqualperc1>100)
		{
		alert("you entered wrong percentage");
		window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc1').focus();
			    }, 0);
		document.getElementById('hiqualperc1').value="";
		return false;
		} 
		if(hiqualperc2>100)
		{
		alert("you entered wrong percentage");
		window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc2').focus();
			    }, 0);
		document.getElementById('hiqualperc2').value="";
		return false;
		} 
		if(hiqualperc3>100)
		{
		alert("you entered wrong percentage");
		window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc3').focus();
			    }, 0);
		document.getElementById('hiqualperc3').value="";
		return false;
		} 
		
		if(totalexp==""||totalexp>60)
		{
		alert("Please Enter the Total Experience");
		window.setTimeout(function ()
			    {
		document.getElementById('totalexp').focus();
			    }, 0);
		document.getElementById('totalexp').value="";
		return false;
		}
		
		
				
	else { 
 		
		 var dataString = "&employeeid=" + employeeid + "&fname=" + fname + "&lname=" + lname + "&datepicker=" + datepicker +
		"&pannum=" + pannum + "&passportnum=" + passportnum +"&uid=" + uid + "&phnumone=" + phnumone +
		"&phnumtwo=" + phnumtwo + "&designation=" + designation +"&rmmanager=" + rmmanager + "&ctc=" + ctc +
		"&emailid=" + emailid + "&visa=" + visa +"&uploadImage=" + uploadImage +  "&rolename=" +rolename+  "&gender=" +gender+ "&bgroup=" +bgroup+

		"&msstatus=" + msstatus +  "&fathername=" + fathername + "&mothername=" + mothername + "&motherdob=" + motherdob + "&spousename=" + spousename +
		"&spousedob=" + spousedob + "&ch1name=" + ch1name +"&ch1dob=" + ch1dob + "&ch2name=" + ch2name +
		"&ch2dob=" + ch2dob + "&cadd=" + cadd +"&padd=" + padd + "&emrgcontnum=" + emrgcontnum +
	
		"&hiqualdeg1=" + hiqualdeg1 + "&hiqualpassout1=" + hiqualpassout1 + "&hiqualperc1=" + hiqualperc1 + "&hiqualdeg2=" + hiqualdeg2 +
		"&hiqualpassout2=" + hiqualpassout2 + "&hiqualperc2=" + hiqualperc2 +"&hiqualdeg3=" + hiqualdeg3 + "&hiqualpassout3=" + hiqualpassout3 +
		"&hiqualperc3=" + hiqualperc3 + "&cert1=" + cert1 +"&cert2=" + cert2 + "&cert3=" + cert3 +

		"&totalexp=" + totalexp + "&preorgname1=" + preorgname1 + "&yearsworked1=" + yearsworked1 + "&refname1=" + refname1 +
		"&refmailid1=" + refmailid1 + "&refnumber1=" + refnumber1 +"&preorgname2=" + preorgname2 + "&yearsworked2=" + yearsworked2 +
		"&refname2=" + refname2 + "&refmailid2=" + refmailid2 +"&refnumber2=" + refnumber2 + "&preorgname3=" + preorgname3 +
		"&yearsworked3=" + yearsworked3 + "&refname3=" + refname3 +"&refmailid3=" + refmailid3+ "&refnumber3=" +refnumber3+ 
		"&datesArray=" + datesArray; 
		
		//alert(dataString);
		$.ajax({
			url : 'postLoginJsp/ADMINController/registrationDB.jsp',
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				$('#qryload').html(data);
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("already existed employee");
			}
		});
			  }  
		})
});

</script>


<SCRIPT TYPE="text/javascript"> 
var count = "1";
function addRow(in_tbl_name)
{
	
	var table = document.getElementById('tblPets1');
	
	var rowCount = table.rows.length;
	if(rowCount>3)
		{
		alert("you can not add more");
		}
	
	else{
	
  var tbody = document.getElementById(in_tbl_name).getElementsByTagName("TBODY")[0];

  var row = document.createElement("TR");
  
  var td2 = document.createElement("TD")
  var strHtml2 = "<input type=\"text\"  id=\"preorgname\" name=\"preorgname\" MAXLENGTH=\"50\" PLACEHOLDER=\"Organization Name\"  class=\"requiredField\"  >";
	 
  td2.innerHTML = strHtml2.replace(/!count!/g,count);
  // create table cell 3
  var td3 = document.createElement("TD")
  var strHtml3 = "<INPUT TYPE=\"text\" id=\"yearsworked\"  NAME=\"yearsworked\"  MAXLENGTH=\"50\" PLACEHOLDER=\"Years Of Worked (in year)\"  STYLE=\"height:24;border: 1 solid;margin:0;\"  onkeypress=\"return isamt(event)\" class=\"requiredField\" >";
  td3.innerHTML = strHtml3.replace(/!count!/g,count);
  // create table cell 4
  var td4 = document.createElement("TD")
  var strHtml4 = "<INPUT TYPE=\"text\" id=\"refname\"  name=\"refname\"  PLACEHOLDER=\"Reference Name\"  MAXLENGTH=\"50\"  STYLE=\"height:24;border: 1 solid;margin:0;\" onchange=\"checking()\">";
  td4.innerHTML = strHtml4.replace(/!count!/g,count);
  // create table cell 5
  var td5 = document.createElement("TD")
  var strHtml5 = "<INPUT TYPE=\"text\" id=\"refmailid\"  NAME=\"refmailid\"  MAXLENGTH=\"50\" PLACEHOLDER=\"Reference Email Id\" STYLE=\"height:24;border: 1 solid;margin:0;\" onchange=\"echeckmail321(this.value)\" class=\"requiredField\" >";
  td5.innerHTML = strHtml5.replace(/!count!/g,count);
  // create table cell 6
  var td6 = document.createElement("TD")
  var strHtml6 = "<INPUT TYPE=\"text\" id=\"refnumber\" NAME=\"refnumber\"  MAXLENGTH=\"15\" PLACEHOLDER=\"Reference Phone Number\"  STYLE=\"height:24;border: 1 solid;margin:0;\"  onkeypress=\"return isamt(event)\" class=\"requiredField\" onchange=\"verifyPhext()\">";
  td6.innerHTML = strHtml6.replace(/!count!/g,count);
  // create table cell 7
  var td7 = document.createElement("TD")
  var strHtml7 = "<INPUT TYPE=\"Button\" CLASS=\"Button\" onClick=\"delRow()\" VALUE=\"Delete Row\" class=\"requiredField\" >";
  td7.innerHTML = strHtml7.replace(/!count!/g,count);
  // append data to row
/*   row.appendChild(td1); */
  row.appendChild(td2);
  row.appendChild(td3);
  row.appendChild(td4);
  row.appendChild(td5);
  row.appendChild(td6);
  row.appendChild(td7);
  // add to count variable
  count = parseInt(count) + 1;
  // append row to table
  tbody.appendChild(row);
	} 
	
}

function delRow()
{
  var current = window.event.srcElement;
  //here we will delete the line
  while ( (current = current.parentElement)  && current.tagName !="TR");
       current.parentElement.removeChild(current);
}
</SCRIPT>

<script type="text/javascript">
/* FOR CHECKING VALIDATION ALL TEXT FIELD IS EMPTY OR NOT  */

//This function here is only a cross-browser events stopper
stopEvent = function(ffevent)
{
   var current_window = window;

   if(current_window.event) //window.event is IE, ffevent is FF
   {//IE
      current_window.event.cancelBubble = true; //this stops event propagation
      current_window.event.returnValue = false; //this prevents default (usually is what we want)
   }
   else
   { //Firefox
      ffevent.stopPropagation();
      ffevent.preventDefault();
   };
}

function validateAllInputBoxes(ffevent)
{
	alert("come into dynamic validation");
	var tblPets11=$('#tblPets1').val();
	alert("tblPets11..."+tblPets11);
	
	var datesArray=[];
	var myTable = document.getElementById('tblPets1').tBodies[0];
     // first loop for each row	
    for (var r=1, n = myTable.rows.length; r < n; r++) 
    {     // this loop is getting each colomn/cells
		for (var c = 0, m = myTable.rows[r].cells.length-1; c < m; c++)
		{
		   if(myTable.rows[r].cells[c].childNodes[0].value)
		   {
		   		var marks = myTable.rows[r].cells[c].childNodes[0].value;
		   		alert("MARKS.."+marks);
		   		if(marks==" " || marks==null)
		   			{
		   			alert("Please Enter all important Fields")
		   			return false;
		   			}
		   	  datesArray.push(marks);
	            }
		   }
		  datesArray.push(";");
		  
        }
	//if(datesArray==0)
		alert("datesArray.."+datesArray);
   var inputs = document.getElementsByTagName('input');
   for(var i = 0; i < inputs.length; ++i)
      if(inputs[i].type === 'text')
         //@Satish, maybe below you wrote by mistake if(inputs[i].value = '') thus all input elements values get cleared out.
         if(inputs[i].value === '') 
         {
            alert("form could not be sent one input text field is empty");
            stopEvent(ffevent);
         }
}
 

</script>

<script>
/* var ctr = 1;
$('#tblPets').on('click', '.button-add', function () {
    ctr++;
    var preorgname = "preorgname" + ctr;
    var yearsworked = "yearsworked" + ctr;
    var refname = "refname" + ctr;
    var refmailid = "refmailid" + ctr;
    var refnumber ="refnumber" +crt;
    var newTr = '<tr><td>Organization Name <input type="text" id=' + preorgname + ' /></td></tr><br><td>Years Of Worked (in year)<input type="text" id=' + yearsworked + ' /></td></tr><tr><td>Organization Reference Name <input type="text" id=' + refname + ' /></td><br></tr><tr><td>Organization Reference Email Id <input type="text" id=' + refmailid + ' /></td></tr> <tr><td>Organization Reference Phone Number<input type="text" id=' + refnumber + ' /></td><br></tr><tr><td id="btnAdd" class="button-add">Add</td></tr>';
    $('#tblPets').append(newTr);
}); */

/* $(document).ready(function () {
    $("#addRow").click(function () {
        $("#tblPets").append("<tr><td>Previous Organization Details</td><td>Organization Name<input type='text' id=' + preorgname + '><br>Years Of Worked (in year)<input type='text' id=' + yearsworked + '><br>Organization Reference Name <input type='text' id=' + refname + ' /><br>Organization Reference Email Id <input type='text' id=' + refmailid + ' /><br>Organization Reference Phone Number<input type='text' id=' + refnumber + ' /> &nbsp; <a href='javascript:void(0);' id='remCF'>Remove</a></td></tr>");
   
        $("#remCF").on('click',function(){
			$(this).parent().parent().remove();
		});
    
    });
}); */

</script>



</head>

<body>
 <div id="qryload" > 
 <div style="height:2200px;width:750px:bg-color:#40e0d0;margin-top:14%"  > 
 <table align="center" width=40% width="100%" cellspacing="2" cellpadding="2" border="5" ID="tblPets">
    <tr>
        <td colspan="2" align="center"><b>Employee Registration Form</b></td>
    </tr>
  
     <tr>
     <td align="left" valign="top" width="50%">
     <label for="regBean.image" class="label">Employee Photo</label>
     </td> 
     <td>
	 <img id="uploadPreview" style="width: 100px; height: 100px;" />
		<input id="uploadImage" type="file" name="regBean.image" accept="image/*" onchange="PreviewImage()" />
     </td>
    </tr>
    
	<tr>
        <td ><!-- align="left" valign="top" width="41%">
			<label for="regBean.employeeid" class="label">Employee Id</label><span style="color:red">*</span> -->
			<label class="flable">Employee Id <span style="color:red">*</span></label> <br>
		</td>
		<td width="57%">
			<!-- <input type="text" id="employeeid" name="regBean.employeeid" id="employeeid" size="24"> -->
			<input type="text" name="employeeid" id="employeeid" size="24"  onkeypress="return isempid(event)" onchange="loadXMLDoc()" >
				<span id="err"> </span>
			</td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">
			<label for="regBean.fname" class="label">Employee First Name</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" name="regBean.fname" id="fname" size="24" onchange="checking()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.lname" class="label">Employee Last Name</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" name="regBean.lname" id="lname" size="24" onchange="verifyn1()"></td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.dob" class="label">Employee DOB</label><span style="color:red">*</span></td>
 
        <td width="57%">
      <%
			java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); 
			/* java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd"); */
      %> 
     <%--   <input type="text" name="tdate"  id="datepicker"value="<%=df.format(new java.util.Date())%>" size="20"  /> --%> 
         <input type="date" value="" name="regBean.dob" id="datepicker" value="<%=df.format(new java.util.Date())%>" placeholder="MM/DD/YYYY" size="60" onkeyup="checkDate1()" onchange="checkDate11()" min=""><div id="datewarn"> </div>
         
<!--     <input type="date" id="datepicker" onchange="(window.event.type+' event handler for '+this.type+' noticed  \''+this.value+'\'');" onclick="(window.event.type+ ' event handler for '+this.type+ ' noticed  \''+this.value+'\'');" onkeydown="window.event.preventDefault();
(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" onkeypress="window.event.preventDefault();
(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" oninput="(window.event.type+' event handler for '+this.type+' noticed \''+this.value+'\'');" />
  -->      
   <!-- <input type="text" value="" name="regBean.dob" id="datepicker" size="60" placeholder="DD/MM/YYYY" onkeyup="checkDate()"><div id="datewarn"> -->
   </td>
  
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.pannum" class="label">Employee PAN NO</label><span style="color:red">*</span></td>
 
        <td width="57%" height="20"><span id="status" style="color:red"></span><br>
        <input type="text" value="" name="regBean.pannum" id="pannum" onkeyup="pan_validate(this.value);" maxlength="10" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.passportnum" class="label">Employee Passport Number</label></td>
        <td width="57%"><input type="text" value=""id="passportnum"  name="regBean.passportnum" size="24" onchange="PPverify()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.uid" class="label">Employee UID</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" name="regBean.uid" id="uid" size="24" onchange= "return uidValidation()"></td>
		
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.phnumone" class="label">Contact Number</label><span style="color:red">*</span> </td>
        <td width="57%"><input type="text"  name="regBean.phnumone" id="phnumone" size="24" onchange="verifyPh1()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.phnumtwo" class="label">Alternate Contact Number</label></td>
        <td width="57%"><input type="text"  name="regBean.phnumtwo" id="phnumtwo" size="24" onchange="verifyPh2()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.designation" class="label">Employee Designation</label><span style="color:red">*</span></td>
        
        <!-- <td width="57%"><input type="text" value="" id="designation" name="regBean.designation" size="24" onchange="verifyn2()"></td> -->
   <td><select id="designation" class="abc" >
		<option  value="none selected">Select Designation </option>
        <% 
		Connection con1=null;
				String basic1="select EMP_DESIGNATION from EMP_MASTER_DESIGNATION ";
				System.out.println(basic1);
		try
			{
		 	con1 = GetConnection.getConnection();
			Statement st1 = con1.createStatement();
			ResultSet rs1 = st1.executeQuery(basic1);

    	 while(rs1.next())
  		   {
    	      String name1 = rs1.getString("EMP_DESIGNATION");
		%>
        	  <option  value="<%=name1%>"><%=name1%></option>
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
        <td align="left" valign="top" width="41%">
        <label for="regBean.rmanager" class="label">Employee Reporting Manager</label><span style="color:red">*</span></td>
 
        <!-- <td width="57%"><input type="text" value="" id="rmmanager" name="regBean.rmanager" size="24"></td> -->
       <td><select id="rmmanager" class="abc" >
		<option  value="none selected">Select RM </option>
        <% 
		Connection con=null;
				String basic="select emp_mailid from NCSS_EMP_MASTER_INFO where role_id in(2,3,1)";
		try
			{
		 	con = GetConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(basic);

    	 while(rs.next())
  		   {
    	      String name = rs.getString("emp_mailid");
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
        <td align="left" valign="top" width="41%">
        <label for="regBean.ctc" class="label">Employee CTC</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" value="" id="ctc" name="regBean.ctc" size="24" onkeypress="return isamt(event)"></td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.emailid" class="label">Personal Email Id</label><span style="color:red">*</span></td>
        <td width="57%">
        <input type="text" value="" name="regBean.emailid" id="emailid" size="24" onchange="echeck(this.value)"></td>
        <!-- <td> <label class="flable1">Personal mail id :</label><span style="color:red">*</span></td>
        <td><input class="mailid" type="text"> <span class="status1"></span></td> -->
        
    </tr>
    <!-- <tr>
    <td><label class="flable2">Company Mail Id:</label><span style="color:red">*</span></td>
    <td><input class="mailid2" type="text"> <span class="status2"></span></td>
    </tr> -->
    
     <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.visainfo" class="label">Role Name</label><span style="color:red">*</span></td>
        <td width="57%">
		<select name="regBean.visainfo" id="rolename">
			<option value="none">Select</option>
			<option value="1">ADMIN</option>
			<option value="2">MANAGER</option>
			<option value="3">HR</option>
			<option value="4">EMPLOYEE</option>
		</select>
        </td>
    </tr>
    
     <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.visainfo" class="label">VISA Info</label></td>
        <td width="57%">
		<select name="regBean.visainfo" id="visa">
			<option value="none">Select</option>
			<option value="h1">h1</option>
			<option value="b1">b1</option>
			<option value="l1">l1</option>
		</select>
        </td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.visainfo1" class="label">GENDER</label><span style="color:red">*</span></td>
        <td width="57%">
		<select name="regBean.visainfo" id="gender">
			<option value="none">Select</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
			<option value="Transgender">Transgender</option>
		</select>
        </td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.visainfo1" class="label">Blood Group</label><span style="color:red">*</span></td>
        <td width="57%">
		<select name="regBean.visainfo" id="bgroup">
			<option value="none">Select</option>
			<option value="A(positive)">A+</option>
			<option value="O(positive)">O+</option>
			<option value="B(positive)">B+</option>
			<option value="AB(positive)">AB+</option>
			<option value="A(negative)">A-</option>
			<option value="O(negative)">O-</option>
			<option value="B(negative)">B-</option>
			<option value="AB(negative)">AB-</option>
		</select>
        </td>
    </tr>
    
	 <tr>
        <td colspan="2" align="center"><b>Employee Personal Details</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.mstatus" class="label">Employee Marital Status</label><span style="color:red">*</span></td>
 
        <!-- <td width="57%"><input type="radio" value="Single" name="regBean.mstatus" id="msstatus">Single<input type="radio" value="Married" id="msstatus" name="regBean.mstatus">Married<input type="radio" value="Divorse"id="msstatus" name="regBean.mstatus">Divorse</td> -->
   		 <td>
   		<select name="marital" size="1" id="msstatus" class="textboxes" onChange="hiding()">
			<option selected value="none">SELECT</option>
			<option value="MARRIED">MARRIED</option>
			<option value="SINGLE">SINGLE</option>
			<option value="DIVORCED">DIVORCED</option>
		</select>
    	</td>
    
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.fathername" class="label" class="perclass">Father Name</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" class="perclass" name="regBean.fathername" id="fathername" size="24" onchange="verifyn3()"></td>
    </tr>
	<tr >
        <td align="left" valign="top" width="41%">
        <label for="regBean.mothername" class="label" class="perclass">Mother Name</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" class="perclass" name="regBean.mothername" id="mothername" size="24" onchange="verifyn4()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.motherdob" class="label" class="perclass">Mother DOB</label><span style="color:red">*</span></td>
 
        <td width="57%"><!-- <input type="date" value="" class="perclass" name="regBean.motherdob" id="motherdob" size="24"> -->
        <input type="date"  name="regBean.dob" id="motherdob" value="<%=df.format(new java.util.Date())%>"size="60" onkeyup="checkDate2()" onchange="checkDate21()" min=""><div id="datewarn2">
        
       <!--  <input type="date" class="perclass" id="motherdob"  onchange="(window.event.type+' event handler for '+this.type+' noticed  \''+this.value+'\'');" onclick="(window.event.type+ ' event handler for '+this.type+ ' noticed  \''+this.value+'\'');" onkeydown="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" onkeypress="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" oninput="(window.event.type+' event handler for '+this.type+' noticed \''+this.value+'\'');" />
         -->
        </td>
    </tr>
   
    
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.spousename" class="label">Spouse Name</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.spousename" id="spousename" size="24" onchange="verifyn5()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.spousedob" class="label">Spouse DOB</label></td>
 
        <td width="57%"><!-- <input type="date" value="" id="spousedob" name="regBean.spousedob" size="24"> -->
         <input type="date"  name="regBean.dob" id="spousedob" value="<%=df.format(new java.util.Date())%>"size="60" onkeyup="checkDate3()" onchange="checkDate31()" min=""><div id="datewarn3">
        
       <!--   <input type="date" id="spousedob"   onchange="(window.event.type+' event handler for '+this.type+' noticed  \''+this.value+'\'');" onclick="(window.event.type+ ' event handler for '+this.type+ ' noticed  \''+this.value+'\'');" onkeydown="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" onkeypress="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" oninput="(window.event.type+' event handler for '+this.type+' noticed \''+this.value+'\'');" />
         -->
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">Child 1</td>
 
        <td width="57%"><label for="regBean.childname1" class="label">Name</label><br><input type="text"  name="regBean.childname1" id="ch1name" size="24" onchange="verifyn6()"/>
		<br/><label for="regBean.childob1" class="label">DOB</label><br>
		<!-- <input type="date"  name="regBean.childob1" id="ch1dob" size="24"/> -->
		 <input type="date"  name="regBean.dob" id="ch1dob" value="<%=df.format(new java.util.Date())%>"size="60" onkeyup="checkDate4()" onchange="checkDate41()" min=""><div id="datewarn4">
		<!-- <input type="date" id="ch1dob"   onchange="(window.event.type+' event handler for '+this.type+' noticed  \''+this.value+'\'');" onclick="(window.event.type+ ' event handler for '+this.type+ ' noticed  \''+this.value+'\'');" onkeydown="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" onkeypress="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" oninput="(window.event.type+' event handler for '+this.type+' noticed \''+this.value+'\'');" />
         -->
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Child 2</td>
 
        <td width="57%"><label for="regBean.childname2" class="label">Name</label><br><input type="text"  name="regBean.hiqualdeg1" id="ch2name" size="24" onchange="verifyn7()"/>
		<br/><label for="regBean.childob2" class="label">DOB</label><br>
		<!-- <input type="date"  name="regBean.hiqualpassout1" id="ch2dob" size="24"/> -->
		<input type="date"  name="regBean.dob" id="ch2dob" value="<%=df.format(new java.util.Date())%>"size="60" onkeyup="checkDate5()" onchange="checkDate51()" min=""><div id="datewarn5"></div>
		
	<!-- 	<input type="date" id="ch2dob"   onchange="(window.event.type+' event handler for '+this.type+' noticed  \''+this.value+'\'');" onclick="(window.event.type+ ' event handler for '+this.type+ ' noticed  \''+this.value+'\'');" onkeydown="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" onkeypress="window.event.preventDefault();
	(window.event.type+' event handler for '+this.type+' prevents keyboard input for value \''+this.value+'\'');" oninput="(window.event.type+' event handler for '+this.type+' noticed \''+this.value+'\'');" />
         -->
		</td>
    </tr>
    
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.currentaddr" class="label">Current Address</label></td>
 
        <td width="57%"><textarea type="text" value="" name="regBean.currentaddr" id="cadd" size="24"></textarea></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.permaddr" class="label">Permanent Address</label></td>
 
        <td width="57%"><textarea type="text" value="" name="regBean.permaddr" id="padd" size="24"></textarea></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.emergcontact" class="label">Emergency Contact Number</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.emergcontact" id="emrgcontnum" size="24" onchange="verifyPh3()"></td>
    </tr>
	<tr>
        <td colspan="2" align="center"><b>Employee Educational Information.</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg1" class="label">Degree Name</label><span style="color:red">*</span><br><input type="text"  name="regBean.hiqualdeg1" id="hiqualdeg1" size="24" onchange="verifyn8()"/>
		<br/><label for="regBean.hiqualpassout1" class="label">Passout</label><br><input type="text"  name="regBean.hiqualpassout1" id="hiqualpassout1" size="24" onblur="yearValidation1(this.value,event)" 
        onkeypress="yearValidation1(this.value,event)"/>
		<br/><label for="regBean.hiqualperc1" class="label">Percentage</label><br><input type="text"  name="regBean.hiqualperc1" id="hiqualperc1" size="24" maxlength="4" onkeypress="return percentValidate1(event)"  onchange="percentValidate1()"/>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">2nd Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg2" class="label">Degree Name</label><br><input type="text"  name="regBean.hiqualdeg2"id="hiqualdeg2"  size="24" onchange="verifyn9()"/>
		<br/><label for="regBean.hiqualpassout2" class="label">Passout</label><br><input type="text"  name="regBean.hiqualpassout2"id="hiqualpassout2" size="24" onblur="yearValidation2(this.value,event)" 
        onkeypress="yearValidation2(this.value,event)"/>
		<br/><label for="regBean.hiqualperc2" class="label">Percentage</label><br><input type="text"  name="regBean.hiqualperc2"id="hiqualperc2" size="24" maxlength="4" onkeypress="return percentValidate2(event)" onchange="percentValidate2()"/>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">3rd Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg3" class="label">Degree Name </label><br><input type="text"  name="regBean.hiqualdeg3" id="hiqualdeg3" size="24" onchange="verifyn10()"/>
		<br/><label for="regBean.hiqualpassout3" class="label">Passout</label><br><input type="text"  name="regBean.hiqualpassout3" id="hiqualpassout3" size="24" onblur="yearValidation3(this.value,event)" 
        onkeypress="yearValidation3(this.value,event)"/>
		<br/><label for="regBean.hiqualperc3" class="label">Percentage</label><br><input type="text"  name="regBean.hiqualperc3" id="hiqualperc3" size="24" maxlength="4" onkeypress="return percentValidate3(event)" onchange="percentValidate3()"/>
		</td>
    </tr>
    
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.certifications1" class="label">Certifications 1</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications1" id="cert1" size="24"></td>
        
    </tr>
    <tr>
    <td>
      <label for="regBean.certifications2" class="label">Certifications 2</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications2" id="cert1" size="24"></td>
 
 </tr>
 
 <tr>
 <td>
 <label for="regBean.certifications3" class="label">Certifications 3</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications3" id="cert1" size="24"></td>
 </tr>
  
	<tr>
        <td colspan="2" align="center"><b>Previous Employment Information.</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.experience" class="label">Total Experience (in year)</label><span style="color:red">*</span></td>
        <td width="57%"><input type="text" value="" name="regBean.experience" id="totalexp" size="24"  onkeypress="return istotalexp(event)" onChange="hiding2()"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">Previous Organization 1 Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname1" class="label">Organization Name </label><br><input type="text" value="" name="regBean.preorgname1" id="preorgname1"  size="24"><br>
		<label for="yearsworked1" class="label">Years Of Worked (in year)</label><br><input type="text" value="" name="yearsworked1" id="yearsworked1" onkeypress="return isyow1(event)" size="24"><br>
		<label for="regBean.refname1" class="label">Organization Reference Name</label><br><input type="text" value="" name="regBean.refname1" id="refname1"size="24" onchange="verifyn11()"/><br>
		<label for="regBean.refmailid1" class="label">Organization Reference Email Id</label><br><input type="text" value="" name="regBean.refmailid1" id="refmailid1"size="24"  onchange="echeckmail1(this.value)"/><br>
		<label for="regBean.refphnumber1" class="label">Organization Reference Phone Number</label><br><input type="text" value="" name="regBean.refnumber1"id="refnumber1" size="24" onchange="verifyPhref1()"/><br>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Previous Organization 2 Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname2" class="label">Organization Name </label><br><input type="text" value="" name="regBean.preorgname2" id="preorgname2"size="24"><br>
		<label for="yearsworked2" class="label">Years Of Worked (in year)</label><br><input type="text" value="" name="yearsworked2"id="yearsworked2" size="24" onkeypress="return isyow2(event)"/><br>
		<label for="regBean.refname2" class="label">Organization Reference Name</label><br><input type="text" value="" name="regBean.refname2" id="refname2"size="24" onchange="verifyn12()"/><br>
		<label for="regBean.refmailid2" class="label">Organization Reference Email Id</label><br><input type="text" value="" name="regBean.refmailid2" id="refmailid2" size="24" onchange="echeckmail2(this.value)"><br>
		<label for="regBean.refphnumber2" class="label">Organization Reference Phone Number</label><br><input type="text" value="" name="regBean.refnumber2" id="refnumber2" size="24" onchange="verifyPhref2()"><br>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Previous Organization 3  Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname3" class="label">Organization Name </label><br><input type="text" value="" name="regBean.preorgname3" id="preorgname3" size="24" /><br>
		<label for="yearsworked3" class="label">Years Of Worked (in year)</label><br><input type="text" value="" name="yearsworked3" id="yearsworked3" size="24" onkeypress="return isyow3(event)" /><br>
		<label for="regBean.refname3" class="label">Organization Reference Name</label><br><input type="text" value="" name="regBean.refname3" id="refname3" size="24" onchange="verifyn13()"/><br>
		<label for="regBean.refmailid3" class="label">Organization Reference Email Id</label><br><input type="text" value="" name="regBean.refmailid3" id="refmailid3" size="24" onchange="echeckmail3(this.value)"/><br>
		<label for="regBean.refphnumber3" class="label">Organization Reference Phone Number</label><br><input type="text" value="" name="regBean.refnumber3"id="refnumber3" size="24" onchange="verifyPhref3()"/><br>
		 <!-- <td id="btnAdd" class="button-add">Add</td> -->
    </tr>
   <!--  <tr><td align="left" valign="top" >&nbsp;</td>
    <td  id="btnAdd" class="button-add">Add</td>
    </tr>  -->
<!--  <tr>
        <td colspan="2">
        <p align="center">
        <td id="btnAdd" class="button-add">Add</td>
		<input type="reset" value="Clear All" name="clear"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="submit1" type="button" value="Submit"  onclick="validation();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
    </tr> -->
 
</table>
<br>
<!-- <HR> -->
<form name="form1"  >
<table id="tblPets1">
 <TR>
<!-- <td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td> -->
</TR> 
</table>

<center>
 <INPUT TYPE="Button" onClick="addRow('tblPets1')" VALUE="Add More Experience"></input>
<!--  <input type="button" id="addRow" value="Add more experience" /> -->
 <!-- <input id="submit1" type="button" value="Submit" onclick="validation();"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<BR><BR> -->
 
 <input id="submit1" type="button" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<BR><BR>
 </center>
 </form>
</div>

<br/>

 <!--  <div id="qryload"> 
 </div>  -->
 
 </div>
 
 
</body>
</html>