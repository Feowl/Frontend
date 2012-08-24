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
		$user = $this->session->get('username');
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
				$phone_number = Format::phone_number(Arr::get($_POST, 'phonenumber'));
	
				//send to api
				$data_string = json_encode($json_items);   
				$results = Model_Contributors::post_contributor($data_string);
                 
				$http_status = json_decode($results['http_status']);
				$json_result = json_decode($results['json_result'], true); 
				 
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
			$user = Session::instance()->get('user');
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
		$username = $this->session->get('username');
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
		
		$this->template->right_content = View::factory('user/account.tpl')->bind('username', $username)
		->bind('userdata', $user);
		$this->template->left_content = Render::profile('account');
		try
		{
			//user info
			$username = $this->session->get('username');
			$userdata = $this->session->get('userdata');
			$contributor_id = $userdata[0]['id']; 
			$email = $userdata[0]['email'];
			$user = $userdata[0];
			
			
			// if the user updates profile
			if (HTTP_Request::POST == $this->request->method())
			{
				//build json items
				$json_items['name'] = Arr::get($_POST,'username');	
				$json_items['password'] = Arr::get($_POST,'userpassword');
				$email = $json_items['email'] = Arr::get($_POST,'useremail');	
				$json_items['language'] = mb_strtoupper(i18n::lang());	
				$phone_number = Format::phone_number(Arr::get($_POST, 'phonenumber'));
	
				//send to api
				$data_json = json_encode($json_items);
				
				$result = Model_Contributors::update_contributor($data_json, $contributor_id);
				print_r($data_json);
				echo "<br />";
				print_r($result);
				exit;
				//$results = Model_Contributors::post_contributor($data_string);
                 
				$http_status = json_decode($results['http_status']);
				$json_result = json_decode($results['json_result'], true); 
				 
				//$http_status = 201;
				if($http_status == 201)
				{
					//contributor device number #mobile
					$device['category'] = 'Phone';
					$device['phone_number'] = $phone_number['number'];
					//get the contributor ID
					
					$device['contributor'] = "/api/v1/contributors/".$contributor_id.'/';
					$device_json = json_encode($device);  
					$device_json = str_replace("\\", "", $device_json);
					
					//print_r($device_json); exit;
					$results = Model_Devices::update_device($device_json, $device_id);
					
					print_r($results); echo "<br />"; print_r($device_json); exit;
					
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
			$results = Model_Devices::get_device('', "contributor=$contributor_id");
			$json_result = json_decode($results['json_result'], true); 
			/*
			* At the moment each user has only one device, no need to loop through
			* TODO, a user can have more than one device (better loop .. foreach)
			*/
			$total_count = $json_result['meta']['total_count'];
			//check if a user has a device
			if($total_count >= 1)
			{
				$category = $json_result['objects'][0]['category'];
				if($category == "Phone")
				{
					$phone_number = $json_result['objects'][0]['phone_number'];					
					$str = $json_result['objects'][0]['resource_uri'];
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
		$userdata = $this->session->get('userdata');
		//print_r($userdata[0]);
		
		$contributor_id = $userdata[0]['id']; 
		$results = Model_Reports::get_reports('', "contributor=$contributor_id");
		
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
		
		$userdata = $this->session->get('userdata');
		
		$contributor_id = $userdata[0]['id']; 
		$results = Model_Reports::get_reports('', "contribuator=$contributor_id&format=csv");
		$csv_format = $results['json_result'];
		
		//create a temporal file and save under temp/
		$filename = uniqid().'_'.$userdata[0]['email']."_contributions.csv";
		
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