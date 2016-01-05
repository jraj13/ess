$(document).ready(function() {
	$(function() {
		alert("jquery ESS");
		$("#search").autocomplete({

			source : function(request, response) {
				$.ajax({
					/*url : "SearchController",*/
					url : 'index.jsp',
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
