<?php
require_once("./db_fundodo_connect.php");
$conn->set_charset("utf8mb4");

// 刪除成功跳出Modal
$deleteSuccess = isset($_GET["delete_success"]);

// 搜尋功能
if (isset($_GET["search"])) {
    $search = $_GET["search"];
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    LEFT JOIN coupons_category ON coupons.category = coupons_category.id WHERE coupons.name LIKE '%$search%' OR coupons.code LIKE '%$search%' ";
} else {
    // 如果沒有指定頁碼，預設為第1頁
    $page = isset($_GET["page"]) ? $_GET["page"] : 1;
    $perPage = 10;
    $firstItem = ($page - 1) * $perPage;

    // 計算資料總筆數
    $totalCount = "SELECT COUNT(*) AS total FROM coupons WHERE status = 1";
    $totalCountResult = $conn->query($totalCount);
    $totalCountRow = $totalCountResult->fetch_assoc();
    $userCount = $totalCountRow["total"];

    // 計算總頁數
    $pageCount = ceil($userCount / $perPage);

    // 處理 SQL 查詢
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id WHERE status = 1 LIMIT $firstItem, $perPage";
}

$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);
?>

<!doctype html>
<html lang="en">

<head>
    <title>Coupons</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("./css.php") ?>
</head>

<body>
    <div class="container mt-4">
        <h2 class="text-center">優惠券清單</h2>
        <form action="">
            <div class="row my-3 justify-content-end">
                <div class="col-md-4 d-flex justify-content-end">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="請輸入優惠券名稱或代碼" name="search">
                        <button class="btn btn-primary btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </div>
            </div>
        </form>
        <div class="d-flex justify-content-between">
            <div class="mb-3">
                <a class="btn btn-success" href="create-coupon.php">新增優惠券+</a>
            </div>
            <div class="mb-3 d-flex justify-content-center">
                <a class="btn btn-secondary " href="coupons.php"><i class="fa-solid fa-arrow-left"></i></a>
            </div>
        </div>

        <div class="pb-2">
            共<?= $userCount ?> 筆資料
        </div>
        <?php if ($result->num_rows > 0) : ?>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>優惠券名稱</th>
                        <th>代碼</th>
                        <th>適用範圍</th>
                        <th>折扣方式</th>
                        <th>折扣面額</th>
                        <th>低消金額</th>
                        <th>優惠說明</th>
                        <th>開始日期</th>
                        <th>截止日期</th>
                        <th>更新時間</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($rows as $coupon) : ?>
                        <tr>
                            <td><?= $coupon["id"] ?></td>
                            <td><?= $coupon["name"] ?></td>
                            <td><?= $coupon["code"] ?></td>
                            <td><?= isset($coupon["category_name"]) ? $coupon["category_name"] : 'N/A' ?></td>
                            <td><?= $coupon["coupontype"] ?></td>
                            <td><?= $coupon["value"] ?></td>
                            <td><?= $coupon["min_limit"] ?></td>
                            <td><?= $coupon["description"] ?></td>
                            <td><?= $coupon["start_date"] ?></td>
                            <td><?= $coupon["end_date"] ?></td>
                            <td><?= $coupon["created_at"] ?></td>
                            <td>
                                <a class="btn btn-primary" href="coupon.php?id=<?= $coupon["id"] ?>">查看</a>
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<?= $coupon['id'] ?>">刪除</button>

                                <div class="modal fade" id="deleteModal<?= $coupon['id'] ?>" tabindex="-1" aria-labelledby="deleteModalLabel<?= $coupon['id'] ?>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="deleteModalLabel<?= $coupon['id'] ?>">確認刪除?</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                是否確認刪除: <?= $coupon['name'] ?>?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                <a class="btn btn-primary" href="doDeleteCoupon.php?id=<?= $coupon["id"] ?>">確認</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <!-- 分頁 -->
            <?php if ($pageCount > 1) : ?>
                <div class="d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                <li class="page-item <?php if ($i == $page) echo "active" ?>">
                                    <a class="page-link" href="?page=<?= $i ?><?php if (isset($_GET['search'])) echo "&search=" . $_GET['search']; ?>"><?= $i ?></a>
                                </li>
                            <?php endfor; ?>
                        </ul>
                    </nav>
                </div>
            <?php endif ?>
        <?php endif; ?>
        <!-- 刪除成功Modal -->
        <?php if ($deleteSuccess) : ?>
            <div class="modal fade show" id="deleteSuccessModal" tabindex="-1" role="dialog" aria-labelledby="deleteSuccessModalLabel" aria-hidden="true" style="display: block;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteSuccessModalLabel">刪除成功</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            優惠券刪除成功！
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <?php include("./js-fundodo.php") ?>

</body>

</html>
