<?php
session_start();
require_once("./db_connect.php");
$conn->set_charset("utf8mb4");

if (!isset($_GET["id"])) {
    echo "無效的優惠券ID";
    exit;
}

$id = intval($_GET["id"]);

$sql = "SELECT coupons.*, coupons_category.name AS category_name FROM coupons 
    JOIN coupons_category ON coupons.category = coupons_category.id WHERE coupons.id = $id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    echo "未找到相關優惠券";
    exit;
}

// 預設顯示可使用狀態
if ($row["status"] == 0) {
    $_SESSION['formData']['status'] = 1;
}

?>

<!doctype html>
<html lang="en">

<head>
    <title>Update Coupon</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
    <div class="container">
        <h1 class="h3 text-center my-3">編輯優惠券</h1>
        <?php if (isset($_SESSION["errors"])) : ?>
            <div class="alert alert-danger">
                <?php foreach ($_SESSION["errors"] as $error) : ?>
                    <p><?= $error ?></p>
                <?php endforeach; ?>
                <?php unset($_SESSION["errors"]); ?>
            </div>
        <?php endif; ?>
        <form id="couponForm" action="doUpdateCoupon.php" method="post">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="my-3">
                        <a class="btn btn-primary btn-sm" href="coupon.php?id=<?= $row["id"] ?>"> <i class="fa-regular fa-circle-left"></i> 返回詳情</a>
                    </div>
                    <table class="table table-bordered">
                        <input type="hidden" name="id" value="<?= $row["id"] ?>">
                        <tbody>
                            <tr>
                                <th class=" table-danger">優惠券編號 </th>
                                <td>
                                    <?= $row["id"] ?>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">優惠券名稱</th>
                                <td>
                                    <input type="text" class="form-control" name="name" value="<?= isset($_SESSION['formData']['name']) ? $_SESSION['formData']['name'] : $row["name"] ?>">
                                    <div class="invalid-feedback">請輸入優惠券名稱</div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">優惠券代碼</th>
                                <td>
                                    <div class="input-group">
                                        <input type="text" id="code" class="form-control" name="code" value="<?= isset($_SESSION['formData']['code']) ? $_SESSION['formData']['code'] : $row["code"] ?>">
                                        <button type="button" class="btn btn-success" onclick="generateCode()">自動生成代碼</button>
                                        <div class="invalid-feedback">請輸入優惠券代碼</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">適用範圍</th>
                                <td>
                                    <select class="form-select" name="category">
                                        <option value="" disabled>選擇適用範圍</option>
                                        <option value="1" <?= (isset($_SESSION['formData']['category']) ? $_SESSION['formData']['category'] : $row["category"]) == 1 ? "selected" : "" ?>>商品</option>
                                        <option value="2" <?= (isset($_SESSION['formData']['category']) ? $_SESSION['formData']['category'] : $row["category"]) == 2 ? "selected" : "" ?>>寵物旅館</option>
                                        <option value="3" <?= (isset($_SESSION['formData']['category']) ? $_SESSION['formData']['category'] : $row["category"]) == 3 ? "selected" : "" ?>>線上課程</option>
                                    </select>
                                    <div class="invalid-feedback">請選擇適用範圍</div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">折扣單位</th>
                                <td class="text-start">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="coupontype" id="inlineRadio1" value="1" <?= (isset($_SESSION['formData']['coupontype']) ? $_SESSION['formData']['coupontype'] : $row["coupontype"]) == 1 ? "checked" : "" ?>>
                                        <label class="form-check-label" for="inlineRadio1">%數折扣</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="coupontype" id="inlineRadio2" value="2" <?= (isset($_SESSION['formData']['coupontype']) ? $_SESSION['formData']['coupontype'] : $row["coupontype"]) == 2 ? "checked" : "" ?>>
                                        <label class="form-check-label" for="inlineRadio2">金額折扣</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">折扣面額</th>
                                <td>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="請輸入百分比或金額" aria-label="請輸入百分比或金額" aria-describedby="value_unit" name="value" value="<?= isset($_SESSION['formData']['value']) ? $_SESSION['formData']['value'] : $row["value"] ?>">
                                        <span class="input-group-text" id="value_unit"><?= (isset($_SESSION['formData']['coupontype']) ? $_SESSION['formData']['coupontype'] : $row["coupontype"]) == 1 ? "%" : "元" ?></span>
                                        <div class="invalid-feedback">請輸入百分比或金額</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">低消金額</th>
                                <td>
                                    <div class="input-group">
                                        <input type="number" class="form-control" placeholder="請輸入限制低消金額" aria-label="請輸入限制低消金額" aria-describedby="min_limit_unit" name="min_limit" value="<?= isset($_SESSION['formData']['min_limit']) ? $_SESSION['formData']['min_limit'] : $row["min_limit"] ?>">
                                        <span class="input-group-text" id="min_limit_unit">元</span>
                                        <div class="invalid-feedback">請輸入限制低消金額</div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">優惠說明</th>
                                <td>
                                    <input type="text" class="form-control" name="description" value="<?= isset($_SESSION['formData']['description']) ? $_SESSION['formData']['description'] : $row["description"] ?>">
                                    <div class="invalid-feedback">請輸入優惠券說明</div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">開始日期</th>
                                <td>
                                    <input type="date" class="form-control" id="start_date" name="start_date" value="<?= isset($_SESSION['formData']['start_date']) ? $_SESSION['formData']['start_date'] : $row["start_date"] ?>">
                                    <div class="invalid-feedback">請輸入開始日期</div>
                                </td>
                            </tr>
                            <tr>
                                <th class=" table-danger">截止日期</th>
                                <td>
                                    <input type="date" class="form-control" id="end_date" name="end_date" value="<?= isset($_SESSION['formData']['end_date']) ? $_SESSION['formData']['end_date'] : $row["end_date"] ?>">
                                    <div class="invalid-feedback">請輸入截止日期</div>
                                </td>
                            </tr>
                            <!-- 修改優惠券狀態部分 -->
                            <tr>
                                <th class=" table-danger">優惠券狀態</th>
                                <td class="text-start">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1" <?= (isset($_SESSION['formData']['status']) ? $_SESSION['formData']['status'] : $row["status"]) == 1 ? "checked" : "" ?>>
                                        <label class="form-check-label" for="inlineRadio1">可使用</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="0" <?= (isset($_SESSION['formData']['status']) ? $_SESSION['formData']['status'] : $row["status"]) == 0 ? "checked" : "" ?>>
                                        <label class="form-check-label" for="inlineRadio2">停用</label>
                                    </div>
                                </td>
                            </tr>



                        </tbody>
                    </table>
                    <div class="d-flex justify-content-center">
                        <button class="btn btn-primary mt-3 mb-5" type="submit">提交</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <?php include("./js-fundodo.php") ?>
</body>

</html>