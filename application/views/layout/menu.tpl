
<div class="navbar navbar-fixed-top">

  <div class="navbar-inner">

    <div class="container">

        <div class="pull-left">

            <a href="{url::site()}" class="brand pull-left right20">
                <img src="{url::base()}assets/img/logo_small.png" class="pull-left logo"/>
                <span>Feowl</span>
            </a>    
            
            {if isset($alert) }
                <div class="alert pull-left top10 bottom0">
                    {$alert|default:'No content supplied'}
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                </div>  
            {else if isset($notice) }
                <div class="alert pull-left top10 bottom0">
                    {$notice|default:'No content supplied'}
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                </div>  
            {/if}

        </div>


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
            {if $smarty.const.ALLOW_CONTRIBUTION}
                <li class="{$active_contribute|default:''}"><a href="{url::site('contribute')}">{__ t='Contribute'}</a></li>
            {/if}
            <li class="{$active_help|default:''}"><a href="{url::site()}pages/help">{__ t='Help'}</a></li>
            <li class="divider-vertical"></li>
		</ul>

    </div>

  </div>

</div>
<div id="header-step" class="hidden-phone hidden-tablet"></div>
