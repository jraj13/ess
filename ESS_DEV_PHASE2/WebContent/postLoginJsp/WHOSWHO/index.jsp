<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autocomplete in java web application using Jquery and JSON</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script>
 <link rel="stylesheet" href="postloginresource/jquery-ui.css">


 <script src="postloginresource/autocompleter.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
User defied css
<link rel="stylesheet" href="postloginresource/style_search.css">
 <script src="postloginresource/autocompleter.js"></script>
<script>
$(document).ready(function() {
	$(function() {
		alert("jquery ESS INDEX ");
		$("#search").autocomplete({

			source : function(request, response) {
				$.ajax({
					/*url : "SearchController",*/
					/* url : "postLoginJsp/WHOSWHO/index.jsp", */
					url : "postLoginJsp/WHOSWHO/controller.jsp",
					type : "POST",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					}
				});
			}
		});
	});
});


</script>
</head>
<body>
	<div class="empsearchheader">
		<h3>Employee Search</h3>
	</div>
	<br />
	<br />
	<div class="search-container">
		<div class="ui-widget">
			<input type="text" id="search" name="search"  class="search ui-autocomplete-input" autocomplete="off"/>
		</div>
	</div>
</body>
</html>
 -->
 
 
 
 

 
 <html>
<head>
<link rel="stylesheet" type="text/css" href="postloginresource/style.css"/>
<script type="text/javascript" src="postloginresource/jquery-1.4.2.min.js"></script>
<script src="postloginresource/jquery.autocomplete.js"></script>
<script>
jQuery(function(){
	
	alert("call jqry");
	
$("#country").autocomplete("postLoginJsp/WHOSWHO/list.jsp");
});
</script>

</head>
<body>
<br><br><center>
<font face="verdana" size="2">
<font size="4">emp search ::: <font color="#809e02"></font>yy</font>
<br><br><br><br>

Select Country   :
<input type="text" id="country" name="country"/>

</font>
</body>
</html>
 
 