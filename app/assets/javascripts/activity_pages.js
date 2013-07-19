$(document).ready(function(){
	//alert("dgdgfgfg");
	$(document).on("ajax:success","#create_activity_form",function(evt, data, status, xhr){
		//alert("hello");
	    $(document).find('.activities').prepend(xhr.responseText);
	    
	    var el = $('#create_activity_form');
	    el.find('input:text,textarea').val('');
	    el.find('input:text,text_field').val('');

	   // $('#create_activity_form').change(function(){
             el.find('.myselect option').prop('selected',false);
       });


	$(document).on("ajax:error","#create_activity_form",function(evt, xhr, status, error){
	    $('.new-activity-form').find('.hello').replaceWith(xhr.responseText);
	});


	$(document).on("click", ".click-link",function(){
            //alert("hello");
		$(this).closest(".activity_partial").find(".comment-form").toggle(".comment-form");
	} );


	$(document).on("ajax:success","#create_comment_form",function(evt, data, status, xhr){
		alert(xhr.responseText);
     $('.comment-create').find('.user-comment').replaceWith(xhr.responseText);
	});

	$(document).on("ajax:error","#create_activity_form",function(evt, xhr, status, error){
      $('.comm-form').find('.comment-form').replaceWith(xhr.responseText);
	});
});

