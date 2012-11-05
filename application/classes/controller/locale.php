<?php defined('SYSPATH') or die('No direct script access.');
 
/**
 * Controller: Locale
 *
 * @package    Feowl/Json
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Controller_locale extends Controller {
 
   /**
   * Set auto render to false
   * @var bool
   */
  public $auto_render = FALSE;
  
  public function action_index() {
    //do nothing
  }

  /**
   * Send an object as json string
   * @param  Object $obj The object to json encore
   */
  public function send_json($obj) {    
    // Change the content type for JSON
    $this->response->headers('Content-Type','application/json');
    // Display the content
    $this->response->body( json_encode($obj) );
  }


  /**
   * Send the signup messages as a json object
   * @access  public    
   */
  public function action_signup() {

    $messages = array(      
      "username"  => array(
        "required" => __("This field required.")
      ),
      "useremail" => array(
          "email"     => __("Enter valid email address"),
      ),
      "userpassword" => array(
          "minlength" => __("Password must be minimum 8 characters")
      ),
      "phonenumber" => array(
          "minlength" => __("Phone Number must have atleast 6 chars"),
          "maxlength" => __("Phone Number must not exceed 13 chars"),
          "digits"    => __("Phone Number should content only digits")
      ),
    );

    return $this->send_json($messages);
  }
  
  
   
}