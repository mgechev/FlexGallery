<?php

//Adding needed functions
require_once './includes/data/en.language.php';
require_once './includes/functions/db.functions.php';
require_once './includes/functions/login.functions.php';

//Connecting to the database
dbConnect('localhost', 'flexgallery', 'root', '');

//Getting page's name
$page = '';
if (!empty($_GET['page'])) {

	$page = $_GET['page'];

}

//Including the right page
switch ($page) {

	case 'register':
		include './pages/register.php';
		break;		

	case 'login':
		include './pages/login.php';
		break;
		
}

?>