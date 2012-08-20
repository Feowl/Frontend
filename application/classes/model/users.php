<?php defined('SYSPATH') or die('No direct access allowed.');

/**
 * Description @ Users Model. Talks with API
 *
 * @package		Feowl
 * @subpackage  Model
 * @author      Feowl Team
 * @copyright   2012
 */
class Model_Users extends Model{
		
	//login function
	//Presently using only a valid email to login a user, risky ... 
	//TODO:: use email and password to login a user
	public function login($email, $password){
		//email is unique returns a single result
		$user_json = Model_Contributors::get_contributors('', "email=$email");
		$user = json_decode($user_json['json_result'], true);
		
		if($user['meta']['total_count'] == true){
			foreach($user['objects'] as $u):
				$session = Session::instance();
				$session->set('user', $user['objects']);
			endforeach;
			return true;
		}else{
			return false;
		}
	}
	
	//logout a user
	public function logout(){
		return Session::instance()->destroy();
	}

} // End User Model