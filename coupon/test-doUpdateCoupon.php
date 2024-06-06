<?php
require_once("./db_fundodo_connect.php");
session_start();

if (!isset($_POST["id"])) {
    echo "無效的請求";
    exit;
}

$id = intval($_POST["id"]);
$name = $_POST["name"];
$code = $_POST["code"];
$category = $_POST["category"];
$coupontype = $_POST["coupontype"];
$value = $_POST["value"];
$min_limit = $_POST["min_limit"];
$description = $_POST["description"];
$start_date = $_POST["start_date"];
$end_date = $_POST["end_date"];

$errors = [];

if (empty($name)) {
    $errors[] = "優惠券名稱為必填項目";
}

if (empty($code)) {
    $errors[] = "優惠券代碼為必填項目";
}

if (empty($category)) {
    $errors[] = "使用範圍為必填項目";
}

if (empty($coupontype)) {
    $errors[] = "優惠券種類為必填項目";
}

if (empty($value)) {
    $errors[] = "折扣面額為必填項目";
}

if (empty($min_limit)) {
    $errors[] = "低消金額為必填項目";
}

if (empty($description)) {
    $errors[] = "優惠說明為必填項目";
}

if (empty($start_date)) {
    $errors[] = "開始日期為必填項目";
}

if (empty($end_date)) {
    $errors[] = "截止日期為必填項目";
}

if (!empty($errors)) {
    $_SESSION["errors"] = $errors;
    $_SESSION["formData"] = $_POST;
    header("Location: update-coupon.php?id=$id");
    exit;
}

$sql = "UPDATE coupons SET name=?, code=?, category=?, coupontype=?, value=?, min_limit=?, description=?, start_date=?, end_date=? WHERE id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssissssssi", $name, $code, $category, $coupontype, $value, $min_limit, $description, $start_date, $end_date, $id);

if ($stmt->execute()) {
    echo "優惠券更新成功";
    header("Location: coupons.php");
    exit;
} else {
    echo "更新失敗: " . $stmt->error;
}
