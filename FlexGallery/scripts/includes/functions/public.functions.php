<?php

function getSystemSettings($name)
{
	$sql = "SELECT value
			FROM settings
			WHERE name = '$name'";
	
	$result = dbGetRow($sql, 1010);
	return intval($result['value']);
}

function getPageContent($page)
{
	$sql = "SELECT title, content
			FROM static_pages
			WHERE default_title = '$page'";
	
	$result = dbGetRow($sql, 1020);
	return $result;
}

function getFileCategoryById($categoryId, $page)
{
	$sql = "SELECT f.file_category_id, f.title
			FROM files_categories f
			LEFT JOIN static_pages s ON s.static_page_id = f.static_page_id
			WHERE f.file_category_id = $categoryId
				AND s.default_title = '$page'";
	
	$result = dbGetRow($sql, 1030);
	return $result;
}

function getCategoriesByParentId($parentId, $page)
{
	$sql = "SELECT f.file_category_id, f.title
			FROM files_categories f
			LEFT JOIN static_pages s ON s.static_page_id = f.static_page_id 
			WHERE f.parent_id = $parentId
				AND s.default_title = '$page'
			ORDER BY f.title";
	
	$result = dbGetArray($sql, 1040);
	return $result;
}

function getFilesByCategoryId($categoryId, $page)
{
	$sql = "SELECT f.file_id, f.filename, f.title
			FROM files f
			LEFT JOIN files_categories fc ON fc.file_category_id = f.file_category_id
			LEFT JOIN static_pages s ON s.static_page_id = fc.static_page_id
			WHERE f.file_category_id = $categoryId
				AND s.default_title = '$page'
			ORDER BY f.title";
	
	$result = dbGetArray($sql, 1050);
	return $result;
}

function getParentCategoryById($childId) {
	$sql = "SELECT file_category_id, title 
			FROM files_categories 
			WHERE file_category_id = (
				SELECT parent_id 
				FROM files_categories 
				WHERE file_category_id = $childId
			)";

	$result = dbGetRow($sql, 1051);
	return $result;
}

function getCitiesCount()
{
/*	$sql = "SELECT COUNT(c.city_id) as count
			FROM cities c"; */
	
	//count only cities with active targs!
	$sql = "SELECT COUNT(DISTINCT t.city_id) as count FROM targs t WHERE t.is_active = TRUE AND t.targ_date >= NOW()";
	
	$result = dbGetRow($sql, 1060);
	return $result['count'];
}

function getAllRegions()
{
	$sql = "SELECT region_id, name
			FROM regions
			ORDER BY name";
	
	$result = dbGetArray($sql, 1070);
	return $result;
}

function getAllDealTypes()
{
	$sql = "SELECT deal_type_id, type
			FROM deal_types
			ORDER BY type";
	
	$result = dbGetArray($sql, 1080);
	return $result;
}

function getAllEstateTypes()
{
	$sql = "SELECT estate_type_id, type
			FROM estate_types
			ORDER BY type";
	
	$result = dbGetArray($sql, 1090);
	return $result;
}

function getAllTargTypes()
{
	$sql = "SELECT targ_type_id, type
			FROM targ_types
			ORDER BY type";
	
	$result = dbGetArray($sql, 1100);
	return $result;
}

function getAllOrganizerTypes()
{
	$sql = "SELECT organizer_type_id, type
			FROM organizer_types
			ORDER BY type";
	
	$result = dbGetArray($sql, 1110);
	return $result;
}

function addWhereToQuery($sql, $where)
{
	if ($where) {
		$sql .= " AND ";
	} else {
		$sql .= " WHERE ";
	}
	
	return $sql;
}

function getTargsList($category = null, $region = null, $date = null, $organizerTypeId = null, $limit = null, $isFeatured = null, $isActive = true, $isArchived = null, $orderBy = null)
{
	$sql = "SELECT t.targ_id, t.title, t.description, t.price_start as price, t.targ_date, t.doc_date_end, t.is_active, c.name as city, r.name as region, i.filename, i.title as image_title, et.type as estate_type, dt.type as deal_type
			FROM targs t
			LEFT JOIN cities c ON c.city_id = t.city_id
			LEFT JOIN images i ON i.image_id = t.image_id
			LEFT JOIN regions r ON r.region_id = c.region_id
			LEFT JOIN organizers o ON o.organizer_id = t.organizer_id
			LEFT JOIN estate_types et ON et.estate_type_id = t.estate_type_id
			LEFT JOIN deal_types dt ON dt.deal_type_id = t.deal_type_id";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = t.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "t.is_active = $isActive";
		$where = true;
	}		
	if (!empty($region)) {
		$sql = addWhereToQuery($sql, $where);
		if (is_int($region)) {
			$sql .= "r.region_id = $region";
		} else {
			$sql .= "r.name = '$region'";
		}
		$where = true;
	}
	if (!empty($date)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) = '$date'";
		$where = true;
	}
	if (!empty($organizerTypeId)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "o.organizer_type_id = $organizerTypeId";
		$where = true;
	}
	if (isset($isArchived) && $isArchived == true) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) < DATE(NOW())";
		$where = true;
	} elseif (isset($isArchived) && $isArchived == false) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) >= DATE(NOW())";
		$where = true;
	}
	if (isset($isFeatured)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "t.is_featured = $isFeatured
				ORDER BY RAND()";
	} else {
		$sql .= " ORDER BY ";
		if (isset($orderBy)) {
			$sql .= "t." . $orderBy . ', ';
		}
		$sql .= "t.targ_id DESC";
	}
	if (!empty($limit)) {
		$sql .= " LIMIT $limit";
	}

	$result = dbGetArray($sql, 1120);
	return $result;
}

function getTargsCount($category = null, $region = null, $date = null, $organizerTypeId = null, $limit = null, $isFeatured = null, $isActive = true, $isArchived = null, $getPriceSum = false)
{
	$sql = "SELECT COUNT(t.targ_id) as count, SUM(t.price_start) as sum
			FROM targs t
			LEFT JOIN cities c ON c.city_id = t.city_id
			LEFT JOIN regions r ON r.region_id = c.region_id
			LEFT JOIN organizers o ON o.organizer_id = t.organizer_id";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = t.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "t.is_active = $isActive";
		$where = true;
	}		
	if (!empty($region)) {
		$sql = addWhereToQuery($sql, $where);
		if (is_int($region)) {
			$sql .= "r.region_id = $region";
		} else {
			$sql .= "r.name = '$region'";
		}
		$where = true;
	}
	if (!empty($date)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) = '$date'";
		$where = true;
	}
	if (!empty($organizerTypeId)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "o.organizer_type_id = $organizerTypeId";
		$where = true;
	}
	if (isset($isFeatured)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "t.is_featured = $isFeatured";
		$where = true;
	}
	if (isset($isArchived) && $isArchived == true) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) < DATE(NOW())";
		$where = true;
	} elseif (isset($isArchived) && $isArchived == false) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "DATE(t.doc_date_end) >= DATE(NOW())";
		$where = true;
	}

	$result = dbGetRow($sql, 1130);

	if ($getPriceSum == false) {
		return $result['count'];
	} else {
		return $result['sum'];
	}
}

function getTargById($targId, $isActive = true, $category = null)
{
	$sql = "SELECT t.targ_id, t.title, t.date_added, t.trial_number,
				t.estate_address, t.description, t.additional, t.targ_date, t.targ_address,
				t.doc_address, t.doc_date_end, t.doc_price, t.view_days, t.view_time_start,
				t.view_time_end, t.price_start, t.price_step, t.deposit, t.map, t.image_id, t.gallery_id,
				c.city_id, c.name as city, r.region_id, r.name as region,
				i.filename, i.title as image_title, ia.name as image_author,
				o.organizer_id, o.name as organizer_name, o.address as organizer_address, o.phone as organizer_phone,
				ot.organizer_type_id, ot.type as organizer_type,
				e.estate_type_id, e.type as estate_type,
				tt.targ_type_id, tt.type as targ_type,
				d.deal_type_id, d.type as deal_type,
				t.is_active, t.is_featured,
				cat.category_id, cat.default_name as category_name
			FROM targs t
			LEFT JOIN cities c ON c.city_id = t.city_id
			LEFT JOIN regions r ON r.region_id = c.region_id
			LEFT JOIN images i ON i.image_id = t.image_id
			LEFT JOIN authors ia ON ia.author_id = i.author_id
			LEFT JOIN organizers o ON o.organizer_id = t.organizer_id
			LEFT JOIN organizer_types ot ON ot.organizer_type_id = o.organizer_type_id
			LEFT JOIN estate_types e ON e.estate_type_id = t.estate_type_id
			LEFT JOIN targ_types tt ON tt.targ_type_id = t.targ_type_id
			LEFT JOIN deal_types d ON d.deal_type_id = t.deal_type_id
			LEFT JOIN categories cat ON cat.category_id = t.category_id
			WHERE t.targ_id = $targId";
	if (isset($isActive)) {
		$sql .= " AND t.is_active = $isActive";
	}
	if (!empty($category)) {
		$sql .= " AND cat.default_name = '$category'";
	}

	$result = dbGetRow($sql, 1140);
	return $result;
}

function getAnnouncementsList($category = null, $limit = null, $isFeatured = null, $isActive = true, $isArchived = false)
{ 
	$sql = "SELECT a.announcement_id, a.title, a.summary, a.date_added, a.is_active, i.filename, i.title as image_title
			FROM announcements a
			LEFT JOIN images i ON i.image_id = a.image_id";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = a.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "a.is_active = $isActive";
		$where = true;
	}
	if (isset($isArchived)) {
		$sql = addWhereToQuery($sql, $where);
//TODO!	michael //	$sql .= "a.is_archived = " . $isArchived ? 'true' : 'false';
		$sql .= "a.is_archived = " . (int)$isArchived;
		$where = true;
	}
	
	if (isset($isFeatured)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= " a.is_featured = $isFeatured
				ORDER BY RAND()";
	} else {
		$sql .= " ORDER BY a.date_added DESC, a.announcement_id DESC";
	}
	if (!empty($limit)) {
		$sql .= " LIMIT $limit";
	}
	
	$result = dbGetArray($sql, 1150);
	return $result;
}

function getAnnouncementsCount($category = null, $limit = null, $isFeatured = null, $isActive = true, $isArchived = null)
{
$sql = "SELECT COUNT(a.announcement_id) as count
			FROM announcements a";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = a.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "a.is_active = $isActive";
		$where = true;
	}
	if (isset($isArchived)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "a.is_archived = " . (int)$isArchived;
		$where = true;
	}
	if (isset($isFeatured)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= " AND a.is_featured = $isFeatured";
	}
	
	$result = dbGetRow($sql, 1160);
	return $result['count'];
}

function getAnnouncementById($announcementId, $isActive = true, $category = null)
{
	$sql = "SELECT a.announcement_id, a.title, a.summary, a.content, a.date_added, 
				a.image_id, a.gallery_id, i.filename, i.title as image_title, ia.name as image_author,
				a.is_active, a.is_featured, a.is_archived,
				cat.category_id, cat.default_name as category_name
			FROM announcements a
			LEFT JOIN images i ON i.image_id = a.image_id
			LEFT JOIN authors ia ON ia.author_id = i.author_id
			LEFT JOIN categories cat ON cat.category_id = a.category_id
			WHERE a.announcement_id = $announcementId";
	if (isset($isActive)) {
		$sql .= " AND a.is_active = $isActive";
	}
	if (!empty($category)) {
		$sql .= " AND cat.default_name = '$category'";
	}
	
	$result = dbGetRow($sql, 1170);
	return $result;
}

function getPublicationsList($category = null, $limit = null, $isActive = true)
{
	$sql = "SELECT p.publication_id, p.title, p.summary, p.date_added, p.is_active, p.is_payed, i.filename, i.title as image_title
			FROM publications p
			LEFT JOIN images i ON i.image_id = p.image_id";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = p.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "p.is_active = $isActive";	
	}
	$sql .= " ORDER BY p.date_added DESC, p.publication_id DESC";
	if (!empty($limit)) {
		$sql .= " LIMIT $limit";
	}
	
	$result = dbGetArray($sql, 1180);
	return $result;
}

function getPublicationsCount($category = null, $limit = null, $isActive = true)
{
	$sql = "SELECT COUNT(p.publication_id) as count
			FROM publications p";
	
	$where = false;
	if(!empty($category)) {
		$sql .= " LEFT JOIN categories cat ON cat.category_id = p.category_id
					WHERE cat.default_name = '$category'";
		$where = true;
	}
	if (isset($isActive)) {
		$sql = addWhereToQuery($sql, $where);
		$sql .= "p.is_active = $isActive";	
	}
	
	$result = dbGetRow($sql, 1190);
	return $result['count'];
}

function getPublicationById($publicationId, $isActive = true, $category = null)
{
	$sql = "SELECT p.publication_id, p.title, p.summary, p.content, p.source, p.date_added,
				p.is_active, p.is_payed, p.image_id, p.gallery_id,
				i.filename, i.title as image_title, ia.name as image_author,
				a.author_id, a.name as author_name,
				cat.category_id, cat.default_name as category_name
			FROM publications p
			LEFT JOIN images i ON i.image_id = p.image_id
			LEFT JOIN authors ia ON ia.author_id = i.author_id
			LEFT JOIN authors a ON a.author_id = p.author_id
			LEFT JOIN categories cat ON cat.category_id = p.category_id
			WHERE p.publication_id = $publicationId";
	if (isset($isActive)) {
		$sql .= " AND p.is_active = $isActive";
	}
	if (!empty($category)) {
		$sql .= " AND cat.default_name = '$category'";
	}

	$result = dbGetRow($sql, 1200);
	return $result;
}

function getBlogsList($limit = null, $randomize = null, $isActive = true)
{
	$sql = "SELECT b.blog_id, b.title, b.url, b.feed, b.logo, b.is_active
			FROM blogs b";
	if (isset($isActive)) {
		$sql .= " WHERE b.is_active = $isActive";
	}
	if (isset($randomize)) {
		$sql .= " ORDER BY RAND()";
	} else {
		$sql .= " ORDER BY title";
	}
	if (!empty($limit)) {
		$sql .= " LIMIT $limit";
	}

	$result = dbGetArray($sql, 1210);
	return $result;
}

function getBlogsCount($limit = null, $isActive = true)
{
	$sql = "SELECT COUNT(b.blog_id) as count
			FROM blogs b";
	if (isset($isActive)) {
		$sql .= " WHERE b.is_active = $isActive";
	}
	
	$result = dbGetRow($sql, 1220);
	return $result['count'];
}

function getBlogById($blogId, $isActive = true)
{
	$sql = "SELECT b.blog_id, b.title, b.url, b.feed, b.logo, b.is_active
			FROM blogs b
			WHERE b.blog_id = $blogId";
	if (isset($isActive)) {
		$sql .= " AND b.is_active = $isActive";
	}
	
	$result = dbGetRow($sql, 1230);
	return $result;
}

function cmpBlogs($a, $b)
{
	if ($a['datetime'] == $b['datetime']) {
		return 0;
	}
	return ($a['datetime'] > $b['datetime']) ? -1 : 1;
}

function getImagesByGalleryId($galleryId)
{
	$sql = "SELECT i.image_id, i.filename, i.title, i.image_order, i.author_id, a.name as author_name
			FROM images i
			LEFT JOIN authors a ON a.author_id = i.author_id
			WHERE i.gallery_id = $galleryId
			ORDER BY i.image_order";
	
	$result = dbGetArray($sql, 1240);
	return $result;
}

function getLatestForumPosts($limit = 10)
{
	if (DB_SCHEMA != DB_SCHEMA_FORUM) {
		$conn = dbConnect(DB_HOST, DB_SCHEMA_FORUM, DB_USER_FORUM, DB_PASS_FORUM, 'conn2');
		if (!$conn) {
			throw new Exception($GLOBALS['systemMessages']['dbError'], 1250);
		}
	} else {
		$conn = false;
	}
	
	$sql = "SELECT topic_id, topic_title, topic_last_poster_id, 
			topic_last_poster_name, topic_last_post_subject, topic_last_post_time
		FROM phpbb_topics
		ORDER BY topic_last_post_time DESC
		LIMIT 0, $limit";
	
	$result = dbGetArray($sql, 1251);
	
	if ($conn) {
		dbConnect(); // reconect back to default connection
	}
	
	return $result;
}

function checkValidCode($code) {
	$sql = "SELECT p.payment_id, p.code, p.valid_from, p.valid_to, p.user, p.ip1, p.ip2, p.ip3
			FROM payments p
			WHERE p.code = '$code'";

	$result = dbGetArray($sql, 1260);
	return $result;
}

function insertPaymentIp($id, $currentIp, $slot)
{
	$sql = "UPDATE payments
			SET $slot = '$currentIp'
			WHERE payment_id = '$id'";

	$success = dbUpdate($sql, 1270);
	return $success;
}

function getTargViewCount ($targId)
{
	$sql = "SELECT view_counter
			FROM targs
			WHERE targ_id = $targId";

	$result = dbGetRow($sql, 1280);
	return $result;
}

function updateViewCount($targId, $viewCount)
{
	$sql = "UPDATE targs
			SET view_counter = $viewCount
			WHERE targ_id = $targId";

	$success = dbUpdate($sql, 1290);
	return $success;
}

function insertSubscriber ($email, $regionPrefs, $estateTypePrefs)
{
	$sql = 'INSERT INTO `subscribers` (subscriber_email, is_subscribed) VALUES ("'.$email.'", 1)';
	$sql .=	" ON DUPLICATE KEY UPDATE subscriber_id = LAST_INSERT_ID(subscriber_id), is_subscribed = 1";
	dbInsert($sql, 1300);
	$subscriberId = mysql_insert_id();
	if(!empty($estateTypePrefs)) {
		foreach($estateTypePrefs as $value) {
			$sql1 = "INSERT INTO `subscribers_estate_types` (subscriber_id, estate_type_id) VALUES ($subscriberId, $value)";
			dbInsert($sql1, 1310);
		}
	}
	if(!empty($regionPrefs)) {
		foreach($regionPrefs as $value) {
			$sql2 = "INSERT INTO `subscribers_regions` (subscriber_id, region_id) VALUES ($subscriberId, $value)";
			dbInsert($sql2, 1320);
		}
	}
	return $subscriberId;
}

function updateSubscriber ($subscriberId, $email, $region, $estateType)
{
	$sql = "UPDATE `subscribers` SET subscriber_email = '$email' WHERE subscriber_id = $subscriberId";
	dbUpdate($sql, 1330);
	$sql1 = "DELETE FROM subscribers_estate_types WHERE subscriber_id = $subscriberId";
	mysql_query($sql1);
	$sql2 = "DELETE FROM subscribers_regions WHERE subscriber_id = $subscriberId";
	mysql_query($sql2);
	if(!empty($estateType)) {
		foreach($estateType as $value) {
			$sql3 = "INSERT INTO `subscribers_estate_types` (subscriber_id, estate_type_id) VALUES ($subscriberId, $value)";
			dbInsert($sql3, 1340);
		}
	}
	if(!empty($region)) {
		foreach($region as $value) {
			$sql4 = "INSERT INTO `subscribers_regions` (subscriber_id, region_id) VALUES ($subscriberId, $value)";
			dbInsert($sql4, 1350);
		}
	}
	return $subscriberId;
}

function getSubscriberMailById ($subscriberId)
{
	$sql = "SELECT subscriber_email FROM subscribers WHERE subscriber_id = $subscriberId";

	$result = dbGetRow($sql, 1360);
	return $result;
}

function unsubscribe($subscriberId)
{
	$sql = "UPDATE subscribers
			SET is_subscribed = 0
			WHERE subscriber_id = $subscriberId";

	$result = dbUpdate($sql, 1370);
	return $result;
}

function isGooglebot()
{
	// check if user agent contains googlebot
	if(eregi("Googlebot",$_SERVER['HTTP_USER_AGENT'])) {
		$ip = $_SERVER['REMOTE_ADDR'];
		//server name e.g. crawl-66-249-66-1.googlebot.com

		$name = gethostbyaddr($ip);
		//check if name ciontains googlebot
		if(eregi("Googlebot",$name)) {
			//list of IP's
			$hosts = gethostbynamel($name);
			foreach($hosts as $host) {
				if ($host == $ip) {
					return true;
				}
			}
			return false; // fake bot
		} else {
			return false; // fake bot
		}
	} else {
		return false; // Not googlebot
	}
}

?>