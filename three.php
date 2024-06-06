<?php
require_once("./db_connect.php");
$sql = "SELECT * FROM users";

$result = $conn->query($sql);

$rows = $result->fetch_all(MYSQLI_ASSOC);

foreach ($rows as $row) :
  $dice = rand(1, 3);
  $file_name = "";
  switch ($dice):
    case 1:
      $file_name = "1.png";
      break;
    case 2:
      $file_name = "4.png";
      break;
    case 3:
      $file_name = "7.png";
      break;
    default:
      break;
  endswitch;

  $sql = "UPDATE users SET avatar_file = '". $file_name. "' WHERE id = ". $row['id'];
  $result = $conn->query($sql);

endforeach;

echo "更新完成";