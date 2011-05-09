<?php

if (!empty($_GET['id'])) {

	$id = (int)$_GET['id'];
	
	$getComments = dbGetArray('SELECT u.username, c.content, c.date, c.comment_id
													FROM comments AS c
													LEFT JOIN users as u ON c.user_id = u.user_id
													WHERE c.photo_id = ' . $id . '', 85);
									
	//Printing this list into xml format
	echo '<?xml version="1.0" encoding="utf-8"?>';

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
	
}

?>