<?php 

require_once("../db_connect.php");


$id = $_GET["id"];
echo $id;

$sql = "UPDATE products SET valid = 1 WHERE id=$id";

if ($conn->query($sql) === FALSE) {
    echo "刪除商品錯誤: " . $conn->error;
}

$sqlDeleteTag="DELETE FROM products_tags WHERE prod_id=$id";

if ($conn->query($sqlDeleteTag) === FALSE) {
    echo "刪除標籤錯誤: " . $conn->error;
}

$sqlDeleteImages="DELETE FROM prod_images WHERE prod_id=$id";

if ($conn->query($sqlDeleteImages) === FALSE) {
    echo "刪除圖片錯誤: " . $conn->error;
}

header("location: product-list.php");