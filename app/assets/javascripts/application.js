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
  $(function() {
    $(".filter").click(function(event){ //we only want the button that is clicked. not all buttons
      alert("success!"); // this tells us if the click fn is working
      event.preventDefault();
      var form = $(this).parents("form")[0]; //this is similar to self. rep the obj that is currently being acted upon
      //console.log(form);
      //grab the attribute that is linked to the route of the button:
      var url  = form.getAttribute("action");
      console.log(url);
      var request = $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        //get js object for org, date, and then grab the values(params) .val
        data: {
          date: $("#show_dates").val(),
          organization: $("#organizations").val(),
          category: $("#categories").val()
        }
      });
      // once the ajax request has been made, do something:

      request.then(function(data){
         console.log(data);

        $.each(data, function(index, value){
          // console.log(index + ". " + value.description);
            var description = $("<li>").text(index + ". " + value.description);
            // console.log(description);
            var descriptionUL = $("#descriptions");
            descriptionUL.append(description);
        });
      });
    });
  });
});
