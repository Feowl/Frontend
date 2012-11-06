<div class="container">
	<div class="row">
		<div class="span4 offset4">
			<h2 class="top20 bottom20">{__ t='Forgot your password?'}</h2>
			<div class="white-panel">
				{if !isset($password)}

			    <form method='post' action="{url::site('user/forgot_password')}" class="padding20 bottom0">
				    
				    {if isset($message)}
				      <div class="error">
				        <div class="alert">
				        	{$message|default:""}	
				        	<a class="close" data-dismiss="alert" href="#">&times;</a>
				        </div>
				      </div>			      
				    {/if}

			      <div class="row-fluid">
			        <label class="control-label">
		        		{__ t='Enter your e-mail address to receive a new password:'}
			          <input type="text" class="span12 top10" id="user_email" name="email">		        
			        </label>
			      </div>

			      <div class="row-fluid top10">
			      	<div class="span6">
			      		<a href="{url::site('user/login')}">
			      			<i class=" icon-arrow-left"></i>
			      			Go back to log in.
			      		</a>
			      	</div>
			        <div class="tr span6">
			          <input type='submit' class="btn btn-primary" name='submit' value="{__ t='Send'}" />
			        </div>
			       </div>

				  </form>	
				{else}
				  <div class="alert">
				  	{__ t='Your Password has been resetted: Check your E-mail for your new password'}
				    <a class="close" data-dismiss="alert" href="#">&times;</a>
				  </div>
				{/if}
			</div>
		</div>
	</div>
</div>