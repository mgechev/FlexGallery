<?php
if (empty($_GET['logoutUser']) && empty($_GET['updateSession'])) {

	if (isUserLogged()) {
	
		if (!empty($_SESSION['time']) && time() - $_SESSION['time'] < USER_SESSION_TIME) {
		
			echo '<login>true</login>';
			
		} else {		
		
			logout();
			echo '<login>false</login>';
			
		}
		
	} else {

		echo '<login>false</login>';

	}

} else {

	if (!empty($_GET['logoutUser'])) {
	
		logout();
	
	}
	if (!empty($_GET['updateSession'])) {
	
		$_SESSION['time'] = time();
	
	}

}
?>