<?php
require_once("../db_connect.php");
$to_dashboard = "/xampp/htdocs/Fundodo/dashboard/";

$sql = "SELECT * FROM prod_images";
$result = $conn->query($sql);
$row = $result->fetch_all(MYSQLI_ASSOC);
?>
<!doctype html>
<html lang="zh-Hant-TW">

<head>
  <title>新增商品</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
  <div class="d-flex">
    <?php include $to_dashboard . "dashboard-aside.php"; ?>
    <div class="w-100">
      <?php include $to_dashboard . "dashboard-header.php"; ?>
      <div class="layout_content">
        <div class="container c-600">
          <div class="mx-auto ">
            <h1 class="mb-3">新增商品</h1>
            <div class="text-end">
              <a href="product-list.php" class="btn btn-primary text-end"><i class="fa-solid fa-arrow-left"></i>回商品列表</a>
            </div>
            <form action="doCreateProduct.php" method="post" enctype="multipart/form-data">
              <div class="mb-2">
                <label for="" class="form-label">商品名稱</label>
                <input type="text" class="form-control" name="name" required>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">商品描述</label>
                <input type="text" class="form-control" name="description">
              </div>
              <div class="mb-2">
                <label for="form-label" class="form-label">商品圖片</label>
                <div></div>
                <input type="file" class="form-control" name="images[]" multiple required>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">種類</label>
                <select name="category" class="form-control">
                  <option selected>請選擇商品種類</option>
                  <?php $sqlCategory = "SELECT * FROM prod_categories ";
                  $resultCategory = $conn->query($sqlCategory);
                  $rowCategory = $resultCategory->fetch_all(MYSQLI_ASSOC); ?>
                  <?php foreach ($rowCategory as $cate) : ?>
                    <option value=<?= $cate["id"] ?>>
                      <?= $cate["name"] ?>
                    </option>
                  <?php endforeach ?>
                </select>
              </div>
              <div class="mb-2">
                <label for="brand" class="form-label">品牌</label>
                <select class="form-select" name="brand">
                  <option selected>請選擇品牌</option>
                  <?php $sqlBrand = "SELECT * FROM prod_brands";
                  $resultBrand = $conn->query($sqlBrand);
                  $row_brand = $resultBrand->fetch_all(MYSQLI_ASSOC); ?>
                  <?php foreach ($row_brand as $brand) : ?>
                    <option value="<?= $brand["id"] ?>">
                      <?= $brand["name"] ?>
                    </option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="mb-2">
                <label class="form-label">商品口味</label>
                <?php $sqlFlavor = "SELECT * FROM prod_tags";
                $resultFlavor = $conn->query($sqlFlavor);
                $row_flavor = $resultFlavor->fetch_all(MYSQLI_ASSOC); ?>
                <?php foreach ($row_flavor as $flavor) : ?>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="flavor<?= $flavor["id"] ?>" value=<?= $flavor["id"] ?> name="flavors[]">
                    <label class="form-check-label" for="flavor<?= $flavor["id"] ?>"><?= $flavor["name"] ?></label>
                  </div>
                <?php endforeach ?>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">價格</label>
                <input type="tel" class="form-control" name="price" required>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">上架數量</label>
                <input type="tel" class="form-control" name="stock" required>
              </div>
              <div class="text-center mt-3">
                <button class="btn btn-primary" type="submit">送出</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>