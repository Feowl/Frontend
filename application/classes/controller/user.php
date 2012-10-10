<?php defined('SYSPATH') or die('No direct script access.');
 
/**
 * user controller, User Authentication on the web platform
 *
 * @package    Feowl/Auth
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Controller_User extends Controller_Template {
 
    public $template = "template/sub_template.tpl";
	
	public function before()
	{
		try 
		{
			$this->session = Session::instance();
		}
		catch(ErrorException $e) 
		{
			session_destroy();
		}
		// Execute parent::before first
		parent::before();
		// Open session
		$this->session = Session::instance();
		//instantiate user model
		$this->model = new Model_Users;
	}
	
	 //Use the after method to load static files
	public function after()
	{
		// Adds all javascript files
		$this->template->files_javascript = array(		
			url::base()."assets/js/script-user.js",
			"http://jzaefferer.github.com/jquery-validation/jquery.validate.js"
		);	
		parent::after();
	}
	
    public function action_index()
    {
        //check if user is logged in
		$user = $this->model->check_login();
         
        // if a user is not logged in, redirect to login page 
        if (!$user)
        {
            Request::current()->redirect('user/login');
        }
		else
		{
			Request::current()->redirect('contribute');
		}
    }
	
	//check login
	private function action_check_login($proceedURL=NULL){
		//check if user is logged in
		
		if($proceedURL != NULL)
		{
			$user = $this->model->check_login($proceedURL);
		}else
		{
			$user = $this->model->check_login();
		}
		
		if(!$user)
		{
			Request::current()->redirect('user/login');
		}
		
	}
     
	public function action_already_logged_in()
	{
		$user = $this->session->get('user');
		if($user)
		{
			Request::current()->redirect('contribute');
		}
	}
	 //post to the api to creat an account for a contributor
    public function action_signup()
    {
		//check if the user is logged in
		$this->action_already_logged_in();
		
        $this->template->right_content = View::factory('user/signup.tpl')
            ->bind('error_1', $error_1)->bind('error_2', $error_2);
		$this->template->left_content = View::factory('user/signup_info.tpl');

        if (HTTP_Request::POST == $this->request->method())
        {    //echo "I love Feowl"; exit;
			try
			{
				//build json items
				$json_items['name'] = Arr::get($_POST,'username');	
				$json_items['password'] = Arr::get($_POST,'userpassword');
				$email = $json_items['email'] = Arr::get($_POST,'useremail');	
				$json_items['language'] = mb_strtoupper(i18n::lang());	
				$json_items['frequency'] = Arr::get($_POST,'frequency');
				$phone_number = Format::phone_number(Arr::get($_POST, 'phonenumber'));
				
				//send to api
				$data_string = json_encode($json_items);
				$results = Model_Contributors::post_contributor($data_string);
				$http_status = json_decode($results['http_status']);
				$json_result = json_decode($results['json_result'], true); 
			
				//print_r($results); exit;
				 
				if($http_status == 201)
				{
					//contributor device number #mobile
					$device['category'] = 'Phone';
					$device['phone_number'] = $phone_number['number'];
					//get the contributor ID
					$results = Model_Contributors::get_contributors('', "email=$email");
					$r = json_decode($results['json_result'], true);
					$device['contributor'] = "/api/v1/contributors/".$r['objects'][0]['id'].'/';
					$device_json = json_encode($device);  
					$device_json = str_replace("\\", "", $device_json);
					$results = Model_Devices::post_device($device_json);
					
					//print_r($results); echo "<br />"; print_r($device_json); exit;
					
					$notice = "Thanks for signing up! We would sent you an email to
					verity your account";
					//set notice in session
					$this->session->set('alert', $notice);
					Request::current()->redirect('home');
				}
				elseif(isset($json_result['error_message']))
				{
					$error_1 = $json_result['error_message']; 
				}
				else
				{
					//error 400 :)
					if(isset($json_result['name'][0])):
						$error_1 = $json_result['name'][0]." ";
					endif;
					if(isset($json_result['email'][0])):
						$error_2 = $json_result['email'][0]; 
					endif;
				}
				//@todo force login to next step
			}
			catch(Exception $e) 
			{
                // Set failure message TODO: Set various notices
				$this->session->set('alert', "Technical Error :)");
            }
		}
    }
     
	//login the user
    public function action_login()
    {
		//check if the user is logged in
		$this->action_already_logged_in();
		
        $this->template->right_content = View::factory('user/login.tpl')
            ->bind('message', $message);
		$this->template->left_content = View::factory('user/login_info.tpl');
         
        if (HTTP_Request::POST == $this->request->method())
        {
			$email = $this->request->post('email');
			$password = $this->request->post('password');
			
			//Attempt login a user
			//$user = Session::instance()->get('user');
			$user = $this->model->login($email, $password);
			
            // If successful, redirect user to contribute page
            if ($user)
            {
				$proceedURL = $this->session->get('proceedURL');
				if($proceedURL)
				{
					Request::current()->redirect($proceedURL);
				}
				else
				{
					Request::current()->redirect('contribute');
				}
            }
            else
            {
                $message = 'Username and password don\'t match';
            }
        }
    }
	
	// user forgot password
    public function action_forgot_password()
    {
        $this->template->right_content = View::factory('user/forgot_password.tpl')
            ->bind('message', $message);
		$this->template->left_content = View::factory('user/forgot_info.tpl');
         
        if (HTTP_Request::POST == $this->request->method())
        {
			$email = $this->request->post('email');
			
			//Attempt login a user
			$user = $this->model->check_user($email);
			
            // If successful, redirect user to login page
            if ($user)
            {
				$this->session->set('alert', print_r($user));
				Request::current()->redirect('user/login');
            }
            else
            {
                $message = 'User does not exist.';
            }
        }
    }
     
	 //logout the user
    public function action_logout()
    {
		// Log user out
		$this->model->logout();
         
        // Redirect to login page
        Request::current()->redirect('user/login');
    }
	
	//delete user account
	public function action_delete()
	{
		//check if the user is logged in
		$this->action_check_login();
		
		//print_r($userdata[0]['id']); exit;
		$user = $this->session->get('user');
		$username = $user['name'];
		$this->template->right_content = View::factory('user/delete.tpl')->bind('username', $username);
		$this->template->left_content = Render::profile('delete');
		
		$q = Arr::get($_GET,'q');
		
		if($q == "yes")
		{
			//sucess notice
			$notice_success = $username." your account has been deleted";
			$notice_failure = $username. " oops something went wrong, Please try again";
			
			//delete user account
			$delete = $this->model->delete();
			
			//set notice in session
			if($delete)
			{
				Session::instance()->set('alert', $notice_success);
			}
			else
			{
				Session::instance()->set('alert', $notice_failure);
			}
			
			Request::current()->redirect('home'); 
			
		}
		elseif($q == "no")
		{
			Request::current()->redirect('home'); 
		}
	}
	
	//profile
	public function action_profile()
	{
		Request::current()->redirect('user/account'); 
	}
	
	//accounts
	public function action_account()
	{
		//check if the user is logged in
		$this->action_check_login();
		$alert = $this->session->get_once('alert');
		$notice = $this->session->get_once('notice');
		$this->template->right_content = View::factory('user/account.tpl')->bind('user', $user)
		->bind('notice', $notice)->bind('alert', $alert);
		$this->template->left_content = Render::profile('account');
		try
		{
			$user = $this->session->get('user');
			$contributor_id = $user['id']; 
			$email = $user['email'];
			
			$result_device = Model_Devices::get_device('', "contributor=$contributor_id");
			$device_decode = json_decode($result_device['json_result'], true); 
			/*
			* At the moment each user has only one device, no need to loop through
			* TODO, a user can have more than one device (better loop .. foreach)
			*/
			$total_count = $device_decode['meta']['total_count'];
			//check if a user has a device
			if($total_count >= 1)
			{
				$category = $device_decode['objects'][0]['category'];
				if($category == "Phone")
				{
					$phone_number = $device_decode['objects'][0]['phone_number'];					
					$str = $device_decode['objects'][0]['resource_uri'];
					$resource = explode('/', $str);
					$device_id = $resource[4];				
				}
				else
				{
					$phone_number = '';
				}
			}
			else
			{
				$phone_number = '';
			}
			
			//add phone number to user array
			$user['phone_number'] = $phone_number;
			
			
			// if the user updates profile
			if (HTTP_Request::POST == $this->request->method())
			{
				//build json items	
				$json_items['password'] = Arr::get($_POST,'userpassword');
				
				$_email = Arr::get($_POST,'useremail');	
				$_name = Arr::get($_POST,'username');
				//if email and or name is changed submit --- 
				//The API would return a 404 if u submit an already existing email
				if($_email != $user['email']):
					$json_items['email'] = $_email;
				endif;
				
				if($_name != $user['name']):
					$json_items['name'] = $_name;
				endif;
				
				$json_items['frequency'] = Arr::get($_POST,'frequency');
				
				$json_items['language'] = mb_strtoupper(i18n::lang());	
				$phonenumber = Format::phone_number(Arr::get($_POST, 'phonenumber'));
	
				//send to api
				$data_json = json_encode($json_items);
				
				$results = Model_Contributors::update_contributor($data_json, $contributor_id);
				
				//change user info in session
				$this->model->force_login($user['id']);
                 
				$http_status = json_decode($results['http_status']);
	
				//$http_status = 204;
				if($http_status == 204)
				{
					//$results = Model_Devices::get_device('', "contributor=$contributor_id");
					//print_r($results); exit;
					
					//contributor device number #mobile
					$device['category'] = 'Phone';
					$device['phone_number'] = $phonenumber['number'];
					
					$device['contributor'] = "/api/v1/contributors/".$contributor_id.'/';
					$device_json = json_encode($device);  
					$device_json = str_replace("\\", "", $device_json);
					
					//print_r($device_json); exit;
					$results = Model_Devices::update_device($device_json, $device_id);
					
					$notice = "Your profile has been updated";
					
					$this->session->set('notice', $notice);
					Request::current()->redirect('user/account');
				}
				else
				{ 	
					$alert = "Technical Error";
					$this->session->set('alert', $alert);
				}
				//@todo force login to next step
			}
		}
		catch(Exception $e) 
		{
			$this->session->set('alert', "Technical Error :)");
			$alert = $this->session->get_once('alert');
			//$alert = $this->session->get_once('alert');
			$this->template->right_content->alert = $alert;
			echo $e; 
		}
			
	}
	
	//display logged in user contributions
	public function action_contributions()
	{
		
		//check if the user is logged in
		$this->action_check_login();
		
		//$username = $this->session->get('username');
		$user = $this->session->get('user');
		//print_r($userdata[0]);
		
		$contributor_id = $user['id']; 
		//created a bug to display contributions
		$results = Model_Reports::get_reports('', "contribsutor=$contributor_id");
		
		$http_status = json_decode($results['http_status']);
		$json_result = json_decode($results['json_result'], true); 
		
		if($http_status == 200)
		{
			//print_r( $json_result['objects']); exit;
			$this->template->right_content = View::factory('user/contributions.tpl')
			->bind('contributions', $json_result['objects'])->bind('total_count', $json_result['meta']['total_count']);
			$this->template->left_content = Render::profile('contributions');
		}
		
	}
	
	//download contributions
	public function action_download_contributions()
	{
		//check if the user is logged in
		$this->action_check_login();
		
		$user = $this->session->get('user');
		
		$contributor_id = $user['id']; 
		//created a bug to display contributions
		$results = Model_Reports::get_reports('', "contribuator=$contributor_id&format=csv");
		$csv_format = $results['json_result'];
		
		//create a temporal file and save under temp/
		$filename = uniqid().'_'.$user['email']."_contributions.csv";
		
		//check file is created and open
		if ($fp = fopen("temp/$filename", "w")) 
		{
			fwrite($fp, $csv_format);
			
			//setting headers to downloAd contributions as CSV
			header('Content-Type: text/csv; charset=utf-8');
			header('Content-Disposition: attachment; filename='.$filename);
			header('Content-Length: ' . strlen($filename));
			header('location: http://localhost/Frontend/temp/'.$filename);
			
			//delete the csv file
			//unlink(URL::base().'temp/'.$filename);
			exit;
		}
		else
		{
			//TODO
		}
	}
}
