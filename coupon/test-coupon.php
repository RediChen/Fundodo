<?php
require_once("./db_fundodo_connect.php");
$conn->set_charset("utf8mb4");

$id = isset($_GET["id"]) ? intval($_GET["id"]) : 0;

if ($id === 0) {
    echo "無效的優惠券 ID";
    exit;
}

$sql = "SELECT * FROM coupons WHERE id = $id";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $coupon = $result->fetch_assoc();
} else {
    echo "未找到優惠券";
    exit;
}
?>
<!doctype html>
<html lang="en">
<head>
    <title>優惠券詳情</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("./css.php") ?>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">優惠券詳情</h2>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <td><?= htmlspecialchars($coupon["id"]) ?></td>
                    </tr>
                    <tr>
                        <th>優惠券名稱</th>
                        <td><?= htmlspecialchars($coupon["name"]) ?></td>
                    </tr>
                    <tr>
                        <th>優惠券代碼</th>
                        <td><?= htmlspecialchars($coupon["code"]) ?></td>
                    </tr>
                    <tr>
                        <th>適用範圍</th>
                        <td><?= htmlspecialchars($coupon["category"]) ?></td>
                    </tr>
                    <tr>
                        <th>折扣方式</th>
                        <td><?= htmlspecialchars($coupon["coupontype"]) ?></td>
                    </tr>
                    <tr>
                        <th>折扣面額</th>
                        <td><?= htmlspecialchars($coupon["value"]) ?></td>
                    </tr>
                    <tr>
                        <th>低消金額</th>
                        <td><?= htmlspecialchars($coupon["min_limit"]) ?></td>
                    </tr>
                    <tr>
                        <th>優惠說明</th>
                        <td><?= htmlspecialchars($coupon["description"]) ?></td>
                    </tr>
                    <tr>
                        <th>開始日期</th>
                        <td><?= htmlspecialchars($coupon["start_date"]) ?></td>
                    </tr>
                    <tr>
                        <th>截止日期</th>
                        <td><?= htmlspecialchars($coupon["end_date"]) ?></td>
                    </tr>
                    <tr>
                        <th>更新時間</th>
                        <td><?= htmlspecialchars($coupon["created_at"]) ?></td>
                    </tr>
                </table>
                <a class="btn btn-primary" href="update-coupon.php?id=<?= $coupon["id"] ?>">編輯</a>
                <a class="btn btn-secondary" href="coupons.php">返回</a>
            </div>
        </div>
    </div>
    <?php include("./js-fundodo.php") ?>
</body>
</html>
