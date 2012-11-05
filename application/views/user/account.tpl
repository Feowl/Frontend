<div class="span6 top20">
  <div class="account-form white-panel">    

    <form method='post' action="{url::site('user/account')}" class="form-horizontal" id="signup">

      <div class="padding20">

	    	{if isset($alert)}
		      <div class="alert">{$alert}	<a class="close" data-dismiss="alert" href="#">&times;</a></div>	      
	      {elseif isset($notice)}
		      <div class="alert">{$notice}	<a class="close" data-dismiss="alert" href="#">&times;</a></div>	
	      {/if}

	    	<h3>{__ t='Change my informations'}</h3>			
				<div class="control-group light-border">
					<label class="control-label" for="">{__ t='Name'}*</label>
					<div class="controls">
						<input type="text" class="span3" id="user_name" name="username" value="{$user.name}" rel="popover" >
					</div>
				</div>
				
				<div class="control-group light-border">
					<label class="control-label" for="">{__ t='E-mail'}*</label>
					<div class="controls top05">
						<strong>{$user.email}</strong>
					</div>
				</div>

				<div class="control-group light-border">
					<label class="control-label" for="">{__ t='GSM Phone Number'}*</label>
					<div class="controls">
						<input type="text" class="span3" id="phone_number" name="phonenumber" value="{$user.phone_number}" rel="popover" >
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="">{__ t='How often do you want to contribute ?'}</label>
					<div class="controls">

					<select id="distribution" name="frequency">
						<option value="0" {if $user.frequency == 0} selected="selected"{/if} >{__ t='Not Sure'}</option>
						<option value="1" {if $user.frequency == 1} selected="selected"{/if} >{__ t='Daily'}</option>
						<option value="2" {if $user.frequency == 2} selected="selected"{/if} >{__ t='Weekly'}</option>
						<option value="3" {if $user.frequency == 3} selected="selected"{/if} >{__ t='Monthly'}</option>
					</select>

					</div>
				</div>
			</div>

			<hr class="top0 bottom0" />


      <div class="padding20">
				<h3>{__ t='Change my password'}</h3>

	      <div class="control-group light-border">
	        <label class="control-label" for="">{__ t='Current password'}</label>
	        <div class="controls">
	          <input type="password" class="span3" id="pwd" name="password" rel="popover">
	        </div>
	      </div>

	      <div class="control-group light-border">
	        <label class="control-label" for="">{__ t='New password'}</label>
	        <div class="controls">
	          <input type="password" class="span3" id="pwd" name="newpassword" rel="popover">
	        </div>
	      </div>

	      <div class="control-group light-border">
	        <label class="control-label" for="">{__ t='Repeat new password'}</label>
	        <div class="controls">
	          <input type="password" class="span3" id="pwd" name="repeat_newpassword"
	          rel="popover">
	        </div>
	      </div>
	      <div class="tr right0">
	        <input type='submit' class="btn btn-primary btn-large sbtn" name='submit' value="{__ t='Update Profile'}" />   
	      </div>

	    </div>

    </form>
  </div>
</div>