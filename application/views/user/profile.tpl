<div class="span5">
	<h2>Profile</h2>
	<div class="bg-sidebar">
	<ul class="nav nav-list " role="menu">
		{if $active == account}
			{assign var=account value=bg}
		{elseif $active == contribute}
			{assign var=contribute value=bg}
		{else}
			
		{/if}
        <li><a class="{$account|default:' '}-sidebar-hover" href="{URL::site('user/account')}"><i class="icon-chevron-right"></i>My Account</a></li>
        <li><a class=" {$contribute|default:' '}-sidebar-hover" href="{URL::site('user/contributions')}"><i class="icon-chevron-right"></i>My Contribution</a></li>
    </ul>
	</div>
	<div class="left-space">
		<a href="{URL::site('user/delete')}" class="btn btn-danger btn-mini" />{__ t='Delete my account'}</a>
	</div>
</div>
	

