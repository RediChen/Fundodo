<?php
require_once('../../connectDB_fdd.php');
include("../../console-lib.php");
$json = file_get_contents('./usersData.json');
$userArr = json_decode($json, true);
$keys = array_keys($userArr[0]);

//匯入新資料
// $sql = "INSERT INTO users (name, ...) VALUES ('$name', ...), ('$name', ...), ...";

//================================================
$sql_INSERT = "INSERT INTO users";

$sql_COLS = " (" . implode(', ', $keys) .  ")";
//================================================

$valuesArr = [];
//! gender, adr_city, user_level, deleted_at
//! adr_district
foreach ($userArr as $user) :
    // 將郵遞區號修正為 int
    $user["adr_district"] = intval($user["adr_district"]);

    foreach ($keys as $key) :
        if ($key == "deleted_at") :
            $user[$key] = 'null';
        endif;
        if ($key == "gender" || $key == "adr_city" || $key == "adr_district" || $key == "user_level" || $key == "deleted_at") :
            continue;
        endif;
        $user[$key] = '"' . $user[$key] . '"';
    endforeach;

    $value_item = '(' . implode(', ', $user) .  ')';
    array_push($valuesArr, $value_item);

endforeach;
$sql_VALUES = " VALUES " . implode(', ', $valuesArr);

$sql = $sql_INSERT . $sql_COLS . $sql_VALUES;


$sql_CREATE = "CREATE TABLE IF NOT EXISTS `users` (
	`id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`nickname` varchar(50) NOT NULL,
	`account` varchar(50) NOT NULL,
	`password_hash` varchar(60) NOT NULL,
	`gender` varchar(10) NOT NULL,
	`user_level` tinyint(1) UNSIGNED NOT NULL,
	`dob` date NOT NULL,
	`tel` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`address` varchar(100) NOT NULL,
	`adr_city` tinyint NOT NULL,
	`adr_district` int(3) UNSIGNED NOT NULL,
	`created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`deleted_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

// $target = "Create table users";

// if ($conn->query($sql_CREATE) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }


// br(3);


// $target = "匯入 301 筆資料";

// //* 此 query 已執行
// if ($conn->query($sql) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }

//登出資料庫
$conn->close();
