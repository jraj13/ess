function phoneValidat() 
{
    var x;
    x = document.getElementById("regBean.phonenum").value;
    if (isNaN(x) || x < 1 || x > 10)
    {
    alert("enter num only");
        
    } 
   // return true;
}

/*function phonenumber(inputtxt)  
{  
  var phoneno = /^\d{10}$/;  
  //north American Num and international num with country code
 // var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  
  if(inputtxt.value.match(phoneno))  
  {  
      return true;  
  }  
  else  
  {  
     alert("Not a valid Phone Number");  
     return false;  
  }  
  }  */



/*<script type="text/javascript">
function validateForm() {
    return checkPhone();
}
function checkPhone() {
    var phone = document.forms["myForm"]["phone"].value;
    var phoneNum = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/; 
        if(phone.value.match(phoneNum)) {
            return true;
        }
        else {
            document.getElementById("phone").className = document.getElementById("phone").className + " error";
            return false;
        }
    }
</script>*/