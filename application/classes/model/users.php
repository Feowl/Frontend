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
				$session = Session::instance();
				//print_r($user['objects']); exit;
				$session->set('userdata', $user['objects']);
				$session->set('username', $user['objects'][0]['name']);	
			return true;
		}else{
			return false;
		}
	}
	
	//logout a user
	public function logout(){
		return Session::instance()->destroy();
	}
	
	//delete user account
	public function delete(){
		$session = Session::instance();
		$userdata = $session->get('userdata');
		$contributor_id = $userdata[0]['id'];
		//$username = $userdata[0]['name'];
		//api request to delete account
		$json_result = Model_Contributors::delete_contributor("", $contributor_id);
		$result = json_decode($json_result['http_status'], true);
		
		if($result == 204){
			$session->destroy();
			return true;
		}else{
			return false;
		}
	}
	
	//change contributor email
	public function change_email(){
		$session = Session::instance();
		$userdata = $session->get('userdata');
		$contributor_id = $userdata[0]['id'];
		
		//api request to delete account
		Model_Contributors::put_contributor("", $contributor_id);
		$session->destroy();
			
		return;
	}

} // End User Model