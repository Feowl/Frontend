<div class="banner remove-height">
	<img src="{URL::base()}assets/img/home-douala.jpg" class="douala" alt="Photo: Alvise Forcellini" />
</div>

<div class="container">
	<div class="row">
		<div class="span4 offset4">		
			<h1 class="white-color bottom40 top40">{__ t="Login to your account"}</h1>
			<div class="login-form white-panel">
				<form method="post" action="{url::site('user/login')}" class="margin30">
					
					{if isset($message)}
						<div class="alert alert-error">
							{$message|default:'No content supplied'}
							<a class="close" data-dismiss="alert" href="#">&times;</a>
						</div>
					{/if}

					{if isset($smarty.post.email)}
						{assign var=email value=$smarty.post.email}
					{else}
						{assign var=email value=''}
					{/if}

						
					<p class="row-fluid bottom10">
						<label for="user_email" class="hide">{__ t='Email'}</label>
						<input type="text" class="span12" id="user_email" name="email" value="{$email}" placeholder="{__ t='Email'}" />	
					</p>	

					<p class="row-fluid bottom10">
						<label for="pwd" class="hide">{__ t='Password'}</label>
						<input type="password" class="span12" id="pwd" name="password" placeholder="{__ t='Password'}" />
					</p>

					<div class="row-fluid">
						<div class="span6 tl top10">
							<a href="{url::site('user/forgot_password')}" >{__ t='Forget your password?'}</a>				
						</div>
						<div class="span6 tr">
							<input type='submit' class="btn btn-primary btn-large" name='submit' value='{__ t='Login'}'/>
						</div>
					</div>
				</form>
				<hr />
				<p class="margin20 top0 silver-color">
					{str_replace('%s', url::site('user/signup'), _('New to Feowl? <a href="%s">Sign up</a> and contribute now!') )}
				</p>
			</div>
		</div>
	</div>
</div>