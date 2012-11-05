<div class="span6 offset1">
	<div class="white-panel padding20">
		<h3>{__ t='Lists of contributions'}</h3>
		{if $total_count >= 0}

			<table class="table table-striped table-condensed">
				<thead>
					<tr>
						<th class="tc">{__ t='District'}</th>
						<th class="tc">{__ t='Duration'}</th>
						<th class="tc">{__ t='Date'}</th>
						<th class="tc">{__ t='Quality'}</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th class="tc">{__ t='District'}</th>
						<th class="tc">{__ t='Duration'}</th>
						<th class="tc">{__ t='Date'}</th>
						<th class="tc">{__ t='Quality'}</th>
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
				</tbody>
			</table>
		
			<div class="tr">
				<a href="{URL::site('user/download_contributions')}?format=csv" target="_blank" class="btn" />
					<i class="icon-download-alt"></i>
					{__ t='Download your contributions (CSV)'}
				</a>
			</div>
		{else}		
			<div class="error top20">
				<div class="alert bottom0">
					{__ t='You currently have no contributions'}
				</div>
			</div>
		{/if}

	</div>
</div>    

  
  
