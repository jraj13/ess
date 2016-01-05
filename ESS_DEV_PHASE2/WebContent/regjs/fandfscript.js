

function calculate_pl_before_first()
{
	
	var available_pl_hr_col1=parseFloat(document.getElementById("available_pl_hr_col1").value);
	var advance_pl_col1=parseFloat(document.getElementById("advance_pl_col1").value);
	
	if(isNaN(available_pl_hr_col1))
	{
		document.getElementById("available_pl_hr_col1").value=0.0;
		available_pl_hr_col1=0.0;
	}
	
	
	if(isNaN(advance_pl_col1)){
		document.getElementById("advance_pl_col1").value=0.0;
		advance_pl_col1=0.0;
	}
	
	document.getElementById("net_pl_col1").value=available_pl_hr_col1+advance_pl_col1; 
	
}






function calculate_sl_before()
{
	
	var available_sl_hr_col1=parseFloat(document.getElementById("available_sl_hr_col1").value);
	
	var advance_sl_hr_col1=parseFloat(document.getElementById("advance_sl_hr_col1").value);
	
	
	if(isNaN(available_sl_hr_col1))
	{
		document.getElementById("available_sl_hr_col1").value=0.0;
		available_sl_hr_col1=0.0;
	}
	
	
	if(isNaN(advance_sl_hr_col1)){
		document.getElementById("advance_sl_hr_col1").value=0.0;
		advance_sl_hr_col1=0.0;
	}
	
	
	
	
	document.getElementById("net_sl1").value=available_sl_hr_col1+advance_sl_hr_col1;
	
}




function calculate_pl_after()
{
	var available_pl_hr_col2=parseFloat(document.getElementById("available_pl_hr_col2").value);
	var advance_pl_col2=parseFloat(document.getElementById("advance_pl_col2").value);
	
	if(isNaN(available_pl_hr_col2))
	{
		document.getElementById("available_pl_hr_col2").value=0.0;
		available_pl_hr_col2=0.0;
	}
	
	
	if(isNaN(advance_pl_col2)){
		document.getElementById("advance_pl_col2").value=0.0;
		advance_pl_col2=0.0;
	}
	
	document.getElementById("net_pl_col2").value=available_pl_hr_col2+advance_pl_col2;
	
}





function calculate_sl_after()
{
	var available_sl_hr_col2=parseFloat(document.getElementById("available_sl_hr_col2").value);
	var advance_sl_hr_col2=parseFloat(document.getElementById("advance_sl_hr_col2").value);
	
	
	if(isNaN(available_sl_hr_col2))
	{
		document.getElementById("available_sl_hr_col2").value=0.0;
		available_sl_hr_col2=0.0;
	}
	
	
	if(isNaN(advance_sl_hr_col2)){
		document.getElementById("advance_sl_hr_col2").value=0.0;
		advance_sl_hr_col2=0.0;
	}
	
	
	document.getElementById("net_sl2").value=available_sl_hr_col2+advance_sl_hr_col2;
	
}


 /*available personal leave script */

function ava_pl_before(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("available_pl_hr_col1").value;
        var len = document.getElementById("available_pl_hr_col1").value.length; 
        var index = document.getElementById("available_pl_hr_col1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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



/*available advance personal leave script  before*/

function advance_pl_before(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("advance_pl_col1").value;
        var len = document.getElementById("advance_pl_col1").value.length; 
        var index = document.getElementById("advance_pl_col1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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



/*available sick leave before leave script */

function avai_sl_before(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("available_sl_hr_col1").value;
        var len = document.getElementById("available_sl_hr_col1").value.length; 
        var index = document.getElementById("available_sl_hr_col1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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

/*script for Available advance sick leave  */ 

function advance_sl_before(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("advance_sl_hr_col1").value;
        var len = document.getElementById("advance_sl_hr_col1").value.length; 
        var index = document.getElementById("advance_sl_hr_col1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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






/*script for after available personal leave */ 

function ava_pl_after(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("available_pl_hr_col2").value;
        var len = document.getElementById("available_pl_hr_col2").value.length; 
        var index = document.getElementById("available_pl_hr_col2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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



/*script for after available advanced personal leave */ 

function adv_pl_after_script(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("advance_pl_col2").value;
        var len = document.getElementById("advance_pl_col2").value.length; 
        var index = document.getElementById("advance_pl_col2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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


/*script for available sl after script */

function available_sl_after_script(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("available_sl_hr_col2").value;
        var len = document.getElementById("available_sl_hr_col2").value.length; 
        var index = document.getElementById("available_sl_hr_col2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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



/* script for advance  sl after script*/

function advance_sl_after_script(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("advance_sl_hr_col2").value;
        var len = document.getElementById("advance_sl_hr_col2").value.length; 
        var index = document.getElementById("advance_sl_hr_col2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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


/* bank detail script*/

function accNo(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("acc_no_emp").value;
        var len = document.getElementById("acc_no_emp").value.length; 
        var index = document.getElementById("acc_no_emp").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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



function accNoAdv(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("bank_acc_adv").value;
        var len = document.getElementById("bank_acc_adv").value.length; 
        var index = document.getElementById("bank_acc_adv").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>5)
        	{
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


 /*employee address validation */

function postalCode1(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("per_add_pcode").value;
        var len = document.getElementById("per_add_pcode").value.length; 
        var index = document.getElementById("per_add_pcode").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>7)
        	{
        	return false;
        	}
        if (index >0 || index==0) { 
        	
            var CharAfterdot = (len + 1) - index; 
            
            if (CharAfterdot > 6) { 

                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >0) {
   return false;
   }
    } 
    return true; 
 } 		


function postalCode2(evt) { 
	
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode !=45) 
        return false; 
    else { 
    var input = document.getElementById("curr_add_pcode").value;
        var len = document.getElementById("curr_add_pcode").value.length; 
        var index = document.getElementById("curr_add_pcode").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        var charcodebefore_dot=((len+1)-index);
        if(charcodebefore_dot>7)
        	{
        	return false;
        	}
        if (index >0 || index==0) { 
        	
            var CharAfterdot = (len + 1) - index; 
            
            if (CharAfterdot > 6) { 

                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >0) {
   return false;
   }
    } 
    return true; 
 } 		


function verifyPh_Per()
{
	 var mobile=document.getElementById("per_cont_no").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("per_cont_no").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('per_cont_no').focus();
				    }, 0);
		 document.getElementById('per_cont_no').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('per_cont_no').focus();
				    }, 0);
		 document.getElementById('per_cont_no').value="";
				    return false;
	     }  
	}  


function verifyPh_Curr()
{
	 var mobile=document.getElementById("curr_cont_no").value;

	 var phoneno = /^(\+91-|\+91|0)?[789]\d{9}$/; 
	
	  if(mobile.match(phoneno))  
	     {  
	       return true;         
	     }  
		 else if(mobile.length<10)
		 {
		 document.getElementById("curr_cont_no").focus();
		 alert("Please Enter  10 Digits Phone Number");
		 window.setTimeout(function ()
				    {
			document.getElementById('curr_cont_no').focus();
				    }, 0);
		 document.getElementById('curr_cont_no').value="";
				    return false;
		 } 
	   else 
	     {  
	     alert("Not a valid Phone Number");
	     window.setTimeout(function ()
				    {
			document.getElementById('curr_cont_no').focus();
				    }, 0);
		 document.getElementById('curr_cont_no').value="";
				    return false;
	     }  
	}  


// E-VOUCHER VALIDATION

function verifyna1()
{
	//alert("alert");
	 var name=document.getElementById("paid_to_name").value;

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
			document.getElementById('paid_to_name').focus();
				    }, 0);
		 document.getElementById('paid_to_name').value="";
				    return false;
	     }  
	}  


function verifyna2()
{
	//alert("alert");
	 var name=document.getElementById("reason_paid_amount").value;
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
			document.getElementById('reason_paid_amount').focus();
				    }, 0);
		 document.getElementById('reason_paid_amount').value="";
				    return false;
	     }  
	}  

function amount_check(evt) { 
        var charCode = (evt.charCode) ? evt.which : event.keyCode

        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
            return false; 
        else { 
        var input = document.getElementById("cash_cheque_amount").value;
            var len = document.getElementById("cash_cheque_amount").value.length; 
            var index = document.getElementById("cash_cheque_amount").value.indexOf('.'); 

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

// for cheque number validation
function isNumber_check(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)){
        return false;
    }
    return true;
}    

// Expense entry  amount validation

function isAmount(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("amount").value;
        var len = document.getElementById("amount").value.length; 
        var index = document.getElementById("amount").value.indexOf('.'); 

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

function isAmount2(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode

    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("amount2").value;
        var len = document.getElementById("amount2").value.length; 
        var index = document.getElementById("amount2").value.indexOf('.'); 

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

