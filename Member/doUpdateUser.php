<?php
require_once("/xampp/htdocs/Fundodo/db_connect.php");

// // 检查是否有 GET 参数
// if (!isset($_GET["id"])) {
//     echo "请通过正常渠道进入此页";
//     exit;
// }
$id = $_POST["id"];
$name = isset($_POST["name"]) ? $_POST["name"] : '';
$nickname = isset($_POST["nickname"]) ? $_POST["nickname"] : '';
$account = isset($_POST["account"]) ? $_POST["account"] : '';
$gender = isset($_POST["gender"]) ? $_POST["gender"] : '';
$user_level = isset($_POST["user_level"]) ? $_POST["user_level"] : '';
$valid = isset($_POST["valid"]) ? $_POST["valid"] : '';
$dob = isset($_POST["dob"]) ? $_POST["dob"] : '';
$tel = isset($_POST["tel"]) ? $_POST["tel"] : '';
$avatar = isset($_POST["avatar"]) ? $_POST["avatar"] : '';
$avatar_file = isset($_POST["avatar_file"]) ? $_POST["avatar_file"] : '';
$email = isset($_POST["email"]) ? $_POST["email"] : '';
$address = isset($_POST["address"]) ? $_POST["address"] : '';

$sql = "UPDATE users SET name='$name', nickname='$nickname', account='$account', gender='$gender',user_level='$user_level', valid='$valid', dob='$dob', tel='$tel', avatar='$avatar', email='$email', avatar_file='$avatar_file',address='$address' WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    $message = "更新成功";
} else {
    $message = "更新資料錯誤: " . $conn->error;
}


$conn->close();
header("Location: user.php?id=$id");
?>