/**
 * 
 */
/* PAN NO VALIDATION */

function pan_validate(pannum)
{

var regpan = /^([A-Za-z]){5}([0-9]){4}([A-Za-z]){1}?$/;

if(regpan.test(pannum) == false)
{

document.getElementById("status").innerHTML = "Permanent Account Number is not yet valid.";
window.setTimeout(function ()
	    {
document.getElementById('pannum').focus();
	    }, 0);
/*document.getElementById('pannum').value="";*/
	    return false;

}
else
{

document.getElementById("status").innerHTML = ""; 

}
	/*{
	if(status==null)
		alert("Enter your pan card number");
	}*/
if(pannum.toString()=="")
	{
	alert("Enter your pan card number");
	window.setTimeout(function ()
		    {
	document.getElementById('pannum').focus();
		    }, 0);
	document.getElementById('pannum').value="";
		    return false;
	}
}


