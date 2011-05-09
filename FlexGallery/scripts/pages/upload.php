<?php

if (!empty($_FILES['Filedata'])) {
	//Creating upload dirs
	if(!is_dir(UPLOAD_DIR)) {
		mkdir(UPLOAD_DIR);
	}
	if (!is_dir(THUMB1_DIR)) {
		mkdir(THUMB1_DIR);
	}
	if (!is_dir(THUMB2_DIR)) {
		mkdir(THUMB2_DIR);
	}

	//Getting image size and mime type
	$imageInfo = getimagesize($_FILES['Filedata']['tmp_name']);

	//Checking the mime type
	if($imageInfo['mime'] == 'image/gif' ||
		$imageInfo['mime'] == 'image/jpeg' ||
		$imageInfo['mime'] == 'image/pjpeg' ||
		$imageInfo['mime'] == 'image/png') {

		$originalName = $_FILES['Filedata']['name'];
		$extension = end(explode(".", $originalName));

		list($usec, $sec) = explode(" ", microtime());
		$microTime = ((float)$usec + (float)$sec);
		$newName = number_format($microTime, 4,'','');
		
		$fileName = $newName . '.' . $extension;
		//$thumbId = dbInsert("INSERT INTO photos (title, user_id) VALUES ('$fileName', ". $_SESSION['id'] .")",  7040);

		//Uploading and resizing the image. Creating thumbs
		$uploaded = false;
			$uploaded = uploadAndResizeImage($_FILES['Filedata']['tmp_name'], UPLOAD_DIR . $fileName, 1000, 1000);
			if (!$uploaded) {
				break;
			}
			
			$uploaded = uploadAndResizeImage($_FILES['Filedata']['tmp_name'], THUMB1_DIR . $fileName, 140, 140);
			if (!$uploaded) {
				break;
			}
			
			$uploaded = uploadAndResizeImage($_FILES['Filedata']['tmp_name'], THUMB2_DIR . $fileName, 100, 100);
			if (!$uploaded) {
				break;
			}								

		if ($uploaded) {
			if (!empty($_POST['newTitle'])) {
				$newTitle = dbInputFilter($_POST['newTitle']);
			} else {
				$newTitle = $fileName;
			}

			$array = array();
			$array['filename'] = $fileName;
			
			//Adding information to the database
			$thumbId = dbInsert("INSERT INTO photos (title, user_id) VALUES ('$fileName', ". $_SESSION['id'] .")",  7040);
			echo '<success>' . $value . 'have been successfully uploaded!' . '</error>';

		} else {
			echo '<error>' . $value . ' ' . $language['admin']['notUploaded'] . '</error>';
		}

	} else {
		echo '<error>' . $value . ' ' . $language['admin']['notWantedFormat'] . '</error>';
	}
}
?>