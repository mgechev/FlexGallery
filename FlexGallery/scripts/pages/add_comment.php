<?php

if (isUserLogged()) {

	if (!empty($_POST['content']) && !empty($_POST['id'])) {
	
		$id = (int)$_POST['id'];
		$content = dbInputFilter($_POST['content']);
		$addComment = dbInsert('INSERT
													INTO comments
													(user_id, photo_id, content, date)
													VALUES
													(' . $_SESSION['id'] . ', ' . $id . ', "' . $content . '", NOW())', 90);
	
	}

}

?>