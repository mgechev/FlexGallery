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
		
	case 'edit_picture':
		include './pages/edit_picture.php';
		break;
		
	case 'delete_picture':
		include './pages/delete_picture.php';
		break;		
		
	case 'users':
		include './pages/users.php';
		break;		
		
	case 'picture_details':
		include './pages/picture_details.php';
		break;	

	case 'add_comment':
		include './pages/add_comment.php';
		break;			
		
	case 'get_rating':
		include './pages/get_rating.php';
		break;
		
	case 'add_vote':
		include './pages/add_vote.php';
		break;		

	case 'login_check':
		include './pages/login_check.php';
		break;

	case 'add_flicker_picture':
		include './pages/add_flicker_picture.php';
		break;
		
}

?>