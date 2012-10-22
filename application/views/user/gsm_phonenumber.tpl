<div class="span6 bg-color">
<div class="login-form">
	<form method='post' action="{url::site('user/gsm_phonenumber')}" class="form-horizontal" id="signup" >            
	
	{if isset($message)}
	<div class="error">
	<div class="alert">{$message|default:'No content supplied'}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{/if}
	<p>{__ t="You have already registered by SMS? No need to register again on the website.
		Enter your phone number and we'll send you your login information by SMS." }</p>
	    
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='GSM Phone number*'}</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_phone" name="phone" >
	</div>
	</div>
	<div class="control-group">
	<div class="controls">
	<input type='submit' class="btn btn-primary btn-large sbtn padbtn" name='submit' value='{__ t='Get my login Information'}'/>
	</div> 
	</div>  
	
</form> 
</div>
</div>    

  
  