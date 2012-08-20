<?php defined('SYSPATH') or die('No direct access allowed.');

/**
 * Description @ Contributors Model. Talks with API about contributor resources
 * Contributors are the individuals registered on the platform, they add reports to it
 * @package		Model
 * @subpackage  Model
 * @author      Feowl Team
 * @copyright   2012
 */
class Model_Contributors extends Model{

	//Add a new contributor to the platform (works if the user that issues this call has the right permission)
	public static function post_contributor($data_string){
        return API::send_request(Kohana::config('api.post_contributor'),$data_string,"POST");
	}
	
	//Returns all contributor if the user that issue this call has the right permission has the right
	public static function get_contributors($data_string, $filter=NULL){
	    return API::send_request(Kohana::config('api.post_contributor'), $data_string, "GET", $filter); 
	}
	
	//Delete a contributor(works if the user that issues this call has the right permission)
	public static function delete_contributor($data_string, $contributor_id){
		 return API::send_request(Kohana::config('api.delete_contributor').$contributor_id."/?", $data_string, "DELETE"); 
	}	
	
	/*
	 * Returns a single contributor identified by its id 
	 * (works if the user that issues this call has the right permission)
	 */
	public static function get_contributor(){
		
	}
	
	//Update the information related to an existing contributor(works if the user that issues this call has the right permission)
	public static function update_contributor(){
		
	}
	

} // End Contributors Model