$(document).ready(function(){
	alert("dgdgfgfg");
	$(document).on("ajax:success","#create_activity_form",function(evt, data, status, xhr){
		alert("hello");
	    $('.activities').find('.activity_partial').replaceWith(xhr.responseText);
	    
	    var el = $('#create_activity_form');
	    el.find('input:text,textarea').val('');
	    el.find('input:text,text_field').val('');

	   // $('#create_activity_form').change(function(){
             el.find('.myselect option').prop('selected',false);
       });

	$(document).on("ajax:error","#create_activity_form",function(evt, xhr, status, error){
	    $('.new-activity-form').find('.hello').replaceWith(xhr.responseText);
	});
});
