<div class="span6 bg-color">
{if !isset($password)}
<div class="login-form">
	<form method='post' action="{url::site('user/forgot_password')}" class="form-horizontal" id="signup" >            
	
	{if isset($message)}
	<div class="error">
	<div class="alert">{$message|default:'No content supplied'}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{else}
	<div class="alert">{__ t='Enter your E-mail inorder to recieve a new password'}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	{/if}
	
	<div style="margin:20px;"></div>
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='E-mail'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_email" name="email" >
	</div>
	</div>

	
	<div class="control-group">
	<div class="controls">
	<input type='submit' class="btn btn-primary btn-large sbtn padbtn" name='submit' value="{__ t='Reset Password'}"/>
	</div> 
	</div>  
	
</form> 
</div>
{else}
	<div class="alert">{__ t='Your Password has been resetted: Check your E-mail for your new password'}
	<br /> ---I would temporally display the email here for testing purpose <br /> {$message}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
{/if}
</div>    

  
  
