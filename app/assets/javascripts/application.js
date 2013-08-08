// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require hogan.js
//= require template.js
//= require compiler.js
//= require bootstrap


//= require_tree .
// $(function(){
//   if ($(."converge").length > 0){
//   	setTimeout(updateMessage, 10000);
//   }
// });
$(document).on("click", ".mnp",function(){
            alert("hello");
    setTimeout(updateMessage, 5000);
    } );
function updateMessage(){
	var friendship_id = $(".converge").attr("data-id");
	var after = $(".msg-from:first-child").attr("data-time");
	$.getScript("/messages.js?user_id=" + friendship_id + "&after=" + after);
	setTimeout(updateMessage, 5000);
}
