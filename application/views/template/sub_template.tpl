{include file='layout/header.tpl'}

	{include file='layout/menu.tpl'}	
	
	<div class="container">
		{$left_content|default:'No content supplied'}
	
		{$right_content|default:'No content supplied'}		
	</div>
	
{include file='layout/footer.tpl'}

