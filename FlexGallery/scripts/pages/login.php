<?php

//Checking if the POST values are empty
if (!empty($_POST['username']) && !empty($_POST['password']) && !isUserLogged()) {

	//Preparing the username and password for the database
	$user = dbInputFilter($_POST['username']);
	$pass = sha1($_POST['password']);
	
	//Checking is the user logged
	$isValidUser =
	dbGetRow("SELECT user_id, username
						FROM users 
						WHERE username = '$user' && password = '$pass' LIMIT 1", 5);

	//Printing the result
	if (count($isValidUser) > 0) {
	
		loginUser($isValidUser);
		
		echo '<success>Welcome '. $isValidUser['username'] .'</success>';
	
	} else {
	
		echo '<error>Wrong username or password</error>';
	
	}	
} else if (isUserLogged()) {

	echo '<success> Welcome ' . $_SESSION['username']  . '</success>';
	exit;
	
}

?>