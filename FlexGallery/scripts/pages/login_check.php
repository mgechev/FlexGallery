<?php
if (empty($_GET['logoutUser']) && empty($_GET['updateSession'])) {

		//if the user is logged, checking for the session timeout
		if (!empty($_SESSION['time']) && time() - $_SESSION['time'] < USER_SESSION_TIME) {		
			echo '<login>true</login>';			
			echo '<username>'. $_SESSION['username'] .'</username>';
			echo '<email>'. $_SESSION['email'] .'</email>';
			echo '<id>'. $_SESSION['id'] .'</id>';
		} else {		
		//if the user haven't been active more than USER_SESSION_TIME seconds, logouting it
			logout();
			echo '<login>false</login>';
		}		
	//if the user isn't logged returning false

} else {
	//if $_GET['logoutUser'] is not empty, logouting the user
	if (!empty($_GET['logoutUser'])) {
		logout();
	}
	//if $_GET['updateSession'] updating session timeout
	if (!empty($_GET['updateSession'])) {
		$_SESSION['time'] = time();
	}
}
?>