<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
    exit();
}
require_once("/xampp/htdocs/Fundodo/db_connect.php");
if (isset($_GET["id"])) {
    $user_id = $_GET['id'];
    $sql = "SELECT * FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
} else {
    $user_id = $_SESSION['user']['id'];
    $sql = "SELECT * FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
}

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    echo "未找到用户信息";
}

$sql_images = "SELECT * FROM users WHERE id = $user_id";
$result_images = $conn->query($sql_images);
$rows_images = $result_images->fetch_all(MYSQLI_ASSOC);

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>會員中心</title>
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
<a href="../article/article_title.php" class="btn btn-primary">文章首頁</a>
    <h1 class="text-center">會員中心</h1>
    <h2 class="text-center">會員資料</h2>
    <p class="text-center">會員暱稱：<?= $row['nickname'] ?></p>
    <p class="text-center">電子信箱：<?= $row['email'] ?></p>
    <p class="text-center">行動電話：<?= $row['tel'] ?></p>

    <!-- 其他功能 -->
    <h2 class="text-center">上傳頭像</h2>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form action="DoAvatarUpload.php?id=<?= $row["id"] ?>" method="post" enctype="multipart/form-data">
                    <div class="mb-2">
                        <label for="" class="form-label">名稱</label>
                        <input type="text" class="form-control" name="avatar">
                    </div>
                    <div class="mb-2">
                        <label for="" class="form-label">選擇檔案</label>
                        <input type="file" class="form-control" name="avatar_file">
                    </div>
                    <button class="btn btn-info" type="submit">送出</button>
                </form>
            </div>
            <div class="col-lg-6">
                <div class="row g-3">
                    <?php foreach ($rows_images as $image) : ?>
                        <div class="col-lg-4 col-md-6">
                            <div class="ratio ratio-1x1">
                                <img src="../avatar/<?= $image["avatar_file"] ?>" alt="" class="object-fit-cover">
                                <h2 class="h4"><?= $image["avatar"] ?></h2>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>

    </div>
</body>

</html>