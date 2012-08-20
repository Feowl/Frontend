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

	//get all users TODO.. return users from the API
	public static function user($email){
		Model_Contributors::get_contributors('', "email=$email");
		$user1 = array('username'=>'test1', 'password'=>'uiuiuiui1', 'email'=>'test1@test.com');
		$user2 = array('username'=>'test2', 'password'=>'uiuiuiui2', 'email'=>'test2@test.com');
		return array($user1, $user2);
	}
	
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

} // End User Model