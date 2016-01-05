<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
    $(document).ready(function() {
        $("#button").click(function(){
        
        	var res_comment = $('#res_comment').val();
        	var resign_no = $('#resign_no').val();
        	
        	
        	if(res_comment=="" || res_comment==null)
        		{
        		alert("Please enter comment");
        		}

        	else{
        
        		var dataString= "&resign_no1="+ res_comment+ "&resign_no2="+ resign_no;
        	
    		alert(dataString);
    				$.ajax({
    					url :'postLoginJsp/Due_Clearance/it_support_dueclear_response_success.jsp',
    					type : 'POST',
    					data : dataString,
    					datatype : 'json',
    					success : function(data) {
    						// $('#lrmain').html(data).delay(5000).fadeOut(); 
    						$('#lrmain').html(data);
    					},
    					error : function(jqXHR, textStatus, errorThrown) {

    					}
    				});
        	}
        });
    });

</script>


</head>
<body>
<div id="lrmain">
<% 

String resign_no=request.getParameter("sequence_id");
System.out.println("resign_no.."+resign_no);

%>
<input type="hidden" value="<%=resign_no %>" id="resign_no"/> 

<textarea rows="5" cols="50" placeholder="write comment here" id="res_comment"></textarea>
<input type="button" value="Send" id="button"/>



</div>



</body>
</html>