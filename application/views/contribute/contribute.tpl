<div class="banner remove-height">	<img src="{URL::base()}assets/img/home-douala.jpg" class="douala" alt="Photo: Alvise Forcellini" /></div><div class="container">	<div class="row">				<div class="span10 offset1">					<h1 class="white-color bottom20 top40">{__ t="Create an account"}</h1>						<div class="login-form white-panel">				<form method='post' action="{url::site('contribute/switch')}" id="contribute" name="contribute">										<div class="row-fluid">						<div class="span5">							<label class="padding30 current">								{__ t='How many power cuts did you witness yesterday ?'}<br />																						<select class="contribute top20" name="contribute">									<option value="Please select" selected="selected">{__ t='Please select'}</option>									<option value="1" >1</option>									<option value="2" >2</option>									<option value="3" >3</option>								</select>								<span class='success-tick success-tick0'></span>										</label>														</div>						<div class="span2 tc or-separator">							<p>or</p>						</div>						<label class="span5 checkbox top60">							<input type='checkbox' value="1" name='know' class="right10" /> {__ t='I don\'t know, I wasn\'t in Douala'}						</label>					</div><!-- END .control-group -->					<hr class="bottom0" />					<div class="row-fluid">												<div class="span4">							<div class="padding30">																<h3>First powercut <span class='success-tick1 success-tick'></span></h3>								<div class="control-group row-fluid">									<label>										{__ t='How long did it last?'}																		<select class="top10 span12 contribute1" name="contribute1">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="29" >{__ t='Less than 30Mins'}</option>											<option value="+30" >{__ t='About 30Mins'}</option>											<option value="+60" >{__ t='About 1 hour'}</option>											<option value="+120" >{__ t='About 2 hours'}</option>											<option value="+180" >{__ t='About 3 hours'}</option>										</select>									</label>								</div>															<div class="control-group row-fluid">									<label>										{__ t='Which part of town where you?'}										<select class="top10 span12 contribute1-1" name="contribute1-1">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="1" >{__ t='Douala I'}</option>											<option value="2" >{__ t='Douala II'}</option>											<option value="3" >{__ t='Douala III'}</option>											<option value="4" >{__ t='Douala IV'}</option>											<option value="5" >{__ t='Douala V'}</option>										</select>									</label>								</div>							</div><!-- END .padding30 -->						</div><!-- END #grid1 -->						<div class="grid2 span4">														<div class="padding30">															<h3>Second powercut <span class='success-tick2 success-tick'></span></h3>								<div class="control-group row-fluid">									<label>										{__ t='How long did it last?'}										<select class="top10 span12 contribute2" name="contribute2">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="29" >{__ t='Less than 30Mins'}</option>											<option value="+30" >{__ t='About 30Mins'}</option>											<option value="+60" >{__ t='About 1 hour'}</option>											<option value="+120" >{__ t='About 2 hours'}</option>											<option value="+180" >{__ t='About 3 hours'}</option>										</select>									</label>								</div>																<div class="control-group row-fluid">									<label>										{__ t='Which part of town where you?'}										<select class="top10 span12 contribute2-1" name="contribute2-1">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="1" >{__ t='Douala I'}</option>											<option value="2" >{__ t='Douala II'}</option>											<option value="3" >{__ t='Douala III'}</option>											<option value="4" >{__ t='Douala IV'}</option>											<option value="5" >{__ t='Douala V'}</option>										</select>									</label>								</div>							</div><!-- END .padding30 -->						</div><!-- END #grid2 -->						<div class="grid3 span4">														<div class="padding30">																<h3>Third powercut <span class='success-tick3 success-tick'></span></h3>								<div class="control-group row-fluid">									<label>										{__ t='How long did it last?'}										<select class="top10 span12 contribute3" name="contribute3">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="29" >{__ t='Less than 30Mins'}</option>											<option value="+30" >{__ t='About 30Mins'}</option>											<option value="+60" >{__ t='About 1 hour'}</option>											<option value="+120" >{__ t='About 2 hours'}</option>											<option value="+180" >{__ t='About 3 hours'}</option>										</select>									</label>								</div>																	<div class="control-group row-fluid">									<label>										{__ t='Which part of town where you?'}										<select class="top10 span12 contribute3-1" name="contribute3-1">											<option value="Please select" selected="selected">{__ t='-'}</option>											<option value="1" >{__ t='Douala I'}</option>											<option value="2" >{__ t='Douala II'}</option>											<option value="3" >{__ t='Douala III'}</option>											<option value="4" >{__ t='Douala IV'}</option>											<option value="5" >{__ t='Douala V'}</option>										</select>									</label>								</div>															</div><!-- END .padding30 -->						</div><!-- END #grid3 -->					</div><!-- END .row-fluid -->					<hr />									<div class="row-fluid">						<div class="span6 tl">										<div class="left30 top10">												<a href="#" onClick="javascript:reset_fields('#contribute');" class='reset'>{__ t='Clear form'}</a>							</div>						</div>						<div class="span6 tr">							<div class="right30">								<input type='submit' class="btn btn-large sbtn contribute-submit" name='submit' value="{__ t='Contribute to Feowl!'}"/>							</div>						</div>					</div>							</form>				<div class="endContainer" style="display:none;">					<div class="alert ">						<a class="close" data-dismiss="alert" href="#">&times;</a>						<p>							<a href="{url::site('explore')}" class="btn btn-large " >Explore the data</a>						</p>					</div>					</div>			</div><!-- END .contribute-form -->		</div><!-- END .white-panel -->		<div class="js-loading-overlay" style="display: block;"></div>	</div></div>