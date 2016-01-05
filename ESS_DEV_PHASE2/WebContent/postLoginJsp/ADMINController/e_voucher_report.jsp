<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%-- <script>
  
  $(document).ready(function(){
	  
	  var date = new Date();
	  var currentMonth = date.getMonth();
	  var currentDate = date.getDate();
	  var currentYear = date.getFullYear();
	  
	      $("#fdate").datepicker({
	    	  maxDate: new Date(currentYear, currentMonth, currentDate),
	          numberOfMonths: 1,
	          onSelect: function(selected) {
	            $("#datepicker2").datepicker("option","minDate", selected)
	          }
	      });
	      $("#tdate").datepicker({
	    	  maxDate: new Date(currentYear, currentMonth, currentDate),
	          numberOfMonths: 1,
	          onSelect: function(selected) {
	             $("#datepicker").datepicker("option","maxDate", selected)
	          }
	      }); 
	  });

  </script>
  --%>
 <script>
function raise(){
	var fdate= $("#fdate").val();
	var tdate= $("#tdate").val();
	
	if(fdate=="" && tdate=="")
		{
		
		alert("Please Choose Starting date and Ending date");
		return false;
		}
	if(fdate=="" )
	{
	
	alert("Please Choose Starting date ");
	window.setTimeout(function ()
		    {
	document.getElementById('fdate').focus();
		    }, 0);
	return false;
	}
	if(tdate=="")
	{
	
	alert("Please Choose Ending date");
	window.setTimeout(function ()
		    {
	document.getElementById('tdate').focus();
		    }, 0);
	return false;
	}
	else
		{
		
		return true;
		}
}

</script>

</head>
<body>


<s:form action="pdf_e_voucher"  onsubmit="return raise();">

<label>From Date<span style="color:red">*</span></label>
<input type="date" name="fdate" id="fdate" style="height:10%;background-color:white;" > &nbsp;

<label>To Date<span style="color:red">*</span></label>
<input type="date" name="tdate" id="tdate" style="height:10%;background-color:white;" > &nbsp;

<input type="submit" id="" value="Download" style="height:20%;"/>


</s:form>

</body>
</html>