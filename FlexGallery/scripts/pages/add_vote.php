<?php

if (isUserLogged()) {

	if (!empty($_GET['id']) && !empty($_GET['vote'])) {

		$id = (int)$_GET['id'];
		$vote = (int)$_GET['vote'];
		
		if ($vote > 5 || $vote < 1) {
			exit;
		}

		$checkForVote = dbGetNumRows('SELECT 1
																  FROM vote
																  WHERE user_id=' . $_SESSION['id'] . ' AND photo_id=' . $id . '', 95);
																  
		if ($checkForVote != 0) {
		
			exit;
		
		} else {
		
			$addVote = dbInsert('INSERT
											  INTO vote
											  (user_id, photo_id, rate)
											  VALUES
											  (' . $_SESSION['id'] . ', ' . $id . ', ' . $vote . ')', 100);
		
		}
	}
	
}

?>