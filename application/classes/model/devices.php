<?php defined('SYSPATH') or die('No direct access allowed.');

/**
 * Description @ Devices Model. Talks with API about device resources
 * Devices are the entities with which a user report a power cut
 * @package		wasaCMS
 * @subpackage  Model
 * @author      Wasamundi/Feowl Team
 * @copyright   2012
 */
class Model_Devices extends Model{

	//Add a new device to a contributor
	public static function post_device($data_string){
		 return API::send_request(Kohana::config('api.post_device'),$data_string,"POST");
	}
	
	//Returns a single device identified by its id
	public static function get_device(){
		
	}
	
	//Update the information related to an existing device
	public static function update_device(){
		
	}
	
	//Delete a device identified by its id
	public static function delete_device(){
		
	}	

} // End Devices Model