<?php

if (isUserLogged()) {

	$usersList = dbGetArray('SELECT users.user_id, users.username
											FROM users
											RIGHT JOIN photos ON photos.user_id = users.user_id
											GROUP BY users.user_id
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