<div class="span6 bg-color">
<div class="signup-form">
	<form method='post' action="{url::site('user/account')}" class="form-horizontal" id="signup" >            
	
	{if isset($alert)}
	<div class="error">
	<div class="alert">
		{$alert}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{elseif isset($notice)}
		<div class="alert">
		{$notice}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	{/if}
	
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='Name'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_name" name="username" value="{$userdata.name}" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='E-mail'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_email" name="useremail" value="{$userdata.email}" rel="popover" >
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
	<input type="text" class="input-xlarge" id="phone_number" name="phonenumber" value="{$userdata.phone_number}" rel="popover" >
	</div>
	</div>
	
	<div class="control-group">
	<label class="control-label opt">{__ t='How often do you want to contribute ?'}</label>
	<div class="controls">
	<select id="distribution" name="distribution">
		<option value="1">{__ t='Daily'}</option>
		<option value="7">{__ t='Weekly'}</option>
		<option value="31">{__ t='Monthly'}</option>
	</select>
	</div>
	</div>
	
	<div class="control-group">
	<center>
		<input type='submit' class="btn btn-primary btn-large sbtn" name='submit' value=' Update Profile '/>
	</center>
	</div>  
	
</form> 
</div>
</div>    

  
  