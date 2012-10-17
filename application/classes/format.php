<?php defined('SYSPATH') or die('No direct access allowed.');

/**
 * Class: Format
 *
 * @package    Feowl
 * @author     Feowl Team
 * @copyright  (c) 2012 Feowl Team
 * @license    http://feowl.tumblr.com/
 */
class Format extends Inflector {
 
 
    /*
	 * Formats an api returned area to get the area number
	 * For instance /api/v1/areas/1/ returns 1
	 * @param   string to be formated
	 * @return  string 
	 */
    public static function area($area)
	{
	    //return the first to the last item :)
		$clean = explode('/',$area);
		array_pop($clean);
        $area = array_pop($clean);
		return $area;
	}
 
	 /*
	 * Formats GSM Number #Cameroon Format
	 * @param   number to be formated
	 * @return  array
	 * @TODO Think of more possibility and replace substr()
	 */
    public static function phone_number($num)
	{
		//clean white spaces
		$number = preg_replace('/(?<=\d)\s+(?=\d)/',"", $num);
		$length = strlen($number);
	
		if(substr($number, 0, 2) == "00"){
			$number = substr($number, 2, $length);
		}
		elseif(substr($number, 0, 1) == "0"){
			$number = substr($number, 1, $length);
		}
		elseif(substr($number,0,1) == "+" ){
			$number = substr($number, 1, $length);
		}
		
		//modify the value of the length...
		$length = strlen($number);	
		
		//this is the order respectively
		//for orange numbers entered without 237
		//for mtn numbers entered without 237
		//for camtel numbers entered without 237
		//for camtel numbers entered without 237
		//for +237
	
		$base = 8;
		$top = 11;
		$status = true;
		
		if($length == $base AND $number[0] == '9'){
			$validnumber = '237'.$number; 
		}
		elseif($length == $base AND $number[0] == '7'){
			$validnumber = '237'.$number;
		}
		elseif($length == $base AND $number[0] == '3'){
			$validnumber = '237'.$number;
		}	
		elseif($length == $base AND $number[0] == '2'){
			$validnumber = '237'.$number;
		}
		elseif($length == $top AND substr($number, 0, 3) == "237"){
			$validnumber = $number;
		}
		else{ 
			$validnumber = $num;
			$status = false;
		}
		
		//echo $validnumber.'<br>'.$status; exit;
		return array("number"=>$validnumber, "status"=>$status);   
	}
 
    
}
?>