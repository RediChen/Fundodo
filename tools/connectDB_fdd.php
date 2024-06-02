<?php
//for 家用筆電
// $to_tools = "/xampp/htdocs/tools/";
$url = "localhost";
$username = "admin";
$password = ".glWcQbgMsmuL2rB";
$database = "fundodo";

//建立連線
$conn = new mysqli($url, $username, $password, $database);

//檢查連線
if ($conn->connect_error) {
    die('無法連線資料庫 fundodo:' . $conn->connect_error);
}