<?php

//Checking if the user is logged
if (isUserLogged()) {

//Checking if the data have been posted
//if no data have been posted I'm just taking the email of the current logged user
	if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['oldPassword'])) {

		$oldPassword = sha1($_POST['oldPassword']);
		$password = sha1($_POST['password']);
		$email = dbInputFilter($_POST['email']);
		
		//Checking if the old password is correct
		$checkUser = dbGetNumRows("SELECT 1
															FROM users
															WHERE password = '$oldPassword'
															AND user_id = " . $_SESSION['id'] . "", 45);

		if ($checkUser != 1) {
		
			echo '<error>Invalid old password!</error>';
			exit;
		
		} 
		
		//Checking the email again
		if(!eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)) {

			echo '<error>Invalid email address.</error>';
			exit;
			
		}
		
		//Updating the profile
		$updateProfile = dbUpdate("UPDATE users
													SET
													password = '$password', email = '$email'
													WHERE user_id = " . $_SESSION['id'] . "", 55);
													
		if ($updateProfile) {
		
			echo '<success>Youre profile have been updated!</success>';
		
		} else {
		
			echo '<error>Error! Try again later.</error>';
		
		}
		
	} else {
		
		//Getting user's email
		$getEmail = dbGetRow('SELECT email
												FROM users
												WHERE user_id = ' . $_SESSION['id'] . '', 65);
												
		echo '<email>' . $getEmail['email'] . '</email>';
	}
}

?>