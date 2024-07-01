<?php
$to_tools = "/xampp/htdocs/tools/";
require_once($to_tools . "connectDB_fdd.php");
include($to_tools . "console-lib.php");


$sql = "CREATE TABLE IF NOT EXISTS `courses` (
	`id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	`abstract` varchar(400) NOT NULL,
	`description` text(3000) NOT NULL,
	`price` mediumint(6) UNSIGNED NOT NULL,
	`created_at` datetime NOT NULL,
	`deleted_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

$target = "創建資料表";

if ($conn->query($sql) === true) {
    echo '成功' . $target;
} else {
    echo $target . '失敗';
}

$sql_CREATE = "CREATE TABLE IF NOT EXISTS `crs_categories` (
	`id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	`category` varchar(20) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

if ($conn->query($sql_CREATE) === false) :
    echo "創建資料表 crs_categories 失敗！";
endif;

$sql_CREATE = "CREATE TABLE IF NOT EXISTS `course_category` (
	`id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
	`course_id` mediumint(6) UNSIGNED NOT NULL,
	`category_id` smallint(3) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

if ($conn->query($sql_CREATE) === false) :
    echo "創建資料表 course_category 失敗！";
endif;