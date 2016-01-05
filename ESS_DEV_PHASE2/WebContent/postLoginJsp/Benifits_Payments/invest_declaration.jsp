  <%@ page import="com.ess.common.util.MonthandyearDecide" %>
  <%@page import="com.ess.common.action.ChoiceFormDetails"%>
  
 <%
	String user = (String) session.getAttribute("empid");

	session.setAttribute("user", user);
	System.out.println("user frm JSP==== " + user);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script src="investmentjs/Investment_pay_Cal.js"></script>
<script src="investmentjs/investment_declaration_script_char.js"></script>

<style>

.myHoverButton:hover { 
background-color: #9999ff;
 } 
table caption {
	background-color: #98c3e2;
	padding: 5px 2%;
	text-align: left;
}


</style>

<script type="text/javascript">

document.onmousedown=disableclick;
status="Right Click Disabled";
function disableclick(e){
  if(event.button==2)
   {
     //alert(status);
     return false;	
   }
}

	function fileUpload(form, action_url, div_id) {

		$('#upload').show();

		cache: false;

		var file = $("#datafile").val();

		action_url = action_url + "?file=" + file + "&type=file2";

		if (file == "") {

			alert("Please Choose File to Upload..");
			return false;
		}
		// Create the iframe...
		//if (confirm("Are you sure?")) {
		var iframe = document.createElement("iframe");
		iframe.setAttribute("id", "upload_iframe");
		iframe.setAttribute("name", "upload_iframe");
		iframe.setAttribute("width", "0");
		iframe.setAttribute("height", "0");
		iframe.setAttribute("border", "0");
		iframe.setAttribute("style", "width: 0; height: 0; border: none;");

		// Add to document...
		form.parentNode.appendChild(iframe);
		window.frames['upload_iframe'].name = "upload_iframe";

		iframeId = document.getElementById("upload_iframe");
		//$("ol#loadplace").hide();
		// Add event...
		var eventHandler = function() {
			$('#upload').show();
			if (iframeId.detachEvent)
				iframeId.detachEvent("onload", eventHandler);
			else
				iframeId.removeEventListener("load", eventHandler, false);

			// Message from server...
			if (iframeId.contentDocument) {
				content = iframeId.contentDocument.body.innerHTML;
			} else if (iframeId.contentWindow) {
				content = iframeId.contentWindow.document.body.innerHTML;
			} else if (iframeId.document) {
				content = iframeId.document.body.innerHTML;
			}
			

			$('#upload').delay(1000).fadeOut();

			setTimeout('iframeId.parentNode.removeChild(iframeId)', 250);

		}

		if (iframeId.addEventListener)
			iframeId.addEventListener("load", eventHandler, true);
		if (iframeId.attachEvent)
			iframeId.attachEvent("onload", eventHandler);

		// Set properties of form...
		form.setAttribute("target", "upload_iframe");
		form.setAttribute("action", action_url);
		form.setAttribute("method", "post");
		form.setAttribute("enctype", "multipart/form-data");
		form.setAttribute("encoding", "multipart/form-data");

		// Submit the form...
		form.submit();

		document.getElementById(div_id).innerHTML = "<font color='green' ><b>Uploading...</b></font>";
		//}

	}

	//	========file 1 upload validation===========

	function fileUploads(form, action_url, div_id) {

		$('#upload1').hide();

		cache: false;

		var file = $("#datafile1").val();

		action_url = action_url + "?file=" + file + "&type=file1";

		if (file == "") {
			alert("Please Choose File to Upload..");
			return false;
		}
		// Create the iframe...
		//if (confirm("Are you sure?")) {
		var iframe = document.createElement("iframe");
		iframe.setAttribute("id", "upload_iframe");
		iframe.setAttribute("name", "upload_iframe");
		iframe.setAttribute("width", "0");
		iframe.setAttribute("height", "0");
		iframe.setAttribute("border", "0");
		iframe.setAttribute("style", "width: 0; height: 0; border: none;");

		// Add to document...
		form.parentNode.appendChild(iframe);
		window.frames['upload_iframe'].name = "upload_iframe";

		iframeId = document.getElementById("upload_iframe");
		//$("ol#loadplace").hide();
		// Add event...
		var eventHandler = function() {
			$('#upload1').show();
			if (iframeId.detachEvent)
				iframeId.detachEvent("onload", eventHandler);
			else
				iframeId.removeEventListener("load", eventHandler, false);

			// Message from server...
			if (iframeId.contentDocument) {
				content = iframeId.contentDocument.body.innerHTML;
			} else if (iframeId.contentWindow) {
				content = iframeId.contentWindow.document.body.innerHTML;
			} else if (iframeId.document) {
				content = iframeId.document.body.innerHTML;
			}
			//alert("content== " + content);

			//document.getElementById(div_id).innerHTML = content;

			$('#upload1').delay(1000).fadeOut();

			// Del the iframe...
			setTimeout('iframeId.parentNode.removeChild(iframeId)', 250);
		}

		if (iframeId.addEventListener)
			iframeId.addEventListener("load", eventHandler, true);
		if (iframeId.attachEvent)
			iframeId.attachEvent("onload", eventHandler);

		// Set properties of form...
		form.setAttribute("target", "upload_iframe");
		form.setAttribute("action", action_url);
		form.setAttribute("method", "post");
		form.setAttribute("enctype", "multipart/form-data");
		form.setAttribute("encoding", "multipart/form-data");

		// Submit the form...
		form.submit();

		document.getElementById(div_id).innerHTML = "<font color='green' ><b>Uploading...</b></font>";
		//}

	}

	function redirectPage() {

		//alert("aM in redirectPage");

		var lipp1 = document.getElementById('lipp1').value;
		var lipp2 = document.getElementById('lipp2').value;
		var lipp3 = document.getElementById('lipp3').value;

		var ppf1 = document.getElementById('ppf1').value;
		var ppf2 = document.getElementById('ppf2').value;
		var ppf3 = document.getElementById('ppf3').value;

		var nss1 = document.getElementById('nss1').value;
		var nss2 = document.getElementById('nss2').value;
		var nss3 = document.getElementById('nss3').value;

		var nsc1 = document.getElementById('nsc1').value;
		var nsc2 = document.getElementById('nsc2').value;
		var nsc3 = document.getElementById('nsc3').value;

		var cgd1 = document.getElementById('cgb1').value;
		var cgd2 = document.getElementById('cgb2').value;
		var cgd3 = document.getElementById('cgb3').value;

		var lap1 = document.getElementById('lap1').value;
		var lap2 = document.getElementById('lap2').value;
		var lap3 = document.getElementById('lap3').value;

		var elss1 = document.getElementById('elss1').value;
		var elss2 = document.getElementById('elss2').value;
		var elss3 = document.getElementById('elss3').value;

		var npf1 = document.getElementById('npf1').value;
		var npf2 = document.getElementById('npf2').value;
		var npf3 = document.getElementById('npf3').value;

		var db1 = document.getElementById('db1').value;
		var db2 = document.getElementById('db2').value;
		var db3 = document.getElementById('db3').value;

		var hlr1 = document.getElementById('hlr1').value;
		var hlr2 = document.getElementById('hlr2').value;
		var hlr3 = document.getElementById('hlr3').value;

		var ies1 = document.getElementById('ies1').value;
		var ies2 = document.getElementById('ies2').value;
		var ies3 = document.getElementById('ies3').value;

		var imf1 = document.getElementById('imf1').value;
		var imf2 = document.getElementById('imf2').value;
		var imf3 = document.getElementById('imf3').value;

		var tfc1 = document.getElementById('tfc1').value;
		var tfc2 = document.getElementById('tfc2').value;
		var tfc3 = document.getElementById('tfc3').value;

		var jsp1 = document.getElementById('jsp1').value;
		var jsp2 = document.getElementById('jsp2').value;
		var jsp3 = document.getElementById('jsp3').value;

		var mpn1 = document.getElementById('mpn1').value;
		var mpn2 = document.getElementById('mpn2').value;
		var mpn3 = document.getElementById('mpn3').value;

		var mps1 = document.getElementById('mps1').value;
		var mps2 = document.getElementById('mps2').value;
		var mps3 = document.getElementById('mps3').value;

		var ms1 = document.getElementById('ms1').value;
		var ms2 = document.getElementById('ms2').value;
		var ms3 = document.getElementById('ms3').value;

		var mth1 = document.getElementById('mth1').value;
		var mth2 = document.getElementById('mth2').value;
		var mth3 = document.getElementById('mth3').value;

		var mts1 = document.getElementById('mts1').value;
		var mts2 = document.getElementById('mts2').value;
		var mts3 = document.getElementById('mts3').value;

		var mtsc1 = document.getElementById('mtsc1').value;
		var mtsc2 = document.getElementById('mtsc2').value;
		var mtsc3 = document.getElementById('mtsc3').value;

		var tu1 = document.getElementById('tu1').value;
		var tu2 = document.getElementById('tu2').value;
		var tu3 = document.getElementById('tu3').value;

		var tu11 = document.getElementById('tu11').value;
		var tu12 = document.getElementById('tu12').value;
		var tu13 = document.getElementById('tu13').value;
		
		var datafile1 = document.getElementById('datafile1').value;
		var datafile = document.getElementById('datafile').value;
			
var actionUrl="Emp_InvestmentDetails_Save?lipp1="+lipp1+"&lipp2="+lipp2+"&lipp3="+lipp3+"&ppf1="+ppf1+"&ppf2="+ppf2+"&ppf3="+ppf3+"&nss1="+nss1+"&nss2="+nss2+"&nss3="+nss3+"&nsc1="+nsc1+"&nsc2="+nsc2+"&nsc3="+nsc3+"&cgd1="+cgd1+"&cgd2="+cgd2+"&cgd3="+cgd3+"&lap1="+lap1+"&lap2="+lap2+"&lap3="+lap3+"&elss1="+elss1+"&elss2="+elss2+"&elss3="+elss3+"&npf1="+npf1+"&npf2="+npf2+"&npf3="+npf3+"&db1="+db1+"&db2="+db2+"&db3="+db3+"&hlr1="+hlr1+"&hlr2="+hlr2+"&hlr3="+hlr3+"&ies1="+ies1+"&ies2="+ies2+"&ies3="+ies3+"&imf1="+imf1+"&imf2="+imf2+"&imf3="+imf3+"&tfc1="+tfc1+"&tfc2="+tfc2+"&tfc3="+tfc3+"&jsp1="+jsp1+"&jsp2="+jsp2+"&jsp3="+jsp3+"&mpn1="+mpn1+"&mpn2="+mpn2+"&mpn3="+mpn3+"&mps1="+mps1+"&mps2="+mps2+"&mps3="+mps3+"&ms1="+ms1+"&ms2="+ms2+"&ms3="+ms3+"&mth1="+mth1+"&mth2="+mth2+"&mth3="+mth3+"&mts1="+mts1+"&mts2="+mts2+"&mts3="+mts3+"&mtsc1="+mtsc1+"&mtsc2="+mtsc2+"&mtsc3="+mtsc3+"&tu1="+tu1+"&tu2="+tu2+"&tu3="+tu3+"&tu11="+tu11+"&tu12="+tu12+"&tu13="+tu13;
		
/* if(jsp1>=10000 ||mpn1>=10000 || mps1>=10000 ||ms1>=10000||mth1>=10000||mts1>=10000||mtsc1>=10000){
	*/
	if(datafile1=="" && datafile=="")
	{
	
	alert("Please Submit Your Valid Documents..");
	
	return false;
	
	}else{
		
		if(datafile1=="")
		{
			datafile1='NA';			
		}
		
		if(datafile=="")
		{
			datafile='NA';			
		}	
	
	
  //alert(actionUrl);
		
	window.location =actionUrl+"&datafile1="+datafile1+"&datafile="+datafile;
	
	
	return true;
}  



	
	}
</script>
<script>
$(function() {
	$('#submit1').click(
			function() {
				var lipp1 = $('#lipp1').val();
				var lipp2= $('#lipp2').val();
				var lipp3= $('#lipp3').val();
				
				var ppf1=$('#ppf1').val();
				var ppf2=$('#ppf2').val();
				var ppf3=$('#ppf3').val();
				
				var nss1=$('#nss1').val();
				var nss2=$('#nss2').val();
				var nss3=$('#nss3').val();
				
				var nsc1=$('#nsc1').val();
				var nsc2=$('#nsc2').val();
				var nsc3=$('#nsc3').val();
				
				var cgb1=$('#cgb1').val();
				var cgb2=$('#cgb2').val();
				var cgb3=$('#cgb3').val();
				
				var lap1=$('#lap1').val();
				var lap2=$('#lap2').val();
				var lap3=$('#lap3').val();
				
				var elss1=$('#elss1').val();
				var elss2=$('#elss2').val();
				var elss3=$('#elss3').val();
				
				
				var npf1=$('#npf1').val();
				var npf2=$('#npf2').val();
				var npf3=$('#npf3').val();
				
				var db1=$('#db1').val();
				var db2=$('#db2').val();
				var db3=$('#db3').val();
				
				var hlr1=$('#hlr1').val();
				var hlr2=$('#hlr2').val();
				var hlr3=$('#hlr3').val();
				
				
				var ies1=$('#ies1').val();
				var ies2=$('#ies2').val();
				var ies3=$('#ies3').val();
				
				var imf1=$('#imf1').val();
				var imf2=$('#imf2').val();
				var imf3=$('#imf3').val();
				
				var tfc1=$('#tfc1').val();
				var tfc2=$('#tfc2').val();
				var tfc3=$('#tfc3').val();
			
				/* ------------------13--------------- */
				
				var jsp1=$('#jsp1').val();
				var jsp2=$('#jsp2').val();
				var jsp3=$('#jsp3').val();
				
				var mpn1=$('#mpn1').val();
				var mpn2=$('#mpn2').val();
				var mpn3=$('#mpn3').val();
				
				var mps1=$('#mps1').val();
				var mps2=$('#mps2').val();
				var mps3=$('#mps3').val();
				
				
				var ms1=$('#ms1').val();
				var ms2=$('#ms2').val();
				var ms3=$('#ms3').val();
				
				var mth1=$('#mth1').val();
				var mth2=$('#mth2').val();
				var mth3=$('#mth3').val();
				
				var mts1=$('#mts1').val();
				var mts2=$('#mts2').val();
				var mts3=$('#mts3').val();
				
				var mtsc1=$('#mtsc1').val();
				var mtsc2=$('#mtsc2').val();
				var mtsc3=$('#mtsc3').val();
				
				/* 2nd table */
				
				var tu1=$('#tu1').val();
				var tu2=$('#tu2').val();
				var tu3=$('#tu3').val();
				
				var tu11=$('#tu11').val();
				var tu12=$('#tu12').val();
				var tu13=$('#tu13').val();
				
			/* required for 3rd table */
				
				var datafile1=$('#datafile1').val();
				var datafile=$('#datafile').val();
				var count=$('#count').val();
				
				alert("datafile2 is"+datafile);
				
				  var dataString = "&lipp1="+lipp1+"&lipp2="+lipp2+"&lipp3="+lipp3+"&ppf1="+ppf1+"&ppf2="+ppf2+"&ppf3="+ppf3+
					"&nss1="+nss1+"&nss2="+nss2+"&nss3="+nss3+"&nsc1="+nsc1+"&nsc2="+nsc2+"&nsc3="+nsc3+
					"&cgb1="+cgb1+"&cgb2="+cgb2+"&cgb3="+cgb3+
					"&lap1="+lap1+"&lap2="+lap2+"&lap3="+lap3+"&elss1="+elss1+"&elss2="+elss2+"&elss3="+elss3+
					"&npf1="+npf1+"&npf2="+npf2+"&npf3="+npf3+
					"&db1="+db1+"&db2="+db2+"&db3="+db3+
					"&hlr1="+hlr1+"&hlr2="+hlr2+"&hlr3="+hlr3+
					"&ies1="+ies1+"&ies2="+ies2+"&ies3="+ies3+
					"&imf1="+imf1+"&imf2="+imf2+"&imf3="+imf3+
					"&tfc1="+tfc1+"&tfc2="+tfc2+"&tfc3="+tfc3+
					
					"&jsp1="+jsp1+"&jsp2="+jsp2+"&jsp3="+jsp3+
					"&mpn1="+mpn1+"&mpn2="+mpn2+"&mpn3="+mpn3+
					"&mps1="+mps1+"&mps2="+mps2+"&mps3="+mps3+
					
					"&ms1="+ms1+"&ms2="+ms2+"&ms3="+ms3+
					"&mth1="+mth1+"&mth2="+mth2+"&mth3="+mth3+
					"&mts1="+mts1+"&mts2="+mts2+"&mts3="+mts3+
					"&mtsc1="+mtsc1+"&mtsc2="+mtsc2+"&mtsc3="+mtsc3+
					
					"&tu1="+tu1+"&tu2="+tu2+"&tu3="+tu3+
					"&tu11="+tu11+"&tu12="+tu12+"&tu13="+tu13+"&datafile1="+datafile1+"&datafile="+datafile;
				
				  if(count>0){
						 alert("You allready declared investment details ! please contact HR");
						 return false;
					 }
				
				//alert("dataString..." + dataString);
				else if((tu1<1) && (tu2<1) && (tu3<1) && (tu11<1) && (tu12<1) && (tu13<1))
					{
				alert("Please Enter at least one value and select checkbox")
				return false;
				}
				else{
				$.ajax({

					url :' postLoginJsp/Benifits_Payments/investmetInsert.jsp',
					type : 'POST',
					data : dataString,
					datatype : 'json',
					success : function(data) {

						alert("investment declaration details are successfully inserted ");
						 /* document.getElementById("submit1").disabled = true; */
							$('#lrmain').html(data).delay(5000).fadeOut();
					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
				}

			})
});


</script>

</head>


<body>

<%
MonthandyearDecide mm=new MonthandyearDecide();
String mm_year=mm.monthyear();

String empPersonalInfoAry11[]=mm_year.split("\\^");
String fy_start = empPersonalInfoAry11[0];
String fy_end =empPersonalInfoAry11[1];


String id = (String) session.getAttribute("empid");
System.out.println("id from choice pay====" + id);

ChoiceFormDetails cfd=new ChoiceFormDetails();
int isExistOrNot=cfd.isExistInvestmentDec(fy_start,fy_end,id);    
System.out.println("isExistOrNot from investment declaration====" + isExistOrNot);

%>


<div class="row" id="lrmain" style="border:2px solid #F5F5F5;  margin-top:15%;">
	<div style="height: 1100px; width: 750px:bg-color:#40e0d0; margin-top: 2%">
	
		<form name="MyForm"action="InvestDec" method="post">
		 <h4>Investment Declaration</h4>
			<h6>
				From Date: &nbsp;<input name="date" type="text"
					value="01-April-<%=fy_start %>" readonly="readonly" /> To Date:&nbsp;<input
					name="date" type="text" value="31-march-<%=fy_end %>" readonly="readonly" />
			</h6>

			<table style="background-color:#dfecf5; width:80%; border:1; cellpadding:0px">
				<caption>Package Distribution</caption>
				
				<input type="hidden" id="count" value="<%=isExistOrNot%>"></input>
				<tr class="headind101">
					<td><h5></h5></td>
					<th>S.No</th>
					<th>Description</th>
					<th>Section</th>
					<th>Limit</th>
					<th>Proposed Amount</th>
					<th>Actual Amount</th>
					<th>Approved Amount</th>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>1</td>
					<td>LIFE INSURANCE POLICY</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="lipp1" type="text" name="lipp1" value='0' onkeypress="return islipp(event)"  maxlength="15"
						onchange="lipp()"></input></td>
					<td><input id="lipp2" type="text" name="lipp2" value='0'
						readonly="readonly"></input></td>
					<td><input id="lipp3" type="text" name="lipp3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>2</td>
					<td>PUBLIC PROVIDENT FUND(PPF)</td>
					<td>80C</td>
					<td>1,50,000.00</td>
					<td><input id="ppf1" type="text" name="ppf1" value='0' onkeypress="return isppf(event)"  maxlength="15"
						onchange="ppf()"></input></td>
					<td><input id="ppf2" type="text" name="ppf2" value='0'
						readonly="readonly"></input></td>
					<td><input id="ppf3" type="text" name="ppf3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>3</td>
					<td>NATIONAL SAVING SCHEME(NSS)</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="nss1" type="text" name="nss1" value='0' onkeypress="return isnss(event)"  maxlength="15"
						onchange="nss()"></input></td>
					<td><input id="nss2" type="text" name="nss2" value='0'
						readonly="readonly"></input></td>
					<td><input id="nss3" type="text" name="nss3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>4</td>
					<td>NSC(VIII ISSUE)</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="nsc1" type="text" name="nsc1" value='0' onkeypress="return isnsc(event)"  maxlength="15"
						onchange="nsc()"></input></td>
					<td><input id="nsc2" type="text" name="nsc2" value='0'
						readonly="readonly"></input></td>
					<td><input id="nsc3" type="text" name="nsc3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>5</td>
					<td>CONTRIBUTION TO GOVT.INFRASTRUTURE BONDS UNDER SEC</td>
					<td>80CCF</td>
					<td>20,000.00</td>
					<td><input id="cgb1" type="text" name="cgb1" value='0' onkeypress="return iscgb(event)"  maxlength="15"
						onchange="cgb()"></input></td>
					<td><input id="cgb2" type="text" name="cgb2" value='0'
						readonly="readonly"></input></td>
					<td><input id="cgb3" type="text" name="cgb3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>6</td>
					<td>LIC ANNITY PLAN</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="lap1" type="text" name="lap1" value='0' onkeypress="return islap(event)"  maxlength="15"
						onchange="lap()"></input></td>
					<td><input id="lap2" type="text" name="lap2" value='0'
						readonly="readonly"></input></td>
					<td><input id="lap3" type="text" name="lap3" value='0'
						readonly="readonly"></input></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td>7</td>
					<td>EQUITY LINKED SAVING SCHEME</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="elss1" type="text" name="elss1" value='0' onkeypress="return iselss(event)"  maxlength="15"
						onchange="elss()"></input></td>
					<td><input id="elss2" type="text" name="elss2" value='0'
						readonly="readonly"></input></td>
					<td><input id="elss3" type="text" name="elss3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>8</td>
					<td>NOTIFIED PENSION FUND</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="npf1" type="text" name="npf1" value='0' onkeypress="return isnpf(event)"  maxlength="15"
						onchange="npf()"></input></td>
					<td><input id="npf2" type="text" name="npf2" value='0'
						readonly="readonly"></input></td>
					<td><input id="npf3" type="text" name="npf3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>9</td>
					<td>DEPOSIT SCHEME OF NATIONAL HOUSING BANK</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="db1" type="text" name="db1" value='0' onkeypress="return isdb(event)"  maxlength="15"
						onchange="db()"></input></td>
					<td><input id="db2" type="text" name="db2" value='0'
						readonly="readonly"></input></td>
					<td><input id="db3" type="text" name="db3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>10</td>
					<td>HOUSING LOAN REPAYMENT(PRINCIPAL)</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="hlr1" type="text" name="hlr1" value='0' onkeypress="return ishlr(event)"  maxlength="15"
						onchange="hlr()"></input></td>
					<td><input id="hlr2" type="text" name="hlr2" value='0'
						readonly="readonly"></input></td>
					<td><input id="hlr3" type="text" name="hlr3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>11</td>
					<td>INFRASTRUCUTE EQUITY SHARES/DEBENTURES</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="ies1" type="text" name="ies1" value='0' onkeypress="return isies(event)"  maxlength="15"
						onchange="ies()"></input></td>
					<td><input id="ies2" type="text" name="ies2" value='0'
						readonly="readonly"></input></td>
					<td><input id="ies3" type="text" name="ies3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>12</td>
					<td>INFRASTRUCTURE MUTUAL FUND</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="imf1" type="text" name="imf1" value='0' onkeypress="return isimf(event)"  maxlength="15"
						onchange="imf()"></input></td>
					<td><input id="imf2" type="text" name="imf2" value='0'
						readonly="readonly"></input></td>
					<td><input id="imf3" type="text" name="imf3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>13</td>
					<td>TUTION FEES FOR CHILDREN</td>
					<td>80C</td>
					<td>0.00</td>
					<td><input id="tfc1" type="text" name="tfc1" value='0' onkeypress="return istfc(event)"  maxlength="15"
						onchange="tf1()"></input></td>
					<td><input id="tfc2" type="text" name="tfc2" value='0'
						readonly="readonly"></input></td>
					<td><input id="tfc3" type="text" name="tfc3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>14</td>
					<td>LIC JEEVAN SURAKSHA-PENSION FUND</td>
					<td>80CCC</td>
					<td>10,000.00</td>
					<td><input id="jsp1" type="text" name="jsp1" value='0' onkeypress="return isjeevan(event)"  maxlength="15"
						onchange="jeevan()"></input></td>
					<td><input id="jsp2" type="text" name="jsp2" value='0'
						readonly="readonly"></input></td>
					<td><input id="jsp3" type="text" name="jsp3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>15</td>
					<td>MEDICLAIM-PARENT(NON SENIOR CITIZEN)</td>
					<td>80D</td>
					<td>15,000.00</td>
					<td><input id="mpn1" type="text" name="mpn1" value='0' onkeypress="return ismpn(event)"  maxlength="15"
						onchange="mpn()"></input></td>
					<td><input id="mpn2" type="text" name="mpn2" value='0'
						readonly="readonly"></input></td>
					<td><input id="mpn3" type="text" name="mpn3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>16</td>
					<td>MEDICLAIM-PARENT(SENIOR CITIZEN)</td>
					<td>80D</td>
					<td>20,000.00</td>
					
					<td><input id="mps1" type="text" name="mps1" value='0' onkeypress="return ismps(event)"  maxlength="15"
						onchange="mps()"></input></td>
					<td><input id="mps2" type="text" name="mps2" value='0'
						readonly="readonly"></input></td>
					<td><input id="mps3" type="text" name="mps3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>17</td>
					<td>MEDICLAIM-SELF/SPOUSE/CHILDREN</td>
					<td>80D</td>
					<td>15,000.00</td>
					<td><input id="ms1" type="text" name="ms1" value='0' onkeypress="return isms(event)"  maxlength="15"
						onchange="ms()"></input></td>
					<td><input id="ms2" type="text" name="ms2" value='0'
						readonly="readonly"></input></td>
					<td><input id="ms3" type="text" name="ms3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>18</td>
					<td>MEDCL TRMNT-HANDICAPPED DEPENDENT</td>
					<td>80DD</td>
					<td>75,000.00</td>
					<td><input id="mth1" type="text" name="mth1" value='0' onkeypress="return ismth(event)"  maxlength="15"
						onchange="mth()"></input></td>
					<td><input id="mth2" type="text" name="mth2" value='0'
						readonly="readonly"></input></td>
					<td><input id="mth3" type="text" name="mth3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>19</td>
					<td>MEDCL TRMNT-SPECF DISEASE-SELF/DEPENDENT</td>
					<td>80DDB</td>
					<td>40,000.00</td>
					<td><input id="mts1" type="text" name="mts1" value='0' onkeypress="return ismts(event)"  maxlength="15"
						onchange="mts()"></input></td>
					<td><input id="mts2" type="text" name="mts2" value='0'
						readonly="readonly"></input></td>
					<td><input id="mts3" type="text" name="mts3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>20</td>
					<td>MEDCL TRMNT-SPECF DISEASE-SENIOR CITIZEN</td>
					<td>80DDB</td>
					<td>60,000.00</td>
					<td><input id="mtsc1" type="text" name="mtsc1" value='0' onkeypress="return ismtsc(event)"  maxlength="15"
						onchange="mtsc()"></input></td>
					<td><input id="mtsc2" type="text" name="mtsc2" value='0'
						readonly="readonly"></input></td>
					<td><input id="mtsc3" type="text" name="mtsc3" value='0'
						readonly="readonly"></input></td>
				</tr>
			</table>
			<table style="background-color:#dfecf5; width:80%; border:1;cellpadding:0px;">
				<caption>
					<i>Certify</i>
				</caption>
				<tr>
					<td><input id="certify" type="checkbox" name="certify"
						value="" onclick="calculate()"/> Declaration:I hereby
							declare that i will be making the above stated Investment during
							the financial year2015-16 </td>
				</tr>
			</table>
			<table style="background-color:#dfecf5; width:80%; border:1;cellpadding:0px;">
				<caption>
					<b>Summary</b>
				</caption>
				<tr>
					<th>Totals</th>
					<th>Proposed</th>
					<th>Actual</th>
					<th>Approved</th>
				</tr>
				<tr>
					<td>Total Under 80C</td>
					<td><input id="tu1" type="text" name="tu1" value='0' readonly="readonly"></input></td>
					<td><input id="tu2" type="text" name="tu2" value='0'
						readonly="readonly"></input></td>
					<td><input id="tu3" type="text" name="tu3" value='0'
						readonly="readonly"></input></td>
				</tr>
				<tr>
					<td>Total Under 80</td>
					<td><input id="tu11" type="text" name="tu11" value='0'
						readonly="readonly"></input></td>
					<td><input id="tu12" type="text" name="tu12" value='0'
						readonly="readonly"></input></td>
					<td><input id="tu13" type="text" name="tu13" value='0'
						readonly="readonly"></input></td>
				</tr>
			</table>

			<table style="background-color:#dfecf5; width:80%; border:1;cellpadding:0px;">

				<form name="fileUp1">
					<tr>
						<td height="30" class="logintext"><strong>Select File</strong></td>
						<td height="30">
						<input name="datafile1" type="file" 
							accept="application/pdf" class="tbdsptxt" id="datafile1" /></td>
						<td height="30" width="692"><label> 
						<input name="fButton" type="button" class="sbtbtn" onClick="fileUploads(this.form,'UploadServlet','upload1'); return false;"value="Upload">
						</label></td>
						<td colspan="3" align="center"><div id="upload1"></div></td>
					</tr>

					</td>
					</tr>

				</form>
			</table>



			<table style="background-color:#dfecf5; width:80%; border:1;cellpadding:0px;">

				<form name="fileUp">
					<tr>
						<td height="30" class="logintext"><strong>Select File</strong></td>
						<td height="30"><input name="datafile" type="file"
							accept="application/pdf" class="tbdsptxt" id="datafile" /></td>
						<td height="30" width="692"><label> <input name="fButton" type="button" class="sbtbtn" onclick="fileUpload(this.form,'UploadServlet','upload'); return false;" value="Upload"/></label></td>
						<td colspan="3" align="center"><div id="upload"></div></td>
					
					</tr>

				</form>
			</table>
					
			<div>
			<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="submit1" type="button" class="myHoverButton" value="SAVE" ></input>
				<br></br>

			</div>
		</form>
		<br></br>
	</div>
	</div>
</body>
</html>
