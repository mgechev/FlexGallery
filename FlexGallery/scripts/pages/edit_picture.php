<?php

if (!empty($_POST['picture'])) {

	$picName = dbInputFilter($_POST['picture']);
	
	if (!empty($_POST['comment'])) {
	
		$comment = dbInputFilter($_POST['comment']);
		if (strlen($comment) <= 255) {
			
			$addComment = dbUpdate('UPDATE photos
														SET
														comment = "' . $comment . '"
														WHERE title = "' . $picName . '"', 65);
														
		}
	
	}
} 

?>