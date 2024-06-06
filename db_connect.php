<?php
// 共用
$server_name="localhost";
$user_name="admin";
$db_name = "fundodo";
$db_name = "fundodo";

//* 泓宣 宏榮
$password="12345";
$db_name="db_test";

//* 李柔
$password = "12345";
$db_name = "pet_hotel_db";

//*陳致
// $password = ".glWcQbgMsmuL2rB";
// $password = "44444";

  //*李柔
$servername = "localhost";
$username = "admin";
$password = "12345";
$dbname = "pet_hotel_db";

//* 晨宇
$db_name="db-products";
$conn=new mysqli($server_name,$user_name,$password,$db_name);

if ($conn->connect_error) {
    die("連線失敗: " . $conn->connect_error);
}