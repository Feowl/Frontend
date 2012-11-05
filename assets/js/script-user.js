$(document).ready(function () {

  $.getJSON(window.BASE_URL + "locale/signup", function(messages) {    
    // Try validating
    $("#signup").validate({
      // We received a JSON object for the locale
      messages: messages,
      rules: {
        username: "required",
        useremail: {
          required: true,
          email: true
        },
        userpassword: {
          required: true,
          minlength: 6
        },
        phonenumber: {
          required: false,
          minlength: 8,
          maxlength: 13,
          digits: true
        }
      },      
      errorClass: "help-inline",
      errorElement: "span",
      highlight: function (element, errorClass, validClass) {
        $(element).parents('.control-group').addClass('error');
      },
      unhighlight: function (element, errorClass, validClass) {
        $(element).parents('.control-group').removeClass('error');
      }
    });

  });

});