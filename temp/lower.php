<?php
//將所有會員帳號小寫化
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include $to_fdd . "tools/console-lib.php";
$sql = "SELECT * FROM users";

$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);

foreach ($rows as $user) :
  $lower_account = strtolower($user['account']);
  $sql = "UPDATE users SET account = '$lower_account' WHERE id = ". $user['id'];
  $result = $conn->query($sql);
endforeach;

echo "更新完成";