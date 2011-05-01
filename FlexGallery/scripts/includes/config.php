<?php

define('DEBUG_MODE', true);

define('DB_HOST',   'localhost');
define('DB_SCHEMA', 'flexgallery');
define('DB_USER',   'root');
define('DB_PASS',   '');

define('USER_SESSION_TIME', 3600);

if (DEBUG_MODE) {
	error_reporting(30719);
} else {
	error_reporting(0);
}

mb_internal_encoding('UTF-8');
date_default_timezone_set('Europe/Sofia');

?>