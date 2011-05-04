<?php

if (!function_exists('mysql_set_charset')) {
	function mysql_set_charset($charset)
	{
		return mysql_query("SET NAMES '" . $charset . "'");
	}
}

//Connecting to the database
function dbConnect($dbHost = DB_HOST, $dbSchema = DB_SCHEMA, $dbUser = DB_USER, $dbPass = DB_PASS)
{
	$dbConnection = @ mysql_connect($dbHost, $dbUser, $dbPass);

	if ($dbConnection) {
		$isDbSelected = mysql_select_db($dbSchema);
		
		if ($isDbSelected) {
			mysql_query("SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO'");
			mysql_set_charset('utf8');
			
			return $dbConnection;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

//Input filter, protecting from SQL Injections
function dbInputFilter($string)
{
	$string = trim($string);
	$isMagicQuotesActive = get_magic_quotes_gpc();
	$isNewEnough = function_exists("mysql_real_escape_string");
	if($isNewEnough) {
		if($isMagicQuotesActive) {
			$string = stripslashes($string);
		}
		$string = mysql_real_escape_string($string);
	} else {
		if(!$isMagicQuotesActive) {
			$string = addslashes($string);
		}
	}
	return $string;
}

//Output filter, protecting from XXS
function dbOutputFilter($string, $isFromEditor = false)
{// not used. we will use smarty|escape
	$string = stripslashes($string);
	if (!$isFromEditor) {
		$string = htmlspecialchars($string);
		$string = nl2br($string);
	}
	return $string;
}

//Insert any information to the database
function dbInsert($sql, $errorCode)
{
	$resource = mysql_query($sql) or die(mysql_error());
	if ($resource) {
		if (mysql_affected_rows() > 0) {
			return mysql_insert_id();
		} else {
			throw new Exception($GLOBALS['systemMessages']['noAffectedRows'], $errorCode);
		}
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Delete information from the database
function dbDelete($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		if (mysql_affected_rows() > 0) {
			return true;
		} else {
			throw new Exception($GLOBALS['systemMessages']['noAffectedRows'], $errorCode);
		}
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Update information in the database
function dbUpdate($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		return true;
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Replace information in the database
function dbReplace($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		$insertId = mysql_insert_id();
		if ($insertId > 0) {
			return $insertId;
		} else {
			throw new Exception($GLOBALS['systemMessages']['noAffectedRows'], $errorCode);
		}
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Getting assoc array from any table
function dbGetArray($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		$result = array();
		while ($row = mysql_fetch_assoc($resource)) {
			$result[] = $row;
		}
		return $result;
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Getting specific row from any table
function dbGetRow($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		$row = mysql_fetch_assoc($resource);
		return $row;
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

//Getting the count of the rows from specific table, which are valid according to specific requirement
function dbGetNumRows($sql, $errorCode)
{
	$resource = mysql_query($sql);
	if ($resource) {
		$count = mysql_num_rows($resource);
		return $count;
	} else {
		throw new Exception($GLOBALS['systemMessages']['dbError'], $errorCode);
	}
}

?>