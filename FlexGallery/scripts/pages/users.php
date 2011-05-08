<?php

if (isUserLogged()) {

	$usersList = dbGetArray('SELECT user_id, username
											FROM users
											ORDER BY user_id ASC', 80);
											

	//Printing this list into xml format
	echo '<?xml version="1.0" encoding="utf-8"?>';		
	foreach ($usersList as $key => $value) {
	
		echo "<user>\n";
		
		echo "\t<id>" . $value['user_id'] . "</id>\n";
		echo "\t<username>" . $value['username'] . "</username>\n";
		
		echo "</user>\n";
	
	}

}

?>