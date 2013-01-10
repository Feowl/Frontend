<div class="banner remove-height">
	<img src="{URL::base()}assets/img/home-douala.jpg" class="douala" alt="Photo: Alvise Forcellini" />
</div>

<div class="container cover-banner">
	<div class="row">		

		<div class="span4 offset4">		
			<h1 class="white-color bottom0 top40">{__ t="Create an account"}</h1>
			<p class="white-color bottom20 left10 right10">
				{__ t='When you sign up to Feowl, you will receive an SMS and you will be able to contribute right away!'}
			</p>
			<div class="login-form white-panel">

				<form method="post" action="{url::site('user/signup')}" class="form-horizontal" id="signup">
					{if isset($error)}
						<div class="alert alert-error">
							{if isset($error)}
								{$error}
							{/if}
							<a class="close" data-dismiss="alert" href="#">&times;</a>
						</div>
					{/if}

						<div class="margin20">


							<p class="row-fluid control-group">
								<label for="user_name">{__ t='Name'}*</label>
								<input type="text" class="span12" id="user_name" name="username" placeholder="Ex: John Do" />
							</p>	
								
							<p class="row-fluid bottom10 control-group">	
								<label for="user_email">{__ t='E-mail'}*</label>
								<input type="text" class="span12" id="user_email" name="useremail" placeholder="Ex: jd@example.org" />
							</p>	
							
							<p class="row-fluid bottom10 control-group">	
								<label for="pwd">{__ t='Password'}*</label>						
								<input type="password" class="span12" id="pwd" name="userpassword" placeholder="{__ t='More than 6 characters'}" />
							</p>	
							
							<p class="row-fluid bottom10 control-group">	
								<label for="phone_number">{__ t='GSM Phone Number'}</label>						
								<input type="text" class="span12" id="phone_number" name="phonenumber" placeholder="Ex: 060000" />
							</p>	
							
							<p class="row-fluid bottom10 control-group">	
								<label for="distribution">{__ t='How often do you want to contribute ?'}</label>						
								<select id="distribution" name="frequency">
									<option value="0">{__ t='I\'m not sure'}</option>
									<option value="1">{__ t='Daily'}</option>
									<option value="2">{__ t='Weekly'}</option>
									<option value="3">{__ t='Monthly'}</option>
								</select>
							</p>	
							

							<div class="row-fluid top20">
								<div class="span8 tl top05">
									<p class="bottom0 top0">{__ t='* Required field.'}</p>
									<p><a href="{URL::site('user/login')}">{__ t='Already have an account? Log in'}</a></p>
								</div>
								<div class="span4 tr">
									<input type="submit" class="btn btn-primary btn-large" name="submit" value="Sign up" />
								</div>
							</div>
							
						</div>
							
				</form>

			</div>
		</div>
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
