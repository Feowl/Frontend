
<div class="navbar navbar-fixed-top">

  <div class="navbar-inner">

    <div class="container">

        <a href="{url::site()}" class="brand">
            <img src="{url::base()}assets/img/logo_small.png" class="pull-left logo"/>
            <span>Feowl</span>
        </a>    

        <ul class="nav pull-right">
            <li class="dropdown">
				{if isset($smarty.session.user.name)}
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i> 
						{$smarty.session.user.name}
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu"> 					
					<li><a href="{url::site('user/profile')}">{__ t='Profile'}</a></li>
					<li class="divider"></li>
					<li><a href="{url::site('user/logout')}">{__ t='Logout'}</a></li>					
                </ul>
				{else}
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i> {__ t=Account}
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu"> 
						<li><a href="{url::site('user/login')}">{__ t='Sign In'}</a></li>						
						<li><a href="{url::site('user/signup')}">{__ t='Sign Up'}</a></li>
                </ul>
				{/if}
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-globe"></i> {__ t='Language'}
                    <b class="caret"></b>
                </a>

                <ul class="dropdown-menu">
                    {foreach from=Kohana::config('multilang.languages.supported') item=lang key=URI}
                        {if $URI == I18n::lang() }
                            <li>
                                <a href="{url::site('language/change/'|cat:$URI)}">
                                    <b class="icon-ok pull-right"></b>
                                    {$lang.name}
                                </a>
                            </li>    
                        {else}
                            <li>
                                <a href="{url::site('language/change/'|cat:$URI)}">
                                    {$lang.name}
                                </a>
                            </li>
                        {/if}
                    {/foreach}
                    
                </ul>
            </li>

        </ul> 
		
        <ul class="nav">
            <li class="{$active_home|default:''}"><a href="{url::site()}">{__ t='Home'}</a></li>
            <li class="{$active_explore|default:''}"><a href="{url::site('explore')}">{__ t='Explore'}</a></li>
            <li class="{$active_contribute|default:''}"><a href="{url::site('contribute')}">{__ t='Contribute'}</a></li>
            <li class="{$active_about|default:''}"><a href="{url::site('pages/about')}">{__ t='About'}</a></li>

		</ul>

    </div>

  </div>

</div>
<div id="header-step" class=""></div>

{* Calling the responsive CSS *}
<link href="{URL::base()}assets/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" media="all" />