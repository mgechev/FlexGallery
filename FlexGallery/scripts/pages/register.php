<?php

if (!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['email'])) {

	//Getting posted values
	$user = $_POST['username'];
	$pass = $_POST['password'];
	$email = $_POST['email'];

	//Validating the email
	if(!eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)) {

		echo '<error>Invalid email address.</error>';
		exit;
		
	}
	
	//Username validation
	if (strlen($user) < 3 || strlen($user) > 15) {
	
		echo '<error>Your username should be between 
3 and 15 characters.</error>';
		exit;
	
	}
	
	//Password validation
	if (strlen($pass) < 3 || strlen($pass) > 15) {
	
		echo '<error>Your password should be between
3 and 15 characters.</error>';
		exit;
	
	}
	
	//Preparing all strings for the database
	$user = dbInputFilter($user);
	$pass = sha1($pass);
	$email = dbInputFilter($email);
	
	//Checking for duplicated username or email
	$checkUsername = 
	dbGetNumRows("SELECT 1 
		      FROM users 
		      WHERE username = '$user'", 5);
	$checkEmail =
	dbGetNumRows("SELECT 1 
		      FROM users 
		      WHERE email = '$email'", 10);
							 
    //If there is already any user with that name or password printing an error
	if ($checkEmail != 0 || $checkUsername != 0) {
	
		echo '<error>This user is already registered!</error>';
		exit;
	
	}

	//Registrating the user (adding it to the database)
	$request =
	dbInsert("INSERT
		 INTO users (username, password, email, registration_date, last_login)
		 VALUES ('$user', '$pass', '$email', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)", 15);
				  
	//Printing the registration result
	if ($request != false) {
	
		echo '<success>Your registration have been 
successfully completed!</success>';
	
	} else {
	
		echo '<error>Error! Please try again later!</error>';
	
	}
	
}

?>