<?php
// 共用
$server_name="localhost";
$user_name="admin";
$db_name = "fundodo";

//* 泓宣
$password="12345";
// $db_name="db_test";

//*陳致
$password = ".glWcQbgMsmuL2rB";
// $password = "44444";

$connect=new mysqli($server_name,$user_name,$password,$db_name);

if ($connect->connect_error) {
    die("連線失敗: " . $connect->connect_error);
}