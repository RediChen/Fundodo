<?php
require_once("/xampp/htdocs/Fundodo/db_connect.php");
session_start();

function back2login()
{
  header("location: login.php");
  exit;
}

// 擋沒有 POST 的情形
if (!isset($_POST["account"]) || !isset($_POST["password"])) {
  echo "請循正常管道進入此頁";
  exit;
}
unset($_SESSION["errorMsg"]);
$account = $_POST["account"];
$password = $_POST["password"];

// 擋沒有完整輸入的情形
if (empty($account)) {
  $_SESSION["errorMsg"]['account'] = "請輸入帳號";
}
if (empty($password)) {
  $_SESSION["errorMsg"]['password'] = "請輸入密碼";
}
if (isset($_SESSION["errorMsg"])) {
  back2login();
}

$sql = "SELECT * FROM users WHERE account = '$account'";
$result = $conn->query($sql);
$userCount = $result->num_rows;

// 擋查無帳號的情形
if ($userCount == 0) :
  $_SESSION["errorMsg"]['account'] = "不存在的帳號";
  back2login();
elseif ($userCount != 1) :
  echo "出事了！重複的帳號";
  exit;
endif;

// var_dump($row);
$row = $result->fetch_assoc();

// 擋密碼錯誤的情形
if (password_verify($password, $row["password_hash"]) == FALSE) {
  $_SESSION["errorMsg"]['password'] = "密碼輸入錯誤";

  if (isset($_SESSION["errorTimes"])) {
    $_SESSION["errorTimes"]++;
  } else {
    $_SESSION["errorTimes"] = 1;
  }
  back2login();
}

// 清除錯誤狀態、載入登入狀態
unset($_SESSION["errorMsg"]);
unset($_SESSION["errorTimes"]);
$_SESSION["user"] = [
  "id" => $row["id"],
  "account" => $row["account"],
  "nickname" => $row["nickname"],
  "name" => $row["name"],
  "email" => $row["email"],
  "user_level" => $row["user_level"],
];

// 根據會員權限分流
if ($row["user_level"] == 20) {
  header("Location: /fundodo/dashboard/dashboard.php");
} else {
  header("location: member-center.php");
}
