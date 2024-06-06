<?php
session_start();

// 檢查是否有特定的標誌來保留會話數據
if (!isset($_SESSION['preserve_form_data'])) {
    unset($_SESSION['formData']);
    unset($_SESSION['errorMsg']);
} else {
    // 重置標誌以便下一次進入新增頁面時不保留數據
    unset($_SESSION['preserve_form_data']);
}

// 設置標誌來保留會話數據
$_SESSION['preserve_form_data'] = true;
?>


<!doctype html>
<html lang="en">

<head>
    <title>Create coupon</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
    <div class="container-fluid px-5 my-4">
        <h2 class="text-center">新增優惠券</h2>
        <div class="my-3">
            <a class="btn btn-primary btn-sm" href="coupons.php"> <i class="fa-regular fa-circle-left"></i> 優惠券列表</a>
        </div>
        <form id="couponForm" action="doCreateCoupon.php" method="post">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="mb-2">
                        <label for="name" class="form-label">優惠券名稱</label>
                        <input type="text" class="form-control" name="name" value="<?= isset($_SESSION['formData']['name']) ? $_SESSION['formData']['name'] : '' ?>">

                        <?php if (isset($_SESSION["errorMsg"]["name"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["name"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["name"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="mb-2">
                        <label for="code" class="form-label">優惠券代碼</label>
                        <div class="input-group">
                            <input type="text" id="code" class="form-control" name="code" value="<?= isset($_SESSION['formData']['code']) ? $_SESSION['formData']['code'] : '' ?>">
                            <button type="button" class="btn btn-success" onclick="generateCode()">自動生成代碼</button>
                        </div>
                        <?php if (isset($_SESSION["errorMsg"]["code"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["code"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["code"]); ?>
                        <?php endif; ?>

                    </div>
                    <div class="mb-2">
                        <label for="category" class="form-label">優惠券使用範圍</label>
                        <select class="form-select" name="category">
                            <option value="" disabled>選擇使用範圍</option>
                            <option value="1" <?= isset($_SESSION['formData']['category']) && $_SESSION['formData']['category'] == '1' ? 'selected' : '' ?>>商品</option>
                            <option value="2" <?= isset($_SESSION['formData']['category']) && $_SESSION['formData']['category'] == '2' ? 'selected' : '' ?>>寵物旅館</option>
                            <option value="3" <?= isset($_SESSION['formData']['category']) && $_SESSION['formData']['category'] == '3' ? 'selected' : '' ?>>線上課程</option>
                        </select>
                        <?php if (isset($_SESSION["errorMsg"]["category"])) : ?>
                            <div class=" text-danger mt-2 errorMsg">
                                <?= $_SESSION["errorMsg"]["category"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["category"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="my-3">
                        <p>優惠券折扣單位</p>
                        <div class="form-check form-check-inline">
                            <input checked class="form-check-input" type="radio" name="coupontype" id="inlineRadio1" value="1" <?= isset($_SESSION['formData']['coupontype']) && $_SESSION['formData']['coupontype'] == '1' ? 'checked' : '' ?>>
                            <label class="form-check-label" for="inlineRadio1">%數折扣</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="coupontype" id="inlineRadio2" value="2" <?= isset($_SESSION['formData']['coupontype']) && $_SESSION['formData']['coupontype'] == '2' ? 'checked' : '' ?>>
                            <label class="form-check-label" for="inlineRadio2">金額折扣</label>
                        </div>
                        <?php if (isset($_SESSION["errorMsg"]["coupontype"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["coupontype"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["coupontype"]); ?>
                        <?php endif; ?>
                    </div>

                    <div class="input-group mt-3">
                        <input type="text" class="form-control" placeholder="請輸入折扣百分比" aria-label="請輸入百分比或金額" aria-describedby="value_unit" name="value" id="value" value="<?= isset($_SESSION['formData']['value']) ? $_SESSION['formData']['value'] : '' ?>">
                        <span class="input-group-text" id="value_unit">%</span>
                    </div>

                    <?php if (isset($_SESSION["errorMsg"]["value"])) : ?>
                        <div class=" text-danger mt-1 errorMsg">
                            <?= $_SESSION["errorMsg"]["value"] ?>
                        </div>
                        <?php unset($_SESSION["errorMsg"]["value"]); ?>
                    <?php endif; ?>


                    <div class="my-3">
                        <p>限制低消金額</p>
                        <div class="input-group mt-3">
                            <input type="text" class="form-control" placeholder="請輸入限制低消金額" aria-label="請輸入限制低消金額" aria-describedby="min_limit_unit" name="min_limit" value="<?= isset($_SESSION['formData']['min_limit']) ? $_SESSION['formData']['min_limit'] : '' ?>">
                            <span class="input-group-text" id="min_limit_unit">元</span>
                        </div>
                        <?php if (isset($_SESSION["errorMsg"]["min_limit"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["min_limit"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["min_limit"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="mb-2">
                        <label for="description" class="form-label">優惠券說明</label>
                        <input type="text" class="form-control" name="description" value="<?= isset($_SESSION['formData']['description']) ? $_SESSION['formData']['description'] : '' ?>">
                        <?php if (isset($_SESSION["errorMsg"]["description"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["description"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["description"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="mb-2">
                        <label for="start_date" class="form-label">開始日期</label>
                        <input type="date" class="form-control" name="start_date" id="start_date" value="<?= isset($_SESSION['formData']['start_date']) ? $_SESSION['formData']['start_date'] : '' ?>">
                        <?php if (isset($_SESSION["errorMsg"]["start_date"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["start_date"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["start_date"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="my-3">
                        <label for="end_date" class="form-label">截止日期</label>
                        <input type="date" class="form-control" name="end_date" id="end_date" value="<?= isset($_SESSION['formData']['end_date']) ? $_SESSION['formData']['end_date'] : '' ?>">
                        <?php if (isset($_SESSION["errorMsg"]["end_date"])) : ?>
                            <div class=" text-danger mt-1 errorMsg">
                                <?= $_SESSION["errorMsg"]["end_date"] ?>
                            </div>
                            <?php unset($_SESSION["errorMsg"]["end_date"]); ?>
                        <?php endif; ?>
                    </div>
                    <div class="d-flex justify-content-center w-100">
                        <button class="btn btn-primary mt-3 mb-5 w-80 me-2" type="submit"><i class="fa-regular fa-circle-check"></i> 提交送出</button>
                        <a class="btn btn-success mt-3 mb-5 w-80 ms-2" href="coupons.php"> <i class="fa-regular fa-circle-xmark"></i> 取消新增</a>
                    </div>

                </div>
            </div>
        </form>
    </div>

    <?php include("./js-fundodo.php") ?>
</body>

</html>