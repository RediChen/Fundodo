<?php
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include $to_fdd . "tools/console-lib.php";
$sql_1 = "SELECT id FROM users WHERE valid = 1";
$user_count = $conn->query($sql_1)->num_rows;

$sql_2 = "SELECT id FROM products WHERE valid = 0";
$product_count = $conn->query($sql_2)->num_rows;

$sql_3 = "SELECT id FROM courses WHERE deleted_at is NULL";
$course_count = $conn->query($sql_3)->num_rows;

$sql_4 = "SELECT id FROM coupons WHERE status = 1";
$coupon_count = $conn->query($sql_4)->num_rows;
?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <title>儀表板 | 後台儀表板</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body class="db_body">
  <div class="d-flex">
    <?php include("./dashboard-aside.php"); ?>
    <div class="w-100">
      <?php include("./dashboard-header.php"); ?>

      <div class="layout_content">
        <h3 class="mb-3">會員資料</h3>
        <div class="row cols-md-3 g-3 justify-content-evenly">
          <div class="col">
            <div class="db-card">
              <div class="stat">
                <strong><?= $user_count ?></strong>
              </div>
              <h5>會員總數</h5>
            </div>
          </div>
          <div class="col">
            <div class="db-card">
              <div class="stat">
                <strong><?= $product_count ?></strong>
              </div>
              <h5>商品總數</h5>
            </div>
          </div>
          <div class="col">
            <div class="db-card">
              <div class="stat">
                <strong><?= $course_count ?></strong>
              </div>
              <h5>課程總數</h5>
            </div>
          </div>
          <div class="col">
            <div class="db-card">
              <div class="stat">
                <strong><?= $coupon_count ?></strong>
              </div>
              <h5>優惠券總數</h5>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <?php include("/xampp/htdocs/Fundodo/tools/common-script.php"); ?>
</body>

</html>