<?php

if (!isset($_GET["id"])) {
    $id = 1;
} else {
    $id = $_GET["id"];
}

require_once("../db_connect.php");
$sql = "SELECT products.*, productimages.ImageName, category.name AS category_name, brands.BrandName
FROM products 
JOIN productimages ON products.ProductID=productimages.ProductID
JOIN category ON products.category_id=category.id
JOIN brands ON products.brand_id=brands.BrandID
WHERE products.ProductID = $id AND valid= 0";
$result = $conn->query($sql);
$row = $result->fetch_assoc();


if ($result->num_rows > 0) {
    $productExit = true;
    $title = $row["ProductName"];
} else {
    $productExit = false;
    $title = "此商品不存在";
}

?>
<!doctype html>
<html lang="en">

<head>
    <title>product edit</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <?php include("css.php") ?>
    <style>
        .container {
            max-width: 600px;
        }
    </style>
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
                    <a class="btn btn-danger" href="deleteProduct.php?id=<?= $row["ProductID"] ?>">確認</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <h1>修改商品資料</h1>
        <div class="text-end d-flex justify-content-between">
            <a href="product-list.php" class="btn btn-primary text-end"><i class="fa-solid fa-arrow-left"></i> 回商品列表</a>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"><i class="fa-solid fa-trash"></i> 刪除此商品</button>
        </div>
        <hr>
        <form action="doUpdateProduct.php" method="post" enctype="multipart/form-data">
            <?php if ($productExit) : ?>
                <div class="mb-2">
                    <input type="hidden" name="id" value="<?= $row["ProductID"] ?>">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">商品名稱</label>
                    <input type="text" class="form-control" name="name" value="<?= $row["ProductName"] ?>">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">商品描述</label>
                    <input type="text" class="form-control" name="description" value="<?= $row["description"] ?>">
                </div>
                <div class="mb-2">
                    <label for="form-label" class="form-label">商品圖片</label>
                    <div class="box"><img class="img-fluid object-fit-cover" src="../product_new/product_images/<?= $row["ImageName"] ?>"></div>
                    <input type="file" class="form-control" name="images[]" value="<?= $row["ImageName"] ?> " multiple required>
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">種類</label>
                    <select name="category" class="form-control">
                        <option selected><?= $row["category_name"] ?></option>
                        <?php $sqlCategory = "SELECT * FROM category";
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
                        <option selected><?= $row["BrandName"] ?></option>
                        <?php $sqlBrand = "SELECT * FROM brands";
                        $resultBrand = $conn->query($sqlBrand);
                        $rows = $resultBrand->fetch_all(MYSQLI_ASSOC); ?>
                        <?php foreach ($rows as $item) : ?>
                            <option value="<?= $item["BrandID"] ?>"><?= $item["BrandName"] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="mb-2">
                    <label class="form-label">商品口味</label>
                    <?php $sqlFlavor = "SELECT * FROM tags";
                    $resultFlavor = $conn->query($sqlFlavor);
                    $rowFlavor = $resultFlavor->fetch_all(MYSQLI_ASSOC); ?>
                    <?php foreach ($rowFlavor as $flavor) : ?>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="flavor<?= $flavor["TagID"] ?>" value=<?= $flavor["TagID"] ?> name="flavors[]">
                            <label class="form-check-label" for="flavor<?= $flavor["TagID"] ?>"><?= $flavor["TagName"] ?></label>
                        </div>
                    <?php endforeach ?>
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">價格</label>
                    <input type="tel" class="form-control" name="price" value="<?= $row["price"] ?>">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">上架數量</label>
                    <input type="tel" class="form-control" name="stock" value="<?= $row["stock"] ?>">
                </div>
                <div class="text-center mt-3">
                    <button class="btn btn-primary " type="submit">送出</button>
                </div>
            <?php else : ?>
                <h1>此商品不存在</h1>
            <?php endif ?>
        </form>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>