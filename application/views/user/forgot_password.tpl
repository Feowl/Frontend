<div class="span6 bg-color">
<div class="login-form">
	<form method='post' action="{url::site('user/forgot_password')}" class="form-horizontal" id="signup" >            
	
	{if isset($message)}
	<div class="error">
	<div class="alert">{$message|default:'No content supplied'}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{/if}
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='Email'}</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_email" name="email" rel="popover" data-content="Enter your email address?" data-original-title="Email">
	</div>
	</div>

	
	<div class="control-group">
	<div class="controls">
	<input type='submit' class="btn btn-primary btn-large sbtn padbtn" name='submit' value='{__ t='Reset Password'}'/>
	</div> 
	</div>  
	
</form> 
</div>
</div>    

  
  