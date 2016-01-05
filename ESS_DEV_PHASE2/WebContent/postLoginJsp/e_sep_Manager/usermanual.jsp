<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>usermanual.jsp</h2>
</body>
</html> --%>



<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>accordion demo</title>
  
  
  
  
  
  
  
  
  
  
 <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  -->
 
 <link rel="stylesheet" href="cartian/jquery-ui.css">
 
  <script src="cartian/jquery-1.10.2.js"></script>
  <script src="cartian/jquery-ui.js"></script> 
  
   <style type="text/css">
/* .ui-accordion .ui-accordion-header {
margin: 2px 0 0 0;
} */

.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
border-bottom-right-radius: 16px;
}
/* .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
border: 1px solid #2D09EB;
background: #95B1E2 url("images/ui-bg_glass_75_e6e6e6_1x400.png") 50% 50% repeat-x;
font-weight: normal;
color: #555555;
} */
/* .ui-accordion .ui-accordion-header_new {
display: block;
/* cursor: pointer; */
/* position: relative; */
margin: 5px 0 0 0;
padding: .7em .5em .5em 7em;
min-height: 0;
/* support: IE7; */
font-size: 100%;
}
 */
.element.style {
/* color: #B66666; */
color: red;
font-size: 15px;
}
   .ui-accordion .ui-accordion-content {
    padding: 0em 0.1em;
    border-top: 0;
    overflow: auto;
    width: 1000px;
    /*  background-color: white !important; */ 
    /* color: black ;   */
} 
 
h3 {
  font-weight:bold;
   font-family: Arial;
   font: bold;
   font size="2"
}
/* label
{
width:10px; 

} */
#underline{
text-decoration: underline; 
}

  </style>
  

</head>
<body>
 
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "content",
      collapsible: true
    });
  });
  </script>
  
  <script>

	/* function for geting description value */
	function run1() {
		alert("run1");
		var choice1=document.getElementById("rec").value;
		alert(choice1);
		var appr_remarks=document.getElementById("appr_remarks").value;
		var appr_remarks1=document.getElementById("appr_remarks1").value;
		alert(appr_remarks1);
		var appr_remarks2=document.getElementById("appr_remarks2").value;
		alert(appr_remarks2);
		alert(appr_remarks);
		/* var pl=document.getElementById("pl").value; */
		var pl=Approved;
		
		var sl=document.getElementById("sl").value;
		var cl=document.getElementById("cl").value;
		
		document.getElementById("desc1").value = document.getElementById("rec").value;
	    document.getElementById("datepicker2").value=" ";
	    
		var dop = document.getElementById("desc1").value;
		
		if(choice1=="Recommended"){
			
			alert("rec");
			 document.getElementById("appr_remarks").value=document.getElementById("pl").value;
		}
		else if(choice1=="Sick Leave"){
			
			 document.getElementById("tot_leave").value=document.getElementById("sl").value;
		}
		else if(choice1=="Casual Leave"){
			
			document.getElementById("tot_leave").value=document.getElementById("cl").value;
			
		}

		
	}

	</script>
</head>
<body>
 <div class="wrapper">
<div id="accordion" style="width:1000px;">
  <h3 style="background-color: #C0DEF5;">Separation Details</h3>
  <div style="background-color: white !important;color: black; ">
  
  
   
		
		<div style="width:90%">
		<div style="float:left;width:40%;">
		<!-- <div style=" margin-top: 5px; margin-left: -0.5%; padding-left: 0px; width: 30%;">Reason Details</div> -->
		<div id="underline">Reason Details</div>
		<hr>
		<div>
		<label>&nbsp;&nbsp;&nbsp;Personal Number :&nbsp; </label><input type="text" id="personalnum" value="csse150045" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<label>&nbsp;&nbsp;&nbsp;Reason for Action :&nbsp; </label><input type="text" id="personalnum" value="Resignation" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detailed Reason:&nbsp; </label><input type="text" id="personalnum" value="Family Business" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relieving Date(R):&nbsp; </label><input type="text" id="personalnum" value="13/10/2015" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
		<label>Actual Notice Period: &nbsp;</label><input type="text" id="personalnum" value="30" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
			</div>
			
	</div>


	<div style="float:right;width:45%;">
		<div>Approved Details</div>
		<hr>
		<div>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Action Type(A):&nbsp; </label>
			<input type="text" id="preseparation" value="Pre Separation" style="background-color:white;height:26px;"/><br>
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reson for Action(A):&nbsp; </label>
			<input type="text" id="preseparation" value="Resignation" style="background-color:white;height:26px;"/><br>
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detailed Reason(A):&nbsp; </label>
			<input type="text" id="preseparation" value="Family Business" style="background-color:white;height:26px;"/><br>
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Physical Leaving Date(RM):&nbsp; </label>
			<input type="text" id="preseparation" value="13/10/2015" style="background-color:#98c3e2;height:26px;" readonly="readonly"/><br>
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relieving Date(HR):&nbsp; </label>
			<input type="text" id="preseparation" value="13/10/2015" style="background-color:white;height:26px;"/><br>
			
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Withdrawal Allowed:&nbsp; </label>
			<input type="checkbox" />
		</div>
	</div> 
	

 </div>  
  </div>
  <h3  style="background-color: #C0DEF5;">Approval</h3>
  <div style="background-color: white !important;color: black;">
   
    <div style="float:left">
  	 <b>Approver Decision</b>
    	<hr>
   	 <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Apporver Role:&nbsp;</label>
   	 <input type="text" value="Reporting Manager" id="rtm"  style="background-color:white;height:26px;"/><br>
   	 <label>Approver Id/Group:&nbsp;</label>
   	 <input type="text" value="csse140040" id="apid"  style="background-color:white;height:26px;"/><br><br>
    
   	 <label>Approver Action:</label>
     <input type="radio" name="rb"  id="rec" onChange="run1()" value="Recommended"/>Recommended 
     <input type="radio" name="rb"  id="notrec"  value="Not Recommended"/>Not Recommended
    
  	 </div>
    
    <div style="float:right">
   	<b>Approver Remarks</b>
    <hr>
   		<!--  <input type="text" id="appr_remarks" name="appr_remarks" value=""/> -->
   		<!--  <input type="hidden" id="appr_remarks1" name="appr_remarks1" value="Recommended"/>
   			  <input type="hidden" id="appr_remarks2" name="appr_remarks2" value="Not Recommended"/> -->
  		<textarea  id="comments_note" rows="3" cols="30" id="appr_remarks"  placeholder="Enter Comments here"></textarea> 
   	 </div>
    
   <!--  </div> -->
    
    
  </div>
  <h3 style="background-color: #C0DEF5">Employee Details</h3>
  <div style="background-color: white !important;color: black;">
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3 style="background-color: #C0DEF5">Notes/ Remarks</h3>
  <div style="background-color: white !important;color: black;">
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
  <h3 style="background-color: #C0DEF5">Attachments</h3>
  <div style="background-color: white !important;color: black;">
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
</div>
 </div>
 
</body>
</html>
