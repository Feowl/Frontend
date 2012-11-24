<?php defined('SYSPATH') or die('No direct access allowed.');

/**
 * Class: Render
 *
 * Renders content 
 *
 * @package    Feowl
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Render {
 
	//renders the profile sidebar
    public static function profile($current=null)
	{
	    return  View::factory('user/profile-left.tpl')->bind('active', $current);
	}
 
 
    
}
?>