<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Controller: Pages. //@todo Pages have to read via the api from the cms
 *
 * @package    Feowl/Home
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */     
class Controller_Pages extends Controller_Template {
	
	//define the template to use
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
		//default page lands to about
		$this->about();
	}

	public function action_about() {
		$this->template->content = View::factory('pages/about.tpl');
	}

	public function action_credits() {
		$this->template->content = View::factory('pages/credits.tpl');
	}

	public function action_tos() {
		$this->template->content = View::factory('pages/tos.tpl');
	}
	
	public function action_not_in_douala() {
		$this->template->content = View::factory('pages/not_in_douala.tpl');
	}

	public function after(){
		// Adds optional stylesheet files in an array
		$this->template->files_stylesheet = array();

		// Adds optional javascript files in an array
		$this->template->files_javascript = array(
			url::base()."assets/js/global.js"
		);

		parent::after();		
	}

} // End Home