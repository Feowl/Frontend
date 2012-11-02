<div class="span6 bg-color">
<div class="signup-form">
	<form method='post' action="{url::site('user/signup')}" class="form-horizontal" id="signup" >            
	
	{if isset($error)}
	<div class="error">
	<div class="alert">
		{if isset($error)}
			{$error}
		{/if}
		<a class="close" data-dismiss="alert" href="#">&times;</a>
	</div>	
	</div>
	{/if}
	
	<div class="control-group light-border">
	<div class="controls">
	<a href="#" >{__ t='I have a phone send my login details'}</a>
	</div>
	</div>
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
		<div class="control-submit">
		<a href="{URL::site('user/login')}">{__ t='Have an account? Login!'}</a>
		<input type='submit' class="btn btn-primary btn-large sbtn signup-submit" name='submit' value=' Sign-up and Contribute! ' onClick="javascript:show_overlay();"/>
		</div>
	</div>  
	
</form> 
</div>
</div>    
	
{literal}
<script type="text/javascript">
	function show_overlay(){
	   document.getElementById('overlay').style.display = 'block'; 
	}
	 
</script>
{/literal}
	
<div id="overlay" style="display:none">
	<div class="js-loading-overlay" ></div>
</div>
  
