<div class="span7">
	<h3>{__ t='Lists of Contributions'}</h3>
	<br />
		<table class="table table-striped table-condensed" id="explore-list">
		{if $total_count >= 1}
		<thead>
			<tr>
				<th>{__ t='District'}</th>
				<th>{__ t='Duration'}</th>
				<th>{__ t='Date'}</th>
				<th>{__ t='Quality'}</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>{__ t='District'}</th>
				<th>{__ t='Duration'}</th>
				<th>{__ t='Date'}</th>
				<th>{__ t='Quality'}</th>
			</tr>
		</tfoot>
		<tbody>
			{foreach $contributions as $contribution}
			<tr>
				<td >{$contribution.area}</td>
				<td >{$contribution.duration}</td>
				<td >{$contribution.has_experienced_outage}</td>
				<td >{$contribution.quality}</td>
			</tr>
			{/foreach}
		{else}
			<tr>
				<div class="error">
					<div class="error alert">
						{__ t='You currently have no contributions'}
					</div>
				</div>
			</tr>
		{/if}
		</tbody>
	</table>
	{if $total_count >= 1}
		<div class="left-space">
			<a href="{URL::site('user/download_contributions')}?format=csv" target="_blank" class="btn btn-primary btn-large" />{__ t=' Download your contributions (csv) '}</a>
		</div>
	{/if}
</div>    

  
  
