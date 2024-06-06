<?php
require_once("../connect_tools/midterm_connect.php");

// // 检查是否有 GET 参数
// if (!isset($_GET["id"])) {
//     echo "请通过正常渠道进入此页";
//     exit;
// }
$id = $_POST["id"];
$name = isset($_POST["name"]) ? $_POST["name"] : '';
$nickname = isset($_POST["nickname"]) ? $_POST["nickname"] : '';
$account = isset($_POST["account"]) ? $_POST["account"] : '';
$password_hash = isset($_POST["password_hash"]) ? $_POST["password_hash"] : '';
$gender = isset($_POST["gender"]) ? $_POST["gender"] : '';
$user_level = isset($_POST["user_level"]) ? $_POST["user_level"] : '';
$valid = isset($_POST["valid"]) ? $_POST["valid"] : '';
$dob = isset($_POST["dob"]) ? $_POST["dob"] : '';
$tel = isset($_POST["tel"]) ? $_POST["tel"] : '';
$avatar = isset($_POST["avatar"]) ? $_POST["avatar"] : '';
$avatar_file = isset($_POST["avatar_file"]) ? $_POST["avatar_file"] : '';
$email = isset($_POST["email"]) ? $_POST["email"] : '';
$address = isset($_POST["address"]) ? $_POST["address"] : '';

$sql = "UPDATE users SET name='$name', nickname='$nickname', account='$account', password_hash='$password_hash', gender='$gender',user_level='$user_level', valid='$valid', dob='$dob', tel='$tel', avatar='$avatar', email='$email', avatar_file='$avatar_file',address='$address' WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    $message = "更新成功";
} else {
    $message = "更新資料錯誤: " . $conn->error;
}


$conn->close();
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更新結果</title>
    <script>
        function redirect() {
            setTimeout(function(){
                window.location.href = "user-edit.php?id=<?= $id ?>";
            }, 3000); // 3 秒後跳轉
        }
    </script>
</head>
<body onload="redirect()">
    <h1><?= $message ?></h1>
    <p>3 秒後自動跳轉到編輯頁面...</p>
</body>
</html>