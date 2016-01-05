<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autocomplete in java web application using Jquery and JSON</title>
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->


<script src="postloginresource/jquery-1.10.2.js"></script>
<script src="postloginresource/jquery-ui.js"></script>



<!--  <script src="postloginresource/autocompleter.js"></script>  -->
 <script src="AUTOSEARCH/autocompleter.js"></script>

<!-- <link rel="stylesheet" 
  href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"> -->
  <link rel="stylesheet" href="postloginresource/jquery-ui.css">
<!-- User defied css -->
<link rel="stylesheet" href="AUTOSEARCH/style_search.css">
<!-- <script>
 $(document).ready(function() {
        $(function() {
                $("#search").autocomplete({     
                source : function(request, response) {
                $.ajax({
                        url : "SearchController",
                        type : "GET",
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
 -->
</head>
<body>
<div class="header">
        <h3>EMPLOYEE SEARCH</h3>
</div>
<br />
<br />
<div class="search-container">
        <div class="ui-widget">
                <input type="text" id="search" name="search" class="search" />
        </div>
</div>
</body>
</html>