function validatePersonalInfo()
{
	//alert("testing");
	  var emp_id=document.empReg.employeeid.value;
	 
	
      var first_name = document.empReg.fname.value;
   
      var last_name = document.empReg.lname.value;
    
      var emp_dob = document.empReg.dob.value;
    
      var emp_pan = document.empReg.pannum.value;
   
      var emp_phnum = document.empReg.phnumone.value;
      var emp_email = document.empReg.emailid.value;
      var emp_marital_status = document.empReg.mstatus.value;
   
      var emp_mothername = document.empReg.mothername.value;
      var emp_mother_dob = document.empReg.motherdob.value;
      
      //alert("testing after varible10 declaration");
      if(emp_id.toString() == ""){alert("Please enter a employee id");}
      if(first_name.toString() == ""){alert("Please enter a first name.");}
      if(last_name.toString() == ""){alert("Please enter a last name.");}
      if(emp_dob.toString() == ""){alert("Please enter your dob name.");}
      if(emp_pan.toString() == ""){alert("Please enter your pan");}
      if(emp_phnum.toString() == ""){alert("Please enter your phone num");}
      if(emp_email.toString() == ""){alert("Please enter your email");}
      if(emp_marital_status.toString() == ""){alert("Please enter your marital status");}
      if(emp_mothername.toString() == ""){alert("Please enter your mother name.");}
      if(emp_mother_dob.toString() == ""){alert("Please enter your mother dob");}
      
//phone num validation
      var phoneInput = document.empReg.phnumone.value;
      var validPhone = false;
      
      
       if(!checkPhone(phoneInput)){
             alert("Phone number is invalid:" + validPhone);
          }
       else{
           validPhone = true;
       }
      /* if( validPhone){
          alert("Your phon num has been verified");
       }*/
       
     //email id validation
       
       
       var emailInput = document.empReg.emailid.value;
       var validemail = false;
      
       if(!checkemail(emailInput)){
             alert("email number is invalid:" + validemail);
          }
      
     //pan validation
       var panInput = document.empReg.pannum.value;
       var validPan = false;

    
        if(!pan_validate(panInput)){
              alert("pan number is invalid:" + validPan);
           }

        
        //Dob validation
          var dobInput = document.empReg.dob.value;
          var validdob = false;

         
           if(!dob_validate(dobInput)){
                 alert("dob  is invalid format:" + validdob);
              }

        
        
       // phone num validation function
        
         function checkPhone(str)
         {
           var phoneformat = /^(\d{10}|\d{3}-\d{3}-\d{4}|\(\d{3}\)\d{3}-\d{4})$/;
            return phoneformat.test(str);
         }
         
         
       
  }

  

  
  //email id validation function
  
  
  
  function checkemail(str)
  {
	  var emailformat = /^[w-.+]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;
	  return emailformat.test(str);
	  
	  }
//pan validation function
  function pan_validate(str)
  {

  var panformat = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
  return panformat.test(str);
  }
  
 //dob validation function
  function dob_validate(str)
  {
	  
 // var dob = document.forms["ProcessInfo"]["txtDOB"].value;
  var pattern =/^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
  return pattern.test(str);
         
  }