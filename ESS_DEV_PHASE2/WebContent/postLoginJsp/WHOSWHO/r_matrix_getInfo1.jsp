<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ess.common.action.EmployeeDetails" %>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
/* r_matrix_table */
#dynamic_id{
width:  50%;
}
</style>
<!-- <script>
$(function() {
	$("#rmgrname").click(function() {
		//alert("rmgrname");
		var empmailid = $('#empmailid').val();
		
		var dataString="&empmailid="+empmailid;
		
		$.ajax({
		    url : 'postLoginJsp/WHOSWHO/r_matrix_info_rmname.jsp', 
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				// $('#r_matrix_res_new').html(data).delay(5000).fadeOut();  
				$('#r_matrix_res_new').html(data);
			},
			error : function(jqXHR, textStatus,
					errorThrown) {

			}
		});
		
	});
	
});


$(function() {
	$("#funHead").click(function() {
		//alert("funHead");
		var empmailid = $('#empmailid').val();
		
		var dataString="&empmailid="+empmailid;
		
		$.ajax({
		    url : 'postLoginJsp/WHOSWHO/r_matrix_info_funcHeadName.jsp', 
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				// $('#r_matrix_res_new').html(data).delay(5000).fadeOut();  
				$('#r_matrix_res_new').html(data);
			},
			error : function(jqXHR, textStatus,
					errorThrown) {

			}
		});
		
	});
	
});

$(function() {
	$("#busiHead").click(function() {
		//alert("busiHead");
		var empmailid = $('#empmailid').val();
		
		var dataString="&empmailid="+empmailid;
		
		$.ajax({
		    url : 'postLoginJsp/WHOSWHO/r_matrix_info_busiHeadName.jsp', 
			type : 'POST',
			data : dataString,
			datatype : 'json',
			success : function(data) {
				// $('#r_matrix_res_new').html(data).delay(5000).fadeOut();  
				$('#r_matrix_res_new').html(data);
			},
			error : function(jqXHR, textStatus,
					errorThrown) {

			}
		});
		
	});
	
});


</script>
 -->
<!-- <script type="text/javascript">
    function changeColor1(id) {
        var tabs = document.getElementsByClassName('active1')
        for (var i = 0; i < tabs.length; ++i) {
            var item = tabs[i];
            item.style.backgroundColor = (item.id == id) ? "red" : "green"; 
       }
    }
     
    function changeColor2(id) {
        var tabs = document.getElementsByClassName('active2')
        for (var i = 0; i < tabs.length; ++i) {
            var item = tabs[i];
          /*   item.style.backgroundColor = (item.id == id) ? "red" : "green"; */
            item.style.backgroundColor = (item.id == id) ? "red" : "green",
         active3.style.backgroundColor =  "yellow" ;
        }
    }
   
     function changeColor3(id) {
        var tabs = document.getElementsByClassName('active3')
        for (var i = 0; i < tabs.length; ++i) {
            var item = tabs[i];
            item.style.backgroundColor = "98c3e2";
            //item.style.backgroundColor = (item.id == active3) ? "red" : "#98c3e2";
        } 
        
    } 
</script> -->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>

<script type="text/javascript">

var make_button_active = function()
{
  //Get item siblings
  var siblings =($(this).siblings());

  //Remove active class on all buttons
  siblings.each(function (index)
    {
      $(this).removeClass('active');
    }
  )


  //Add the clicked button class
  $(this).addClass('active');
}

//Attach events to menu
$(document).ready(
  function()
  {
    $(".active").click(make_button_active);
  }  
)

</script>

<style>
.active {
        background-color: #f90;
    }

</style>





</head>
<body>


<table id="r_matrix_table">
<tr style="background-color: #B0C4DE;">
<th >&nbsp;&nbsp;&nbsp;</th>
		<th>S.No.</th>
		<th id="dynamic_id">Name</th>
		<th>Level</th>
</tr>

	<%
	String input_value=request.getParameter("checked_matrix_radio");
	System.out.println("jsp input value1.."+input_value);
	
	ArrayList<Object> leaveOV1 = EmployeeDetails.r_matrix_info_self_details(input_value);
	System.out.println("leaveOV1.size()... "+leaveOV1.size() );
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
		    String business_heade = empDataAry[8];
		    String hr = empDataAry[9];
%>

<%
ArrayList<Object> newobj = EmployeeDetails.r_matrix_info_self(input_value);
System.out.println("newobj.size()... "+newobj.size() );
if (newobj.size() > 0) {
	for (int j = 0; j < newobj.size(); j++) {

		String employeedata2 = newobj.get(j).toString();
		
		String empDataAry2[] = employeedata2.split("\\^");
		String empFname_rm = empDataAry2[0];
		String empLname_rm = empDataAry2[1];

%>



 <tr>
 <input type="hidden" value="<%=empEmail %>" id="empmailid"/>
<td style="background-color: #B0C4DE;">&nbsp;&nbsp;&nbsp;</td>
			<td style="background-color:#E2BC72"><!-- <input type="button" value="1"
				style="width: 102%; height: 121%; background-color:;" class="active"
				onClick="changeColor1(this.id)"> -->
				1
				</td>
				
			<td  id="dynamic_id"><div id="r_matrix_res_new"><%=empFname_rm%>&nbsp;<%=empLname_rm%></div></td>
			
			<td style="background-color:#E2BC72" id="rmgrname"><!-- <input type="text"
				value="Reporting Manager" id="rmgrname" readonly="readonly"
				style="background-color:;" class="active"> -->
				Reporting Manager
				</td>

		</tr>

<tr>
<td style="background-color: #B0C4DE;">&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #DFECF5;">2<!-- <input type="button" value="2" style="width: 102%; height: 121%;background-color: #DFECF5;"   class="active1" onClick="changeColor1(this.id)"> -->
</td>
<td><%=hr %></td>
<td style="background-color: #DFECF5;" class="active2" onClick="changeColor2(this.id)" id="funHead">Functional Head
<!-- <input type="text" value="Functional Head" id="funHead"  readonly="readonly" style="background-color:#DFECF5" class="active1"> --></td>
</tr>

<tr>
<td style="background-color: #B0C4DE;">&nbsp;&nbsp;&nbsp;</td>
<td style="background-color: #DFECF5;">3
<!-- <input type="button" value="3" style="width: 102%; height: 121%; background-color: #DFECF5;" class="active3" onClick="changeColor3(this.id)"> -->
</td>
<td><%=business_heade %></td>
<td style="background-color: #DFECF5;" id="busiHead" >Business Head
<!-- <input type="text" value="Business Head" id="busiHead"  readonly="readonly" style="background-color:#DFECF5" class="active3" > -->
</td>
</tr>


<%
	}}
		}
	}else {

%>

<tr>
						<td colspan="3">No Records Found</td>
					</tr>

					<%
						}
					%>
					
	</table>
	
	
</body>
</html>