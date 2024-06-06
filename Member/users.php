<?php
session_start();

// 检查是否已设置 $_SESSION["user"]
if (isset($_SESSION["user"]) && ($_SESSION["user"]["user_level"] == 20)) {
    //echo "歡迎登入";
    //print_r($_SESSION);
} else {
    echo "不符合資格";
    header("Location: login.php");
    //print_r($_SESSION);
    exit();
}

require_once("/xampp/htdocs/Fundodo/db_connect.php");

$sqlALL = "SELECT * FROM users WHERE valid = 1";
$resultAll = $conn->query($sqlALL);
$allUserCount = $resultAll->num_rows;




if (isset($_GET["search"])) {
    $search = $_GET["search"];
    $sql = "SELECT id, name, nickname, account, password_hash, email, gender, user_level, valid, 	dob, tel, email , created_at, deleted_at FROM users WHERE (id LIKE '%$search%' OR account LIKE '%$search%' OR nickname LIKE '%$search%'OR name LIKE '%$search%'OR tel LIKE '%$search%') AND valid = 1";
    $pageTitle = "$search 的搜尋結果";
} else if (isset($_GET["page"]) && isset($_GET["order"])) {
    $page = $_GET["page"];
    $perPage = 30;
    $firstItem = ($page - 1) * $perPage;
    $pageCount = ceil($allUserCount / $perPage);

    $order = $_GET["order"];
    // if($order==1){
    //     $sql= "SELECT * FROM users WHERE valid=1 ORDER BY id ASC LIMIT $firstItem, $perPage";
    // }
    switch ($order) {
        case 1: // id ASC
            // $sql = "SELECT * FROM users WHERE valid=1 ORDER BY id ASC LIMIT $firstItem, $perPage";
            $orderClause = "ORDER BY id ASC";
            break;
        case 2: // id DESC
            // $sql = "SELECT * FROM users WHERE valid=1 ORDER BY id DESC LIMIT $firstItem, $perPage";
            $orderClause = "ORDER BY id DESC";
            break;
        case 3: // name ASC
            //  $sql = "SELECT * FROM users WHERE valid=1 ORDER BY name ASC LIMIT $firstItem, $perPage";
            $orderClause = "ORDER BY nickname ASC";
            break;
        case 4: // name DESC
            //  $sql = "SELECT * FROM users WHERE valid=1 ORDER BY name ASC LIMIT $firstItem, $perPage";
            $orderClause = "ORDER BY nickname DESC";
            break;
    }

    $sql = $sql = "SELECT * FROM users WHERE valid=1 $orderClause LIMIT $firstItem, $perPage";
    // $sql="SELECT * FROM users WHERE valid=1 LIMIT $firstItem, $perPage";
    $pageTitle = "會員清單, 頁 $page";
} else {
    $sql = "SELECT id, name, email, tel FROM users WHERE valid = 1";
    $pageTitle = "會員清單";
    header("location: users.php?page=1&order=1");
}


$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);
$userCount = $result->num_rows;
if (isset($_GET["page"])) {
    $userCount = $allUserCount;
}


?>

<!doctype html>
<html lang="en">

<head>
    <title>會員管理後台</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
 <a href="../dashboard/dashboard.html" class="btn btn-primary">首頁</a>
    <div class="container">
        <h1><?= $pageTitle ?></h1>
        <div class="py-2">
            <div class="d-flex justify-content-start gap-3">
                <div>
                    <?php if (isset($_GET["search"])) : ?>
                        <a class="btn btn-primary" href="users.php"><i class="fa-solid fa-arrow-left"></i></a>
                    <?php endif; ?>
                </div>
                <div class="d-flex gap-3">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="搜尋相關會員" name="search">
                            <button class="btn btn-primary" type="submit"><i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                            <a href="create-user.php" class="btn btn-primary">
                                <i class="fa-solid fa-plus"></i>
                            </a>
                        </div>
                    </form>
                </div>

                        </div>

                    </div>
                    <div class="pb-2 d-flex justify-content-end">
                        <?php if (isset($_GET["page"])) : ?>
                            <div>
                                排序: <div class="btn-group">
                                    <a href="?page=<?= $page ?>&order=1" class="btn btn-primary
                    <?php
                            if ($order == 1) echo "active";
                    ?>
                    ">id <i class="fa-solid fa-arrow-down-short-wide"></i></a>
                                    <a href="?page=<?= $page ?>&order=2" class="btn btn-primary   <?php
                                                                                                    if ($order == 2) echo "active";
                                                                                                    ?>">id <i class="fa-solid fa-arrow-down-wide-short"></i></a>
                                    <a href="?page=<?= $page ?>&order=3" class="btn btn-primary <?php
                                                                                                if ($order == 3) echo "active"; ?>">暱稱<i class="fa-solid fa-arrow-down-wide-short"></i></a>
                                    <a href="?page=<?= $page ?>&order=4" class="btn btn-primary <?php
                                                                                                if ($order == 4) echo "active"; ?>">暱稱<i class="fa-solid fa-arrow-down-wide-short"></i></a>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>
                    <?php if (isset($_GET["page"])) : ?>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                    <li class="page-item <?php if ($i == $page) echo "active" ?>">

                            <a class="page-link" href="?page=<?= $i ?>&order=<?= $order ?>"><?= $i ?></a>
                        </li>
                    <?php endfor; ?>
                </ul>
            </nav>
        <?php endif; ?>
        <?php if ($result->num_rows > 0) : ?>
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="text-center table-danger">id</th>
                        <th class="text-center table-danger">會員姓名</th>
                        <th class="text-center table-danger">暱稱</th>
                        <th class="text-center table-danger">帳號</th>
                        <!-- <th class="text-center table-danger">密碼</th> -->
                        <!-- <th class="text-center table-danger">性別</th> -->
                        <!-- <th class="text-center table-danger">權限</th> -->
                        <th class="text-center table-danger">會員等級</th>
                        <th class="text-center table-danger">生日</th>
                        <th class="text-center table-danger">電話</th>
                        <!-- <th class="text-center table-danger">頭像</th>
                        <th class="text-center table-danger">頭像路徑</th> -->
                        <!-- <th class="text-center table-danger">郵箱</th> -->
                        <!-- <th class="text-center table-danger">創建時間</th> -->
                        <th class="text-center table-danger" colspan="3">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($rows as $user) : ?>
                        <tr>
                            <td><?= $user["id"] ?></td>
                            <td><?= $user["name"] ?></td>
                            <td><?= $user["nickname"] ?></td>
                            <td><?= $user["account"] ?></td>
                            <!-- <td><?= $user["password_hash"] ?></td> -->
                            <!-- <td><?= ($user["gender"] == 1) ? "男" : (($user["gender"] == 2) ? "女" : "未知") ?></td> -->
                            <td><?= ($user["user_level"] == 20) ? "管理者" : (($user["user_level"] == 3) ? "版主" : "會員") ?></td>
                            <!-- <td><?= ($user["valid"] == 3) ? "高級會員" : (($user["valid"] == 0) ? "封禁帳號" : "會員") ?></td> -->
                            <td><?= $user["dob"] ?></td>
                            <td><?= $user["tel"] ?></td>
                            <!-- <td><?= $user["avatar"] ?></td> -->
                            <!-- <td><?= $user["avatar_file"] ?></td> -->
                            <!-- <td><?= $user["email"] ?></td> -->
                            <!-- <td><?= $user["created_at"] ?></td> -->
                            <td><a class="btn btn-primary" href="user.php?id=<?= $user["id"] ?>">詳細資料</a></td>
                            <td><a class="btn btn-success" href="user-edit.php?id=<?= $user["id"] ?>" title="編輯使用者"><i class="fa-solid fa-pen-to-square"></i></a></td>
                            <td><a href="user-delete.php?id=<?= $user["id"] ?>"><button class="btn btn-danger" title="刪除使用者" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa-solid fa-trash"></i></button></a></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <div class="text-center">
                <?php if (!isset($_GET["search"])) : ?>
                    第 <?= $page ?> 頁 ,共 <?= $pageCount ?> 頁 , 共 <?= $userCount ?> 筆
                <?php endif; ?>
                <?php if (isset($_GET["search"])) : ?>
                    共 <?= $userCount ?> 筆
                <?php endif; ?>
            </div>
            <?php if (isset($_GET["page"])) : ?>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                            <li class="page-item <?php if ($i == $page) echo "active" ?>">

                                <a class="page-link" href="?page=<?= $i ?>&order=<?= $order ?>"><?= $i ?></a>
                            </li>
                        <?php endfor; ?>
                    </ul>
                </nav>
            <?php endif; ?>
        <?php else : ?>
            沒有使用者
        <?php endif; ?>
    </div>
        </div>
      </div>
    </div>
</body>

</html>