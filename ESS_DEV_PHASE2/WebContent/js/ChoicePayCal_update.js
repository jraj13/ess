
// medical text box validation

function ismedical(evt) { 
      var charCode = (evt.charCode) ? evt.which : event.keyCode


      if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
          return false; 
      else { 
      var input = document.getElementById("mr2").value;
          var len = document.getElementById("mr2").value.length; 
          var index = document.getElementById("mr2").value.indexOf('.'); 

          if (index > 0 && charCode == 46) { 
              return false; 
          } 
          if (index >0 || index==0) { 
              var CharAfterdot = (len + 1) - index; 
              if (CharAfterdot > 2) { 

                  return false; 
              } 

     }

 if (charCode == 46 && input.split('.').length >1) {
     return false;
     }


      } 
      return true; 
   } 


//Education text box validation

function iseducation1(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("cea2").value;
        var len = document.getElementById("cea2").value.length; 
        var index = document.getElementById("cea2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//convayance text box validation

function isconveyance(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("coa2").value;
        var len = document.getElementById("coa2").value.length; 
        var index = document.getElementById("coa2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 


//fuel text box validation

function isfuel(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("fme2").value;
        var len = document.getElementById("fme2").value.length; 
        var index = document.getElementById("fme2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 


//hra text box validation

function ishra(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("hra2").value;
        var len = document.getElementById("hra2").value.length; 
        var index = document.getElementById("hra2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//lta text box validation

function islta(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("lta2").value;
        var len = document.getElementById("lta2").value.length; 
        var index = document.getElementById("lta2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

// ernps  text box validation

function isernps(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("ernc1").value;
        var len = document.getElementById("ernc1").value.length; 
        var index = document.getElementById("ernc1").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//hostel text box validation

function ishostel(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("cha2").value;
        var len = document.getElementById("cha2").value.length; 
        var index = document.getElementById("cha2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

// food text box validation

function isfood(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("fc2").value;
        var len = document.getElementById("fc2").value.length; 
        var index = document.getElementById("fc2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

// advance text box validation

function isadvance(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("ab").value;
        var len = document.getElementById("ab").value.length; 
        var index = document.getElementById("ab").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//washing text box validation

function iswashing(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("we").value;
        var len = document.getElementById("we").value.length; 
        var index = document.getElementById("we").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 

//gift text box validation

function isgift(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("gf2").value;
        var len = document.getElementById("gf2").value.length; 
        var index = document.getElementById("gf2").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 

   }

if (charCode == 46 && input.split('.').length >1) {
   return false;
   }


    } 
    return true; 
 } 





function medical()
{
	var acp=document.getElementById('acp').value;
	var mr1=document.getElementById('mr1').value;
	var mr2=document.getElementById('mr2').value;
	if(Number(mr2)>15000)
	{
		window.alert("Enter with in a medical Reimursement range");
		 document.getElementById("mr2").focus();
		document.getElementById('mr2').value='0';
	}    
	else if(mr2<1)
		{
		document.getElementById('mr2').value='0';
		}
	else if(Number(mr2)>Number(acp))
			{
		alert("Please  Enter less than available choice pay amount");
		document.getElementById("mr2").focus();
		document.getElementById('mr2').value='0';
			}
	else
		{
	var acp=document.getElementById('acp').value;
	var mr2=document.getElementById('mr2').value;
		var acp1=(Number(acp)-Number(mr2));
		//acp.value=acp1;
		document.getElementById('acp').value = acp1;
		document.getElementById("cea2").focus();
		
		}
}


function education()
{
	var cea1=document.getElementById('cea1').value;
	if(Number(cea1)>2)
	{
		alert("Enter 1 or 2 number only");
		
		document.getElementById('cea1').value="";
	}
}

function education1()
{
	var acp=document.getElementById('acp').value;
	var cea1=document.getElementById('cea1').value;
	var cea2=document.getElementById('cea2').value;
	if(Number(cea2)>2400)
	{
		alert("Enter with in a Children Education Allowance range");
		document.getElementById('cea2').value='0';
		document.getElementById("cea2").focus();
	}
	else if(cea2<1)
		{
		document.getElementById('cea2').value='0';
		}
	else if(Number(cea2)>Number(acp))
		{
		window.alert("Enter with in a medical Reimursement range");
		document.getElementById('cea2').value='0';
		document.getElementById("cea2").focus();
		}
	else
	{
	var acp=document.getElementById('acp').value;
	var cea2=document.getElementById('cea2').value;
		var cea22=(Number(acp)-Number(cea2));
		//acp.value=cea22;
		document.getElementById('acp').value = cea22;
		document.getElementById("coa2").focus();
	}
	
}
function conveyance()
{
	
	var acp=document.getElementById('acp').value;
	
	var coa2=document.getElementById('coa2').value;
	if(Number(coa2)>9600)
	{
		alert("Enter with in a Conveyance range");
		document.getElementById('coa2').value='0';
		document.getElementById("coa2").focus();
	}
	else if(Number(coa2)>Number(acp))
	{
		
	window.alert("Enter with in Available Choice Payrange");
	document.getElementById('coa2').value='0';
	document.getElementById("coa2").focus();
	}

	else if(coa2<1)
		{
		document.getElementById('coa2').value='0';
		}
	
	else
	{
		
	var acp=document.getElementById('acp').value;
	var coa2=document.getElementById('coa2').value;
	var coa22=(Number(acp)-Number(coa2));
	document.getElementById('acp').value = coa22;
	document.getElementById("fme2").focus();
	}
}
function fuel()
{
	var acp=document.getElementById('acp').value;
   var fme1=document.getElementById('fme1').value;
   var fme2=document.getElementById('fme2').value;
   if(Number(fme2)>Number(fme1))
	{
	   alert("Enter with in a Fuel/ Maintainance Expenses range");
	   document.getElementById('fme2').value='0';
	   document.getElementById("fme2").focus();
	}
   else if(Number(fme2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('fme2').value='0';
	document.getElementById("fme2").focus();
	}

   else if(fme2<1){
	   document.getElementById('fme2').value='0';
   }
	else
	{
	var acp=document.getElementById('acp').value;
	var fme2=document.getElementById('fme2').value;
	var fme22=(Number(acp)-Number(fme2));
		document.getElementById('acp').value = fme22;
		document.getElementById("hra2").focus();
	}
}
function hra()
{
	var acp=document.getElementById('acp').value;
	var hra1=document.getElementById('hra1').value;
	var hra2=document.getElementById('hra2').value;
	if(Number(hra2)>Number(hra1))
	{
		alert("Enter with in a HRA  range");
		document.getElementById('hra2').value='0';
		document.getElementById("hra2").focus();
	}
	else if(Number(hra2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('hra2').value='0';
	document.getElementById("hra2").focus();
	}
	else if(hra2<1)
		{
		document.getElementById('hra2').value='0';
		}
	
	else
	{
		var acp=document.getElementById('acp').value;
		var hra2=document.getElementById('hra2').value;
		var hra22=(Number(acp)-Number(hra2));
		document.getElementById('acp').value = hra22;
		document.getElementById("lta2").focus();
	}
}
function lta()
{
	var lta1=document.getElementById('lta1').value;
	var lta2=document.getElementById('lta2').value;
	var acp=document.getElementById('acp').value;
	if(Number(lta2)>Number(lta1))
	{
		alert("Enter with in a LTA range");
		document.getElementById('lta2').value='0';
		document.getElementById("lta2").focus();
	}
	else if(Number(lta2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('lta2').value='0';
	document.getElementById("lta2").focus();
	}
	else if(lta2<1)
		{
		document.getElementById('lta2').value='0';
		}
	else
	{
		var acp=document.getElementById('acp').value;
		var lta2=document.getElementById('lta2').value;
		var lta22=(Number(acp)-Number(lta2));
		document.getElementById('acp').value = lta22;
		document.getElementById("ernc1").focus();
	}
}
function ernps()
{
	
	var ernc=document.getElementById('ernc').value;
	var ernc1=document.getElementById('ernc1').value;
	var acp=document.getElementById('acp').value;
if(ernc1<6000)
	{
	alert("Enter with in a Er.NPS Contribution range");
	document.getElementById('ernc1').value='0';
	document.getElementById("ernc1").focus();
	}
else if(Number(ernc1)>Number(ernc))
	{
	alert("Enter with in a Er.NPS Contribution range");
	document.getElementById('ernc1').value='0';
	document.getElementById("ernc1").focus();
	}
else if(Number(ernc1)>Number(acp))
{
window.alert("Enter with in a medical Reimursement range");
document.getElementById('ernc1').value='0';
document.getElementById("ernc1").focus();
}
else
	{
	var acp=document.getElementById('acp').value;
	var ernc1=document.getElementById('ernc1').value;
		var ernc11=(Number(acp)-Number(ernc1));
	document.getElementById('acp').value = ernc11;
	document.getElementById("ab").focus();
	
	}
	
}
function hostel()
{
	var acp=document.getElementById('acp').value;
	var cha1=document.getElementById('cha1').value;
	var cha2=document.getElementById('cha2').value;
	if(Number(cha2)>7200)
	{
		alert("Enter with in a Children Hostel Allowance range");
		document.getElementById('cha2').value='0';
		document.getElementById("cha2").focus();
		
	}
	else if(Number(cha2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('cha2').value='0';
	document.getElementById("cha2").focus();
	}
	else if(cha2<1){
		document.getElementById('cha2').value='0';
	}
	else
	{
	var acp=document.getElementById('acp').value;
	var cha2=document.getElementById('cha2').value;
	var cha22=(Number(acp)-Number(cha2));
	document.getElementById('acp').value = cha22;
	}
}
function hostel1()
{
	var cha1=document.getElementById('cha1').value;
	if(Number(cha1)>2)
	{
		alert("Enter 1 or 2 number only");
		document.getElementById('cha1').value="";
	}
}
function food()
{
	var acp=document.getElementById('acp').value;
	var fc2=document.getElementById('fc2').value;
	if((Number(fc2)<15600))
	{
		alert("Enter with in a Food Coupons range");
		document.getElementById('fc2').value='0';
		document.getElementById("fc2").focus();
	}
	else if(Number(fc2)>30000)
	{
		alert("Enter with in a Food Coupons range");
		document.getElementById('fc2').value='0';
		document.getElementById("fc2").focus();
	}
	else if(Number(fc2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('fc2').value='0';
	document.getElementById("fc2").focus();
	}
	else
		{
		var acp=document.getElementById("acp").value;
		var fc2=document.getElementById("fc2").value;
		var fc22=(Number(acp)-Number(fc2));
		document.getElementById("acp").value = fc22;
		document.getElementById("gf2").focus();
		}
}

function advance()
{
	
	var ab=document.getElementById("ab").value;
	var acp=document.getElementById("acp").value;
	if(Number(ab)>Number(acp))
	{
		alert("Please  Enter less than available choice pay amount");
		document.getElementById("ab").value='0';
		document.getElementById("ab").focus();
	}
	else if(ab<1)
		{
		document.getElementById("ab").value='0';
		}
	else{
		var ab=document.getElementById("ab").value;
	var acp=document.getElementById("acp").value;
	var ab1=(Number(acp)-Number(ab));
	document.getElementById("acp").value = ab1;
	document.getElementById("we").focus();
}
}
function washing()
{
	var we=document.getElementById("we").value;
	var acp=document.getElementById("acp").value;
	if(Number(we)>Number(acp))
	{
		alert("Please  Enter less than available choice pay amount");
		document.getElementById("we").value='0';
		document.getElementById("we").focus();
	}
	else if(we<1)
		{
		document.getElementById("we").value='0';
		}
	
	else
	{
		var we=document.getElementById("we").value;
	var acp=document.getElementById("acp").value;
	var we1=(Number(acp)-Number(we));
	document.getElementById("acp").value = we1;
	document.getElementById("gf2").focus();
}
}
//utility bills

function ubills()
{
	
	var acp=document.getElementById('acp').value;
	var ub1=document.getElementById('ub1').value;
	var ub=document.getElementById('ub').value;
	if(ub>2500){
		alert("Please Enter with in a Utility Bill range");
		document.getElementById("ub").value='0';
		document.getElementById("ub").focus();
	}
	else if (Number(ub)>Number(acp)) {
		alert("Please Enter with in a Available Choice Pay");
		document.getElementById("ub").value='0';
		document.getElementById("ub").focus();
	}
	else if(ub<1)
	{
	document.getElementById("ub").value='0';
	document.getElementById("ub").focus();
	}

	else
		{
		var acp=document.getElementById('acp').value;
		var ub=document.getElementById('ub').value;
		var ub22=(acp-ub);
		document.getElementById("acp").value = gf22;
		}
}


function isub(evt) { 
    var charCode = (evt.charCode) ? evt.which : event.keyCode


    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46) 
        return false; 
    else { 
    var input = document.getElementById("ub").value;
        var len = document.getElementById("ub").value.length; 
        var index = document.getElementById("ub").value.indexOf('.'); 

        if (index > 0 && charCode == 46) { 
            return false; 
        } 
        if (index >0 || index==0) { 
            var CharAfterdot = (len + 1) - index; 
            if (CharAfterdot > 2) { 

                return false; 
            } 
   }
if (charCode == 46 && input.split('.').length >1) {
   return false;
   }

    } 
    return true; 
 } 



function gifton()
{
	var gf2=document.getElementById('gf2').value;
	if(gf2<1){
	document.getElementById('gf2').value="";
	}
}
function giftout()
{
	var gf2=document.getElementById('gf2').value;
	if(gf2<1){
	document.getElementById('gf2').value='0';
	}
}
function gift()
{
	var acp=document.getElementById('acp').value;
	var gf2=document.getElementById('gf2').value;
	if(Number(gf2)>5000)
	{
		alert("Enter with in a Gift Coupons range");
		document.getElementById('gf2').value="0";
		document.getElementById("gf2").focus();
	}
	else if(Number(gf2)>Number(acp))
	{
	window.alert("Enter with in a medical Reimursement range");
	document.getElementById('gf2').value='0';
	document.getElementById("gf2").focus();
	}
	else if(gf2<1)
		{
		document.getElementById('gf2').value="0";
		}
	else
		{
		var acp=document.getElementById('acp').value;
		var gf2=document.getElementById('gf2').value;
		var gf22=(Number(acp)-Number(gf2));
		document.getElementById('acp').value = gf22;
}
}


//button submit validate form

function validateform()
{
var mr2=document.getElementById("mr2").value;
var cea2=document.getElementById("cea2").value;
var coa2=document.getElementById("coa2").value;
 var fme2=document.getElementById("fme2").value;
var hra2=document.getElementById("hra2").value;
var lta2=document.getElementById("lta2").value;
var ernc1=document.getElementById("ernc1").value;
var cha2=document.getElementById("cha2").value;
var fc2=document.getElementById("fc2").value;
var ab=document.getElementById("ab").value;
var we=document.getElementById("we").value;
var gf2=document.getElementById("gf2").value;
var ub=document.getElementById("ub").value;
if((mr2<1) && (cea2<1) && (coa2<1) && (fme2<1) && (hra2<1) && (lta2<1) && (ernc1<6000) && (cha2<1) && (fc2<1) && (ab<1) && (we<1) && (gf2<1)&& (ub<1))
	{
	alert("Please Enter at least one field value")
		return false;
}
}







