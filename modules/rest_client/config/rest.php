<?php defined('SYSPATH') OR die('No direct script access.');
// Useless file
return array(
    'default' => array(
        /**
         * uri: the location and protocol of the rest server
         * content_type: What to send up as a default Content-Type header
         */
        'uri' => $_ENV["FEOWL_API_ROOT"],
        'content_type' => 'application/json'
    )
);
