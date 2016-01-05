<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>



<head><link rel="stylesheet" type="text/css" media="all" href="csstiles/style.css" />
<!-- script for phone validation -->


 <!-- <script type="text/javascript" src="regjs/regformvalidation.js"></script> --> 
 <script type="text/javascript" src="regjs/registrationpagevalidate.js"></script>
 <script type="text/javascript" src="regjs/panvalidate.js"></script> 
 
<script type="text/javascript">

    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };

</script>

 
</head>

  <div id="header">
    <tiles:insertAttribute name="header" />
 </div>
    <div id="sidebar" style="margin-top:0.5%;margin-left:-1%;height:2350px;padding-bottom:3%">
        <tiles:insertAttribute name="menu" />
    </div>
    <%-- <div id="content">
        <tiles:insertAttribute name="body" />  --%>

 


  
    
<div style="height:2350px;width:750px:bg-color:#40e0d0;margin-top:2%">
<B> Please Fill Registration Form..</B><br/>

<form name="form" action="regsuccess" onSubmit="return Validation()"  method="post">

<table align="center" width=50% width="100%" cellspacing="2" cellpadding="2" border="5">

    <tr>
        <td colspan="2" align="center"><b>Employee Registration Form</b></td>
       
    </tr>
   <!--  <tr>
        <td align="left" valign="top" width="41%">
			<label for="regBean.image" class="label">Upload Image</label><span style="color:red"></span>
		</td>
		<td width="57%" height="100"><label for="regBean.image" class="label"></label>
			<input type="text" id="image" name="regBean.image" size="20">
			<input type="button" value="Browse">
		</td>
    </tr> -->
    <tr>
    <td align="left" valign="top" width="50%">
    <label for="regBean.photo" class="label">Employee Photo</label><span style="color:red">*</span>
    </td> 
    <td>
	<img id="uploadPreview" style="width: 100px; height: 100px;" />
    	
		<input id="uploadImage" type="file" name="myPhoto" accept="image/*" onchange="PreviewImage();" />
  </td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
			<label for="regBean.employeeid" class="label">Employee Id</label><span style="color:red">*</span>
		</td>
		<td width="57%">
			<input type="text" id="employeeid" name="regBean.employeeid" size="24">
		</td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">
        <p id="p1"></p>
			<label for="regBean.fname" class="label">Employee First Name</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="fname" name="regBean.fname" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.lname" class="label">Employee Last Name</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="lname"name="regBean.lname" size="24"></td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.dob" class="label">Employee DOB</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="dob" name="regBean.dob" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.pannum" class="label">Employee PAN</label><span style="color:red">*</span></td>
 
        <td width="57%" height="50" ><span id="status" style="color:red">*</span><input type="text" id="pannum" name="regBean.pannum" onkeyup="pan_validate(this.value);" maxlength="10" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.passportnum" class="label">Employee Passport Number</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.passportnum" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.uid" class="label">Employee UID</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.uid" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.phnumone" class="label">PH Num1</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="phnumone" name="regBean.phnumone" size="24"  ></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.phnumtwo" class="label">PH Num2</label></td>
 
        <td width="57%"><input type="text"  name="regBean.phnumtwo" size="24" id="phone" ></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.designation" class="label">Employee Designation</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.designation" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.rmanager" class="label">Employee Reporting Manager</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.rmanager" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.ctc" class="label">Employee CTC</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.ctc" size="24"></td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">
        <p id="p3"></p>
        <label for="regBean.emailid" class="label">Email</label><span style="color:red">*</span></td>
        <td width="57%">
        <input type="text" id="emailid" name="regBean.emailid" size="24"></td>
    </tr>
     <tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.visainfo" class="label">VISA Info</label></td>
        <td width="57%">
		<select name="regBean.visainfo">
			<option value="none">None</option>
			<option value="h1">h1</option>
			<option value="b1">b1</option>
			<option value="l1">l1</option>
</select>
        </td>
    </tr>
	<tr>
        <td colspan="2" align="center"><b>Employee Personal Details</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.mstatus" class="label">Employee Marital Status</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="radio" value="Single" id="mstatus" name="regBean.mstatus">Single<input type="radio" value="Married" name="regBean.mstatus">Married<input type="radio" value="Divorse" name="regBean.mstatus">Divorse</td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.mothername" class="label">Mother Name</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="mothername" name="regBean.mothername" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.motherdob" class="label">Mother DOB</label><span style="color:red">*</span></td>
 
        <td width="57%"><input type="text" id="motherdob" name="regBean.motherdob" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.spousename" class="label">Spouse Name</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.spousename" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.spousedob" class="label">Spouse DOB</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.spousedob" size="24"></td>
    </tr>
    <tr>
        <td align="left" valign="top" width="41%">Child 1</td>
 
        <td width="57%"><label for="regBean.childname1" class="label">Name</label>&nbsp;&nbsp;<input type="text"  name="regBean.childname1" size="24"/>
		<br/><br/><label for="regBean.childob1" class="label">DOB</label>&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.childob1" size="24"/>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Child 2</td>
 
        <td width="57%"><label for="regBean.childname2" class="label">Name</label>&nbsp;&nbsp;<input type="text"  name="regBean.childname2" size="24"/>
		<br/><br/><label for="regBean.childob2" class="label">DOB</label>&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.childob2" size="24"/>
		</td>
    </tr>
    
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.currentaddr" class="label">Current Address</label></td>
 
        <td width="57%"><textarea type="text" value="" name="regBean.currentaddr" size="24"></textarea></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.permaddr" class="label">Permanent Address</label></td>
 
        <td width="57%"><textarea type="text" value="" name="regBean.permaddr" size="24"></textarea></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.emergcontact" class="label">Emergency Contact Number</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.emergcontact" size="24"></td>
    </tr>
	<tr>
        <td colspan="2" align="center"><b>Employee Educational Information.</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg1" class="label">Degree Name</label>&nbsp;&nbsp;<input type="text"  name="regBean.hiqualdeg1" size="24"/>
		<br/><br/><label for="regBean.hiqualperc1" class="label">Percentage</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualperc1" size="24"/>
		<br/><br/><label for="regBean.hiqualpassout1" class="label">Passout</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualpassout1" size="24"/>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">2nd Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg2" class="label">Degree Name</label>&nbsp;&nbsp;<input type="text"  name="regBean.hiqualdeg2" size="24"/>
        <br/><br/><label for="regBean.hiqualperc2" class="label">Percentage</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualperc2" size="24"/>
		<br/><br/><label for="regBean.hiqualpassout2" class="label">Passout</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualpassout2" size="24"/>
		
		</td>	
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">3rd Highest Qualification</td>
 
        <td width="57%"><label for="regBean.hiqualdeg3" class="label">Degree Name </label>&nbsp;&nbsp;<input type="text"  name="regBean.hiqualdeg3" size="24"/>
        <br/><br/><label for="regBean.hiqualperc3" class="label">Percentage</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualperc3" size="24"/>
		<br/><br/><label for="regBean.hiqualpassout3" class="label">Passout</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="regBean.hiqualpassout3" size="24"/>
		
		</td>
    </tr>
    
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.certifications1" class="label">Certifications 1</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications1" size="24"></td>
        
    </tr>
    <tr>
    <td>
      <label for="regBean.certifications2" class="label">Certifications 2</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications2" size="24"></td>
 
 </tr>
 
 <tr>
 <td>
 <label for="regBean.certifications3" class="label">Certifications 3</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.certifications3" size="24"></td>
 </tr>
 
 
	<tr>
        <td colspan="2" align="center"><b>Previous Employment Information.</b></td>
        
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">
        <label for="regBean.experience" class="label">Total Experience</label></td>
 
        <td width="57%"><input type="text" value="" name="regBean.experience" size="24"></td>
    </tr>
	<tr>
        <td align="left" valign="top" width="41%">Previous Organization 1 Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname1" class="label">Emp ORG Name </label>&nbsp;&nbsp;<input type="text" value="" name="regBean.preorgname1" size="24"><br>
		<br/><label for="yearsworked1" class="label">Years Of Worked</label>&nbsp;&nbsp;<input type="text" value="" name="yearsworked1" size="24"><br></br>
		<label for="regBean.refname1" class="label">ORG Ref Name</label>&nbsp;<input type="text" value="" name="regBean.refname1" size="24"><br><br/>
		<label for="regBean.refmailid1" class="label">ORG Ref EmailId</label>&nbsp;<input type="text" value="" name="regBean.refmailid1" size="24"><br><br/>
		<label for="regBean.refphnumber1" class="label">ORG Ref PhoneNum</label>&nbsp;<input type="text" value="" name="regBean.refnumber1" size="24"><br>
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Previous Organization 2 Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname2" class="label">Emp ORG Name</label>&nbsp;&nbsp;<input type="text" value="" name="regBean.preorgname2" size="24"><br/>
		<br/><label for="yearsworked2" class="label">Years Of Worked</label>&nbsp;&nbsp;<input type="text" value="" name="yearsworked2" size="24"><br/><br/>
		<label for="regBean.refname2" class="label">ORG Ref Name</label>&nbsp;&nbsp;<input type="text" value="" name="regBean.refname2" size="24"><br/><br/>
		<label for="regBean.refmailid2" class="label">ORG Ref EmailId</label>&nbsp;&nbsp;<input type="text" value="" name="regBean.refmailid2" size="24"><br><br/>
		<!-- <label for="regBean.refphnumber2" class="label">ORG Reference Phone Number</label><br><input type="text" value="" name="regBean.refnumber2" size="24"><br> -->
		</td>
    </tr>
    
    <tr>
        <td align="left" valign="top" width="41%">Previous Organization 3  Details</td>
 
        <td width="57%">
		<label for="regBean.preorgname3" class="label">Emp ORG Name </label>&nbsp;&nbsp;<input type="text" value="" name="regBean.preorgname3" size="24"><br>
		<br/><label for="yearsworked3" class="label">Years Of Worked</label>&nbsp;&nbsp;<input type="text" value="" name="yearsworked3" size="24"><br><br>
		<label for="regBean.refname3" class="label">ORG Ref Name</label>&nbsp;&nbsp;<input type="text" value="" name="regBean.refname3" size="24"><br><br>
		<label for="regBean.refmailid3" class="label">ORG Ref EmailId</label>&nbsp;&nbsp;<input type="text" value="" name="regBean.refmailid3" size="24"><br><br>
		<!-- <label for="regBean.refphnumber3" class="label">ORG Reference Phone Number</label><br><input type="text" value="" name="regBean.refnumber3" size="24"><br> -->
		</td>
    </tr>
     
    <tr>
        <td colspan="2">
        <p align="center">
		 <input type="reset" value="  Clear All   " name="clear">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="  Submit" name="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value=" Cancel " name="cancel">
       </td>
    </tr>
    
 </table>
</form>
</div>

<div id="footer" style="margin-left:-1%">
        <tiles:insertAttribute name="footer" />
    </div>



</html>