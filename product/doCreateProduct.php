<?php
require_once("../db_connect.php");

$name = $_POST["name"];
$description = $_POST["description"];
$category = $_POST["category"];
$brand=$_POST["brand"];
$price = $_POST["price"];
$stock = $_POST["stock"];
$now = date('Y-m-d H:i:s');
$flavors = isset($_POST['flavors']) ? $_POST['flavors'] : [];

$sqlProduct="INSERT INTO products (ProductName, description, category_id, brand_id, price, on_shelves_time, stock)
VALUES ('$name', '$description', '$category', '$brand', '$price', '$now', '$stock' )";


if ($conn->query($sqlProduct) === TRUE) {
    $last_id = $conn->insert_id;
    echo "新資料輸入成功, id 為 $last_id";
} else {
    echo "error: " . $conn->error;
}

$sqlInsertTags = "INSERT INTO producttags (ProductID, TagID) VALUES (?, ?)";

$stmtInsertTags = $conn->prepare($sqlInsertTags);
foreach ($flavors as $flavorID) {
    $stmtInsertTags->bind_param("ii", $last_id, $flavorID);
    $stmtInsertTags->execute();
}

// 上傳圖片

$uploadDir='product_images/';

$allowed_extensions = array('jpg', 'jpeg', 'png', 'gif');//定義可上傳圖片類型
$image_counter = 'a'; 

foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
    $originalFileName = $_FILES['images']['name'][$key];
    $fileExtension = pathinfo($originalFileName, PATHINFO_EXTENSION);

    
    if (in_array(strtolower($fileExtension), $allowed_extensions)) {// 轉小寫
        $newFileName = "product_id" . $last_id . $image_counter . "." . $fileExtension;
        $targetFilePath = $uploadDir . $newFileName;

        if (move_uploaded_file($tmp_name, $targetFilePath)) {
            // 插入图片数据，仅存储文件名
            $stmt = $conn->prepare("INSERT INTO ProductImages (ProductID, ImageName) VALUES (?, ?)");
            $stmt->bind_param("is", $last_id, $newFileName);
            $stmt->execute();
            $stmt->close();

            // 更新文件名后缀
            $image_counter++;
        }
    }
}
$conn->close();
header("location: product-list.php");
echo "Product and images uploaded successfully!";
?>







