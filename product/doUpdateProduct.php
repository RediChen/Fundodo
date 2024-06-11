<?php
require_once("../db_connect.php");

$id = $_POST["id"];
$name = $_POST["name"];
$description = $_POST["description"];
$category = $_POST["category"];
$brand = $_POST["brand"];
$price = $_POST["price"];
$stock = $_POST["stock"];

$sqlProduct = "UPDATE products SET name='$name', description='$description', category_id='$category', price='$price', stock='$stock' WHERE id=$id";

$conn->query($sqlProduct);

if (isset($_POST['flavors'])) {
    $flavors = $_POST['flavors']; // 獲取口味的口味數組

    // 先刪除舊的 `producttags` 記錄
    $sql_delete = "DELETE FROM products_tags WHERE prod_id = $id";
    $conn->query($sql_delete);

    // 插入新的 `producttags` 記錄
    foreach ($flavors as $flavor) {
        $sql_insert = "INSERT INTO products_tags (prod_id, tag_id) VALUES ($id, $flavor)";
        $conn->query($sql_insert);
    }

    echo "口味更新成功！";
} else {
    echo "請選擇至少一種口味";
}

// -----------------------------------------------------

// 刪除舊的圖片
$sqlOldImages = "SELECT image_name FROM prod_images WHERE prod_id = $id";
$resultOldImages = $conn->query($sqlOldImages);
$oldImages = $resultOldImages->fetch_all(MYSQLI_ASSOC);

foreach ($oldImages as $oldImage) {
    $oldImagePath = "./product_images/" . $oldImage['image_name']; // 旧图片文件路径
    unlink($oldImagePath); // 删除旧图片文件
}

// 刪除舊的圖片記錄
$sql_delete_images = "DELETE FROM prod_images WHERE prod_id = $id";
$conn->query($sql_delete_images);

$allowed_extensions = array('jpg', 'jpeg', 'png', 'gif'); // 定義可上傳圖片類型
$image_counter = 'a'; 

foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
    $originalFileName = $_FILES['images']['name'][$key];
    $fileExtension = pathinfo($originalFileName, PATHINFO_EXTENSION);

    if (in_array(strtolower($fileExtension), $allowed_extensions)) { // 轉小寫
        $newFileName = "product_id" . $id . $image_counter . "." . $fileExtension;
        $targetFilePath = "./product_images/" . $newFileName;

        if (move_uploaded_file($tmp_name, $targetFilePath)) {
            // 插入圖片數據，只存儲文件名
            $stmt = $conn->prepare("INSERT INTO prod_images (prod_id, image_name) VALUES (?, ?)");
            $stmt->bind_param("is", $id, $newFileName);
            $stmt->execute();
            $stmt->close();

            // 更新文件名後綴
            $image_counter++;
        }
    }
}

header("location: product-list.php");
?>
