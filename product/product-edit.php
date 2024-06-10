<?php

if (!isset($_GET["id"])) {
  $id = 1;
} else {
  $id = $_GET["id"];
}

require_once("../db_connect.php");
$sql = "SELECT products.*, prod_images.image_name, prod_categories.name AS category_name, prod_brands.name AS brand_name
FROM products 
JOIN prod_images ON products.id=prod_images.prod_id
JOIN prod_categories ON products.category_id=prod_categories.id
JOIN prod_brands ON products.brand_id=prod_brands.id
WHERE products.id = $id AND valid= 0";
$result = $conn->query($sql);
$product = $result->fetch_assoc();


if ($result->num_rows > 0) {
  $productExit = true;
  $title = $product["name"];
} else {
  $productExit = false;
  $title = "此商品不存在";
}

?>
<!doctype html>
<html lang="en">

<head>
  <title>修改商品</title>
  <!-- Required meta tags -->
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
          確認刪除此商品?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
          <a class="btn btn-danger" href="deleteProduct.php?id=<?= $product["id"] ?>">確認</a>
        </div>
      </div>
    </div>
  </div>
  <div class="d-flex">
    <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
    <div class="w-100">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
      <div class="layout_content">
        <div class="container c-600">
          <h1>修改商品資料</h1>
          <div class="text-end d-flex justify-content-between">
            <a href="product-list.php" class="btn btn-primary text-end"><i class="fa-solid fa-arrow-left"></i> 回商品列表</a>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa-solid fa-trash"></i> 刪除此商品</button>
          </div>
          <hr>
          <form action="doUpdateProduct.php" method="post" enctype="multipart/form-data">
            <?php if ($productExit) : ?>
              <div class="mb-2">
                <input type="hidden" name="id" value="<?= $product["id"] ?>">
              </div>
              <div class="mb-2">
                <label for="" class="form-label">商品名稱</label>
                <input type="text" class="form-control" name="name" value="<?= $product["name"] ?>">
              </div>
              <div class="mb-2">
                <label for="" class="form-label">商品描述</label>
                <input type="text" class="form-control" name="description" value="<?= $product["description"] ?>">
              </div>
              <div class="mb-2">
                <label for="form-label" class="form-label">商品圖片</label>
                <div class="product_box"><img class="img-fluid object-fit-cover" src="./product_images/<?= $product["image_name"] ?>"></div>
                <input type="file" class="form-control" name="images[]" value="<?= $product["image_name"] ?> " multiple required>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">種類</label>
                <select name="category" class="form-control">
                  <option selected><?= $product["category_name"] ?></option>
                  <?php $sqlCategory = "SELECT * FROM prod_categories";
                  $resultCategory = $conn->query($sqlCategory);
                  $rowCategory = $resultCategory->fetch_all(MYSQLI_ASSOC); ?>
                  <?php foreach ($rowCategory as $cate) : ?>
                    <option value=<?= $cate["id"] ?>><?= $cate["name"] ?></option>
                  <?php endforeach ?>
                </select>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">品牌</label>
                <select class="form-select" name="brand">
                  <option selected><?= $product["brand_name"] ?></option>
                  <?php $sqlBrand = "SELECT * FROM prod_brands";
                  $resultBrand = $conn->query($sqlBrand);
                  $rows = $resultBrand->fetch_all(MYSQLI_ASSOC); ?>
                  <?php foreach ($rows as $item) : ?>
                    <option value="<?= $item["id"] ?>"><?= $item["name"] ?></option>
                  <?php endforeach; ?>
                </select>
              </div>
              <div class="mb-2">
                <label class="form-label">商品口味</label>
                <?php $sqlFlavor = "SELECT * FROM prod_tags";
                $resultFlavor = $conn->query($sqlFlavor);
                $rowFlavor = $resultFlavor->fetch_all(MYSQLI_ASSOC); ?>
                <?php foreach ($rowFlavor as $flavor) : ?>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="flavor<?= $flavor["id"] ?>" value=<?= $flavor["id"] ?> name="flavors[]">
                    <label class="form-check-label" for="flavor<?= $flavor["id"] ?>"><?= $flavor["name"] ?></label>
                  </div>
                <?php endforeach ?>
              </div>
              <div class="mb-2">
                <label for="" class="form-label">價格</label>
                <input type="tel" class="form-control" name="price" value="<?= $product["price"] ?>">
              </div>
              <div class="mb-2">
                <label for="" class="form-label">上架數量</label>
                <input type="tel" class="form-control" name="stock" value="<?= $product["stock"] ?>">
              </div>
              <div class="text-center mt-3">
                <button class="btn btn-primary " type="submit">送出</button>
              </div>
            <?php else : ?>
              <h1>此商品不存在</h1>
            <?php endif ?>
          </form>
        </div>
      </div>
    </div>
  </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>