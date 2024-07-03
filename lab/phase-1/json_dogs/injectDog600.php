<?php
require_once('../../connectDB_fdd.php');
include("../../console-lib.php");
$json = file_get_contents('./dogs_rsl.json');
$dogArr = json_decode($json, true);
$keys = [
	"user_id", "created_at", "id",  "gender", "bodytype",  "breed", "name",  "deleted_at"
];

//匯入新資料
// $sql = "INSERT INTO dogs (name, ...) VALUES ('$name', ...), ('$name', ...), ...";

//================================================
$sql_INSERT = "INSERT INTO dogs";

$sql_COLS = " (" . implode(', ', $keys) .  ")";
//================================================

$valuesArr = [];
//! gender, adr_city, dog_level, deleted_at
//! adr_district
foreach ($dogArr as $dog) :
	$dog["deleted_at"] = 'null';
	foreach ($keys as $key) :
		if ($key == "id" || $key == "user_id" || $key == "gender") :
			continue;
		endif;
		$dog[$key] = '"' . $dog[$key] . '"';
	endforeach;

	$value_item = '(' . implode(', ', $dog) .  ')';
	array_push($valuesArr, $value_item);

endforeach;
$sql_VALUES = " VALUES " . implode(', ', $valuesArr);

$sql = $sql_INSERT . $sql_COLS . $sql_VALUES;

echo "SQL:<br>" . $sql;
// $sql_CREATE = "CREATE TABLE IF NOT EXISTS `dogs` (
// 	`id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
// 	`name` varchar(50) NOT NULL,
// 	`gender` tinyint(1) NOT NULL,
// 	`bodytype` varchar(10) NOT NULL,
// 	`user_id` int(6) UNSIGNED NOT NULL,
// 	`breed` varchar(14) NOT NULL,
// 	`created_at` datetime NOT NULL,
// 	`deleted_at` datetime DEFAULT NULL,
// 	PRIMARY KEY (`id`)
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";

// $target = "Create table dogs";

// if ($conn->query($sql_CREATE) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }


// br(3);


// $target = "匯入 589 筆資料";

// // //* 此 query 已執行
// if ($conn->query($sql) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }

//登出資料庫
$conn->close();
