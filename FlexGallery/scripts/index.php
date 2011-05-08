<?php

//Starting the session
session_start();

//Adding needed functions
require_once './includes/config.php';
require_once './includes/data/en.language.php';
require_once './includes/functions/db.functions.php';
require_once './includes/functions/login.functions.php';
require_once './includes/functions/gallery.functions.php';

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
		
	case 'upload':
		include './pages/upload.php';
		break;
		
	case 'picture_list':
		include './pages/picture_list.php';
		break;
		
	case 'edit_profile':
		include './pages/edit_profile.php';
		break;
		
}

?>