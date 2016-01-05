<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
$(function() {
	$("#submit").click(function() {
		
						var checked_matrix_radio = $('input:radio[name=subordinate]:checked').val();
						var url_link;

						// if (checked_matrix_radio === undefined) 
						 if (typeof(checked_matrix_radio) == 'undefined')
						 {
							alert("Please select anyone !");
							return false;
						}
						
						else if (checked_matrix_radio == "Self") {
						/* 	url_link = 'postLoginJsp/WHOSWHO/r_matrix_info1.jsp'; */
							url_link = 'postLoginJsp/WHOSWHO/r_matrix_getInfo1.jsp';
							//alert("url_link..."+url_link);
						}
						else {
							url_link = 'postLoginJsp/WHOSWHO/r_matrix_info2.jsp';
							//alert("url_link..."+url_link);
						}

					/*	else { */
							var dataString = '&checked_matrix_radio=' + checked_matrix_radio;
						//	alert(dataString);

							$.ajax({
										/* url : 'postLoginJsp/WHOSWHO/r_matrix_info.jsp', */
										url  : url_link,
										type : 'POST',
										data : dataString,
										datatype : 'json',
										success : function(data) {
											// $('#r_matrix_res').html(data).delay(5000).fadeOut();  
											$('#r_matrix_res')
													.html(data);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {

										}
									});
						/* } */
					});
});



</script>

</head>

<body>

<div style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">
<b>R-Matrix</b>
</div>

<br>
<%


%>
<div style="background-color: #98c3e2; margin-top: 3px; margin-left: -1.5%; padding-left: 15px; font-size: 15px; width: 101.5%;">

<!-- Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="sysdate" style="height: 26px;"><br> -->
<input type="radio" value="Self" id="Self" name="subordinate" >For Self <br>
<input type="radio" value="Subordinate" id="Subordinate" name="subordinate">For Subordinate<br>

</div>
<input type="button" value="Submit" id="submit" style="margin-left: -1.5%; padding-left: 15px; font-size: 15px; ">
<br><br><br>
<div id="r_matrix_res"></div>

</body>
</html>