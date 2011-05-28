<?php

if (isUserLogged()) {

	if (!empty($_GET['picture'])) {

		$picName = dbInputFilter($_GET['picture']);

		$deletePicture = dbDelete('DELETE
													FROM photos
													WHERE title = "' . $picName . '"', 70);

		unlink(UPLOAD_DIR . $picName);
		unlink(THUMB1_DIR . $picName);
		unlink(THUMB2_DIR . $picName);
		
	}

}

?>