<?php 

require_once("../db_connect.php");


$id = $_GET["id"];
echo $id;

$sql = "UPDATE products SET valid = 1 WHERE ProductID=$id";

if ($conn->query($sql) === TRUE) {
    echo "刪除商品成功";
} else {
    echo "刪除商品錯誤: " . $conn->error;
}

$sqlDeleteTag="DELETE FROM producttags WHERE ProductID=$id";

if ($conn->query($sqlDeleteTag) === TRUE) {
    echo "刪除標籤成功";
} else {
    echo "刪除標籤錯誤: " . $conn->error;
}

$sqlDeleteImages="DELETE FROM productimages WHERE ProductID=$id";

if ($conn->query($sqlDeleteImages) === TRUE) {
    echo "刪除圖片成功";
} else {
    echo "刪除圖片錯誤: " . $conn->error;
}

header("location: product-list.php");