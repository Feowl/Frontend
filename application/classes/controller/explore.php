<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Controller: Explore
 *
 * @package    Feowl/Explore
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Controller_Explore extends Controller_Template {

	public $template = 'template/template.tpl';
	
	public function before(){
		try {
			$this->session = Session::instance();
		} catch(ErrorException $e) {
			session_destroy();
		}
		// Execute parent::before first
		parent::before();
		// Open session
		$this->session = Session::instance();
	}
	
	public function action_index() {
		$this->template->content = View::factory('explore/explore.tpl');
	}
	
	public function after(){
		// Adds optional stylesheet files in an array
		$this->template->files_stylesheet = array(
			url::base()."assets/css/jquery.qtip.css",	
			url::base()."assets/less/jQRangeSlider.less"	
		);
		// Adds optional javascript files in an array
		$this->template->files_javascript = array(		
			url::base()."assets/js/handlebars.js",
			url::base()."assets/js/chroma.min.js",
			url::base()."assets/js/kartograph.min.js",
			url::base()."assets/js/raphael.min.js",		
			url::base()."assets/js/g.raphael-min.js",		
			url::base()."assets/js/g.bar-min.js",
			url::base()."assets/js/jquery-ui.min.js",		
			url::base()."assets/js/jquery.qtip.min.js",				
			url::base()."assets/js/jQAllRangeSliders-min.js",
			url::base()."assets/js/underscore-min.js",
			url::base()."assets/js/global.js",
			url::base()."assets/js/script-explore.js"
		);
		$this->template->active_explore = "active";
		parent::after();		
	}
	
} // End Welcome