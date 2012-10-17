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
		 return API::send_request(Kohana::config('api.device'),$data_string,"POST");
	}
	
	//Returns a usere device identified by its id
	public static function get_device($data_string, $filter=NULL){
		return API::send_request(Kohana::config('api.device'),$data_string,"GET", $filter);
	}
	
	//Update the information related to an existing device(works if the user that issues this call has the right permission)
	public static function update_device($data_string, $device_id, $filter=NULL){
		 return API::send_request(Kohana::config('api.update_device').$device_id."/?", $data_string, "PUT", $filter); 
	}
	
	//Delete a device identified by its id
	public static function delete_device(){
		
	}	

} // End Devices Model