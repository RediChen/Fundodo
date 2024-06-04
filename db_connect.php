<?php
$server_name="localhost";
$user_name="admin";
$password="12345";
$db_name="db_test";

$connect=new mysqli($server_name,$user_name,$password,$db_name);

if ($connect->connect_error) {
    die("連線失敗: " . $connect->connect_error);
}