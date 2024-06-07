<?php
require_once("../db_connect.php");
$conn->set_charset("utf8mb4");

if (!isset($_GET["id"])) {
    die("優惠券 ID 缺失");
}

$id = intval($_GET["id"]);

$sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id WHERE coupons.id = $id";
$result = $conn->query($sql);

// 檢查查詢結果是否為空
if ($result->num_rows == 0) {
    echo "優惠券不存在或已被刪除";
    exit;
}

$row = $result->fetch_assoc();
?>

<!doctype html>
<html lang="en">

<head>
    <title>Coupon</title>
    <!-- Required meta tags -->
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>

</head>


<body>

<div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="db_content">
        <div class="container px-5 my-4">
        <h2 class="text-center">優惠券詳情</h2>
        <div class="my-3">
            <a class="btn btn-primary " href="coupons.php"> <i class="fa-regular fa-circle-left"></i> 回優惠券列表</a>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6 row">
                <table class="table-1d col-md-12">
                        <tr>
                            <th class=" table-danger">優惠券編號</th>
                            <td><?= $row["id"] ?></td>
                        </tr>
                        <tr>
                            <th th class=" table-danger">優惠券名稱</th>
                            <td><?= $row["name"] ?></td>
                        </tr>
                        <tr>
                            <th class=" table-danger">優惠券代碼</th>
                            <td><?= $row["code"] ?></td>
                        </tr>
                        <tr>
                            <th class=" table-danger">適用範圍</th>
                            <td><?= $row["category_name"] ?></td>
                        </tr>

                        <tr>
                            <th class=" table-danger">折扣單位</th>
                            <td><?= $row["coupontype"] == "%折扣" ? "%數折扣" : "金額折扣" ?></td>
                        </tr>
                        <tr>
                            <th class=" table-danger">折扣面額</th>
                            <td><?= $row["value"] . ($row["coupontype"] == "%折扣" ? " %" : " 元") ?></td>
                        </tr>

                        <tr>
                            <th class=" table-danger">低消金額</th>
                            <td><?= $row["min_limit"] ?> 元</td>
                        </tr>
                        <tr>
                            <th class=" table-danger">優惠說明</th>
                            <td><?= $row["description"] ?></td>
                        </tr>
                        <tr>
                            <th class=" table-danger">優惠券使用期限</th>
                            <td><?= $row["start_date"] ?> ~ <?= $row["end_date"] ?></td>
                        </tr>
                        <tr>
                            <th class=" table-danger">優惠券狀態</th>
                            <td><?= $row["status"] == 1 ? "可使用" : "已停用" ?> </td>
                        </tr>
                        <tr>
                            <th class=" table-danger">更新時間</th>
                            <td><?= $row["created_at"] ?></td>
                        </tr>
                    </tbody>


                </table>
                <div class="d-flex justify-content-center my-3">
                    <div class="py-2 d-flex mx-2">
                        <a class="btn btn-warning btn-sm" href="update-coupon.php?id=<?= $row["id"] ?>"><i class="fa-solid fa-pen-to-square"></i> 編輯優惠券</a>
                    </div>

                    <div class="py-2 d-flex mx-2">
                        <?php if ($row["status"] == 1) : ?>
                            <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#statusModal<?= $row["id"] ?>"><i class="fa-solid fa-ban"></i> 停用優惠券</a>
                        <?php else : ?>
                            <a class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#statusModal<?= $row["id"] ?>"><i class="fa-solid fa-check"></i> 啟用優惠券</a>
                        <?php endif; ?>

                        <div class="modal fade" id="statusModal<?= $row["id"] ?>" tabindex="-1" aria-labelledby="statusModalLabel<?= $row["id"] ?>" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="statusModalLabel<?= $row["id"] ?>"></h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        是否確認<?= $row["status"] == 1 ? "停用" : "啟用" ?>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                        <a class="btn btn-primary" href="doDeleteCoupon.php?id=<?= $row["id"] ?>&status=<?= $row["status"] == 1 ? 0 : 1 ?>"><?= $row["status"] == 1 ? "確認停用" : "確認啟用" ?></a>
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
      </div>
    </div>
   
    </div>


    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
    <?php include("./js-fundodo.php") ?>
    </body>

</html>