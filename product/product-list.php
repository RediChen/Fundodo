<?php
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");

include "/xampp/htdocs/Fundodo/tools/tool-lib.php";
session_start();

$fundodo = "localhost/fundodo/";
if (!isset($_SESSION["user"]) || ($_SESSION["user"]["user_level"] != 20)) :
  leadTo('/Fundodo/member/login.php');
endif;


require_once("db_connect.php");

if (!isset($_GET["category"]) && !isset($_GET["search"]) && !isset($_GET["max"]) && !isset($_GET["min"])) {
    header("location:product-list.php?category=1&&page=1&&order=1");
    exit;
}
$sqlAll = "SELECT * FROM products WHERE valid=0";
$resultAll = $conn->query($sqlAll);
$allProductCount = $resultAll->num_rows; // 總共有多少列商品

$sqlCategory = "SELECT * FROM category ORDER BY id ASC"; // 處理每個nav tab
$resultCate = $conn->query($sqlCategory);
$cateRows = $resultCate->fetch_all(MYSQLI_ASSOC);
$sqlOrder = "ORDER BY products.ProductID ASC";

$categoryArr = [];
foreach ($cateRows as $cate) {
    $categoryArr[$cate["id"]] = $cate["name"]; // 重新整理新陣列
}

if (isset($_GET["category"]) && isset($_GET["page"]) && isset($_GET["order"])) {
    $cate_id = $_GET["category"];
    $page = $_GET["page"];
    $order = $_GET["order"];
    $sqlcate = "SELECT * FROM products WHERE category_id=$cate_id AND valid=0";
    $resultcate = $conn->query($sqlcate);
    $allProductCount = $resultcate->num_rows;
    $perPage = 15;
    $firstItem = ($page - 1) * $perPage;
    $pageCount = ceil($allProductCount / $perPage);

    switch ($order) {
        case 1:
            $orderClause = "ORDER BY ProductID ASC";
            break;
        case 2:
            $orderClause = "ORDER BY ProductID DESC";
            break;
        case 3:
            $orderClause = "ORDER BY price ASC";
            break;
        case 4:
            $orderClause = "ORDER BY price DESC";
            break;
        case 5:
            $orderClause = "ORDER BY on_shelves_time ASC";
            break;
        case 6:
            $orderClause = "ORDER BY on_shelves_time DESC";
            break;
        case 7:
            $orderClause = "ORDER BY stock ASC";
            break;
        case 8:
            $orderClause = "ORDER BY stock DESC";
            break;
    }

    $sql = "SELECT products.*, category.name AS category_name, MIN(productimages.ImageName) AS ImageName
    FROM products
    JOIN category ON products.category_id = category.id
    JOIN productimages ON products.ProductID=productimages.ProductID
    WHERE products.category_id=$cate_id 
    AND valid=0
    GROUP BY products.ProductID, category.name
    $orderClause
    LIMIT $firstItem, $perPage";
    $pageTitle = "商品列表";
} elseif (isset($_GET["search"]) && isset($_GET["order"]) && isset($_GET["page"])) {
    $search = $_GET["search"];
    $order = $_GET["order"];
    $page = isset($_GET["page"]) ? $_GET["page"] : 1;
    $sqlSearchCount = "SELECT * FROM products WHERE ProductName LIKE '%$search%' AND valid=0";
    $resultSearch = $conn->query($sqlSearchCount);
    $allProductCount = $resultSearch->num_rows;
    $perPage = 15;
    $firstItem = ($page - 1) * $perPage;
    $pageCount = ceil($allProductCount / $perPage);

    switch ($order) {
        case 1:
            $orderClause = "ORDER BY ProductID ASC";
            break;
        case 2:
            $orderClause = "ORDER BY ProductID DESC";
            break;
        case 3:
            $orderClause = "ORDER BY price ASC";
            break;
        case 4:
            $orderClause = "ORDER BY price DESC";
            break;
        case 5:
            $orderClause = "ORDER BY on_shelves_time ASC";
            break;
        case 6:
            $orderClause = "ORDER BY on_shelves_time DESC";
            break;
        case 7:
            $orderClause = "ORDER BY stock ASC";
            break;
        case 8:
            $orderClause = "ORDER BY stock DESC";
            break;
    }

    $sql = "SELECT products.*, category.name AS category_name, MIN(productimages.ImageName) AS ImageName
    FROM products
    JOIN category ON products.category_id = category.id
    JOIN productimages ON products.ProductID = productimages.ProductID
    WHERE ProductName
    LIKE '%$search%'
    AND valid=0
    GROUP BY products.ProductID, category.name
    $orderClause
    LIMIT $firstItem, $perPage";

    $pageTitle = "$search 的搜尋結果";
} elseif (isset($_GET["max"]) && isset($_GET["min"]) && isset($_GET["page"]) && isset($_GET["order"])) {
    $min = $_GET["min"];
    $max = $_GET["max"];
    $order = $_GET["order"];
    $page = isset($_GET["page"]) ? $_GET["page"] : 1;

    $sqlcount = "SELECT * FROM products WHERE price >= $min AND price <= $max AND valid=0";
    $resultcount = $conn->query($sqlcount);
    $allProductCount = $resultcount->num_rows;
    $perPage = 15;
    $pageCount = ceil($allProductCount / $perPage);
    $firstItem = ($page - 1) * $perPage;

    switch ($order) {
        case 1:
            $orderClause = "ORDER BY ProductID ASC";
            break;
        case 2:
            $orderClause = "ORDER BY ProductID DESC";
            break;
        case 3:
            $orderClause = "ORDER BY price ASC";
            break;
        case 4:
            $orderClause = "ORDER BY price DESC";
            break;
        case 5:
            $orderClause = "ORDER BY on_shelves_time ASC";
            break;
        case 6:
            $orderClause = "ORDER BY on_shelves_time DESC";
            break;
        case 7:
            $orderClause = "ORDER BY stock ASC";
            break;
        case 8:
            $orderClause = "ORDER BY stock DESC";
            break;
    }

    $sql = "SELECT products.*, category.name AS category_name, MIN(productimages.ImageName) AS ImageName
    FROM products
    JOIN category ON products.category_id = category.id
    JOIN productimages ON products.ProductID = productimages.ProductID
    WHERE price >= $min AND price <= $max
    AND valid=0
    GROUP BY products.ProductID, category.name
    $orderClause
    LIMIT $firstItem, $perPage";
    $pageTitle = "商品列表";
}
$result = $conn->query($sql);
$productCount = $result->num_rows;
$rows = $result->fetch_all(MYSQLI_ASSOC);

if (isset($_GET["page"])) {
    $productCount = $allProductCount;
}

?>
<!doctype html>
<html lang="en">

<head>
    <title>商品列表</title>
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
    <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="deleteModalLabel">確認刪除</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    確認刪除商品?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <a class="btn btn-danger" href="deleteProduct?id=<?= $row["ProductID"] ?>">確認</a>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
        <div class="w-100">
            <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
            <div class="db_content">
                <div class="container">
                    <div class="d-flex g-3">
                        <h1 class="mt-3 flex-fill"> <?= $pageTitle ?></h1>
                        <form class="align-self-center" action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="請搜尋商品名稱" name="search">
                                <input type="hidden" value="1" name="order">
                                <input type="hidden" value="1" name="page">
                                <button class="btn btn-primary" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                        <a class="btn btn-primary ms-3 align-self-center" href="createProduct.php">新增商品<i class="fa-solid fa-plus"></i></a>
                    </div>
                    <?php if (isset($_GET["search"])) : ?>
                        <div class="align-self-center">
                            <a href="product-list.php" class="btn btn-primary"><i class="fa-solid fa-arrow-left"></i> 回商品列表</a>
                        </div>
                    <?php endif ?>
                    <div class="py-2">
                        <form action="">
                            <div class="row g-3 align-items-center">
                                <?php if (isset($_GET["min"])) : ?>
                                    <div class="col-auto">
                                        <a class="btn btn-primary" href="product-list.php"><i class="fa-solid fa-arrow-left-long"></i></a>
                                    </div>
                                <?php endif ?>
                                <?php
                                $minValue = 0;
                                $maxValue = 0;
                                if (isset($_GET["min"])) $minValue = $_GET["min"];
                                if (isset($_GET["max"])) $maxValue = $_GET["max"];
                                ?>
                                <div class="col-auto">
                                    價格篩選
                                </div>
                                <div class="col-auto">
                                    <input type="tel" class="form-control text-end" value=<?= $minValue ?> name="min" min="0">
                                </div>
                                <div class="col-auto">
                                    ～
                                </div>
                                <div class="col-auto">
                                    <input type="tel" class="form-control text-end" value=<?= $maxValue ?> name="max" min="0">
                                </div>
                                <div class="col-auto mb-2">
                                    <input type="hidden" name="page" value="1">
                                </div>
                                <div class="col-auto mb-2">
                                    <input type="hidden" name="order" value="1">
                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary">篩選</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="py-2">
                        <div class="my-3 d-flex">
                            <ul class="nav nav-tabs flex-fill">
                                <?php foreach ($cateRows as $category) : ?>
                                    <li class="nav-item">
                                        <a class="nav-link <?php if (isset($_GET["category"]) && $_GET["category"] == $category["id"]) echo "active"; ?>" href="?category=<?= $category["id"] ?>&page=1&order=1"><?= $category["name"] ?></a>
                                    </li>
                                <?php endforeach ?>
                            </ul>
                            <div>共 <?= $productCount ?> 樣商品</div>
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr class="text-nowrap text-center">
                                    <th>編號
                                        <?php if (($order != 2) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=2"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 1) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=1"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 1) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=1"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 2) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=2"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 2) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=2"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 1) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=1"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php endif ?>
                                    </th>
                                    <th>商品名稱</th>
                                    <th>商品圖片</th>
                                    <th>商品描述</th>
                                    <th>分類</th>
                                    <th>價格
                                        <?php if (($order != 4) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=4"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 3) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=3"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 3) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=3"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 4) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=4"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 3) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=3"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 4) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=4"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php endif ?>
                                    </th>
                                    <th>上架時間
                                        <?php if (($order != 5) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=5"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 6) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=6"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 5) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=5"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 6) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=6"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 5) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=5"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 6) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=6"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php endif ?>
                                    </th>
                                    <th>庫存量
                                        <?php if (($order != 7) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=7"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 8) && isset($_GET["category"])) : ?>
                                            <a href="?category=<?= $cate_id ?>&page=<?= $page ?>&order=8"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 7) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=7"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 8) && isset($_GET["search"])) : ?>
                                            <a href="?search=<?= $search ?>&page=<?= $page ?>&order=8"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php elseif (($order != 7) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=7"><i class="fa-solid fa-sort-up"></i></a>
                                        <?php elseif (($order != 8) && isset($_GET["min"])) : ?>
                                            <a href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $page ?>&order=8"><i class="fa-solid fa-sort-down"></i></a>
                                        <?php endif ?>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rows as $prod) : ?>
                                    <tr>
                                        <td class="align-middle text-center"><?= $prod["ProductID"] ?></td>
                                        <td class="align-middle"><?= $prod["ProductName"] ?></td>
                                        <td class="align-middle">
                                            <div class="product_box">
                                                <img class="object-fit-cover img-fluid" src="./product_images/<?= $prod["ImageName"] ?>" alt="">
                                            </div>
                                        </td>
                                        <td class="fixed-width align-middle">
                                            <p><?= $prod["description"] ?></p>
                                        </td>
                                        <td class="align-middle text-center"><?= $prod["category_name"] ?></td>
                                        <td class="align-middle text-center">NT$<?= $prod["price"] ?></td>
                                        <td class="align-middle text-center"><?= $prod["on_shelves_time"] ?></td>
                                        <td class="align-middle text-center"><?= $prod["stock"] ?></td>
                                        <td class="align-middle text-center"><a class="btn btn-primary" href="product-edit.php?id=<?= $prod["ProductID"] ?>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                        <?php if (isset($_GET["page"])) : ?>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <?php if (isset($_GET["category"]) && isset($_GET["page"])) : ?>
                                        <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                            <li class="page-item <?php if ($i == $page) echo "active"; ?>">
                                                <a class="page-link" href="?category=<?= $cate_id ?>&page=<?= $i ?>&order=<?= $order ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor ?>
                                    <?php elseif (isset($_GET["min"]) && isset($_GET["max"]) && isset($_GET["page"]) && isset($_GET["order"])) : ?>
                                        <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                            <li class="page-item <?php if ($i == $page) echo "active"; ?>">
                                                <a class="page-link" href="?min=<?= $min ?>&max=<?= $max ?>&page=<?= $i ?>&order=<?= $order ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor ?>
                                    <?php elseif (isset($_GET["search"]) && isset($_GET["page"]) && isset($_GET["order"])) : ?>
                                        <?php for ($i = 1; $i <= $pageCount; $i++) : ?>
                                            <li class="page-item <?php if ($i == $page) echo "active"; ?>">
                                                <a class="page-link" href="?search=<?= $search ?>&page=<?= $i ?>&order=<?= $order ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor ?>
                                    <?php endif ?>
                                </ul>
                            </nav>
                        <?php endif ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>