<?php
require_once("../db_connect.php");
$conn->set_charset("utf8mb4");

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
        $categoryClause = "AND status = 1 AND start_date <= NOW() AND end_date >= NOW()";
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

// 日期篩選
$start_date = isset($_GET["start_date"]) ? $_GET["start_date"] : "";
$end_date = isset($_GET["end_date"]) ? $_GET["end_date"] : "";

$dateClause = "";
if (!empty($start_date) && !empty($end_date)) {
    $dateClause = "AND (start_date >= '$start_date' AND end_date <= '$end_date')";
} elseif (!empty($start_date)) {
    $dateClause = "AND start_date >= '$start_date'";
} elseif (!empty($end_date)) {
    $dateClause = "AND end_date <= '$end_date'";
}

// 更新 SQL 查詢
if (!empty($search)) {
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id 
    WHERE (coupons.name LIKE '%$search%' OR coupons.code LIKE '%$search%') $categoryClause $dateClause $orderClause LIMIT $firstItem, $perPage";
} else {
    $sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id 
    WHERE 1 $categoryClause $dateClause $orderClause LIMIT $firstItem, $perPage";
}

// 計算資料總筆數
$totalCountSql = "SELECT COUNT(*) AS total FROM coupons 
WHERE (coupons.name LIKE '%$search%' OR coupons.code LIKE '%$search%') $categoryClause $dateClause";
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
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
    <style>

    </style>
</head>

<body>
    <div class="d-flex">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
        <div class="w-100">
            <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
            <div class="db_content">
                <div class="container-fluid ">
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
                                <input type="date" class="form-control" name="start_date" value="<?= $start_date ?>">
                            </div>
                            ~
                            <div class="col-md-2">
                                <input type="date" class="form-control" name="end_date" value="<?= $end_date ?>">
                            </div>
                            <div class="col-md-auto">
                                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <div class="mb-3">
                                <a class="btn btn-warning" href="create-coupon.php"><i class="fa-solid fa-paw"></i> 新增優惠券 <i class="fa-solid fa-paw"></i></a>
                            </div>
                            <!-- 優惠券篩選分類 -->
                            <div class="d-flex justify-content-center my-3">
                                <a class="btn btn-primary mx-1" href="coupons.php?category=all">全部</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=1">商品</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=2">寵物旅館</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=3">線上課程</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=active">進行中</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=expired">已截止</a>
                                <a class="btn btn-primary mx-1" href="coupons.php?category=inactive">已停用</a>
                                <?php if (isset($_GET["search"])) : ?>
                                    <div class="mx-1">
                                        <a class="btn btn-secondary" href="coupons.php"><i class="fa-solid fa-arrow-left"></i></a>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </form>

                    <div class="pb-2">
    <?php
    $searchMessage = "";
    if (isset($_GET["search"]) && !empty($search)) {
        $searchMessage = "您搜尋的是 <strong style=>$search</strong> <br>";
    }
    if (!empty($start_date) && !empty($end_date)) {
        $searchMessage .= "從 <strong style=>$start_date</strong> 到 <strong style=>$end_date</strong><br>";
    } elseif (!empty($start_date)) {
        $searchMessage .= "從 <strong style=>$start_date</strong> 起，";
    } elseif (!empty($end_date)) {
        $searchMessage .= "到 <strong style=>$end_date</strong> 止，";
    }
    if (!empty($searchMessage)) {
        echo $searchMessage . "共 <strong>$couponCount</strong> 筆資料";
    } else {
        echo "共 <strong>$couponCount</strong> 筆資料";
    }
    ?>
</div>


                    <div class="couponList">
                        <?php if ($result->num_rows > 0) : ?>
                            <table class="table table-1row table-hover">
                                <thead>
                                    <tr class="table-warning">
                                        <th><a href="<?= getOrderLink("id", $order_by, $order) ?>">ID <i class="fa-solid fa-sort"></i></a></th>
                                        <th><a href="<?= getOrderLink("name", $order_by, $order) ?>">優惠券名稱 <i class="fa-solid fa-sort"></i></a></th>
                                        <th><a href="<?= getOrderLink("code", $order_by, $order) ?>">代碼 <i class="fa-solid fa-sort"></i></a></th>
                                        <th><a href="<?= getOrderLink("category_name", $order_by, $order) ?>">適用範圍 <i class="fa-solid fa-sort"></i></a></th>
                                        <th><a href="<?= getOrderLink("coupontype", $order_by, $order) ?>">折扣類別 <i class="fa-solid fa-sort"></i></a></th>
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
                                            <!-- 適用範圍 -->
                                            <td><?= isset($coupon["category_name"]) ? $coupon["category_name"] : 'N/A' ?></td>
                                            <!-- 折扣類型 -->
                                            <td>
                                                <?= $coupon["coupontype"] == "%折扣" ? "折數" : "金額" ?>
                                            </td>
                                            <!-- 折扣面額 -->
                                            <td>
                                                <?= $coupon["coupontype"] == "%折扣" ? $coupon["value"] . " %" : $coupon["value"] . " 元" ?>
                                            </td>
                                            <td><?= $coupon["min_limit"] ?> 元</td>
                                            <td><?= $coupon["start_date"] ?></td>
                                            <td><?= $coupon["end_date"] ?></td>
                                            <td><?= $coupon["created_at"] ?></td>
                                            <td>
                                                <?php
                                                $currentDate = date('Y-m-d');
                                                if ($coupon["end_date"] < $currentDate) {
                                                    echo "已截止";
                                                } else {
                                                    echo $coupon["status"] == 1 ? "可使用" : "已停用";
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <a class=" btn1 btn btn-primary btn-sm" href="coupon.php?id=<?= $coupon["id"] ?>">查看詳情 <i class="fa-solid fa-circle-info"></i></a>
                                                <?php if ($coupon["status"] == 1 && $coupon["end_date"] >= $currentDate) : ?>
                                                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal<?= $coupon["id"] ?>">點擊停用 <i class="fa-solid fa-circle-xmark"></i></button>
                                                <?php elseif ($coupon["status"] == 0 || $coupon["end_date"] < $currentDate) : ?>
                                                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#activateModal<?= $coupon["id"] ?>">點擊啟用 <i class="fa-solid fa-circle-check"></i></button>
                                                <?php endif; ?>

                                                <!-- 停用確認模態框 -->
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
                                                                <a class="btn btn-primary" href="doUpdateCoupon.php?id=<?= $coupon["id"] ?>&action=deactivate">確認</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- 啟用確認模態框 -->
                                                <div class="modal fade" id="activateModal<?= $coupon["id"] ?>" tabindex="-1" aria-labelledby="activateModalLabel<?= $coupon["id"] ?>" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5" id="activateModalLabel<?= $coupon["id"] ?>">確認啟用?</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                是否確認啟用: <?= $coupon["name"] ?>?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                                                <a class="btn btn-primary" href="doUpdateCoupon.php?id=<?= $coupon["id"] ?>&action=activate">確認</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                    </div>
                    <!-- 分頁 -->
                    <?php if ($pageCount > 1) : ?>
                        <div class="d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <!-- 最前頁按鈕 -->
                                    <li class="page-item <?php if ($page == 1) echo 'disabled'; ?>">
                                        <a class="page-link" href="?page=1<?php if (isset($_GET["search"])) echo "&search=" . $_GET["search"]; ?><?= isset($_GET['category']) ? "&category=" . $_GET['category'] : '' ?>">最前頁</a>
                                    </li>

                                    <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                        <li class="page-item <?php if ($i == $page) echo "active" ?>">
                                            <a class="page-link" href="?page=<?= $i ?><?php if (isset($_GET["search"])) echo "&search=" . $_GET["search"]; ?><?= isset($_GET['category']) ? "&category=" . $_GET['category'] : '' ?>"><?= $i ?></a>
                                        </li>
                                    <?php endfor; ?>

                                    <!-- 最後一頁按鈕 -->
                                    <li class="page-item <?php if ($page == $pageCount) echo 'disabled'; ?>">
                                        <a class="page-link" href="?page=<?= $pageCount ?><?php if (isset($_GET["search"])) echo "&search=" . $_GET["search"]; ?><?= isset($_GET['category']) ? "&category=" . $_GET['category'] : '' ?>">最後一頁</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    <?php endif ?>
                <?php endif; ?>
                </div>
            </div>
        </div>
    </div>


    <?php include("./js-fundodo.php") ?>

</body>

</html>