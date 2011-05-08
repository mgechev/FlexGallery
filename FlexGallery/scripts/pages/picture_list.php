<?php

if (isUserLogged()) {

	//Getting list of all pictures by the user
	$getPicturesByUserId =
	dbGetArray(
	'SELECT title, photo_id, comment
	FROM photos
	WHERE users_user_id = '. $_SESSION['id'] .'', 35);
	
	//Printing this list into xml format
	echo '<?xml version="1.0" encoding="utf-8"?>';
	
	foreach ($getPicturesByUserId as $key => $value) {
	
		echo "\n<picture>\n";
		
		echo "\t<id>" . $value['photo_id'] . "</id>\n";
		echo "\t<title>" . $value['title'] . "</title>\n";
		echo "\t<comment>" . $value['comment'] . "</comment>\n";
		
		echo "</picture>\n";
	
	}

}

?>