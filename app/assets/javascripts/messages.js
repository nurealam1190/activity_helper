$(document).ready(function(){
   
    $(document).on("click", ".mnp",function(){

           //alert("hello");
            //alert(xhr.responseText);
           // $('.converge').replaceWith(xhr.responseText);
		
	} );
    // $(document).on("ajax:success", "#messages-form", function(evt, data, status, xhr){
    // 	alert("hi");
    //   $(document).find('.converge').replaceWith(xhr.responseText);
      
    // })
   $(document).on("ajax:success","#create_new_message_form",function(evt, data, status, xhr){
   // alert(xhr.responseText);
    $(document).find('.converge').replaceWith(xhr.responseText);
   });

   $(document).on("click", ".mnp",function(){
            //alert("hello");
    $(this).closest(".replace").find(".unread").html("U0");
    } );

   $(document).on("ajax:success","#new-form-msg",function(evt, data, status, xhr){
      var el = $('#new-form-msg');
      el.find('input:text,textarea').val('');
     });

   $('.message-form3').typeahead({
      name: 'friends',
     
      remote:'/messages/get_friends?q=%QUERY',
      header: '<center><h3 class="Users-name">Users Name</h3></center>',
      template: " <img class='template' src={{image}}> {{value}}",
      engine: Hogan
     
      //local: ["india", "indonesia","america","australia"]
      
    });




});