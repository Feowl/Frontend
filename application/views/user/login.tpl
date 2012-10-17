<div class="span6 bg-color">
<div class="login-form">
	<form method='post' action="{url::site('user/login')}" class="form-horizontal" id="signup" >            
	
	{if isset($message)}
	<div class="error">
	<div class="alert">{$message|default:'No content supplied'}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{/if}
	{if isset($smarty.post.email)}
		{assign var=email value=$smarty.post.email}
	{else}
		{assign var=email value=''}
	{/if}
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='Email'}</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_email" name="email" value="{$email}" >
	</div>
	</div>

	<div class="control-group light-border">
	<label class="control-label">{__ t='Password'}</label>
	<div class="controls">
	<input type="password" class="input-xlarge" id="pwd" name="password" >
	</div>
	</div>
	
	<div class="control-group">
	<div class="controls">
	<input type='submit' class="btn btn-primary btn-large sbtn padbtn" name='submit' value='{__ t='Login'}'/><a href="{url::site('user/forgot_password')}" class='forgot-password'>{__ t='Forget your password?'}</a>
	</div> 
	</div>  
	
</form> 
</div>
</div>    

  
  