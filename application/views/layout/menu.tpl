
<div class="navbar navbar-fixed-top">

  <div class="navbar-inner">

    <div class="container">

        <a href="{url::site()}" class="brand">
            <img src="{url::base()}assets/img/logo_small.png" class="pull-left logo"/>
            <span>Feowl</span>
        </a>    

        <ul class="nav pull-right">
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

        {if isset($smarty.session.user.name)}
            <ul class="nav pull-right">
                <li class="divider-vertical"></li>
                <li>
                    <a href="{url::site('user/profile')}" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user"></i> 
    					{$smarty.session.user.name}                        
                    </a>
                </li>
    		    <li>
                    <a href="{url::site('user/logout')}">                        
                        <i class="icon-off"></i> 
                        {__ t='Logout'}
                    </a>
                </li>					
            </ul>
		{else}		 
            <div class="pull-right">                  
                <a href="{url::site('user/login')}">
                    <span class="btn">
                        {__ t='Login'}
                    </span>
                </a>
                <a href="{url::site('user/signup')}">                        
                    <strong class="btn btn-primary">
                    {__ t='Sign up'}  
                    </strong>                  
                </a>
            </div>
        {/if}

		
        <ul class="nav pull-right main-menu">
            <li class="{$active_home|default:''}"><a href="{url::site()}">{__ t='Home'}</a></li>
            <li class="{$active_explore|default:''}"><a href="{url::site('explore')}">{__ t='Explore'}</a></li>
            <li class="{$active_contribute|default:''}"><a href="{url::site('contribute')}">{__ t='Contribute'}</a></li>
		</ul>

    </div>

  </div>

</div>
<div id="header-step" class="hidden-phone hidden-tablet"></div>
