$(function(){
	$("form[data-remove=true]").on("ajax:success", function(e){
		var listItem = $(e.target).closest("li");
		listItem.remove()
	});
})