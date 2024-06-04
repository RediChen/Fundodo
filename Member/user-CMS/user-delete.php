<?php
require_once("../connect_tools/midterm_connect.php");

if(!isset($_GET["id"])){
    echo "請循正常管道進入此頁";
    exit;
}

$id=$_GET["id"];

$sql = "UPDATE users SET valid=0 WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    $message = "成功删除用户";
} else {
    $message = "刪除資料錯誤: " . $conn->error;
}

$conn->close();

echo "<script>alert('$message'); window.location.href='users.php';</script>";
exit(); 
?>