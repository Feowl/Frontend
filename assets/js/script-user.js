$(document).ready(function() {
// Popover 
	$('#signup input').hover(function()
	{
	$(this).popover('show')
	});
	//try validating
	$("#signup").validate({
		rules:{
		username:"required",
		useremail:{required:true,email: true},
		userpassword:{required:true,minlength: 6},
		phonenumber:{required:false, minlength: 8, maxlength:13, digits:true}
		},

		messages:{
		username:"Enter your first and last name",
		useremail:{
		required:"Enter your email address",
		useremail:"Enter valid email address"},
		userpassword:{
		required:"Enter your password",
		minlength:"Password must be minimum 8 characters"},
		phonenumber:{
		minlength:"Phone Number must have atleast 6 chars",
		maxlength: "Phone Number must not exceed 13 chars",
		digits: "Phone Number should content only digits"
		},
		
		},

		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass)
		{
		$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass)
		{
		$(element).parents('.control-group').removeClass('error');
		$(element).parents('.control-group').addClass('success');
		}
		});
});
