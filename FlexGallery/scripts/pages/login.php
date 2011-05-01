<?php

//Checking if the POST values are empty
if (!empty($_POST['username']) && !empty($_POST['password'])) {

	//Preparing the username and password for the database
	$user = dbInputFilter($_POST['username']);
	$pass = sha1($_POST['password']);
	
	//Checking is the user logged
	$isValidUser =
	dbGetNumRows("SELECT 1 
							  FROM users 
							  WHERE username = '$user' && password = '$pass'", 5);

	//Printing the result
	if ($isValidUser != 0) {
	
		loginUser(sha1(rand()));
		
		echo '<success>Welcome '. $user .'.</success>';
	
	} else {
	
		echo '<error>Wrong username or password</error>';
	
	}	
}

?>