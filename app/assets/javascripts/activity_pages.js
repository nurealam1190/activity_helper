$(document).ready(function(){
	//alert("dgdgfgfg");
	  //for success of activity creation and clear the fields
	$(document).on("ajax:success","#create_activity_form",function(evt, data, status, xhr){
		//alert("hello");
	    $(document).find('.activities').prepend(xhr.responseText);
	    
	    var el = $('#create_activity_form');
	    el.find('input:text,textarea').val('');
	    el.find('input:text,text_field').val('');

	   // $('#create_activity_form').change(function(){
             el.find('.myselect option').prop('selected',false);
       });

     // for cheking error in activity creation
	$(document).on("ajax:error","#create_activity_form",function(evt, xhr, status, error){
	    $('.new-activity-form').find('.hello').replaceWith(xhr.responseText);
	});

     // for toggling the comment form
	$(document).on("click", ".click-link",function(){
            //alert("hello");
		$(this).closest(".activity_partial").find(".comment-form").toggle(".comment-form");
	} );

     // for prepend the comment and clear the fields
	$(document).on("ajax:success","#create_comment_form",function(evt, data, status, xhr){
		//alert(xhr.responseText);
     $(this).closest('.comment-create').prepend(xhr.responseText);

         var el = $('#create_comment_form');
         el.find('input:text,text_field').val('');
	});
     // for cheking error in comment
	$(document).on("ajax:error","#create_comment_form",function(evt, xhr, status, error){
		//alert(xhr.responseText);
      $(this).closest('.comment-form').replaceWith(xhr.responseText);
	});


     //for toggling the message list
	$(document).on("click", ".click-link",function(){
            //alert("hello");
		$(this).closest(".abcd").find(".message-list").toggle(".message-list");
	} );


    //for toggling the freind-list
	$(document).on("click", ".click-link",function(){
            //alert("hello");
		$(this).closest(".dfac").find(".index").toggle(".index");
	} );

     // to toggling the msg sending form
	$(document).on("click", ".click-link",function(){
            //alert("hello");
		$(this).closest(".msg").find(".gsm").toggle(".gsm");
	} );

	
});

