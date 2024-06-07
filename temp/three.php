<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include $to_fdd . "tools/console-lib.php";
$sql = "SELECT * FROM users";

$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);

foreach ($rows as $row) :
  if ($row['id'] == 1) continue;
  $dice = rand(0, 6);
  $file_name = "avatar$dice.png";

  $sql = "UPDATE users SET avatar_file = '". $file_name. "' WHERE id = ". $row['id'];
  $result = $conn->query($sql);
endforeach;


echo "更新完成";