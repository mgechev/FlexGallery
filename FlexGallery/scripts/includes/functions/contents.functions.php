<?php

function getContentById($id) {
	$sql = "SELECT `title`, `content`, `short_description`, `source`, `created`, `image_id`, `category_id`, `is_active`
			FROM `contents`
			WHERE `content_id` = $id";

	return dbGetRow($sql, 1010);
}

function getContentsByCategory($categoryId, $limit = NULL, $offset = NULL, $isActive = true) {
	$sql = "SELECT SQL_CALC_FOUND_ROWS c.`content_id`, c.`title`, c.`short_description`, c.`content`, c.`source`, c.`created`, c.`category_id`, c.`is_active`, i.`filename`, i.`description`
			FROM `contents` c
			LEFT JOIN `images` i ON i.`image_id` = c.`image_id`
			WHERE `category_id` = $categoryId";
	if (isset($isActive)) {
		$sql .= " AND is_active = " . intval($isActive);
	}
	$sql .= " ORDER BY `created` DESC, `content_id` DESC";
	if(!empty($limit)) {
		$sql .= " LIMIT $limit";
		if(!empty($offset)) {
			$sql .= " OFFSET $offset";
		}
	}

	return dbGetArray($sql, 1020);
}

function getImageById($id) {
	$sql = "SELECT `filename`, `description`, `content_id`
			FROM `images`
			WHERE `image_id` = $id";

	return dbGetRow($sql, 1040);
}

function getImagesByContentId($content_id) {
	$sql = "SELECT `image_id`, `filename`, `description`, `order_by`, `content_id`
			FROM `images`
			WHERE `content_id` = $content_id
			ORDER BY `order_by`";

	return dbGetArray($sql, 1050);
}

?>