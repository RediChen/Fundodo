<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
    exit();
}
require_once("../connect_tools/midterm_connect.php");

$user_id = $_SESSION['user']['id'];

$sql = "SELECT * FROM users WHERE id = $user_id";
$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);

if ($result->num_rows > 0) {
    var_dump ($_SESSION["user"]);
} else {
    echo "未找到用户信息";
}

$conn->close();

?>


<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <form action="DoAvatarUpload.php" method="post" enctype="multipart/form-data">
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
                    <?php foreach($rows as $image):?>
                    <div class="col-lg-4 col-md-6">
                        <div class="ratio ratio-1x1">
                            <img src="../avatar/<?=$image["avatar_file"]?>" alt="" class="object-fit-cover">
                            <h2 class="h4"><?=$image["avatar"]?></h2>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>

    </div>
</body>

</html>