<?php
session_start();
require_once("/xampp/htdocs/Fundodo/db_connect.php");

if (!isset($_POST["avatar"])) {
    echo "請循正常管道進入";
    exit;
}
if (isset($_GET["id"])) {
    $user_id = $_GET['id'];
    $sql = "SELECT * FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
} else {
    $user_id = $_SESSION['user']['id'];
    $sql = "SELECT * FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
}

$avatar = $_POST["avatar"];

// 檢查用戶是否有其他圖片
$avatar_folder = "../avatar/";
$old_avatar_files = glob($avatar_folder . $user_id . "_*");
foreach ($old_avatar_files as $old_avatar_file) {
    unlink($old_avatar_file);
}

if ($_FILES["avatar_file"]["error"] == 0) {
    $target_dir = "../avatar_catch/"; // 指定目標文件夾
    $file_extension = pathinfo($_FILES["avatar_file"]["name"], PATHINFO_EXTENSION);
    $avatar_file = $user_id . "." . $file_extension; // 新的文件名稱，包含用戶ID
    if (move_uploaded_file($_FILES["avatar_file"]["tmp_name"], $target_dir . $avatar_file)) {
        echo "上傳成功";
        // 檔案上傳成功後，將檔案移動到 avatar 文件夾中
        $source_file = $target_dir . $avatar_file;
        $destination_file = "../avatar/{$avatar_file}";
        if (rename($source_file, $destination_file)) {
            echo "檔案移動成功";
        } else {
            echo "檔案移動失敗";
        }
    } else {
        echo "上傳失敗";
    }
}

$sql = "UPDATE users SET avatar='$avatar', avatar_file='$avatar_file' WHERE id='$user_id'";

if ($conn->query($sql) === TRUE) {
    echo "更新成功";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
if(isset($user_id)){
    $encoded_user_id = urlencode($user_id);
    header("location: Member-center.php?id=$encoded_user_id");
} else {
    header("location: Member-center.php");
}
exit;