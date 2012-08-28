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
	
	public function __construct()
	{
		try 
		{
			$this->session = Session::instance();
		}
		catch(ErrorException $e) 
		{
			session_destroy();
		}
		//parent::__construct();
		// set session 
		$this->session = Session::instance();
	}
	
	/**
	 * Log out a user by removing the related session variables.
	 * TODO:: use email and password to login a user
	 * @param  string  email
	 * @param  string  password
	 * @return  boolean
	 */
	public function login($email, $password)
	{
		//email is unique returns a single result
		$user_json = Model_Contributors::get_contributors('', "email=$email");
		$user = json_decode($user_json['json_result'], true);
	
		//if there is a user with this email
		if($user['meta']['total_count'] == true)
		{
			//now check if the contributor password is valid
		    $password_check_json = self::check_password($user['objects'][0]['id'], $password);
			$password_check = json_decode($password_check_json['json_result'], true);
			
			if($password_check['password_valid'])
			{
				//set user info in session
				$this->session->set('user', $password_check);
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	
	/**
	 * Check if a user is login
	 * 
	 * @param  string  proceed_url
	 * @return  boolean
	 */
	public function check_login($proceedURL=NULL)
	{
		$user= $this->session->get('user');
	
		//check if a user is logged in
		if($user)
		{
			return true;
		}
		else
		{
			//if user is not login set the proceedURL in session
			if($proceedURL != NULL)
			{
				$this->session->set('proceedURL', $proceedURL);
			}
			else
			{
				$this->session->set('proceedURL', Request::detect_uri());
			}
			return false;
		}	
	}
	
	/**
	 * check if a contributor password is valid
	 * 
	 * @param  string  contributor_id
	 * @param  string  password
	 * @return  boolean
	 */
	public static function check_password($contributor_id, $password){
		$filter = "password=$password";
		$data_string = "";
		return API::send_request(Kohana::config('api.contributor').$contributor_id."/check_password/?", $data_string, "GET", $filter); 
	}
	
	/**
	 * Logout a user by either destroying all session variables or related variables.
	 * 
	 * TODO:: use email and password to login a user
	 * @param  string  email
	 * @param  string  password
	 * @return  boolean
	 */
	public function logout($destroy=false)
	{
		if($destroy != true)
		{
			$this->session->destroy();
		}
		else
		{
			$this->session->delete('user');
		}
		return;
	}
	
	/**
	 * Logout a user by either destroying all session variables or related variables.
	 * delete user account (works if the user that issues this call has the right permission)
	 * @return  boolean
	 */
	public function delete()
	{
		$user = $this->session->get('user');
		$contributor_id = $user['id'];
		//$username = $userdata[0]['name'];
		//api request to delete account
		$json_result = Model_Contributors::delete_contributor("", $contributor_id);
		$result = json_decode($json_result['http_status'], true);
		
		if($result == 204)
		{
			self::logout(true);
			return true;
		}
		else
		{
			return false;
		}
	}
	
} // End User Model