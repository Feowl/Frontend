<?php defined('SYSPATH') or die('No direct access allowed.');$api_root = $_ENV["FEOWL_API_ROOT"];return array(  'post_report'             => "{$api_root}reports/?",  'get_reports'             => "{$api_root}reports/?",  'post_contributor'        => "{$api_root}contributors/?',",  'device'                  => "{$api_root}devices/?",  'update_device'           => "{$api_root}devices/",  'contributor'             => "{$api_root}contributors/"  // Default configuration for rest module  "default" => array(    'content_type' => 'application/json',    'uri'          => $api_root  ));  