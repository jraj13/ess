/**
 * 
 */

/* PHONE NUMBER1 VALIDATION*/


function onlyNumbers(event) {
	 var mobile=document.getElementById("phnumone").value;
     var e = event || evt; // for trans-browser compatibility
     var charCode = e.which || e.keyCode;
     
     if (charCode > 31 && (charCode < 48||charCode > 57))
    	 {
         return false;
    	 }
     return true;
 } 

function verifyPh1()
 {
	 var mobile=document.getElementById("phnumone").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("phnumone").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('phnumone').focus();
				    }, 0);
		 document.getElementById('phnumone').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('phnumone').focus();
				    }, 0);
		 document.getElementById('phnumone').value="";
				    return false;
	     }  
	}  

/* PHONE NUMBER2 VALIDATION*/

function onlyNumbers(event) {
	 var mobile=document.getElementById("phnumtwo").value;
     var e = event || evt; // for trans-browser compatibility
     var charCode = e.which || e.keyCode;
     
     if (charCode > 31 && (charCode < 48||charCode > 57))
    	 {
         return false;
    	 }
     return true;
 } 

function verifyPh2()
 {
	 var mobile=document.getElementById("phnumtwo").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("phnumtwo").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('phnumtwo').focus();
				    }, 0);
		 document.getElementById('phnumtwo').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('phnumtwo').focus();
				    }, 0);
		 document.getElementById('phnumtwo').value="";
				    return false;
	     }  
	}  

/* EMERGENCY CONTACT NUMBER VALIDATION */

function onlyNumbers(event) {
	 var mobile=document.getElementById("emrgcontnum").value;
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    
    if (charCode > 31 && (charCode < 48||charCode > 57))
   	 {
        return false;
   	 }
    return true;
} 

function verifyPh3()
{
	 var mobile=document.getElementById("emrgcontnum").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("emrgcontnum").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('emrgcontnum').focus();
				    }, 0);
		 document.getElementById('emrgcontnum').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('emrgcontnum').focus();
				    }, 0);
		 document.getElementById('emrgcontnum').value="";
				    return false;
	     }  
	}  


/* PHONE NUMBER1(DYNAMIC ADDED ROW) VALIDATION*/


function onlyNumbers(event) {
	 var mobile=document.getElementById("refnumber").value;
     var e = event || evt; // for trans-browser compatibility
     var charCode = e.which || e.keyCode;
     
     if (charCode > 31 && (charCode < 48||charCode > 57))
    	 {
         return false;
    	 }
     return true;
 } 

function verifyPhext()
 {
	 var mobile=document.getElementById("refnumber").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("refnumber").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('refnumber').focus();
				    }, 0);
		 document.getElementById('refnumber').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('refnumber').focus();
				    }, 0);
		 document.getElementById('refnumber').value="";
				    return false;
	     }  
	}  



/* MAIL ID VALIDATION  */

/*if ((emailid==null)||(emailid=="")){
	alert("Please Enter your Email ID");
	emailid.focus();
	return false;
}
if (echeck('emailid')==false)){
	emailid="";
	emailid.focus();
	return false;
}
	return true; */

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
/* UID VALIDATION  */
function uidValidation()
{
//var a = document.form.regBeanphnumone.value;
	 var uid=document.getElementById("uid").value;
if(uid=="")
{
alert("please Enter the Currect UID No");
uid.focus();
document.getElementById("uid").value="";
return false;
}
if(isNaN(uid))
{
alert("Enter 12 digit UID Number");

window.setTimeout(function ()
	    {
document.getElementById('uid').focus();
	    }, 0);
document.getElementById('uid').value="";
	    return false;


}
if((uid.length < 1) || (uid.length > 12))
{
alert(" Your UID must be 12 digit ");

window.setTimeout(function ()
	    {
document.getElementById('uid').focus();
	    }, 0);
document.getElementById('uid').value="";
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


/* employee id Validation  */

function isempid(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


  /*  if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) */
    		  if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 48 || charCode > 57) && (charCode < 97 || charCode > 122)) {
    			  return false; 
    		  }
    		 
        else { 
    var input = document.getElementById("employeeid").value;
        var len = document.getElementById("employeeid").value.length; 
   var index = document.getElementById("employeeid").value.indexOf('.'); 
   
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


/* ACCOUNT NO VALIDATION  */
function acntValidation()
{
//var a = document.form.regBeanphnumone.value;
	 var acntno=document.getElementById("acntno").value;
if(acntno=="")
{
alert("please Enter the Account No");

window.setTimeout(function ()
	    {
document.getElementById('acntno').focus();
	    }, 0);
document.getElementById('acntno').value="";
	    return false;


}
if(isNaN(acntno))
{
alert("Enter Numeric value");

window.setTimeout(function ()
		
	    {
document.getElementById('acntno').focus();
	    }, 0);
document.getElementById('acntno').value="";
	    return false;


}
if((acntno.length < 1) || (acntno.length > 15))
{
alert(" Your A/C No is Wrong entered ! ");

window.setTimeout(function ()
	    {
document.getElementById('acntno').focus();
	    }, 0);
document.getElementById('acntno').value="";
	    return false;
	    

}
}


/* PASSPORT VALIDATION  */

	function PPverify()
{
	//alert("alert");
	 var name=document.getElementById("passportnum").value;

	 /*var exp = /^[ A-Za-z.]*$/; */
	   var exp = /^[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Passport Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('passportnum').focus();
				    }, 0);
		 document.getElementById('passportnum').value="";
				    return false;
	     }  
	}  






/* NAME VALIDATION  */

function verifyn1()
{
	//alert("alert");
	 var name=document.getElementById("lname").value;

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
			document.getElementById('lname').focus();
				    }, 0);
		 document.getElementById('lname').value="";
				    return false;
	     }  
	}  


/*function verifyn2()
{
	//alert("alert2");
	 var name=document.getElementById("designation").value;

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
			document.getElementById('designation').focus();
				    }, 0);
		 document.getElementById('designation').value="";
				    return false;
	     }  
	}  */
 
function verifyn3()
{
	//alert("alert2");
	 var name=document.getElementById("fathername").value;

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
			document.getElementById('fathername').focus();
				    }, 0);
		 document.getElementById('fathername').value="";
				    return false;
	     }  
	}  
	
function verifyn4()
{
	 var name=document.getElementById("mothername").value;

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
			document.getElementById('mothername').focus();
				    }, 0);
		 document.getElementById('mothername').value="";
				    return false;
	     }  
	}  
	
  
function verifyn5()
{
	 var name=document.getElementById("spousename").value;

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
			document.getElementById('spousename').focus();
				    }, 0);
		 document.getElementById('spousename').value="";
				    return false;
	     }  
	}  
	
function verifyn6()
{
	 var name=document.getElementById("ch1name").value;

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
			document.getElementById('ch1name').focus();
				    }, 0);
		 document.getElementById('ch1name').value="";
				    return false;
	     }  
	}  
	
function verifyn7()
{
	 var name=document.getElementById("ch2name").value;

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
			document.getElementById('ch2name').focus();
				    }, 0);
		 document.getElementById('ch2name').value="";
				    return false;
	     }  
	}  
	
  
function verifyn8()
{
	 var name=document.getElementById("hiqualdeg1").value;

	 var exp = /^[ A-Za-z.()]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualdeg1').focus();
				    }, 0);
		 document.getElementById('hiqualdeg1').value="";
				    return false;
	     }  
	}  
	
function verifyn9()
{
	 var name=document.getElementById("hiqualdeg2").value;

	 var exp = /^[ A-Za-z.()[0-9]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualdeg2').focus();
				    }, 0);
		 document.getElementById('hiqualdeg2').value="";
				    return false;
	     }  
	}  
	
function verifyn10()
{
	 var name=document.getElementById("hiqualdeg3").value;

	 var exp = /^[ A-Za-z.()[0-9]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualdeg3').focus();
				    }, 0);
		 document.getElementById('hiqualdeg3').value="";
				    return false;
	     }  
	}  
	




/* YEAR  VALIDATION  */




function yearValidation1(year,ev) {

	  var text = /^[0-9]+$/;
	  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
	    if (year != 0) {
	        if ((year != "") && (!text.test(year))) {
	        	
	            alert("Please Enter Numeric Values Only");
	            document.getElementById('hiqualpassout1').value="";
	            document.getElementById("hiqualpassout1").focus();
				 
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout1').focus();
						    }, 0);
				
				 document.getElementById('hiqualpassout1').value="";
	            return false;
	            
	        }

	        if (year.length != 4) {
	            alert("Year is not proper. Please check");
	            document.getElementById('hiqualpassout1').value="";
	            document.getElementById("hiqualpassout1").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout1').focus();
						    }, 0);
				 
						    return false;
	        }
	        var current_year=new Date().getFullYear();
	        if((year < 1920) || (year > current_year))
	            {
	            alert("Year should be in range 1920 to current year");
	            document.getElementById('hiqualpassout1').value="";
	            document.getElementById("hiqualpassout1").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout1').focus();
						    }, 0);
				 
	            
	            return false;
	            }
	        return true;
	    } }
	}




function yearValidation2(year,ev) {

	  var text = /^[0-9]+$/;
	  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
	    if (year != 0) {
	        if ((year != "") && (!text.test(year))) {
	        	
	            alert("Please Enter Numeric Values Only");
	            document.getElementById('hiqualpassout2').value="";
	            document.getElementById("hiqualpassout2").focus();
				 
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout2').focus();
						    }, 0);
				
				 document.getElementById('hiqualpassout2').value="";
	            return false;
	            
	        }

	        if (year.length != 4) {
	            alert("Year is not proper. Please check");
	            document.getElementById('hiqualpassout2').value="";
	            document.getElementById("hiqualpassout2").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout2').focus();
						    }, 0);
				 
						    return false;
	        }
	        var current_year=new Date().getFullYear();
	        if((year < 1920) || (year > current_year))
	            {
	            alert("Year should be in range 1920 to current year");
	            document.getElementById('hiqualpassout2').value="";
	            document.getElementById("hiqualpassout2").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout2').focus();
						    }, 0);
				 
	            
	            return false;
	            }
	        return true;
	    } }
	}


function yearValidation3(year,ev) {

	  var text = /^[0-9]+$/;
	  if(ev.type=="blur" || year.length==8 && ev.keyCode!=8 && ev.keyCode!=46) {
	    if (year != 0) {
	        if ((year != "") && (!text.test(year))) {
	        	
	            alert("Please Enter Numeric Values Only");
	            document.getElementById('hiqualpassout3').value="";
	            document.getElementById("hiqualpassout3").focus();
				 
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout3').focus();
						    }, 0);
				
				 document.getElementById('hiqualpassout3').value="";
	            return false;
	            
	        }

	        if (year.length != 4) {
	            alert("Year is not proper. Please check");
	            document.getElementById('hiqualpassout3').value="";
	            document.getElementById("hiqualpassout3").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout3').focus();
						    }, 0);
				 
						    return false;
	        }
	        var current_year=new Date().getFullYear();
	        if((year < 1920) || (year > current_year))
	            {
	            alert("Year should be in range 1920 to current year");
	            document.getElementById('hiqualpassout3').value="";
	            document.getElementById("hiqualpassout3").focus();
				 window.setTimeout(function ()
						    {
					document.getElementById('hiqualpassout3').focus();
						    }, 0);
				 
	            
	            return false;
	            }
	        return true;
	    } }
	}





/* DATE OF BIRTH VALIDATION */

function isFutureDate(idate){
    var today = new Date().getTime(),
        idate = idate.split("/");
    
    idate = new Date(idate[2], idate[1] - 1, idate[0]).getTime();
    return (today - idate) < 0 ? true : false;
}


// your function
function checkDate1(){
	//alert("date validation");
    var idate = document.getElementById("datepicker"),
        resultDiv = document.getElementById("datewarn"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } else {
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


function checkDate11(){
var name=document.getElementById("datepicker").value;
   // alert(name);//yyyy-mm-dd
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
  if(name>datestring)
	   {
	   alert("Entered date is a future date");
	   window.setTimeout(function ()
			    {
		document.getElementById('datepicker').focus();
			    }, 0);
	 document.getElementById('datepicker').value="";
	 document.getElementById('datewarn').innerHTML=""; 
			    return false;
	   }
}

/* motherdob */

function checkDate2(){
	//alert("date validation");
    var idate = document.getElementById("motherdob"),
        resultDiv = document.getElementById("datewarn2"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } else {
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


function checkDate21(){
var name=document.getElementById("motherdob").value;
   // alert(name);//yyyy-mm-dd
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
	   alert("Entered date is a future date");
	   window.setTimeout(function ()
			    {
		document.getElementById('motherdob').focus();
			    }, 0);
	 document.getElementById('motherdob').value="";
	 document.getElementById('datewarn2').innerHTML=""; 
			    return false;
	   }
}


/* FOR SPOUSE DOB */


function checkDate3(){
    var idate = document.getElementById("spousedob"),
        resultDiv = document.getElementById("datewarn3"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } else {
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


function checkDate31(){
var name=document.getElementById("spousedob").value;
   // alert(name);//yyyy-mm-dd
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
	   alert("Entered date is a future date");
	   window.setTimeout(function ()
			    {
		document.getElementById('spousedob').focus();
			    }, 0);
	 document.getElementById('spousedob').value="";
	 document.getElementById('datewarn3').innerHTML=""; 
			    return false;
	   }
}

/* FOR CHILD1 DOB */

function checkDate4(){
    var idate = document.getElementById("ch1dob"),
        resultDiv = document.getElementById("datewarn4"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } else {
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


function checkDate41(){
var name=document.getElementById("ch1dob").value;
   // alert(name);//yyyy-mm-dd
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
	   alert("Entered date is a future date");
	   window.setTimeout(function ()
			    {
		document.getElementById('ch1dob').focus();
			    }, 0);
	 document.getElementById('ch1dob').value="";
	 document.getElementById('datewarn4').innerHTML=""; 
			    return false;
	   }
}



/* FOR CHILD2 DOB */
function checkDate5(){
    var idate = document.getElementById("ch2dob"),
        resultDiv = document.getElementById("datewarn5"),
      //  dateReg = /(0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])[\/]201[4-9]|20[2-9][0-9]/;
        dateReg = /201[4-9]|20[2-9][0-9][\/] (0[1-9]|[12][0-9]|3[01])[\/](0[1-9]|1[012])/;
    
    if(dateReg.test(idate.value)){
        if(isFutureDate(idate.value)){
        	//alert("Entered date is a future date");
           resultDiv.innerHTML = "Entered date is a future date";
            resultDiv.style.color = "red";
        } else {
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


function checkDate51(){
var name=document.getElementById("ch2dob").value;
   // alert(name);//yyyy-mm-dd
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
   
  if(name>datestring)
	   {
	   alert("Entered date is a future date");
	   window.setTimeout(function ()
			    {
		document.getElementById('ch2dob').focus();
			    }, 0);
	 document.getElementById('ch2dob').value="";
	 document.getElementById('datewarn5').innerHTML=""; 
			    return false;
	   }
}



/* FOR HIDING FUTURE DATE FROM CALENDAR */
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    var maxDate = year + '-' + month + '-' + day;
   // alert(maxDate);
    $('#datepicker').attr('max', maxDate);
    $('#motherdob').attr('max', maxDate);
    $('#spousedob').attr('max', maxDate);
    $('#ch1dob').attr('max', maxDate);
    $('#ch2dob').attr('max', maxDate);
    
});


/* PERCENT VALIDATION */

function percentValidate1(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("hiqualperc1").value;
        var len = document.getElementById("hiqualperc1").value.length; 
        var index = document.getElementById("hiqualperc1").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('hiqualperc1').focus();
		    }, 0);
	document.getElementById('hiqualperc1').value="";
	
	 return false; 
}
        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 3) { 
                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >3) {
   return false;
   }

    } 
    return true; 
 } 		



function percentValidate2(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("hiqualperc2").value;
        var len = document.getElementById("hiqualperc2").value.length; 
        var index = document.getElementById("hiqualperc2").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('hiqualperc2').focus();
		    }, 0);
	document.getElementById('hiqualperc2').value="";
	
	 return false; 
}
        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 3) { 
                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >3) {
   return false;
   }

    } 
    return true; 
 } 		

function percentValidate3(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("hiqualperc3").value;
        var len = document.getElementById("hiqualperc3").value.length; 
        var index = document.getElementById("hiqualperc3").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('hiqualperc3').focus();
		    }, 0);
	document.getElementById('hiqualperc3').value="";
	
	 return false; 
}
        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 3) { 
                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >3) {
   return false;
   }

    } 
    return true; 
 } 		

function percentValidate4(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("empQual1Perc").value;
        var len = document.getElementById("empQual1Perc").value.length; 
        var index = document.getElementById("empQual1Perc").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual1Perc').focus();
		    }, 0);
	document.getElementById('empQual1Perc').value="";
	
	 return false; 
}
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

function percentValidate5(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("empQual2Perc").value;
        var len = document.getElementById("empQual2Perc").value.length; 
        var index = document.getElementById("empQual2Perc").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual2Perc').focus();
		    }, 0);
	document.getElementById('empQual2Perc').value="";
	
	 return false; 
}
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

function percentValidate6(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("empQual3Perc").value;
        var len = document.getElementById("empQual3Perc").value.length; 
        var index = document.getElementById("empQual3Perc").value.indexOf('.'); 
if(input>100){
	alert("wrong entered");
	window.setTimeout(function ()
		    {
	document.getElementById('empQual3Perc').focus();
		    }, 0);
	document.getElementById('empQual3Perc').value="";
	
	 return false; 
}
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


/*function percentValidate1()
{
	 var perc3=document.getElementById("hiqualperc1").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("hiqualperc1").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc1').focus();
			    }, 0);
	 document.getElementById('hiqualperc1').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	   else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualperc1').focus();
				    }, 0);
		 document.getElementById('hiqualperc1').value="";
				    return false;
	     }  
	}  

function percentValidate2()
{
	 var perc3=document.getElementById("hiqualperc2").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("hiqualperc2").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc2').focus();
			    }, 0);
	 document.getElementById('hiqualperc2').value="";
			    return false;
	 }   
	
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	   else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualperc2').focus();
				    }, 0);
		 document.getElementById('hiqualperc2').value="";
				    return false;
	     }  
	}  

function percentValidate3()
{
	 var perc3=document.getElementById("hiqualperc3").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("hiqualperc3").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('hiqualperc3').focus();
			    }, 0);
	 document.getElementById('hiqualperc3').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	  else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('hiqualperc3').focus();
				    }, 0);
		 document.getElementById('hiqualperc3').value="";
				    return false;
	     }  
	}  


function percentValidate4()
{
	 var perc3=document.getElementById("empQual1Perc").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("empQual1Perc").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('empQual1Perc').focus();
			    }, 0);
	 document.getElementById('empQual1Perc').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	  else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('empQual1Perc').focus();
				    }, 0);
		 document.getElementById('empQual1Perc').value="";
				    return false;
	     }  
	}  

function percentValidate5()
{
	 var perc3=document.getElementById("empQual2Perc").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("empQual2Perc").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('empQual2Perc').focus();
			    }, 0);
	 document.getElementById('empQual2Perc').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	  else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('empQual2Perc').focus();
				    }, 0);
		 document.getElementById('empQual2Perc').value="";
				    return false;
	     }  
	}  

function percentValidate6()
{
	 var perc3=document.getElementById("empQual3Perc").value;
	 var phoneno = /^[0-9]+$/;
	 if(perc3>100)
	 {
	 document.getElementById("empQual3Perc").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('empQual3Perc').focus();
			    }, 0);
	 document.getElementById('empQual3Perc').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	  else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('empQual3Perc').focus();
				    }, 0);
		 document.getElementById('empQual3Perc').value="";
				    return false;
	     }  
	}  
*/
/* Employee Educational Information validation */

/*function totalexpval()
{
	 var perc3=document.getElementById("totalexp").value;
	 var phoneno = /^[0-9].+$/;
        if(perc3>50)
	 {
	 document.getElementById("totalexp").focus();
	 alert("Wrong entered");
	 window.setTimeout(function ()
			    {
		document.getElementById('totalexp').focus();
			    }, 0);
	 document.getElementById('totalexp').value="";
			    return false;
	 }   
	 else if(perc3.match(phoneno))  
	     {  
	       return true;         
	     }  
	 else if(isNaN(perc3))
	 {
		 alert("Enter Numeric value");

		 window.setTimeout(function ()
		 	    {
		 document.getElementById('totalexp').focus();
		 	    }, 0);
		 document.getElementById('totalexp').value="";
		 	    return false;
		 }
	  else 
	     {  
	     alert("Enter Numeric value");
	     window.setTimeout(function ()
				    {
			document.getElementById('totalexp').focus();
				    }, 0);
		 document.getElementById('totalexp').value="";
				    return false;
	     }  
	}  

*/



function istotalexp(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("totalexp").value;
        var len = document.getElementById("totalexp").value.length; 
        var index = document.getElementById("totalexp").value.indexOf('.'); 
        if(input>60){
        	alert("wrong entered");
        	window.setTimeout(function ()
        		    {
        	document.getElementById('totalexp').focus();
        		    }, 0);
        	document.getElementById('totalexp').value="";
        	 return false; 
        }
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


function isyow1(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("yearsworked1").value;
        var len = document.getElementById("yearsworked1").value.length; 
        var index = document.getElementById("yearsworked1").value.indexOf('.'); 

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

function isyow2(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("yearsworked2").value;
        var len = document.getElementById("yearsworked2").value.length; 
        var index = document.getElementById("yearsworked2").value.indexOf('.'); 

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

function isyow3(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("yearsworked3").value;
        var len = document.getElementById("yearsworked3").value.length; 
        var index = document.getElementById("yearsworked3").value.indexOf('.'); 

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




function isyowext(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode
    		
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("yearsworked").value;
        var len = document.getElementById("yearsworked").value.length; 
        var index = document.getElementById("yearsworked").value.indexOf('.'); 

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

/* PREV ORG MAIL ID VALIDATION */

function echeckmail1(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   refmailid1.focus();
	 //  emailid="";
	   document.getElementById('refmailid1').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   refmailid1.focus();
	 //  emailid="";
	   document.getElementById('refmailid1').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    refmailid1.focus();
	  //  emailid="";
	    document.getElementById('refmailid1').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    refmailid1.focus();
	   // emailid="";
	    document.getElementById('refmailid1').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    refmailid1.focus();
	  //  emailid="";
	    document.getElementById('refmailid1').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    refmailid1.focus();
	   // emailid="";
	    document.getElementById('refmailid1').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    refmailid1.focus();
	  //  emailid="";
	    document.getElementById('refmailid1').value="";
	    return false;
		 }
  }



function echeckmail2(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   refmailid2.focus();
	 //  emailid="";
	   document.getElementById('refmailid2').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   refmailid2.focus();
	 //  emailid="";
	   document.getElementById('refmailid2').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    refmailid2.focus();
	  //  emailid="";
	    document.getElementById('refmailid2').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    refmailid2.focus();
	   // emailid="";
	    document.getElementById('refmailid2').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    refmailid2.focus();
	  //  emailid="";
	    document.getElementById('refmailid2').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    refmailid2.focus();
	   // emailid="";
	    document.getElementById('refmailid2').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    refmailid2.focus();
	  //  emailid="";
	    document.getElementById('refmailid2').value="";
	    return false;
		 }
  }


function echeckmail3(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   refmailid3.focus();
	 //  emailid="";
	   document.getElementById('refmailid3').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   refmailid3.focus();
	 //  emailid="";
	   document.getElementById('refmailid3').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    refmailid3.focus();
	  //  emailid="";
	    document.getElementById('refmailid3').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    refmailid3.focus();
	   // emailid="";
	    document.getElementById('refmailid3').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    refmailid3.focus();
	  //  emailid="";
	    document.getElementById('refmailid3').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    refmailid3.focus();
	   // emailid="";
	    document.getElementById('refmailid3').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    refmailid3.focus();
	  //  emailid="";
	    document.getElementById('refmailid3').value="";
	    return false;
		 }
  }


function echeckmail321(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID1");
	   refmailid.focus();
	 //  emailid="";
	   document.getElementById('refmailid').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID2");
	   refmailid.focus();
	 //  emailid="";
	   document.getElementById('refmailid').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID3");
	    refmailid.focus();
	  //  emailid="";
	    document.getElementById('refmailid').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID4");
	    refmailid.focus();
	   // emailid="";
	    document.getElementById('refmailid').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID5");
	    refmailid.focus();
	  //  emailid="";
	    document.getElementById('refmailid').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID6");
	    refmailid.focus();
	   // emailid="";
	    document.getElementById('refmailid').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID7");
	    refmailid.focus();
	  //  emailid="";
	    document.getElementById('refmailid').value="";
	    return false;
		 }
  }


/* REFERENCE MOB NUMBER */



function onlyNumbers(event) {
	 var mobile=document.getElementById("refnumber1").value;
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    
    if (charCode > 31 && (charCode < 48||charCode > 57))
   	 {
        return false;
   	 }
    return true;
} 

function verifyPhref1()
{
	 var mobile=document.getElementById("refnumber1").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("refnumber1").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('refnumber1').focus();
				    }, 0);
		 document.getElementById('refnumber1').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('refnumber1').focus();
				    }, 0);
		 document.getElementById('refnumber1').value="";
				    return false;
	     }  
	}  


function onlyNumbers(event) {
	 var mobile=document.getElementById("refnumber2").value;
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    
    if (charCode > 31 && (charCode < 48||charCode > 57))
   	 {
        return false;
   	 }
    return true;
} 

function verifyPhref2()
{
	 var mobile=document.getElementById("refnumber2").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("refnumber2").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('refnumber2').focus();
				    }, 0);
		 document.getElementById('refnumber2').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('refnumber2').focus();
				    }, 0);
		 document.getElementById('refnumber2').value="";
				    return false;
	     }  
	}  



function onlyNumbers(event) {
	 var mobile=document.getElementById("refnumber3").value;
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;
    
    if (charCode > 31 && (charCode < 48||charCode > 57))
   	 {
        return false;
   	 }
    return true;
} 

function verifyPhref3()
{
	 var mobile=document.getElementById("refnumber3").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("refnumber3").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('refnumber3').focus();
				    }, 0);
		 document.getElementById('refnumber3').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('refnumber3').focus();
				    }, 0);
		 document.getElementById('refnumber3').value="";
				    return false;
	     }  
	}  


/* Ref name validation */

function verifyn11()
{
	 var name=document.getElementById("refname1").value;

	 var exp = /^[ A-Za-z]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('refname1').focus();
				    }, 0);
		 document.getElementById('refname1').value="";
				    return false;
	     }  
	}  

function verifyn12()
{
	 var name=document.getElementById("refname2").value;

	 var exp = /^[ A-Za-z]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('refname2').focus();
				    }, 0);
		 document.getElementById('refname2').value="";
				    return false;
	     }  
	} 

function verifyn13()
{
	 var name=document.getElementById("refname3").value;

	 var exp = /^[ A-Za-z]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Not a valid Name");
	     window.setTimeout(function ()
				    {
			document.getElementById('refname3').focus();
				    }, 0);
		 document.getElementById('refname3').value="";
				    return false;
	     }  
	} 



/* validation for due clearance amoutn  */

function isdcamt(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("dcamnt").value;
        var len = document.getElementById("dcamnt").value.length; 
        var index = document.getElementById("dcamnt").value.indexOf('.'); 

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


/* PREV ORG MAIL ID VALIDATION UNDER PERSONAL INFO */

function echeckmail4(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   org1RefMail.focus();
	   document.getElementById('org1RefMail').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   org1RefMail.focus();
	   document.getElementById('org1RefMail').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    org1RefMail.focus();
	    document.getElementById('org1RefMail').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    org1RefMail.focus();
	    document.getElementById('org1RefMail').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    org1RefMail.focus();
	    document.getElementById('org1RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    org1RefMail.focus();
	    document.getElementById('org1RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    org1RefMail.focus();
	    document.getElementById('org1RefMail').value="";
	    return false;
		 }
  }



function echeckmail5(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   org2RefMail.focus();
	   document.getElementById('org2RefMail').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   org2RefMail.focus();
	   document.getElementById('org2RefMail').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    org2RefMail.focus();
	    document.getElementById('org2RefMail').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    org2RefMail.focus();
	    document.getElementById('org2RefMail').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    org2RefMail.focus();
	    document.getElementById('org2RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    org2RefMail.focus();
	    document.getElementById('org2RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    org2RefMail.focus();
	    document.getElementById('org2RefMail').value="";
	    return false;
		 }
  }


function echeckmail6(str) {
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	   alert("Invalid E-mail ID");
	   org3RefMail.focus();
	   document.getElementById('org3RefMail').value="";
	   return false;
		}
	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	   alert("Invalid E-mail ID");
	   org3RefMail.focus();
	   document.getElementById('org3RefMail').value="";
	   return false;
		}
	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	    alert("Invalid E-mail ID");
	    org3RefMail.focus();
	    document.getElementById('org3RefMail').value="";
	    return false;
		}
	 if (str.indexOf(at,(lat+1))!=-1){
	    alert("Invalid E-mail ID");
	    org3RefMail.focus();
	    document.getElementById('org3RefMail').value="";
	    return false;
		 }
	 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	    alert("Invalid E-mail ID");
	    org3RefMail.focus();
	    document.getElementById('org3RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(dot,(lat+2))==-1){
	    alert("Invalid E-mail ID");
	    org3RefMail.focus();
	    document.getElementById('org3RefMail').value="";
	    return false;
		 }
	 if (str.indexOf(" ")!=-1){
	    alert("Invalid E-mail ID");
	    org3RefMail.focus();
	    document.getElementById('org3RefMail').value="";
	    return false;
		 }
  }




































/* NOT WORKING VALIDATION  */


function Validation(employeeid)
{
	alert("come in validation page");
	var employeeid = document.employeeid.value;
	if(employeeid=="")
	{
	alert("please Enter the Employee Id");
	document.employeeid.focus();
	return false;
	}
	
	var fname = document.form.fname.value;
	if(fname=="")
	{
	alert("please Enter the First Name");
	document.form.fname.focus();
	return false;
	}
	
	var lname = document.form.lname.value;
	if(lname=="")
	{
	alert("please Enter the Last Name");
	document.form.lname.focus();
	return false;
	}
	
	var dob = document.form.dob.value;
	if(dob=="")
	{
	alert("please Enter the Date of Birth");
	document.form.dob.focus();
	return false;
	}
	
	var pannum = document.form.pannum.value;
	if(pannum=="")
	{
	alert("please Enter the PAN Number");
	document.form.pannum.focus();
	return false;
	}

	var uid = document.form.uid.value;
	if(uid=="")
	{
	alert("please Enter the User Id");
	document.form.uid.focus();
	return false;
	}
	
	var phnumone = document.form.phnumone.value;
	if(phnumone=="")
	{
	alert("please Enter the Contact Number");
	document.form.phnumone.focus();
	return false;
	}

	var emailid=document.form.emailid;
	if ((emailid.value==null)||(emailid.value=="")){
		alert("Please Enter your Email ID");
		emailid.focus();
		return false;
	}
	if (echeck(emailid.value)==false){
		emailid.value="";
		emailid.focus();
		return false;
	}
	return true;

	function echeck(str) {

			var at="@";
			var dot=".";
			var lat=str.indexOf(at);
			var lstr=str.length;
			var ldot=str.indexOf(dot);
			if (str.indexOf(at)==-1){
			   alert("Invalid E-mail ID");
				emailid.focus();
			   return false;
			}

			if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
			   alert("Invalid E-mail ID");
				emailid.focus();
			   return false;
			}

			if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
			    alert("Invalid E-mail ID");
				emailid.focus();
			    return false;
			}

			 if (str.indexOf(at,(lat+1))!=-1){
			    alert("Invalid E-mail ID");
			    return false;
			 }

			 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
			    alert("Invalid E-mail ID");
				emailid.focus();
			    return false;
			 }

			 if (str.indexOf(dot,(lat+2))==-1){
			    alert("Invalid E-mail ID");
				emailid.focus();
			    return false;
			 }
			
			 if (str.indexOf(" ")!=-1){
			    alert("Invalid E-mail ID");
				emailid.focus();
			    return false;
			 }

	 		 return true;					
		}
	
	
}