<?php

if (!empty($_GET['id'])) {

	$id = (int)$_GET['id'];
	
	$rating = dbGetRow('SELECT AVG(rate) AS rate
									  FROM vote
									  WHERE photo_id=' . $id . '', 105);

	if (!$rating['rate']) {	
		$rating['rate'] = 0;
	}
	
	echo '<?xml version="1.0" encoding="utf-8"?>';
	echo '<rating>' . $rating['rate'] . '</rating>';
}

?>