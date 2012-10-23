	<div class="container">

		<div class="row">
			
			<div class="span7" id="explore-space">
				
				<div class="row">
					
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
					</div>	
					
					<div id="explore-map" class="span4"></div>	
					
					<div class="span7">
						<div id="explore-range-slider"></div>
					</div>

				</div>	
			
			</div>

			<div class="span4 offset1 intro">
				<h2>{__ t='Welcome to Feowl'}</h2>				
					{__ t='<p>Feowl is a community-driven platform that produces accurate and actionable public data on the electricity supply in Douala.</p><p>Feowl will poll reliable voluntary contributors and will ask them about their power cut experience: Did they witness one? When was that? Where?</p><p>Feowl will aggregate, compute and analyze the data received via polls and will display them on this platform using the best visualization techniques.</p><p>Feowl was made possible thanks to a grant received from the International Press Institute.</p>'}
				</p>
				<p class="call-to-contribute">
					<a class="btn btn-large btn-primary" href="{url::site('contribute')}">Contribute to Feowl!</a>
				</p>		
			</div>

		</div>		

	</div>