<?php
require_once("./db_connect.php");

if (!isset($_GET["id"])) {
    die("無效的請求");
}

$id = intval($_GET["id"]);
$status = intval($_GET["status"]);

$sql = "UPDATE coupons SET status = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $status, $id);

if ($stmt->execute()) {
    header("Location: coupon.php?id=$id");
    exit;
} else {
    echo "更新失敗: " . $stmt->error;
}
?>


