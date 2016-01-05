<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.ess.common.action.AttendanceDetails"%>
<%@ page import="java.lang.*,java.util.*"%>
<%@ page import="java.sql.*" %>
    <%@page import="com.ess.util.GetConnection"%>
    
<head>
<title>e-Separation Edit Page  </title>
<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
	
<link rel="stylesheet" href="../../date/jquery-ui.css"/></link> 
<script src="../../date/jquery-1.10.2.js"></script>
<script src="../../date/jquery-ui.js"></script>
<style>
.mytext {
    width: 700px;
    height:70;
}
</style>

<script>
	$(function() {

		$('#editsucess').click(function() {
		var seqid = $('#seqid').val();
		var note= $('#note').val();
		
		
			if(seqid == " ") {
			       
		        return false;
		    }
			else {
				
				var e_sepedit = "&seqid=" + seqid+"&note="+note;
				
				$.ajax({

					url : 'e-separateEdit_insert.jsp',
					type : 'POST',
					data : e_sepedit,
					datatype : 'json',
					success : function(data) {
						//alert(data);
						$('#qryload').html(data).delay(2000).fadeOut();
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("sorry try again");

					}
				
				});
					}
		})
	});
</script>
</head>
<body>
<div id="qryload">
 <%
 System.out.println("esep_requestEdit.jsp");  
								
String message="";
String seqid = request.getParameter("seqid"); 
		
		String RegQry ="select * from E_SEPARATION_EMP where SEQUENCE_NO='"+seqid+"'";
		
		System.out.println("Edit Query...."+RegQry);
	
				Connection con = GetConnection.getConnection(); 

		Statement st = con.createStatement();
			
			 ResultSet rs = st.executeQuery(RegQry);
	
	if(rs.next()) {
                
              %>
          
			<table>
				<tr>
					<th>
						<h2>Update Here..</h2>
					</th>
				</tr>
				
				<tr>
					<td>Note :</td>
					<td><input type="hidden" id="seqid"  value="<%=seqid%>"/></input></td>
					<td><input type="text" id="note"  value="<%=rs.getString("SEPARATION_NOTE") %>" class="mytext"/></input></td>
				</tr>
				<tr>
					<td align="center">
					<input type="button" value="submit" id="editsucess" /></input>
					</td>
					<td>
					<input type="submit" name="Close" value="Close Window" title="Close Window" onClick="javascript:window.close();"/></input>
					</td>
				</tr>


	</table>
	 <% } %>
 </div> 

</body>
</html>
