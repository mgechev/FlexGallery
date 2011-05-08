<?php

print '<error>';

var_dump($_POST);

print '</error>';

if (!empty($_POST['picture'])) {

	$picName = dbInputFilter($_POST['picture']);

	$deletePicture = dbDelete('DELETE
												FROM photos
												WHERE title = "' . $picName . '"', 70);

	unlink(UPLOAD_DIR . $picName);
	unlink(THUMB1_DIR . $picName);
	unlink(THUMB2_DIR . $picName);
	
	echo '<error>asdasd</error>';
	
}

?>