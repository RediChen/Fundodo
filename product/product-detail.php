<?php
if (!isset($_GET["id"])) {
  $id = 1;
} else {
  $id = $_GET["id"];
}

require_once "../db_connect.php";
$sql = "SELECT products.name, products.description, products.price, products.on_shelves_time, products.stock, prod_images.image_name, prod_categories.name AS category_name, prod_brands.name AS brand_name FROM products 
JOIN prod_images ON products.id=prod_images.prod_id
JOIN prod_categories ON products.category_id=prod_categories.id
JOIN prod_brands ON products.brand_id=prod_brands.id
WHERE products.id = $id AND valid = 0";

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
<html lang="zh-Hant-TW">

<head>
  <title>修改商品</title>
  <?php include "/xampp/htdocs/Fundodo/tools/common-head.php"; ?>

</head>

<body>
  <!-- Modal: 刪除確認訊息 -->
  <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="deleteModalLabel">確認刪除</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">確認刪除此商品？</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
          <a class="btn btn-danger" href="deleteProduct.php?id=<?= $id ?>">確認</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal: 刪除確認訊息 END -->
  <div class="d-flex">
    <?php include "/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"; ?>
    <div class="w-100">
      <?php include "/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"; ?>
      <div class="layout_content">
        <div class="container c-600">
          <h1>商品詳細資料</h1>
          <div class="text-end d-flex justify-content-between">
            <a href="product-list.php" class="btn btn-primary text-end">
              <i class="fa-solid fa-arrow-left"></i>回商品列表
            </a>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa-solid fa-trash me-2"></i> 刪除此商品</button>
          </div>
          <hr>
          <table class="table-1row">
            <?php if ($productExit) : ?>
              <tr>
                <th>商品 ID</th>
                <td><?= $id ?></td>
              </tr>
              <tr>
                <th>商品名稱</th>
                <td><?= $product["name"] ?></td>
              </tr>
              <tr>
                <th>商品描述</th>
                <td><?= $product["description"] ?></td>
              </tr>
              <tr>
                <th>商品圖片</th>
                <td>
                  <div class="product_box">
                    <img class="img-fluid object-fit-cover" src="./product_images/<?= $product["image_name"] ?>">
                  </div>
                </td>
              </tr>
              <tr>
                <th>商品種類</th>
                <td><?= $product["category_name"] ?></td>
              </tr>
              <tr>
                <th>商品品牌</th>
                <td><?= $product["brand_name"] ?></td>
              </tr>
              <?php
              $sqlFlavor = "SELECT prod_tags.name FROM products_tags JOIN prod_tags ON products_tags.tag_id = prod_tags.id WHERE products_tags.prod_id = $id";
              $resultFlavor = $conn->query($sqlFlavor);
              $rowsFlavor = $resultFlavor->fetch_all(MYSQLI_ASSOC);
              $tagArr = [];
              foreach ($rowsFlavor as $row) :
                array_push($tagArr, $row['name']);
              endforeach;
              ?>
              <tr>
                <th>商品口味</th>
                <td><?= implode('、', $tagArr); ?></td>
              </tr>
              <tr>
                <th>商品價格</th>
                <td><?= $product["price"] ?></td>
              </tr>
              <tr>
                <th>上架數量</th>
                <td><?= $product["stock"] ?></td>
              </tr>
              <tr>
                <th>修改資料</th>
                <td>
                  <a href="product-edit.php?id=<?= $id ?>" class="btn btn-primary"><i class="fa-solid fa-edit"></i></a>
                </td>
              </tr>
            <?php else : ?>
              <h1 class="text-danger text-center mt-5">此商品不存在</h1>
            <?php endif; ?>
          </table>
        </div>
      </div>
    </div>
  </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>