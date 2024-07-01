<?php
//讀取值
// $name = $_POST['name'];
// $email = $_POST['email'];
// $phones = $_POST['phones'];
// $now = date('Y-m-d H:i:s');

//連線資料庫
require_once('../connectDB.php'); //連線資料物件：$conn
include('./date_handle-json.php');
// 資料陣列：$dataFormated；欄位陣列：$ordered_col

//匯入新資料
// $sql = "INSERT INTO users (name, phone, email, created_at) VALUES ('$name', '$phones', '$email', '$now')";
$sql_INSERT = "INSERT INTO users";
//================================================

$sql_COLS = " (" . implode(', ', $ordered_col) . ", created_at" .  ")";

//================================================

$now = date('Y-m-d H:i:s');

$valuesArr = [];
foreach ($dataFormated as $userData) :
    $value_item = '("' . implode('", "', $userData) . '", "' . $now .  '")';
    array_push($valuesArr, $value_item);
    // echo $value_item;
    // break;
endforeach;
$sql_VALUES = " VALUES " . implode(', ', $valuesArr);

$sql = $sql_INSERT . $sql_COLS . $sql_VALUES;

// echo 'SQL 語法：<br>' . $sql;

$target = "匯入 100 筆資料";

//* 此 query 已執行
// if ($conn->query($sql) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }

//登出資料庫
$conn->close();