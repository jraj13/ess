<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Input page to the admin</title>

<script>
function issalary(evt) { 
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
            if (CharAfterdot > 1) { 

                return false; 
            } 
   }

if (charCode == 46 && input.split('.').length >0) {
   return false;
   }
    } 
    return true; 
 } 

</script>

<script>
function total()
{
	 var tot_ctc = document.getElementById("ctc").value;
	 if(tot_ctc<50000)
		 {
		 alert("Please enter more than 50000");
		 document.getElementById("ctc").value="";
		 }
	 else
		 {
		  return true; 
		 }
}


</script>



</head>
<body>
<h2 style="background-color: #00CED1;margin-left:-4%;padding-left:10px"><I>Salary Break up Statement generation</I></h2><br>

<!-- Enter CTC :<input type="text" id="ctc"  onkeypress="return issalary(event)" maxlength="10"/> -->
Enter CTC : <input type="text" id="ctc"  onkeypress="return issalary(event)" onchange="total()" maxlength="10" style="height: 28px;" />
Select Basic Percent : <select  id="basic_per" style="height: 28px;">
<option value="none select">Select basic</option>
<option value="30">30</option>
<option value="40">40</option>
<option value="50">50</option>

</select>

<input type="button" id="salarybrekupbtn" value="Genrate Salary Breakup"  onclick="openPage(id)"/>&nbsp;
<BR><BR>&nbsp;

<!-- <div id="lrmain">
</div> -->

<div id="qrySuccess">
</div>


</body>
</html>