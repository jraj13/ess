<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
<head>
<title>Load Page Dynamically inside a jQuery UI Dialog</title>

<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
	
<link rel="stylesheet" href="../../date/jquery-ui.css">
<script src="../../date/jquery-1.10.2.js"></script>
<script src="../../date/jquery-ui.js"></script>


<script type="text/javascript">
$(function($) {
		 $(document).ready(function(){
	 $('#sd').datepicker({
	 showOnFocus: false,
	
	 pickerClass: 'noPrevNext',
	   numberOfMonths: 1,
	       dateFormat: 'yy-mm-dd',
	       
	   /*    minDate: '0', */
	       maxDate: '+1Y',
	             onSelect: function(dateStr) {
	                   var min = $(this).datepicker('getDate');
	                   $('#ed').datepicker('option', 'minDate', min || '0');
	                   cal();
	       }});
		/*  }); */
		 
	 $('#ed').datepicker({
	 showOnFocus: false,
	
	 pickerClass: 'noPrevNext',
	   numberOfMonths: 1,
	       dateFormat: 'yy-mm-dd',
	       minDate: '0',
	       maxDate: '+1Y',
	             onSelect: function(dateStr) {
	                   var max = $(this).datepicker('getDate');
	                   $('#sd').datepicker('option', 'maxDate', max || '+1Y');
	                   
	                   cal();                                               
	       }});
	   });
	});
	
        function cal(){
        if(document.getElementById("ed")){
            document.getElementById("used").value=GetDays();
        }  
        function GetDays(){
                var dropdt = new Date(document.getElementById("ed").value);
                var pickdt = new Date(document.getElementById("sd").value);
               var noOf=parseInt((dropdt - pickdt) / (24 * 3600 * 1000)+1);
          
            	   if(noOf<1)
            		   {
            		   alert("Selected Start Date and End Date is not valid");
            		   return 0;
            		   }
            	   else{
            		   return noOf;
            	   }
              
        }
    }

    </script> 
 
 
 
 
 
<!--  <script>

        function cal(){
        	
        	var choice=document.getElementById("choice1").value;
        	//alert(choice);
            var pl=document.getElementById("pl").value;
            var sl=document.getElementById("sl").value;
            var cl=document.getElementById("cl").value;
            var advancepl=document.getElementById("advancepl").value;
            var oph=document.getElementById("sl").value;
            var advancesl=document.getElementById("oph").value;
            var outdoor=document.getElementById("outdoor").value;
            var lwp=document.getElementById("lwp").value;
            var location=document.getElementById("location").value;
            var working=document.getElementById("working").value;
            var leave=document.getElementById("paternity").value;
            
                var dropdt = new Date(document.getElementById("datepicker2").value);
                
                var pickdt = new Date(document.getElementById("datepicker1").value);
               // alert(pickdt);
                
               var noOf=parseInt((dropdt - pickdt) / (24 * 3600 * 1000)+1);
              // alert("days============"+noOf)
               
               //alert("pl info"+pl);
               if(isNaN(noOf)){
            	   alert("please select Start Date");
            	   document.getElementById("datepicker2").value=" ";
               }
               else if(choice=="Type of Leave"){
            	   alert("please choose Type of Leave");
            	   document.getElementById("datepicker2").value=" ";
               }
              
               else if(noOf<1)
            		   {
            		   alert("Selected Start Date and End Date is not valid");
            		   document.getElementById("absence1").value="0";
            		   document.getElementById("datepicker2").value=" ";
            		   
            		   }
            	   else if(choice=="PL" && noOf>pl) {
                       		alert("Please select with in available PL="+pl+ " days only");
                       	 document.getElementById("absence1").value="0";
                       	document.getElementById("datepicker2").value=" ";
                       		}
            	   else if(choice=="SL" && noOf>sl){
            		   alert("Please select with in available SL days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="CL" && noOf>cl){
            		   lert("Please select with in available CL days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Advance PL" && noOf>advancepl){
            		   alert("Please select with in available Advance PL days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="OPH" && noOf>oph){
            		   alert("Please select with in available OPH days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Advance SL" && noOf>advancesl){
            		   alert("Please select with in available Advance SL days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Outdoor Duty" && noOf>outdoor){
            		   alert("Please select with in available Outdoor Duty days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Leave Without Pay(LWP)" && noOf>lwp){
            		   alert("Please select with in available Leave Without Pay(LWP) days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Present_Non ART Location" && noOf>location){
            		   alert("Please select with in available Present_Non ART Location days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Present-ART Not Working" && noOf>working){
            		   alert("Please select with in available Present-ART Not Working days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else if(choice=="Paternity Leave" && noOf>leave){
            		   alert("Please select with in available Paternity Leave days only");
                     	 document.getElementById("absence1").value="0";
                     	document.getElementById("datepicker2").value=" ";
            	   }
            	   else {
            		   document.getElementById("absence1").value=noOf;
            	   }
        }
            		   
            		   

    </script>
  -->
<script>




	$(function() {

		$('#submit').click(function() {

			//alert("Am In Btn new  Click update");
			
		 var sid = $('#sid').val();
		 
		var tol = $('#tol').val();
		var sd = $('#sd').val();
		
		var ed = $('#ed').val();
		//alert("end date"+ed)
		
		var np = $('#np').val();
		var ss = $('#sts').val();
		var used = $('#used').val();
		
		//alert("used values.....**"+used); 
			
	  var dataString ="&sid=" +sid+ "&tol=" +tol+ "&sd=" +sd+  "&ed=" +ed+  "&np=" +np+ "&ss=" +ss+ "&used=" +used;  
			
			//alert("dataString.."+dataString);
alert("Updated Successfully");
			$.ajax({
				
				url : 'leaveOverviewEditSuccess.jsp',
				type : 'POST',
				data : dataString,
				datatype : 'json',
				success : function(data)
				{
			 	
					//alert("Am cumin"); 

					$('#qryload').html(data).delay(6000).fadeOut();
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});

		})
	});
</script>
<script>
$(function() {

	$('#submit').click(function() {

/* setTimeout(function(){I */
	popupWindow.close(); window.location.href='postLoginJsp/ATND/leaveoverview.jsp';
	});
	});
</script>
</head>
<body>

 <%
String message="";
String id = request.getParameter("sid"); 

System.out.println("sid===="+id);  
		
		
		String RegQry ="SELECT * from CALENDAR_LEAVE_APPLY_TEST where SID="+id+"";
		
		System.out.println("Edit Query...."+RegQry);
	
		

	
				Connection con = GetConnection.getConnection(); 

		Statement st = con.createStatement();
			
			 ResultSet rs = st.executeQuery(RegQry);
			
			/* String typeOfLeave=rs.getString(1);
			String startDate=rs.getString(2);
			String startTime=rs.getString(3);
			String endDate=rs.getString(4);
			String endTime=rs.getString(5);
			String nextProcessor=rs.getString(6);
			String status=rs.getString(7);
			String used=rs.getString(8);
		 */
			
		

		
		
	
	if(rs.next()) {
                
              %>
          
<table>
				<tr>
					<th>
						<h2>Update here..</h2>
					</th>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" id="sid" value="<%=id %>" /></td>
				</tr>
				<tr>
					<td>TYPE OF LEAVE :</td>
					<td><input type="text" id="tol" value="<%=rs.getString("TYPE_OF_LEAVE") %>"/></td>
				</tr>
				<tr>
					<td>START DATE :</td>
					<td><input type="text" id="sd" value="<%=rs.getDate("START_DATE") %>" /></td>
				</tr>
				
				<tr>
					<td>END DATE :</td>
					<td><input type="text" id="ed" value="<%=rs.getDate("END_DATE") %> " onchange="cal()"/></td>
				</tr>
				
				<tr>
					<td>NEXT PROCESSOR :</td>
					<td><input type="text" id="np" value="<%=rs.getString("NEXTPROCESSOR") %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>STATUS :</td>
					<td><input type="text" id="sts" value="<%=rs.getString("STATUS") %> " readonly="readonly"/></td>
				</tr>
				<tr>
					<td>USED :</td>
					<td><input type="text" id="used" value="<%=rs.getString("ABSENCE_DAY") %> " readonly="readonly"/></td>
				</tr>

				<tr>
					<td align="center">
					<!-- <input type="button" id="editSub" value="SUBMIT" onclick="editsuccess()"/> -->
					<input type="button" value="submit" id="submit" />
					</td>
				</tr>

<tr>

			<!-- <td><a href="#" id="anchorID">Click Here</a></td> -->
		</tr>

	</table>
	 <% } %>
	 
	 <br/>
	 
	 <%
				String pl = AttendanceDetails.getLeaveDaysPL();
				String cl = AttendanceDetails.getLeaveDaysCL();
				String sl = AttendanceDetails.getLeaveDaysSL();
				//String oph = AttendanceDetails.getLeaveDaysOth();
				String paternity = AttendanceDetails.getLeaveDaysPaternity();
			//out.println("print==========="+pl+cl+sl+oth+paternity);
			
			
			
				
		%>
	 	                                            <input type="hidden" id="pl" value="<%=pl%>"/><br>
													<input type="hidden" id="sl" value="<%=cl%>"/><br>
													<input type="hidden" id="cl" value="<%=sl%>"/><br>
													
													<%-- <input type="hidden" id="oph" value="<%=oph%>"/><br> --%>
													<input type="hidden" id="paternity" value="<%=paternity%>"/><br>
													<input type="hidden" id="advancepl" value="5"/><br>
													<input type="hidden" id="advancesl" value="3"/><br>
													<input type="hidden" id="outdoor" value="5"/><br>
													<input type="hidden" id="lwp" value="5"/><br>
													<input type="hidden" id="location" value="5"/><br>
													<input type="hidden" id="working" value="3"/><br>
															
	
	<div id="qryload" >
	
	</div>

</body>
</html>
