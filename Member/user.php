<?php
if (!isset($_GET["id"])) {
    $id = 3;
} else {
    $id = $_GET["id"];
}


require_once("/xampp/htdocs/Fundodo/db_connect.php");
$sql = "SELECT * FROM users WHERE id = $id AND valid = 1";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$sql_images = "SELECT * FROM users WHERE id = $id  AND valid = 1";
$result_images = $conn->query($sql_images);
$rows_images = $result_images->fetch_all(MYSQLI_ASSOC);

if ($result->num_rows > 0) {
    $userExit = true;
    $title = $row["name"];
} else {
    $userExit = false;
    $title = "使用者不存在";
}

// $userExit=true;
// if($result->num_rows==0)$userExit=false;



if ($row === null) {
    // 如果 $row 为空，你可以提供一个备用的值或者显示一个错误消息
    echo "未找到用户";
    exit; // 停止执行后续代码
}

// var_dump($row);
?>


<!doctype html>
<html lang="en">

<head>
    <title>User</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>


</head>

<body>
<div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="db_content">
             <!-- modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id="deleteModalLabel">確認刪除</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    刪除使用者
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <a href="user-delete.php?id=<?= $row["id"] ?>" type="button" class="btn btn-danger">確認</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteAvatar" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id="deleteModalLabel">確認刪除</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    刪除頭像
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <a href="Avatar-delete.php?id=<?= $row["id"] ?>" type="button" class="btn btn-danger">確認</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="py-2">
            <a href="users.php" class="btn btn-primary"><i class="fa-solid fa-arrow-left"></i>回使用者列表</a>
        </div>
        <div class="row justify-content-start">
            <div class="col-lg-6">
                <?php if ($userExit) : ?>
                    <table class="table table-bordered">
                        <tr>
                            <th>id</th>
                            <td><?= $row["id"] ?></td>
                        </tr>
                        <tr>
                            <th>會員姓名</th>
                            <td><?= $row["name"] ?></td>
                        </tr>
                        <tr>
                            <th>暱稱</th>
                            <td><?= $row["nickname"] ?></td>
                        </tr>
                        <tr>
                            <th>帳號</th>
                            <td><?= $row["account"] ?></td>
                        </tr>
                        <tr>
                            <th>密碼</th>
                            <td><?= $row["password_hash"] ?></td>
                        </tr>
                        <tr>
                            <th>性別</th>
                            <td><?= ($row["gender"] == 1) ? "男" : (($row["gender"] == 2) ? "女" : "未知") ?></td>
                        </tr>
                        <tr>
                            <th>權限</th>
                            <td><?= ($row["user_level"] == 20) ? "管理者" : (($row["user_level"] == 3) ? "版主" : "會員") ?></td>
                        </tr>
                        <tr>
                            <th>會員等級</th>
                            <td><?= ($row["valid"] == 3) ? "高級會員" : (($row["valid"] == 0) ? "封禁帳號" : "會員") ?></td>
                        </tr>
                        <tr>
                            <th>生日</th>
                            <td><?= $row["dob"] ?></td>
                        </tr>
                        <tr>
                            <th>電話</th>
                            <td><?= $row["tel"] ?></td>
                        </tr>
                        <tr>
                            <th>頭像</th>
                            <td><?= $row["avatar"] ?></td>
                        </tr>
                        <tr>
                            <th>頭像路徑</th>
                            <td><?= $row["avatar_file"] ?></td>
                        </tr>
                        <tr>
                            <th>郵箱</th>
                            <td><?= $row["email"] ?></td>
                        </tr>
                        <tr>
                            <th>創建時間</th>
                            <td><?= $row["created_at"] ?></td>
                        </tr>
                    </table>
                    <div class="py-2 d-flex justify-content-between">
                        <a class="btn btn-primary" href="user-edit.php?id=<?= $row["id"] ?>" title="編輯使用者"><i class="fa-solid fa-pen-to-square"></i></a>


                        <button class="btn btn-danger" title="刪除使用者" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa-solid fa-trash"></i></button>
                    </div>


                <?php else : ?>
                    <h1>使用者不存在</h1>
                <?php endif; ?>
            </div>
            <div class="col-lg-3 mx-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row g-3 justify-content-start">
                            <?php foreach ($rows_images as $image) : ?>
                                <div class="col">
                                    <div class="ratio ratio-1x1">
                                        <img src="../avatar/<?= $image["avatar_file"] ?>" alt="" class="object-fit-cover">
                                        <h2 class="h4"><?= $image["avatar"] ?></h2>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col text-center">
                                <a class="text-decoration-none btn btn-secondary" href="Member-center.php?id=<?= $row["id"] ?>" title="前往會員中心更換頭像">會員中心</a>
                                <button class="btn btn-danger" title="刪除使用者" data-bs-toggle="modal" data-bs-target="#deleteAvatar"><i class="fa-solid fa-trash"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

        </div>
      </div>
    </div>
 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>