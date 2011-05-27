<?php

//Checking if the POST values are empty
if (!empty($_POST['username']) && !empty($_POST['password']) && !isUserLogged()) {

	//Preparing the username and password for the database
	$user = dbInputFilter($_POST['username']);
	$pass = sha1($_POST['password']);
	
	//Checking is the user logged
	$isValidUser =
	dbGetArray("SELECT user_id, username, email
						FROM users 
						WHERE username = '$user' AND password = '$pass' LIMIT 1", 5);

	//Printing the result
	if (count($isValidUser) > 0) {
	
		loginUser($isValidUser[0]);
		
		echo '<success><username>'. $isValidUser[0]['username'] .'</username><id>' . $isValidUser[0]['user_id'] .'</id><email>' . $isValidUser[0]['email'] .'</email></success>';
		
		$myFile = "testFile.txt";
		$fh = fopen($myFile, 'w') or die("can't open file");
		fwrite($fh, '<success><username>'. $isValidUser[0]['username'] .'</username><id>' . $isValidUser[0]['user_id'] .'</id><email>' . $isValidUser[0]['email'] .'</email></success>');
		fclose($fh);
	
	} else {
	
		echo '<error>Wrong username or password</error>';
	
	}	
} else if (isUserLogged()) {

	echo '<success><username>'. $_SESSION['username'] .'</username><id>' . $_SESSION['id'] .'</id><email>' . $_SESSION['email'] .'</email></success>';
	exit;
	
}

?>