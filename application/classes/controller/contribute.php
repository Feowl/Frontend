<?php
defined('SYSPATH') or die('No direct script access.');

/**
 * Controller: Contribute
 *
 * @package    Feowl/Contribute
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Controller_Contribute extends Controller_Template {
  public $template = "template/template.tpl";
  public $how_many_outage;
  public $area;
  public $duration;
  public $happened_at;
  public $has_experience_power_cut;
  
  
  public function before() {
    try {
      $this->session = Session::instance();
    }
    catch (ErrorException $e) {
      session_destroy();
    }
    // Execute parent::before first
    parent::before();
    // Open session
    $this->session = Session::instance();
    $this->user    = $this->session->get('user');
    
  }
  
  //Use the after method to load static files
  public function after() {
    // Adds all optional javascript files
    $this->template->files_javascript  = array(
      url::base() . "assets/js/global.js",
      url::base() . "assets/js/script-contribute.js"
    );
    $this->template->active_contribute = "active";
    parent::after();
  }
  
  
  public function action_index() {
    if(ALLOW_CONTRIBUTION) {
      $this->template->content = View::factory('contribute/contribute.tpl');
    } else {
      $this->request->redirect('/');
      exit;
    }
  }
  
  //handle contribute action
  public function action_switch() {

    //check for ajax request
    if (HTTP_Request::GET == $this->request->method()) {
      //prepare variables
      $e         = explode(",", Arr::get($_GET, 'content'));
      $count_var = count($e);

      //@todo, scale it to n power cuts
      if ($e[1] != 1) {
        //iterate to report several power cuts
        //@assume: the API does not fail.
        $this->how_many_outage                  = $e[0];
        $this->has_experience_power_cut         = true;
        $this->duration                         = (int) $e[2];
        $this->area                             = "/api/v1/areas/" . $e[3] . "/";
        $date                                   = explode("/", date("d/m/y", time()));
        //@todo do all validation and cleaning of data
        $json_items['area']                     = $this->area;
        $json_items['happened_at']              = "2012-07-09 05:45:00";
        $json_items['has_experience_power_cut'] = $this->has_experience_power_cut;
        $json_items['duration']                 = $this->duration;
        if ($this->user) {
          $json_items['contributor'] = "/api/v1/contributors/" . $this->user['id'] . "/";
        } else {
          $json_items['contributor'] = null;
        }
        //send to api
        $data_string = json_encode($json_items);
        $data_string = str_replace("\\", "", $data_string);
        //Model returns an array of status code and json data
        $results     = Model_Reports::create_report($data_string);
        //add 1 more power cut
        if ($count_var > 4) {
          $this->duration         = $e[4];
          $this->area             = $e[5];
          $json_items['area']     = "/api/v1/areas/" . $this->area . "/";
          $json_items['duration'] = $this->duration;
          //send to api
          $data_string            = json_encode($json_items);
          $data_string            = str_replace("\\", "", $data_string);
          //Model returns an array of status code and json data
          $results                = Model_Reports::create_report($data_string);
        }
        //add 2more power cuts
        if ($count_var > 6) {
          $this->duration         = $e[6];
          $this->area             = $e[7];
          $json_items['area']     = "/api/v1/areas/" . $this->area . "/";
          $json_items['duration'] = $this->duration;
          //send to api
          $data_string            = json_encode($json_items);
          $data_string            = str_replace("\\", "", $data_string);
          //Model returns an array of status code and json data
          $results                = Model_Reports::create_report($data_string);

		      //we expect just the final result from the api if more than 1 power cut			
		      $http_status = json_decode($results['http_status']);
		      $json_result = json_decode($results['json_result'], true);
		      
		      if ($http_status == 201) {
        		Session::instance()->set('alert', __("Thank you, your contribution has been taken into account.") );
		        //redirect to explore
		      } elseif (isset($json_result['error_message'])) {
		        Session::instance()->set('alert', $json_result['error_message']);
		      }
			 	}
      }


	 		// Change the content type for JSON
	 		$this->response->headers('Content-Type','application/json')->send_headers();
			//Request::initial()->response($r);
			echo json_encode( array("url" =>  url::site('user/contributions') ) );
			exit;
    }
  }
  
}