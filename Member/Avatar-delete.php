<?php
require_once("../connect_tools/midterm_connect.php");
if(!isset($_GET["id"])){
    echo "請循正常管道進入此頁";
    exit;
}

$id=$_GET["id"];

$sql = "UPDATE users SET avatar=NULL, avatar_file=NULL WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    echo "<script>alert('成功删除頭像');</script>";
} else {
    echo "刪除資料錯誤: " . $conn->error;
}

$conn->close();

header("location: users.php");
exit(); // 重定向后终止脚本执行
?>