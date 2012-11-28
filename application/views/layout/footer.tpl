	<div class="container">

		<footer>

			<div class="row">
				<div class="tc span1 offset1"><a href="{URL::base()}pages/about">{__ t='About'}</a></div>
				<div class="tc span1"><a href="{URL::base()}pages/credits">{__ t='Credits'}</a></div>
				<div class="tc span1"><a href="http://www.apache.org/licenses/LICENSE-2.0.html">{__ t='Licence'}</a></div>	
				<div class="tc span1"><a href="mailto:contact@feowl.com">{__ t='Contact'}</a></div>
				<div class="tc span2"><a href="{URL::base()}pages/tos">{__ t='Terms of service'}</a></div>
				<div class="tc span1"><a href="http://feowl.tumblr.com/">{__ t='Blog'}</a></div>
				<div class="tc span1"><a href="http://twitter.com/feowl">{__ t='Twitter'}</a></div>				
				<div class="tc span1"><a href="http://facebook.com/feowl">{__ t='Facebook'}</a></div>				
				<div class="tc span1"><a href="https://github.com/Feowl/">{__ t='Code'}</a></div>
			</div>

			<div class="row">
				<div class="offset2 span8 tc">
					<p class="mentions">
						{__ t='Feowl is financed by a grant from the <a href="http://www.freemedia.at/">International Press Institute</a>.'}
						<br />
						{__ t='It is a project by <a href="http://www.internetsansfrontieres.com/">Internet Sans Frontières</a>, <a href="http://jplusplus.org/">Journalism++</a>, <a href="http://www.tesobe.com/">TESOBE</a> and <a href="http://www.wasamundi.com/">Wasamundi</a>.'}
					</p>
				</div>
			</div>

		</footer>

	</div>
	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	{* Global js *}
	<script src="{URL::base()}assets/js/jquery.js" type="text/javascript"></script>
	<script src="{URL::base()}assets/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	<script src="{URL::base()}assets/js/genral.js" type="text/javascript"></script>
	
	{* Optional js *}
	{if isset($files_javascript)}
		{include file='tool/header-file.tpl' type='js'  list=$files_javascript after="" before=""}
	{/if}

	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-35984661-3']);
	  _gaq.push(['_trackPageview']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</script>

	</body>
</html>
