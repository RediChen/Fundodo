<?php
require_once('/tools/connectDB_fdd.php');
include("/tools/console-lib.php");
$json = file_get_contents('./course.json');
$crsArr = json_decode($json, true)['data'];
$keys = ["id", "title", "abstract", "price"];
$keys_t = ["id", "title", "abstract", "price", "created_at"];
//================================================
//隨機生成給定時間後的時間點 in timestamp format(int)
function rand_time($time_i)
{
	$d_h = rand(0, 17);
	$d_m = rand(0, 31);
	$d_s = rand(0, 12);
	$time_f = strtotime("+$d_h hours $d_m minutes $d_s seconds", $time_i);
	return $time_f;
}
//將 timestamp format(int) 轉換成 'y-m-d H:i:s' format
function f_time($int_time)
{
	return date('y-m-d H:i:s', $int_time);
}
//================================================

$the_time = mktime(11, 02, 37, 12, 18, 2024);
$valuesArr = [];
foreach ($crsArr as $course) :
	

	$valItem = [];
	for ($i = 0; $i < count($keys); $i++) :
		if ($keys[$i] === "id") :
			$value_item[$keys[$i]] = $course[$i];
		elseif ($keys[$i] === "price") :
			$value_item[$keys[$i]] = intval($course[$i]);
		else :
			$value_item[$keys[$i]] = '"' . $course[$i] . '"';
		endif;
	endfor;

	$value_item["created_at"] = '"' . f_time($the_time) . '"';

	$sql_oneVal = '(' . implode(', ', $value_item) .  ')';
	array_push($valuesArr, $sql_oneVal);
	$the_time = rand_time($the_time);
endforeach;


$sql_VALUES = " VALUES " . implode(', ', $valuesArr);

//準備匯入新資料
$sql_INSERT = "INSERT INTO courses";

$sql_COLS = " (" . implode(', ', $keys_t) .  ")";
//================================================

$sql = $sql_INSERT . $sql_COLS . $sql_VALUES;

// echo "SQL:<br>" . $sql;

//* 執行 query
if ($conn->query($sql) === true) {
	$last_id = $conn->insert_id;
    echo "成功匯入 $last_id 筆資料";
} else {
    echo $target . '失敗';
}

//登出資料庫
$conn->close();
