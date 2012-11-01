<div class="span6 bg-color-acc">
<div class="account-form">
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
	
	<div class="tag">
	----------------------------- {__ t='Change my informations'} -----------------------------
	</div>
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='Name'}*</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="user_name" name="username" value="{$user.name}" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label" for="input01">{__ t='E-mail'}*</label>
	<div class="controls email-size">
	{$user.email}
	</div>
	</div>

	<div class="control-group light-border">
	<label class="control-label">{__ t='GSM Phone Number'}</label>
	<div class="controls">
	<input type="text" class="input-xlarge" id="phone_number" name="phonenumber" value="{$user.phone_number}" rel="popover" >
	</div>
	</div>

	<div class="control-group">
	<label class="control-label">{__ t='How often do you want to contribute ?'}</label>
	<div class="controls">

	<select id="distribution" name="frequency">
		<option value="0" {if $user.frequency == 0} selected="selected"{/if} >{__ t='Not Sure'}</option>
		<option value="1" {if $user.frequency == 1} selected="selected"{/if} >{__ t='Daily'}</option>
		<option value="2" {if $user.frequency == 2} selected="selected"{/if} >{__ t='Weekly'}</option>
		<option value="3" {if $user.frequency == 3} selected="selected"{/if} >{__ t='Monthly'}</option>
	</select>
	</div>
	</div>

	<div class="tag">
	----------------------------- {__ t='Change my password'} ---------------------------------
	</div>


	<div class="control-group light-border">
	<label class="control-label">{__ t='Current password'}</label>
	<div class="controls">
	<input type="password" class="input-xlarge" id="pwd" name="password" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='New password'}</label>
	<div class="controls">
	<input type="password" class="input-xlarge" id="pwd" name="newpassword" rel="popover" >
	</div>
	</div>
	
	<div class="control-group light-border">
	<label class="control-label">{__ t='Repeat new password'}</label>
	<div class="controls">
	<input type="password" class="input-xlarge" id="pwd" name="repeat_newpassword" rel="popover" >
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

  
  
