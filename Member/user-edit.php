<?php
if (!isset($_GET["id"])) {
    $id = 302;
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


if ($row === null) {
    // 如果 $row 为空，你可以提供一个备用的值或者显示一个错误消息
    echo "未找到用户";
    exit; // 停止执行后续代码
}

// var_dump($row);
?>


<?php
if (!isset($_GET["id"])) {
    $id = 1;
} else {
    $id = $_GET["id"];
}

$sql = "SELECT * FROM users WHERE id = $id";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

$sql_images = "SELECT * FROM users WHERE id = $id  AND valid = 1";
$result_images = $conn->query($sql_images);
$rows_images = $result_images->fetch_all(MYSQLI_ASSOC);

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
                <div class="container">
                    <div class="py-2">
                        <a href="users.php" class="btn btn-primary"><i class="fa-solid fa-arrow-left"></i>回使用者列表</a>
                        <a href="user.php?id=<?= $row["id"] ?>" class="btn btn-primary"><i class="fa-solid fa-arrow-left"></i>回上一頁</a>
                    </div>
                    <div class="row justify-cont
           ent-center">
            <div class="col-lg-4">
                <?php if ($userExit) : ?>
                    <form action="doUpdateUser.php" method="post">
                        <table class="table table-bordered">
                            <input type="hidden" name="id" value="<?= $row["id"] ?>">
                            <tr>
                                <th>id</th>
                                <td>
                                    <?= $id ?>
                                </td>
                            </tr>
                            <tr>
                                <th>會員姓名</th>
                                <td>
                                    <input type="text" class="form-control" name="name" value="<?= $row["name"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>暱稱</th>
                                <td>
                                    <input type="text" class="form-control" name="nickname" value="<?= $row["nickname"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>帳號</th>
                                <td>
                                    <input type="text" class="form-control" name="account" value="<?= $row["account"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>密碼</th>
                                <td>
                                    <input type="text" class="form-control" name="password_hash" value="<?= $row["password_hash"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>性別</th>
                                <td>
                                    <input type="text" class="form-control" name="gender" value="<?= $row["gender"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>權限</th>
                                <td>
                                <input type="text" class="form-control" name="user_level" value="<?= $row["user_level"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>會員等級</th>
                                <td>
                                    <input type="text" class="form-control" name="valid" value="<?= $row["valid"] ?>">
                                </td>
                            <tr>
                                <th>生日</th>
                                <td>
                                    <input type="text" class="form-control" name="dob" value="<?= $row["dob"] ?>">
                                </td>
                            </tr>
                            </tr>
                            <tr>
                                <th>電話</th>
                                <td>
                                    <input type="text" class="form-control" name="tel" value="<?= $row["tel"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>頭像</th>
                                <td>
                                    <input type="text" class="form-control" name="avatar" value="<?= $row["avatar"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>頭像路徑</th>
                                <td>
                                    <input type="text" class="form-control" name="avatar_file" value="<?= $row["avatar_file"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>郵箱</th>
                                <td>
                                    <input type="email" class="form-control" name="email" value="<?= $row["email"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>地址</th>
                                <td>
                                    <input type="text" class="form-control" name="address" value="<?= $row["address"] ?>">
                                </td>
                            </tr>
                            <tr>
                                <th>說明</th>
                                <td>
                                    <p>
                                        性別: 1 = 男性 、 2 = 女性 <br>
                                        權限:  3 = 版主 、 20 = 管理者<br>
                                        會員等級: 0 = 封禁會員 、 1 = 一般會員
                                    </p>
                                </td>
                            </tr>
                        </table>


                        <button type="submit" class="btn btn-primary">送出</button>
                    </form>
            </div>
        <?php else : ?>
            <h1>使用者不存在</h1>
        <?php endif; ?>
        </div>
    </div>


    </div>
</body>

</html>