
	<div class="banner">

		<img src="{URL::base()}assets/img/home-douala.jpg" class="douala" />

		<div class="welcome">
			<div class="container">
				<div class="span5">
					<h2>{__ t='Welcome to Feowl'}</h2>		
					<p>
						{__ t='Feowl is a community-driven platform that produces accurate and actionable public data on the electricity supply in Douala.'}
					</p>
					<p>
						<a class="btn btn-giant btn-primary btn-giant" href="{url::site('contribute')}">Contribute to Feowl</a>
					</p>
				</div>
			</div>
		</div>

	</div>

	<div class="container">

		<div class="row">
			
			<div class="span4 offset7 home white-panel" id="explore-space">
				
				<h3>{__ t='Power cuts in Douala'}</h3>
				<div id="explore-legend" class="tl">
					<ul class="well no-style">
						<li><span class="legend no-relevant"></span>{__ t='no data'}</li>
						<li><span class="legend less-30min"></span>{__ t='< 30m'}</li>
						<li><span class="legend less-2h"></span>{__ t='< 2h'}</li>
						<li><span class="legend less-4h"></span>{__ t='< 4h'}</li>
						<li><span class="legend more-4h"></span>{__ t='> 4h'}</li>
					</ul>
				</div>

				<div id="explore-map"></div>	
				<p>
					<a class="btn btn-large btn-primary" href="{url::site('contribute')}">{__ t='Explore the reports'}</a>
				</p>		

				
				<div class="span6 hidden">
					<div id="explore-range-slider"></div>
				</div>
			
			</div>

		</div>		

	</div>