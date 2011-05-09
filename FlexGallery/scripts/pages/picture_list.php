<?php

//if (isUserLogged()) {

	//Getting list of all pictures by the user
	
	if (empty($_GET['id'])) {
	
		$userId = $_SESSION['id'];
	
	} else {
	
		$userId = (int)$_GET['id'];
	
	}
	if ($userId == -1) {	
		
		$getPicturesByUserId =
		dbGetArray('SELECT photos.title, photos.photo_id, photos.comment, AVG( vote.rate ) AS rate
							FROM photos
							LEFT JOIN vote ON vote.photo_id = photos.photo_id
							WHERE vote.rate IS NOT NULL
							GROUP BY photos.photo_id
							UNION
							SELECT photos.title, photos.photo_id, photos.comment, 0 AS rate
							FROM photos
							LEFT JOIN vote ON vote.photo_id = photos.photo_id
							WHERE vote.rate IS NULL
							GROUP BY photos.photo_id', 35);	
		
	} else {
	
		$getPicturesByUserId =
		dbGetArray(
		'SELECT title, photo_id, comment
		FROM photos
		WHERE user_id = '. $userId .'', 35);
		
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