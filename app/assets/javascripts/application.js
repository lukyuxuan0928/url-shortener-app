// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$( document ).ready(function() {
  $("#submit_btn").on("click", function(event) {
    event.preventDefault();
    $.ajax({
      url: "/add",
      method: "POST",
      dataType: "json",
      data: {
        url_shortener : {
          ori_url: $("#ori_url_text").val()
        },
        ori_url: $("#ori_url_text").val()
      },
      success: function(data) {
        message = "";

        if (data['errors'] == "") {
          message = 'Generated. Ori_URL: ' + data['link']['ori_url'] + '. Short_URL: localhost:3000/' +
                      data['link']['short_url'] + '. You can visit this Ori_URL by using this Short_URL next time';
        }
        else {
          if(data['errors']['ori_url'][0] == 'has already been taken')
            message = 'This url alredy stored in our database. Short_URL: localhost:3000/' + data['link']['short_url'];
          else if (data['errors']['ori_url'][0] == 'is not a valid URL')
            message = 'Please enter a valid URL.';
          else if (data['errors']['ori_url'][0] == "can't be blank")
            message = 'Please enter a URL.';
        }
        $('#message_body').text(message);
        $('#message_modal').modal('show');
      }
    });
  });
});
