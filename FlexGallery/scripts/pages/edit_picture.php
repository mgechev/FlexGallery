<?php

if (isUserLogged()) {

	if (!empty($_POST['id'])) {

		$id = dbInputFilter($_POST['id']);
		
		if (!empty($_POST['comment'])) {
		
			$comment = dbInputFilter($_POST['comment']);
			if (strlen($comment) <= 255) {
				
				$addComment = dbUpdate('UPDATE photos
															SET
															comment = "' . $comment . '"
															WHERE photo_id = "' . $id . '"', 65);
															
			}
		
		}
	} 

}
?>