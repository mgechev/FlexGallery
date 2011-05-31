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
		echo "\t<description>" . $value['comment'] . "</description>\n";
		
		$id = $value['photo_id'];
		$getComments = dbGetArray('SELECT u.username, c.content, c.date, c.comment_id
													FROM comments AS c
													LEFT JOIN users as u ON c.user_id = u.user_id
													WHERE c.photo_id = ' . $id . '', 85);

		$rating = dbGetRow('SELECT AVG(rate) AS rate, COUNT(rate) AS count, SUM(rate) AS ratingSum
									  FROM vote
									  WHERE photo_id=' . $id . '', 105);

		if (!$rating['rate']) {	
			$rating['rate'] = 0;
		}
		
		echo '<rating>' . $rating['rate'] . '</rating>';
		echo '<count>' . $rating['count'] . '</count>';
		echo '<ratingSum>' . $rating['ratingSum'] . '</ratingSum>';
		
		foreach ($getComments as $key => $value) {
		
			echo "\n<comment>\n";
			
			echo "\t<id>" . $value['comment_id'] . "</id>\n";
			echo "\t<content>" . $value['content'] . "</content>\n";
			echo "\t<username>" . $value['username'] . "</username>\n";
			echo "\t<date>" . $value['date'] . "</date>\n";

			echo "</comment>\n";
		
		}
		
		if (count($getComments) == 0) {
		
			echo '<comment>0</comment>';
		
		}
		
		
		echo "</picture>\n";
	
	}
	
	if (count($getPicturesByUserId) == 0) {
	
		echo '<picture>0</picture>';
	
	}

//}

?>