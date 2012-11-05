<div class="span12 top20 bottom10">
	<h2> Profile </h2>
</div>
<div class="span4">
	<div class="">		
		<ul class="nav nav-pills nav-stacked" role="menu">
			{if $active == account}
				{assign var=accountActive value="active"}
				{assign var=accountStats value="icon"}
			{elseif $active == contributions}
				{assign var=contributionsActive value="active"}
				{assign var=contStats value="icon"}
			{/if}
      <li class="{$accountActive|default:''}">
       	<a href="{URL::site('user/account')}">
       		<i class="icon-chevron-right {$accountStats|default:''}-white"></i>
       		{__ t='My account'}
       	</a>
      </li>
      <li class="{$contributionsActive|default:''}">
      	<a href="{URL::site('user/contributions')}">
      		<i class="icon-chevron-right {$contStats|default:''}-white"></i>
      		{__ t='My contributions'}
      	</a>
      </li>
	  </ul>
	</div>
</div>
	

