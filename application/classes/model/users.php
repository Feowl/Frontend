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
		
		if($user['meta']['total_count'] == true)
		{
			//set user info in session
			$this->session->set('userdata', $user['objects']);
			$this->session->set('username', $user['objects'][0]['name']);	
			return true;
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
		$username = $this->session->get('username');
		$userdata = $this->session->get('userdata');
		
		//check if a user is logged in
		if($username AND $userdata)
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
			$this->session->delete('userdate');
			$this->session->delete('username');
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
		$userdata = $this->session->get('userdata');
		$contributor_id = $userdata[0]['id'];
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
	
	//change contributor email (works if the user that issues this call has the right permission)
	public function modify_email($data)
	{
		$userdata = $session->get('userdata');
		$contributor_id = $userdata[0]['id'];
		
		$data_json = json_encode($data['email']);
		//api request to update email
		$update = Model_Contributors::update_contributor($data_json, $contributor_id);
		
		print_r($update); exit;
			
		return;
	}

} // End User Model