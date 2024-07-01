-- 資料表欄位型別統整表
-- https://docs.google.com/spreadsheets/d/1jvJNMUG2evcyz22wNJMboV0RCpweRl2kum5RKee0JIc/edit#gid=0

SET time_zone = "+08:00";

CREATE TABLE IF NOT EXISTS `images_stored` (
	`id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	`genre` varchar(2) NOT NULL,
	`item_id` int(8) UNSIGNED NOT NULL,
	`item_sub_id` tinyint(2) UNSIGNED NOT NULL,
	`image_name` varchar(9) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
	`id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`nickname` varchar(50) NOT NULL,
	`account` varchar(50) NOT NULL,
	`password` varchar(60) NOT NULL,
	`gender` varchar(10) NOT NULL,
	`user_level` tinyint(1) UNSIGNED NOT NULL,
	`dob` date NOT NULL,
	`cellphone_num` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`address` varchar(100) NOT NULL,
	`adr_city` tinyint NOT NULL,
	`adr_district` int(3) UNSIGNED NOT NULL,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`deleted_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- DEFAULT CURRENT_TIMESTAMP 功效為：
-- 自動初始化: 資料寫入欄位，自動填入當下時間


-- 以下 products 的結構為簡化版，僅作一層的分類
CREATE TABLE IF NOT EXISTS `products` (
	`id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`pic_file` varchar(30) NOT NULL,
	`description` varchar(254) NOT NULL,
	`vategory_id` int(6) UNSIGNED NOT NULL,
	`price` int(6) UNSIGNED NOT NULL,
	`stock` int(11) UNSIGNED NOT NULL,
	`on_shelves_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `courses` (
	`id` mediumint(6) NOT NULL AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	`desc` text(400) NOT NULL,
	`img_file_name` varchar(50) NOT NULL,
	`mtl_file_name` varchar(50) NOT NULL,
	`view_count` int(9) UNSIGNED NOT NULL DEFAULT 0,
	`price` mediumint(6) UNSIGNED NOT NULL,
	`price_sp` mediumint(6) UNSIGNED DEFAULT NULL,
	`sp_from` date DEFAULT NULL,
	`sp_timespan` smallint(3) UNSIGNED DEFAULT NULL,
	`on_shelves_time` datetime DEFAULT CURRENT_TIMESTAMP,
	`valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `course_user` (
	`id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	`course_id` mediumint(6) UNSIGNED NOT NULL,
	`user_id` int(6) UNSIGNED NOT NULL,
	`activated_at` datetime DEFAULT CURRENT_TIMESTAMP,
	`valid_timespan` smallint(4) UNSIGNED DEFAULT NULL,
	`valid` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `crs_categories` (
	`id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	`category` varchar(20) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `course_category` (
	`id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
	`course_id` mediumint(6) UNSIGNED NOT NULL,
	`category_id` smallint(3) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `crs_view_record` (
	`id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	`user_id` int(8) UNSIGNED NOT NULL,
	`crs_id` int(8) UNSIGNED NOT NULL,
	`start_at` datetime NOT NULL,
	`end_at` datetime NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
