<?php

// function updateStaticPage($content, $page)
// {
	// $sql = "UPDATE static_pages
			// SET content = '$content'
			// WHERE default_title = '$page'";
	
	// $success = dbUpdate($sql, 2010);
	// return $success;
// }

// function getStaticPages()
// {
	// $sql = "SELECT default_title, title
			// FROM static_pages
			// ORDER BY title";
	
	// $result = dbGetArray($sql, 2020);
	// return $result;
// }

// function deleteTargById($targId)
// {
	// $sql = "DELETE FROM targs WHERE targ_id = $targId";
	
	// $success = dbDelete($sql, 2030);
	// return $success;
// }

// function getAllCities()
// {
	// $sql = "SELECT city_id, name
			// FROM cities
			// ORDER BY name";
	
	// $result = dbGetArray($sql, 2040);
	// return $result;
// }

// function getCitiesByRegionId($regionId)
// {
	// $sql = "SELECT city_id, name
			// FROM cities
			// WHERE region_id = $regionId
			// ORDER BY name";
	
	// $result = dbGetArray($sql, 2050);
	// return $result;
// }

// function getAllOrganizers()
// {
	// $sql = "SELECT organizer_id, name
			// FROM organizers
			// ORDER BY name";
	
	// $result = dbGetArray($sql, 2060);
	// return $result;
// }

// function getOrganizersByOrganizerTypeId($organizerTypeId)
// {
	// $sql = "SELECT organizer_id, name
			// FROM organizers
			// WHERE organizer_type_id = $organizerTypeId
			// ORDER BY name";
	
	// $result = dbGetArray($sql, 2070);
	// return $result;
// }

// function getOrganizerById($organizerId)
// {
	// $sql = "SELECT o.organizer_id, o.name, o.address, o.phone, o.organizer_type_id
			// FROM organizers o
			// WHERE o.organizer_id = $organizerId";
	
	// $result = dbGetRow($sql, 2080);
	// return $result;
// }

// function insertDealType($newDealType)
// {
	// $sql = "INSERT INTO deal_types (type) VALUE ('$newDealType')";
	// $sql .=	" ON DUPLICATE KEY UPDATE deal_type_id = LAST_INSERT_ID(deal_type_id)";
	
	// //$insertId = dbInsert($sql, 2090);
	// $insertId = dbReplace($sql, 2090);
	// return $insertId;
// }

// function insertEstateType($newEstateType)
// {
	// $sql = "INSERT INTO estate_types (type) VALUE ('$newEstateType')";
	// $sql .=	" ON DUPLICATE KEY UPDATE estate_type_id = LAST_INSERT_ID(estate_type_id)";
	
	// //$insertId = dbInsert($sql, 2100);
	// $insertId = dbReplace($sql, 2100);
	// return $insertId;
// }

// function insertTargType($newTargType)
// {
	// $sql = "INSERT INTO targ_types (type) VALUE ('$newTargType')";
	// $sql .=	" ON DUPLICATE KEY UPDATE targ_type_id = LAST_INSERT_ID(targ_type_id)";
	
	// //$insertId = dbInsert($sql, 2110);
	// $insertId = dbReplace($sql, 2110);
	// return $insertId;
// }

// function insertCity($newCity, $regionId)
// {
	// $sql = "INSERT INTO cities (name, region_id) VALUE ('$newCity', $regionId)";
	// $sql .=	" ON DUPLICATE KEY UPDATE city_id = LAST_INSERT_ID(city_id)";
	
	// //$insertId = dbInsert($sql, 2120);
	// $insertId = dbReplace($sql, 2120);
	// return $insertId;
// }

// function addNullToQuery($field, $sql)
// {
	// if ($field === null) {
		// $sql .= "NULL";
	// } else {
		// $sql .= "'$field'";
	// }
	// return $sql;
// }

// function insertTarg($title, $trialNumber, $estateSquare, $estateAddress, $description, $targDate, $targAddress, $docAddress, $docDateEnd, $docPrice, $viewDays, $viewTimeStart, $viewTimeEnd, $priceStart, $priceStep, $deposit, $map, $isActive, $isFeatured, $categoryId, $cityId, $organizerId, $estateTypeId, $targTypeId, $dealTypeId, $isBulletin, $additional)
// {
	// $sql = "INSERT INTO targs (title, trial_number, estate_address, description, targ_date, targ_address,
				// doc_address, doc_date_end, doc_price, view_days, view_time_start, view_time_end,
				// price_start, price_step, deposit, map, square, is_active, is_featured, category_id,
				// city_id, organizer_id, estate_type_id, targ_type_id, deal_type_id";
	// if ($isBulletin) {
		// $sql .= ", additional";
	// }
	// $sql .= ") VALUE (";
	// $sql .= "'$title', '$trialNumber', '$estateAddress', '$description', ";
	// $sql = addNullToQuery($targDate, $sql).", ";
	// $sql .= "'$targAddress', '$docAddress', ";
	// $sql = addNullToQuery($docDateEnd, $sql).", ";
	// $sql = addNullToQuery($docPrice, $sql).", ";
	// $sql .= "'$viewDays', ";
	// $sql = addNullToQuery($viewTimeStart, $sql).", ";
	// $sql = addNullToQuery($viewTimeEnd, $sql).", ";
	// $sql = addNullToQuery($priceStart, $sql).", ";
	// $sql = addNullToQuery($priceStep, $sql).", ";
	// $sql = addNullToQuery($deposit, $sql).", ";
	// $sql .= "'$map', $estateSquare, $isActive, $isFeatured, $categoryId, ";

	// $sql = addNullToQuery($cityId, $sql).", ";
	// $sql = addNullToQuery($organizerId, $sql).", ";
	// $sql = addNullToQuery($estateTypeId, $sql).", ";
	// $sql = addNullToQuery($targTypeId, $sql).", ";
	// $sql = addNullToQuery($dealTypeId, $sql);
	// if ($isBulletin) {
		// $sql .= ", '$additional'";
	// }
	// $sql .= ")";
	
	// $insertId = dbInsert($sql, 2130);
	// return $insertId;
// }

// function updateTarg($targId, $title, $trialNumber, $estateSquare, $estateAddress, $description, $targDate, $targAddress, $docAddress, $docDateEnd, $docPrice, $viewDays, $viewTimeStart, $viewTimeEnd, $priceStart, $priceStep, $deposit, $map, $isActive, $isFeatured, $categoryId, $cityId, $organizerId, $estateTypeId, $targTypeId, $dealTypeId, $isBulletin, $additional)
// {
	// $sql = "UPDATE targs
			// SET
				// title = '$title',
				// trial_number = '$trialNumber',
				// square = '$estateSquare',
				// estate_address = '$estateAddress',
				// description = '$description',
				// targ_date = ";
	// $sql = addNullToQuery($targDate, $sql).", ";
	// $sql .=		"targ_address = '$targAddress',
				// doc_address = '$docAddress',
				// doc_date_end = ";
	// $sql = addNullToQuery($docDateEnd, $sql).", ";
	// $sql .=		"doc_price = ";
	// $sql = addNullToQuery($docPrice, $sql).", ";
	// $sql .=		"view_days = '$viewDays',
				// view_time_start = ";
	// $sql = addNullToQuery($viewTimeStart, $sql).", ";
	// $sql .=		"view_time_end = ";
	// $sql = addNullToQuery($viewTimeEnd, $sql).", ";
	// $sql .=		"price_start = ";
	// $sql = addNullToQuery($priceStart, $sql).", ";
	// $sql .=		"price_step = ";
	// $sql = addNullToQuery($priceStep, $sql).", ";
	// $sql .=		"deposit = ";
	// $sql = addNullToQuery($deposit, $sql).", ";
	// $sql .=		"map = '$map',
				// is_active = $isActive,
				// is_featured = $isFeatured,
				// category_id = $categoryId,
				// city_id = ";
	// $sql = addNullToQuery($cityId, $sql).", ";
	// $sql .=		"organizer_id = ";
	// $sql = addNullToQuery($organizerId, $sql).", ";
	// $sql .=		"estate_type_id = ";
	// $sql = addNullToQuery($estateTypeId, $sql).", ";
	// $sql .=		"targ_type_id = ";
	// $sql = addNullToQuery($targTypeId, $sql).", ";
	// $sql .=		"deal_type_id = ";
	// $sql = addNullToQuery($dealTypeId, $sql);
	// if ($isBulletin) {
		// $sql .= ", additional = '$additional'";
	// }
	// $sql .= " WHERE targ_id = $targId";

	// $success = dbUpdate($sql, 2140);
	// return $success;
// }

// function getCategoryIdByName($categoryName)
// {
	// $sql = "SELECT category_id
			// FROM categories
			// WHERE default_name = '$categoryName'";
	
	// $result = dbGetRow($sql, 2150);
	// return $result['category_id'];
// }

// function getPublicationsByTitle($category = null, $termsDb, $limit = null)
// {
	// $sql = "SELECT p.publication_id, p.title, p.is_active, p.is_payed, cat.default_name, LOWER(p.title) as info
			// FROM publications p
			// LEFT JOIN categories cat ON cat.category_id = p.category_id
			// HAVING cat.default_name = '$category'";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " AND $infoQuery";
	// }
	
	// $sql .= " ORDER BY p.date_added DESC, p.publication_id DESC";
	
	// if (!empty($limit)) {
		// $sql .= " LIMIT $limit";
	// }

	// $result = dbGetArray($sql, 2160);
	// return $result;
// }

// function getPublicationsByTitleCount($category = null, $termsDb, $limit = null)
// {
	// $sql = "SELECT COUNT(x.id) as count
			// FROM (SELECT p.publication_id as id, cat.default_name, LOWER(p.title) as info
				// FROM publications p
				// LEFT JOIN categories cat ON cat.category_id = p.category_id
				// HAVING cat.default_name = '$category'";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " AND $infoQuery";
	// }
	// $sql .= ") as x";

	// $result = dbGetRow($sql, 2170);
	// return $result['count'];
// }

// function insertPublication($title, $summary, $content, $source, $isActive, $isPayed, $categoryId, $authorId)
// {
	// $sql = "INSERT INTO publications (title, summary, content, source, is_active, is_payed, category_id, author_id
			// ) VALUE ('$title', '$summary', '$content', '$source', $isActive, $isPayed, $categoryId, ";
	// $sql = addNullToQuery($authorId, $sql);
	// $sql .= ")";
	
	// $insertId = dbInsert($sql, 2180);
	// return $insertId;
// }

// function updatePublication($publicationId, $title, $summary, $content, $source, $isActive, $isPayed, $authorId)
// {
	// $sql = "UPDATE publications
			// SET
				// title = '$title',
				// summary = '$summary',
				// content = '$content',
				// source = '$source',
				// is_active = $isActive,
				// is_payed = $isPayed,
				// author_id = ";
	// $sql = addNullToQuery($authorId, $sql);
	// $sql .= " WHERE publication_id = $publicationId";

	// $success = dbUpdate($sql, 2190);
	// return $success;
// }

// function deletePublicationById($publicationId)
// {
	// $sql = "DELETE FROM publications WHERE publication_id = $publicationId";
	
	// $success = dbDelete($sql, 2200);
	// return $success;
// }

// function getAllAuthors()
// {
	// $sql = "SELECT author_id, name
			// FROM authors
			// ORDER BY name";
	
	// $result = dbGetArray($sql, 2210);
	// return $result;
// }

// function insertAuthor($newAuthor)
// {
	// $sql = "INSERT INTO authors (name) VALUE ('$newAuthor')";
	// $sql .=	" ON DUPLICATE KEY UPDATE author_id = LAST_INSERT_ID(author_id)";
	
	// //$insertId = dbInsert($sql, 2220);
	// $insertId = dbReplace($sql, 2220);
	// return $insertId;
// }

// function insertАnnouncement($title, $summary, $content, $isActive, $isFeatured, $isArchived, $categoryId)
// {
	// $sql = "INSERT INTO announcements (title, summary, content, is_active, is_featured, is_archived, category_id
			// ) VALUE ('$title', '$summary', '$content', $isActive, $isFeatured, $isArchived, $categoryId)";
	
	// $insertId = dbInsert($sql, 2230);
	// return $insertId;
// }

// function updateАnnouncement($announcementId, $title, $summary, $content, $isActive, $isFeatured, $isArchived)
// {
	// $sql = "UPDATE announcements
			// SET
				// title = '$title',
				// summary = '$summary',
				// content = '$content',
				// is_active = $isActive,
				// is_featured = $isFeatured,
				// is_archived = $isArchived
			// WHERE announcement_id = $announcementId";
	
	// $success = dbUpdate($sql, 2240);
	// return $success;
// }

// function deleteАnnouncementById($announcementId)
// {
	// $sql = "DELETE FROM announcements WHERE announcement_id = $announcementId";
	
	// $success = dbDelete($sql, 2250);
	// return $success;
// }

// function getAnnouncementsByTitle($category = null, $termsDb, $limit = null)
// {
	// $sql = "SELECT a.announcement_id, a.title, a.is_active, cat.default_name, LOWER(a.title) as info
			// FROM announcements a
			// LEFT JOIN categories cat ON cat.category_id = a.category_id
			// HAVING cat.default_name = '$category'";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " AND $infoQuery";
	// }
	
	// $sql .= " ORDER BY a.date_added DESC, a.announcement_id DESC";
	
	// if (!empty($limit)) {
		// $sql .= " LIMIT $limit";
	// }

	// $result = dbGetArray($sql, 2260);
	// return $result;
// }

// function getAnnouncementsByTitleCount($category = null, $termsDb, $limit = null)
// {
	// $sql = "SELECT COUNT(x.id) as count
			// FROM (SELECT a.announcement_id as id, cat.default_name, LOWER(a.title) as info
				// FROM announcements a
				// LEFT JOIN categories cat ON cat.category_id = a.category_id
				// HAVING cat.default_name = '$category'";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " AND $infoQuery";
	// }
	// $sql .= ") as x";

	// $result = dbGetRow($sql, 2270);
	// return $result['count'];
// }

// function getAllSettings()
// {
	// $sql = "SELECT settings_id, name, value
			// FROM settings
			// ORDER BY settings_id";
	
	// $result = dbGetArray($sql, 2280);
	// return $result;
// }

// function updateSettingsById($id, $value)
// {
	// $sql = "UPDATE settings
			// SET value = $value
			// WHERE settings_id = $id";
	
	// $success = dbUpdate($sql, 2290);
	// return $success;
// }

// function deleteBlogById($blogId)
// {
	// $sql = "DELETE FROM blogs WHERE blog_id = $blogId";
	
	// $success = dbDelete($sql, 2300);
	// return $success;
// }

// function insertBlog($title, $url, $feed, $logo, $isActive)
// {
	// $sql = "INSERT INTO blogs (title, url, feed, logo, is_active
			// ) VALUE ('$title', '$url', '$feed', '$logo', $isActive)";
	
	// $insertId = dbInsert($sql, 2310);
	// return $insertId;
// }

// function updateBlog($blogId, $title, $url, $feed, $logo, $isActive)
// {
	// $sql = "UPDATE blogs
			// SET
				// title = '$title',
				// url = '$url',
				// feed = '$feed',
				// is_active = $isActive";
	// if (isset($logo) && $logo != '') {
		// $sql .= ", logo = '$logo'";
	// } elseif ($logo === null) {
		// $sql .= ", logo = NULL";
	// }
	// $sql .= " WHERE blog_id = $blogId";
	
	// $success = dbUpdate($sql, 2320);
	// return $success;
// }

// function getBlogsByTitle($termsDb, $limit = null)
// {
	// $sql = "SELECT b.blog_id, b.title, LOWER(b.title) as info, b.is_active
			// FROM blogs b";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " HAVING $infoQuery";
	// }
	
	// $sql .= " ORDER BY b.title";
	
	// if (!empty($limit)) {
		// $sql .= " LIMIT $limit";
	// }

	// $result = dbGetArray($sql, 2330);
	// return $result;
// }

// function getBlogsByTitleCount($termsDb, $limit = null)
// {
	// $sql = "SELECT COUNT(x.id) as count
			// FROM (SELECT b.blog_id as id, LOWER(b.title) as info
			// FROM blogs b";
	
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " HAVING $infoQuery";
	// }
	// $sql .= ") as x";

	// $result = dbGetRow($sql, 2340);
	// return $result['count'];
// }

// function uploadAndResizeImage($source, $target, $maxWidthSizePx, $maxHeightSizePx)
// {
	// @ini_set('memory_limit', '100M');
	
	// list($width, $height) = getimagesize($source);

	// $modwidth = 0;
	// $modheight = 0;

	// if ($width <= $maxWidthSizePx && $height <= $maxHeightSizePx) {
		// return copy($source, $target);
	// } else if ($width > $maxWidthSizePx && $height < $maxHeightSizePx) {
			// $modwidth = $maxWidthSizePx;
			// $diff = $width / $modwidth;
			// $modheight = $height / $diff;
			// if ($modheight > $maxHeightSizePx) {
				// $mod2height = $modheight;
				// $modheight = $maxHeightSizePx;
				// $diff = $mod2height / $modheight;
				// $modwidth = $modheight / $diff;
			// }
		// } else {
			// $modheight = $maxHeightSizePx;
			// $diff = $height / $modheight;
			// $modwidth = $width / $diff;
			// if ($modwidth > $maxWidthSizePx) {
				// $mod2width = $modwidth;
				// $modwidth = $maxWidthSizePx;
				// $diff = $mod2width / $modwidth;
				// $modheight = $modheight / $diff;
			// }
		// }

	// if ($modwidth > 0 && $modheight > 0) {
		// $tn = imagecreatetruecolor($modwidth, $modheight);
		// $imageInfo = getimagesize($source);
		// if (($imageInfo['mime'] == 'image/jpeg') || ($imageInfo['mime'] == 'image/pjpeg')) {
			// $file = imagecreatefromjpeg($source) ;
			// imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height) ;
			// return imagejpeg($tn, $target, 100) ;
		// } elseif ($imageInfo['mime'] == 'image/gif') {
			// $file = imagecreatefromgif($source) ;
			// imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height) ;
			// return imagegif($tn, $target, 100) ;
		// }
	// }
// }

// function uploadAndResizeImage2($source, $target, $maxWidthSizePx, $maxHeightSizePx)
// { // слага бял фон със зададените размери и върху него поставя оразмерената картинка, спазвайки пропорциите
	// @ini_set('memory_limit', '100M');

	// $modwidth = 0;
	// $modheight = 0;
		
	// list($width, $height) = getimagesize($source);
			
	// if ($width == $maxWidthSizePx && $height == $maxHeightSizePx) {
		// return copy($source, $target);
	// } else {
		// $imageInfo = getimagesize($source);
		// if (($imageInfo['mime'] == 'image/jpeg') || ($imageInfo['mime'] == 'image/pjpeg')) {
			// $file = imagecreatefromjpeg($source);
		// } elseif ($imageInfo['mime'] == 'image/gif') {
			// $file = imagecreatefromgif($source);
		// }

		// if (!empty($file)) {
			// $tn = imagecreatetruecolor($maxWidthSizePx, $maxHeightSizePx);
			// $white = imagecolorallocate($tn, 255, 255, 255);
			// imagefill($tn, 0, 0, $white);
			
			// if ($width > $maxWidthSizePx && $height < $maxHeightSizePx) {
				// $modwidth = $maxWidthSizePx;
				// $diff = $width / $modwidth;
				// $modheight = $height / $diff;
				// if ($modheight > $maxHeightSizePx) {
					// $mod2height = $modheight;
					// $modheight = $maxHeightSizePx;
					// $diff = $mod2height / $modheight;
					// $modwidth = $modheight / $diff;
				// }
			// } elseif ($height > $maxHeightSizePx) {
				// $modheight = $maxHeightSizePx;
				// $diff = $height / $modheight;
				// $modwidth = $width / $diff;
				// if ($modwidth > $maxWidthSizePx) {
					// $mod2width = $modwidth;
					// $modwidth = $maxWidthSizePx;
					// $diff = $mod2width / $modwidth;
					// $modheight = $modheight / $diff;
				// }
			// }

			// if ($modwidth > 0 && $modheight > 0) {
				// imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height);
			// } else {
				// imagecopy($tn, $file, 0, 0, 0, 0, $width, $height);
			// }
			
			// if (($imageInfo['mime'] == 'image/jpeg') || ($imageInfo['mime'] == 'image/pjpeg')) {
				// return imagejpeg($tn, $target, 100);
			// } elseif ($imageInfo['mime'] == 'image/gif') {
				// return imagegif($tn, $target, 100);
			// }
		// } else {
			// return false;
		// }
	// }
// }

// function getBytes($value)
// {
	// $value = trim($value);
	// $last = strtolower($value[strlen($value)-1]);
	// switch($last) {
		// // The 'G' modifier is available since PHP 5.1.0
		// case 'g':
			// $value *= 1024;
		// case 'm':
			// $value *= 1024;
		// case 'k':
			// $value *= 1024;
	// }

	// return $value;
// }

// function insertOrganizer($name, $address, $phone, $organizerTypeId)
// {
	// $sql = "INSERT INTO organizers (name, address, phone, organizer_type_id
			// ) VALUE ('$name', '$address', '$phone', ";
	// $sql = addNullToQuery($organizerTypeId, $sql);
	// $sql .= ")";
	
	// $sql .=	" ON DUPLICATE KEY UPDATE organizer_id = LAST_INSERT_ID(organizer_id)";
	
	// //$insertId = dbInsert($sql, 2350);
	// $insertId = dbReplace($sql, 2350);
	// return $insertId;
// }

// function updateOrganizer($organizerId, $name, $address, $phone, $organizerTypeId)
// {
	// $sql = "UPDATE organizers
			// SET
				// name = '$name',
				// address = '$address',
				// phone = '$phone',
				// organizer_type_id = ";
	// $sql = addNullToQuery($organizerTypeId, $sql);
	// $sql .= " WHERE organizer_id = $organizerId";

	// $success = dbUpdate($sql, 2360);
	// return $success;
// }

// function deleteOrganizerById($organizerId)
// {
	// $sql = "DELETE FROM organizers WHERE organizer_id = $organizerId";
	
	// $success = dbDelete($sql, 2370);
	// return $success;
// }

// function insertOrganizerType($newOrganizerType)
// {
	// $sql = "INSERT INTO organizer_types (type) VALUE ('$newOrganizerType')";
	// $sql .=	" ON DUPLICATE KEY UPDATE organizer_type_id = LAST_INSERT_ID(organizer_type_id)";
	
	// //$insertId = dbInsert($sql, 2380);
	// $insertId = dbReplace($sql, 2380);
	// return $insertId;
// }

// function getOrganizersList($termsDb = null, $organizerTypeId = null, $limit = null)
// {
	// $sql = "SELECT o.organizer_id, o.name, o.organizer_type_id, LOWER(o.name) as info
			// FROM organizers o";
	
	// $having = false;
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " HAVING $infoQuery";
		// $having = true;
	// }
	// if (!empty($organizerTypeId)) {
		// if ($having) {
			// $sql .= " AND ";
		// } else {
			// $sql .= " HAVING ";
		// }
		// $sql .= "o.organizer_type_id = $organizerTypeId";
	// }
	// $sql .= " ORDER BY o.name";
	// if (!empty($limit)) {
		// $sql .= " LIMIT $limit";
	// }
	
	// $result = dbGetArray($sql, 2390);
	// return $result;
// }

// function getOrganizersCount($termsDb = null, $organizerTypeId = null, $limit = null)
// {
	// $sql = "SELECT COUNT(x.id) as count
			// FROM (SELECT o.organizer_id as id, o.organizer_type_id, LOWER(o.name) as info
				// FROM organizers o";
	
	// $having = false;
	// $infoQuery = prepareRLikeQuery($termsDb, 'info');
	// if (!empty($infoQuery)) {
		// $sql .= " HAVING $infoQuery";
		// $having = true;
	// }
	// if (!empty($organizerTypeId)) {
		// if ($having) {
			// $sql .= " AND ";
		// } else {
			// $sql .= " HAVING ";
		// }
		// $sql .= "o.organizer_type_id = $organizerTypeId";
		// $having = true;
	// }
	// $sql .= ") as x";

	// $result = dbGetRow($sql, 2400);
	// return $result['count'];
// }

// function insertFileCategory($title, $parentId, $staticPageName)
// {
	// $sql = "INSERT INTO files_categories (title, parent_id, static_page_id) VALUE ('$title', $parentId, (SELECT static_page_id FROM static_pages WHERE default_title='$staticPageName'))";
	
	// $insertId = dbInsert($sql, 2410);
	// return $insertId;
// }

function insertFile($title, $comment, $username)
{
	$sql = "INSERT INTO files(title, comment, users_user_id) VALUE ('$title', '$comment', $username)";
	
	$insertId = dbInsert($sql, 2420);
	return $insertId;
}

// function deleteCategoryById($categoryId)
// {
	// $sql = "DELETE FROM files_categories WHERE file_category_id = $categoryId";
	
	// $success = dbDelete($sql, 2430);
	// return $success;
// }

// function deleteFileById($fileId)
// {
	// //$sql = "DELETE FROM files WHERE file_id = $fileId";
	// $sql = "UPDATE files SET file_category_id = NULL WHERE file_id = $fileId";
	
	// //$success = dbDelete($sql, 2440);
	// $success = dbUpdate($sql, 2440);
	// return $success;
// }

// function deleteImageById($imageId)
// {
	// //$sql = "DELETE FROM images WHERE image_id = $imageId";
	// $sql = "UPDATE images SET gallery_id = NULL WHERE image_id = $imageId";
	
	// //$success = dbDelete($sql, 2450);
	// $success = dbUpdate($sql, 2450);
	// return $success;
// }

// function insertImage($fileName, $title, $galleryId, $authorId)
// {
	// $sql = "INSERT INTO images(filename, title, gallery_id, author_id) VALUE ('$fileName', '$title', $galleryId,";
	// $sql = addNullToQuery($authorId, $sql);
	// $sql .= ")";
	
	// $insertId = dbInsert($sql, 2460);
	// return $insertId;
// }

// function insertGallery($name)
// {
	// $sql = "INSERT INTO galleries(name) VALUE ('$name')";
	
	// $insertId = dbInsert($sql, 2470);
	// return $insertId;
// }

// function updateTargThumb($targId, $thumbId)
// {
	// $sql = "UPDATE targs SET image_id = $thumbId WHERE targ_id = $targId";

	// $success = dbUpdate($sql, 2480);
	// return $success;
// }

// function updatePublicationThumb($publicationId, $thumbId)
// {
	// $sql = "UPDATE publications SET image_id = $thumbId WHERE publication_id = $publicationId";
	
	// $success = dbUpdate($sql, 2490);
	// return $success;
// }

// function updateAnnouncementThumb($announcementId, $thumbId)
// {
	// $sql = "UPDATE announcements SET image_id = $thumbId WHERE announcement_id = $announcementId";
	
	// $success = dbUpdate($sql, 2500);
	// return $success;
// }

// function updateTargGallery($targId, $galleryId)
// {
	// $sql = "UPDATE targs SET gallery_id = $galleryId WHERE targ_id = $targId";
	
	// $success = dbUpdate($sql, 2510);
	// return $success;
// }

// function updatePublicationGallery($publicationId, $galleryId)
// {
	// $sql = "UPDATE publications SET gallery_id = $galleryId WHERE publication_id = $publicationId";
	
	// $success = dbUpdate($sql, 2520);
	// return $success;
// }

// function updateAnnouncementGallery($announcementId, $galleryId)
// {
	// $sql = "UPDATE announcements SET gallery_id = $galleryId WHERE announcement_id = $announcementId";
	
	// $success = dbUpdate($sql, 2530);
	// return $success;
// }

// function updateImageInfo($imageId, $title, $authorId)
// {
	// $sql = "UPDATE images
			// SET
				// author_id = ";
	// $sql = addNullToQuery($authorId, $sql);
	// if (!empty($title)) {
		// $sql .= " , title = '$title'";
	// }
	// $sql .= " WHERE image_id = $imageId";
	
	// $success = dbUpdate($sql, 2540);
	// return $success;
// }

// function getPaymentsCount()
// {
	// $sql = "SELECT COUNT(payment_id) as count
			// FROM payments";

	// $result = dbGetRow($sql, 2550);
	// return $result['count'];
// }

// function getPaymentsList($limit = null, $orderBy = null)
// {
	// $sql = "SELECT p.payment_id, p.code, p.valid_from, p.valid_to, p.user, p.ip1, p.ip2, p.ip3
			// FROM payments p";

	// $sql .= " ORDER BY ";
	// if (isset($orderBy)) {
		// $sql .= "p." . $orderBy . ', ';
	// }
	// $sql .= "p.payment_id DESC";

	// if (!empty($limit)) {
		// $sql .= " LIMIT $limit";
	// }

	// $result = dbGetArray($sql, 2560);
	// return $result;
// }

// function insertNewPayment($code, $validFrom, $validTo, $user)
// {
	// $sql = "INSERT INTO payments(code, valid_from, valid_to, user) VALUE ('$code', '$validFrom', '$validTo', '$user')";
	// $insertId = dbInsert($sql, 2570);
	// return $insertId;
// }

// function getPaymentById($paymentId)
// {
	// $sql = "SELECT p.payment_id, p.code, p.valid_from, p.valid_to, p.user, p.ip1, p.ip2, p.ip3
			// FROM payments p
			// WHERE p.payment_id = $paymentId";
	
	// $result = dbGetRow($sql, 2580);
	// return $result;
// }

// function getPaymentByCode($paymentCode)
// {
	// $sql = "SELECT p.payment_id, p.code, p.valid_from, p.valid_to, p.user, p.ip1, p.ip2, p.ip3
			// FROM payments p
			// WHERE p.code = '$paymentCode'";

	// $result = dbGetRow($sql, 2581);
	// return $result;
// }

// function paymentSearch ($paymentUser, $validFrom, $validTo, $ip)
// {
	// $sql = 'SELECT p.payment_id, p.code, p.valid_from, p.valid_to, p.user, p.ip1, p.ip2, p.ip3
			// FROM payments p
			// WHERE 1 ';
	// if(!empty($paymentUser)) {
		// $sql .= "AND p.user LIKE '%$paymentUser%' ";
	// }

	// if(!empty($validFrom)) {
		// $sql .= "AND p.valid_from >= '$validFrom' ";
	// }

	// if(!empty($validTo)) {
		// $sql .= "AND p.valid_to <= '$validTo' ";
	// }

	// if(!empty($ip)) {
		// $sql .= "AND p.ip1 LIKE '%$ip%' OR p.ip2 LIKE '%$ip%' OR p.ip3 LIKE '%$ip%' ";
	// }

	// $sql .= 'ORDER BY p.payment_id DESC';

	// $result = dbGetArray($sql, 2582);
	// return $result;
// }

// function getPaymentNoteById($paymentId)
// {
	// $sql = "SELECT p.note
			// FROM payments p
			// WHERE p.payment_id = $paymentId";

	// $result = dbGetRow($sql, 2590);
	// return $result;
// }

// function updatePaymentNoteById ($paymentId, $noteContent) {
	// $sql = "UPDATE payments p
			// SET p.note = '$noteContent'
			// WHERE p.payment_id = $paymentId";
	
	// $success = dbUpdate($sql, 2600);
	
	// return $success;
// }

// function genCode($length = 6, $chars = '123456789ABCDEFGHJKMNPRSTVWXYZ')
// {
	// $code  = '';
	// // Generate code
	// for ($i = 0; $i < $length; ++$i) {
		// $code .= substr($chars, (((int)mt_rand(0, strlen($chars))) - 1), 1);
	// }

	// return $code;
// }

// function hmac($algo,$data,$passwd) {
	// /* md5 and sha1 only */
	// $algo=strtolower($algo);
	// $p=array('md5'=>'H32','sha1'=>'H40');
	// if(strlen($passwd)>64) $passwd=pack($p[$algo],$algo($passwd));
	// if(strlen($passwd)<64) $passwd=str_pad($passwd,64,chr(0));

	// $ipad=substr($passwd,0,64) ^ str_repeat(chr(0x36),64);
	// $opad=substr($passwd,0,64) ^ str_repeat(chr(0x5C),64);

	// return($algo($opad.pack($p[$algo],$algo($ipad.$data))));
// }
?>