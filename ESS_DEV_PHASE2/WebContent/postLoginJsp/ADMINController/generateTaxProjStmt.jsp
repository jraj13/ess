<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="com.ess.common.action.EmployeeDetails"%>
    <%@ page import="java.lang.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="postloginresource/jquery-ui.css">
<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script> 

<script>


$(function () {
    $("#checkAll").click(function () {
        if ($("#checkAll").is(':checked')) {
            $(".book").prop("checked", true);
        } else {
            $(".book").prop("checked", false);
        }
    });
    
    $("#UnCheckIt").click(function () {
		
    	$('input:checkbox[name=empid]').attr('checked',false);
    			
        });	
});


	</script>
	
<script type="text/javascript">
    $(document).ready(function() {
        $("button").click(function(){
            var favorite = [];
            
            $.each($("input[name='empid']:checked"), function(){            
                favorite.push($(this).val());
            });
          //  alert("Selected data: " + favorite.join("; "));
            var dataString='&value=' + favorite.join("; ");

    		//alert(dataString);
    				$.ajax({
    					url :'postLoginJsp/ADMINController/generateTaxProjStmtSuccess.jsp',
    					type : 'POST',
    					data : dataString,
    					datatype : 'json',
    					success : function(data) {
    					//alert("Tax projection report generated successfully");
    						// $('#lrmain').html(data).delay(5000).fadeOut(); 
    						$('#lrmain').html(data);
    					},
    					error : function(jqXHR, textStatus, errorThrown) {

    					}
    				});
        });
    });

</script>
</head>


<body>
<br>
<div id="lrmain">
<table id="tab1" align="center" width="30%">

<tr align="center">
			<%
	java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MMM/yyyy");
					
	 String var1=df.format(new java.util.Date());
		String[] date=var1.split("/");
		//out.println("year======="+date[2]);
	%>
<center>
<input type="checkbox" id="checkAll" value="Select All" name="empid1" />&nbsp;<label>SELECT ALL</label> &nbsp;&nbsp;
<label>MONTH</label>&nbsp;<input type="text" id="month" value="<%=date[1].toUpperCase() %>" size="5" style="height:30px" readonly="readonly" /> &nbsp;&nbsp;
 <input type='button' value='Reset' id='UnCheckIt'>&nbsp;&nbsp;
 <!-- <input type="button" id="testB" onclick="submit(document.getElementsByTagName('input'))" value="Generate Tax Projection"  /> &nbsp;&nbsp; -->
 <button type="button">Generate Tax Projection</button> &nbsp;&nbsp; 
</center>
</tr>


<!-- </table> -->
<br>
	<!-- <table  id="tab2" align="center" width="50%"> -->
		<tr style="background-color: #40E0D0">

			<th>SELECT</th>
			<th>EMP ID</th>
			<th>EMP NAME</th>
		
			   
		</tr>
		<%
			ArrayList<String> leaveOV1 = EmployeeDetails.getAllEmployeeInfo();
			if (leaveOV1.size() > 0) {
				for (int i = 0; i < leaveOV1.size(); i++) {
					String employeedata = leaveOV1.get(i).toString();
					
					String empDataAry[] = employeedata.split("\\^");
					String empId = empDataAry[0];
					String empFname = empDataAry[1];
					String empLname = empDataAry[2];
					String joiningDate = empDataAry[3];
					String empDob = empDataAry[4];
					String empDesig = empDataAry[5];
					String empEmail = empDataAry[6];
					String repManager = empDataAry[7];
					String empCtc = empDataAry[8];
				    String status = empDataAry[9]; 
					String remarks = empDataAry[10];
				   /*  String Dor = empDataAry[11];  */
				   	String counter=empDataAry[12];
					System.out.println("counter.."+counter);
		%>

		<tr align="center">
		<%--  <td style="background-color: #4682B4"><input type="button" id="<%=empId%>" value="Edit"  onclick="editFunction(id);"/> </td> --%> 
	    <%--   <td style="background-color: #4682B4"><input type="radio" name="radio"   onclick="confirm_deletion('<%=empId%>');" /></td> --%>
			
			 <td ><input type="checkbox" class="book" id="chkbx" name="empid" value="<%=empId %>,<%=date[1].toUpperCase() %>" onchange="fnTest(this);"/> </td>
			 
			 <td><input type="text" id="empid" name="empid" size="10" value="<%=empId%>"  style="background-color:white;color:black" readonly="readonly" /></td>
			 <td><input type="text" id="empfn" name="empid" size="30" value="<%=empFname%> &nbsp;<%=empLname%>" style="background-color:white;color:black" readonly="readonly" /></td>
	
	
	
			 <%-- <td><%=empId%></td>
			 <td><%=empFname%> &nbsp;<%=empLname%></td> --%>
			 
	
		</tr>
		<%
			}
			}else {
		%>
							<tr>
								<td colspan="10">No Records</td>
							</tr>

							<%
								}
			
							%>
	
	</table>
	
	</div>

</body>
</html>
