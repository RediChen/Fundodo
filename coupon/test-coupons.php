<?php
require_once("./db_fundodo_connect.php");
$conn->set_charset("utf8mb4");

// 刪除成功跳出Modal
$deleteSuccess = isset($_GET["delete_success"]);

// 預設排序
$order_by = isset($_GET["order_by"]) ? $_GET["order_by"] : "id";
$order = isset($_GET["order"]) ? $_GET["order"] : "DESC";

// 設定排序條件
$orderClause = "";
switch ($order_by) {
    case "id":
        $orderClause = "ORDER BY id " . $order;
        break;
    case "name":
        $orderClause = "ORDER BY name " . $order;
        break;
    case "code":
        $orderClause = "ORDER BY code " . $order;
        break;
    case "category_name":
        $orderClause = "ORDER BY category_name " . $order;
        break;
    case "coupontype":
        $orderClause = "ORDER BY coupontype " . $order;
        break;
    case "value":
        $orderClause = "ORDER BY value " . $order;
        break;
    case "min_limit":
        $orderClause = "ORDER BY min_limit " . $order;
        break;
    case "start_date":
        $orderClause = "ORDER BY start_date " . $order;
        break;
    case "end_date":
        $orderClause = "ORDER BY end_date " . $order;
        break;
    case "created_at":
        $orderClause = "ORDER BY created_at " . $order;
        break;
    default:
        $orderClause = "ORDER BY id DESC";
        break;
}

// 搜尋功能
$perPage = 10;
$search = isset($_GET["search"]) ? $_GET["search"] : "";

// 類別過濾
$category = isset($_GET["category"]) ? $_GET["category"] : "all";
$categoryClause = "";

if ($category != "all") {
    if ($category == "active") {
        $categoryClause = "AND status = 1 ";
    } elseif ($category == "expired") {
        $categoryClause = "AND end_date < NOW() ";
    } elseif ($category == "inactive") {
        $categoryClause = "AND status = 0 ";
    } else {
        $categoryClause = "AND category = " . intval($category) . " ";
    }
}

// 如果沒有指定頁碼，預設為第1頁
$page = isset($_GET["page"]) ? $_GET["page"] : 1;
$firstItem = ($page - 1) * $perPage;

if (!empty($search)) {
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id 
    WHERE (coupons.name LIKE '%$search%' OR coupons.code LIKE '%$search%') $categoryClause $orderClause LIMIT $firstItem, $perPage";
} else {
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id 
    WHERE 1 $categoryClause $orderClause LIMIT $firstItem, $perPage";
}

// 計算資料總筆數
$totalCountSql = "SELECT COUNT(*) AS total FROM coupons 
WHERE (coupons.name LIKE '%$search%' OR coupons.code LIKE '%$search%') $categoryClause";
$totalCountResult = $conn->query($totalCountSql);
$totalCountRow = $totalCountResult->fetch_assoc();
$couponCount = $totalCountRow["total"];

// 計算總頁數
$pageCount = ceil($couponCount / $perPage);

$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);

function getOrderLink($column, $current_order_by, $current_order)
{
    $new_order = $current_order_by == $column && $current_order == 'ASC' ? 'DESC' : 'ASC';
    return "?order_by=$column&order=$new_order";
}
?>

<!doctype html>
<html lang="en">

<head>
    <title>Coupons</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="./tools/style.css">
    <?php include("./css.php") ?>
</head>

<body>
    <div class="container-fluid px-5 my-4">
        <h2 class="text-start">優惠券列表</h2>
        <form action="">
            <div class="row my-3 justify-content-end">
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="請輸入優惠券名稱或代碼" name="search" value="<?= $search ?>">
                        <button class="btn btn-primary btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </div>
            </div>
            <!-- 日期篩選 -->
            <div class="row justify-content-end">
                <div class="col-md-2">
                    <input type="date" class="form-control" name="start_date">
                </div>
                ~
                <div class="col-md-2">
                    <input type="date" class="form-control" name="end_date">
                </div>
                <div class="col-md-auto">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>

            <div class="d-flex justify-content-between">
                <div class="mb-3">
                    <a class="btn btn-warning" href="create-coupon.php">新增優惠券 <i class="fa-solid fa-plus"></i></a>
                </div>
                <!-- 優惠券篩選分類 -->
                <div class="d-flex justify-content-center my-3">
                    <a class="btn btn-success mx-1" href="coupons.php?category=all">全部</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=1">商品</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=2">寵物旅館</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=3">線上課程</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=active">進行中</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=expired">已截止</a>
                    <a class="btn btn-success mx-1" href="coupons.php?category=inactive">已停用</a>
                    <?php if (isset($_GET["search"])) : ?>
                        <div class="mx-1">
                            <a class="btn btn-secondary" href="coupons.php"><i class="fa-solid fa-arrow-left"></i></a>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </form>

        <div class="pb-2">
            <?php if (isset($_GET["search"])) : ?>您搜尋的是"<?= $search ?>"，<?php endif; ?>共 <?= $couponCount ?> 筆資料
        </div>
        <?php if ($result->num_rows > 0) : ?>
            <table class="table table-bordered table-danger table-hover">
                <thead>
                    <tr class="table-warning">
                        <th><a href="<?= getOrderLink("id", $order_by, $order) ?>">ID <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("name", $order_by, $order) ?>">優惠券名稱 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("code", $order_by, $order) ?>">代碼 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("category_name", $order_by, $order) ?>">適用範圍 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("coupontype", $order_by, $order) ?>">折扣單位 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("value", $order_by, $order) ?>">折扣面額 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("min_limit", $order_by, $order) ?>">低消金額 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("start_date", $order_by, $order) ?>">開始日期 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("end_date", $order_by, $order) ?>">截止日期 <i class="fa-solid fa-sort"></i></a></th>
                        <th><a href="<?= getOrderLink("created_at", $order_by, $order) ?>">更新時間 <i class="fa-solid fa-sort"></i></a></th>
                        <th class="text-center text-primary">優惠券狀態</th>
                        <th class="text-center text-primary">操作</th>
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
                            <td><?= $coupon["start_date"] ?></td>
                            <td><?= $coupon["end_date"] ?></td>
                            <td><?= $coupon["created_at"] ?></td>
                            <td><?= $coupon["status"] == 1 ? "可使用" : "已停用" ?></td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="coupon.php?id=<?= $coupon["id"] ?>">查看</a>
                                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal<?= $coupon["id"] ?>">停用</button>

                                <div class="modal fade" id="deleteModal<?= $coupon["id"] ?>" tabindex="-1" aria-labelledby="deleteModalLabel<?= $coupon["id"] ?>" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="deleteModalLabel<?= $coupon["id"] ?>">確認停用?</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                是否確認停用: <?= $coupon["name"] ?>?
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
                                    <a class="page-link" href="?page=<?= $i ?><?php if (isset($_GET["search"])) echo "&search=" . $_GET["search"]; ?><?= isset($_GET['category']) ? "&category=" . $_GET['category'] : '' ?>"><?= $i ?></a>
                                </li>
                            <?php endfor; ?>
                        </ul>
                    </nav>
                </div>
            <?php endif ?>
        <?php endif; ?>

       
    </div>

    <?php include("./js-fundodo.php") ?>

</body>

</html>
