/**
 * 
 */

// ESEPARATION NEW REQUEST

function verifyreason()
{
	 var name=document.getElementById("reason").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Numeric value not allowed");
	     window.setTimeout(function ()
				    {
			document.getElementById('reason').focus();
				    }, 0);
		 document.getElementById('reason').value="";
				    return false;
	     }  
	}  

function verifydreason()
{
	 var name=document.getElementById("detailed").value;

	 var exp = /^[ A-Za-z.]*$/; 
	
	  if(name.match(exp))  
	     {  
	       return true;         
	     }  
		
	   else 
	     {  
	     alert("Numeric value not allowed");
	     window.setTimeout(function ()
				    {
			document.getElementById('detailed').focus();
				    }, 0);
		 document.getElementById('detailed').value="";
				    return false;
	     }  
	}  