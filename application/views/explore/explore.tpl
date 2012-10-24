	<div class="container">

		<div class="page-header row">
			<h1>{__ t='Explore the data collected by Feowl'}</h1>
		</div>

		<div id="explore-space" class="row">


			<div id="explore-legend" class="span3">
				<ul class="nav nav-list well">
					<li class="nav-header">
						{__ t='Legend'}
					</li>
					<li><span class="legend no-relevant"></span>{__ t='No enough data'}</li>
					<li><span class="legend less-30min"></span>{__ t='No power cuts or less than 30mn'}</li>
					<li><span class="legend less-2h"></span>{__ t='Beetween 30mn and 2h'}</li>
					<li><span class="legend less-4h"></span>{__ t='Beetween 2h and 4h'}</li>
					<li><span class="legend more-4h"></span>{__ t='More than 4 hours'}</li>
				</ul>
				<!--div id="contributions"></div-->
				<div class="well hidden" id="explore-barchart">
					<h4 data-tpl="{__ t='Proportion of Feowl users suffering from power cuts in %s'}"></h4>
					<div id="explore-barchart-area" data-absent="{__ t='no data available'}"></div>
					<ul id="explore-barchart-duration">
						<li>{__ t="0"}</li>
						<li>{__ t="30'"}</li>
						<li>{__ t="2h"}</li>
						<li>{__ t="4h"}</li>
						<li class="last">{__ t="&gt; 4h"}</li>
					</ul>
					<h5>{__ t="Duration of daily power cuts"}</h5>
				</div>
			</div>

			<div id="explore-map" class="span9"></div>
		
			<div  class="span12">
				<div id="explore-range-slider"></div>
			</div>

			<div class="span12">
				<h2>{__ t='User reports'}</h2>
				<table class="table table-striped table-condensed" id="explore-list">
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
						<tr>
							<td colspan="4" class="tc">{__ t='Loading'}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			{literal}

				<!-- tbody after loading of data from the API -->
				<script id="tpl-reports-list" type="text/x-handlebars-template">

					{{#if list}}

			  			{{#list}}
							<tr>
								<td>{{district_name area}}</td>
								<td>{{duration}}</td>
								<td>{{short_date_string happened_at}}</td>
								<td>{{quality}}</td>
							</tr>
				  		{{/list}}

				  		{{#if next_page}}
							<tr class="load-more">
								<td colspan="4">
									{/literal}{__ t='Load more'}{literal}
								</td>
							</tr>
				  		{{/if}}

			  		{{else}}	

						<tr>
							<td colspan="4" class="tc">
								{/literal}{__ t='No reports submited for that period'}{literal}
							</td>
						</tr>

			  		{{/if}}

				</script>

				<!-- metadata under the legend -->
				<script id="tpl-reports-summary" type="text/x-handlebars-template">
					
					{{#list}}
						{{! <p>qualité</p>}}
						{{! TODO: sum all the duration values in one variable}}
						{{! duration_rate duration}}
						{{! <p>contrib</p>}}
						{{! contributor}}
					{{/list}}
					{{^list}}
						no list here!
					{{/list}}

					{/literal}{__ t='SOMETHING TO TRANSLATE!'}{literal}
					
					{{! contributor}}

				</script>

			{/literal}

		</div>	

	</div>