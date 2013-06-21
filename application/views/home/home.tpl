	<div class="banner">

		<img src="{URL::base()}assets/img/home-douala.jpg" class="douala" alt="Photo: Alvise Forcellini" />

		<div class="welcome">
			<div class="container">
				<div class="span6">
					<h2>{__ t='Welcome to Feowl'}</h2>		
					<p>
						{__ t='Feowl is a community-driven platform that produces accurate and actionable public data on the electricity supply in Douala, Cameroon.'}
					</p>
					<p>
			            {if $smarty.const.ALLOW_CONTRIBUTION}
							<a class="btn btn-primary btn-giant" href="{url::site('contribute')}">{__ t='Contribute to Feowl'}</a>
							<a class="btn btn-giant left10" href="{URL::base()}pages/not_in_douala">{__ t='Not in Douala?'}</a>
						{/if}
					</p>
				</div>
			</div>
		</div>

	</div>

	<div class="container">

		<div class="row">
			
			<div class="span7">			

			    {if $smarty.const.ALLOW_CONTRIBUTION}	
					<h2 class="left30 top20 bottom20">{__ t='How it works'}</h2>		
				
					<div class="right20 left30">
						<div class="row-fluid">
							<div class="span4 what">
								<div class="well">
									<h3>1. {__ t="Register"}</h3>
									{__ t="Register for Feowl, either online or via SMS by texting REGISTER to 88002014. Feowl only works in Douala at the moment!"}
								</div>
							</div>

							<div class="span4 what">
								<div class="well">
									<h3>2. {__ t="Contribute"}</h3>
									{__ t="We'll send you an SMS each morning at most asking you a simple question: <em>How many power cuts did you have yesterday?</em> Make sure to answer, even if you had 0 cuts!"}
								</div>
							</div>

							<div class="span4 what">
								<div class="well">
									<h3>3. {__ t="Explore"}</h3>
									{__ t="Feowl then produces statistics with all the information collected. It'll be a powerful source to hold energy producers and regulators to account!"}
								</div>
							</div>
						</div>	
					</div>
				{else}
					<h2 class="left30 top20 bottom20">{__ t="What is Feowl"}</h2>
					<div class="left30 bottom50">
						{__ t="<p>Feowl is a project that monitored power cuts in Douala, Cameroon, between November 2012 and May 2013. Users would register via SMS or email and receive daily prompts asking them how many power cuts they had the day before. They would answer per email or SMS, adding how long the power cut last, using shortcodes, e.g. PC DOUALA1 90 for a 90-minute power cut in the first arrondissement.</p><p>The experiment was discontinued for lack of funding but was a tremendous step forward in crowdsourcing vital information in developing countries.</p>"}
					</div>
				{/if}

			</div>

			<div class="span4  home white-panel" id="explore-space">
				
				<h3>{__ t='Power cuts in Douala'}</h3>
				<div id="explore-legend" class="tl">
					<ul class="well no-style">
						<li><span class="legend no-relevant"></span>{__ t='no data'}</li>
						<li><span class="legend less-30min"></span>{__ t='&lt; 30m'}</li>
						<li><span class="legend less-2h"></span>{__ t='&lt; 2h'}</li>
						<li><span class="legend less-4h"></span>{__ t='&lt; 4h'}</li>
						<li><span class="legend more-4h"></span>{__ t='&gt; 4h'}</li>
					</ul>
				</div>

				<div id="explore-map"></div>	
				<p>
					<a class="btn btn-large btn-primary" href="{url::site('explore')}">{__ t='Explore the reports'}</a>
				</p>		
				
				<div class="hidden">
					<div id="explore-range-slider"></div>
				</div>
			
			</div>

		</div>	

	</div>