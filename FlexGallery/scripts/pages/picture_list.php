<?php

//if (isUserLogged()) {
	//Getting list of all pictures by the user
	if (!empty($_GET['id'])) {
		$userId = (int)$_GET['id'];
	} else {
		$userId = -1;
	}
	
	if (!empty($_GET['pageNumber'])) {
		$page = (int)$_GET['pageNumber'];
	} else {
		$page = 0;
	}

	if ($userId == -1) {	
		
		$getPicturesByUserId =
		dbGetArray('SELECT photos.title, photos.photo_id, photos.comment
							FROM photos
							LIMIT '. $page * PAGE_SIZE . ', '. PAGE_SIZE .'', 35);	
		
	} else {
	
		$getPicturesByUserId =
		dbGetArray(
		'SELECT title, photo_id, comment
		FROM photos
		WHERE user_id = '. $userId .'
		LIMIT '. $page * PAGE_SIZE . ', '. PAGE_SIZE .'', 35);
		
	}
	
	//Printing this list into xml format
	echo '<?xml version="1.0" encoding="utf-8"?>';
	
	foreach ($getPicturesByUserId as $key => $value) {
	
		echo "\n<picture>\n";
		
		echo "\t<id>" . $value['photo_id'] . "</id>\n";
		echo "\t<title>" . $value['title'] . "</title>\n";
		echo "\t<comment>" . $value['comment'] . "</comment>\n";
		
		echo "</picture>\n";
	
	}
	
	if (count($getPicturesByUserId) == 0) {
	
		echo '<picture>0</picture>';
	
	}

//}

?>