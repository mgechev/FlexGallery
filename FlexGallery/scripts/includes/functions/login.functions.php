<?php

function get_user_ip()
{
	if (getenv("HTTP_CLIENT_IP")) {
		$ip = getenv("HTTP_CLIENT_IP");
	} elseif (getenv("HTTP_X_FORWARDED_FOR")) {
		$ip = getenv("HTTP_X_FORWARDED_FOR");
	} elseif( getenv("REMOTE_ADDR")) {
		$ip = getenv("REMOTE_ADDR");
	} else {
		$ip = "UNKNOWN";
	}

	return $ip;
}

function logout()
{
	session_unset();
	$isLoggedOut = session_destroy();
	$_SESSION = array();

	return $isLoggedOut;
}

function isUserLogged()
{
	$time = time();
	
	if (!isset($_SESSION['id']) || empty($_SESSION['id']) || is_null($_SESSION['id'])) {
		return false;
	} elseif ($_SESSION['time'] < ($time - USER_SESSION_TIME)) {
		logout();
		return false;
	} elseif ($_SESSION['ip'] !== get_user_ip()) {
		return false;
	} else {
		//$_SESSION['time'] = $time;
		return true;
	}
}

function loginUser($array)
{
	$_SESSION['id'] = $array['user_id'];
	$_SESSION['username'] = $array['username'];
	$_SESSION['ip'] = get_user_ip();
	$_SESSION['time'] = time();

	return true;
}

?>