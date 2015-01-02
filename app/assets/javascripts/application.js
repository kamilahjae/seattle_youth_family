// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready( function() {
  $('.dropdown-toggle').dropdown();
});

$(function() {
  $(".choose").click(function(event){ //we only want the button that is clicked. not all buttons
    event.preventDefault();
    var form = $(this).parents("form"); //this is similar to self. rep the obj that is currently being acted upon
    //grab the attribute that is linked to the route of the button
    var url  = form.attr("action");
    $.ajax({
      type: "POST",
      url: url
    });
  });
});
