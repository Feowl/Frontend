<div class="span6 bg-color">
<div class="signup-form">
	<form method='post' action="{url::site('user/signup')}" class="form-horizontal" id="signup" >            
	
	{if isset($error_2) OR isset($error_1)}
	<div class="error">
	<div class="alert">
		{if isset($error_1)}
			{$error_1}
		{/if}
		{if isset($error_2)}
			{$error_2}
		{/if}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{/if}
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='Name'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_name" name="username" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='E-mail'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_email" name="useremail" rel="popover" >
	</div>
	</div>

	<div class="control-group light-border">
	<label class="control-label">{__ t='Password'}*</label>
	<div class="controls">
	<input type="password" class="input-xlarge" id="pwd" name="userpassword" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='GSM Phone Number'}</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="phone_number" name="phonenumber" rel="popover" >
	</div>
	</div>
	
	<div class="control-group">
	<label class="control-label opt">{__ t='How often do you want to contribute ?'}</label>
	<div class="controls">
	<select id="distribution" name="frequency">
		<option value="0">{__ t='Not Sure'}</option>
		<option value="1">{__ t='Daily'}</option>
		<option value="2">{__ t='Weekly'}</option>
		<option value="3">{__ t='Monthly'}</option>
	</select>
	</div>
	</div>
	
	<div class="control-group">
	<center>
		<input type='submit' class="btn btn-primary btn-large sbtn" name='submit' value=' Sign-up and Contribute! '/>
	</center>
	</div>  
	
</form> 
</div>
</div>    

  
  