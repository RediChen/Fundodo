<?php
require_once("./db_connect.php");
session_start();

if (!isset($_POST["id"]) && !isset($_GET["id"])) {
    echo "無效的請求";
    exit;
}

$id = isset($_POST["id"]) ? intval($_POST["id"]) : intval($_GET["id"]);
$action = isset($_GET["action"]) ? $_GET["action"] : '';

if ($action === 'activate') {
    $sql = "UPDATE coupons SET status = 1 WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        echo "SQL準備錯誤: " . $conn->error;
        exit;
    }
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo "優惠券已啟用";
        header("Location: coupons.php");
        exit;
    } else {
        echo "啟用失敗: " . $stmt->error;
    }
} elseif ($action === 'deactivate') {
    $sql = "UPDATE coupons SET status = 0 WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        echo "SQL準備錯誤: " . $conn->error;
        exit;
    }
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo "優惠券已停用";
        header("Location: coupons.php");
        exit;
    } else {
        echo "停用失敗: " . $stmt->error;
    }
} else {
    $name = $_POST["name"];
    $code = $_POST["code"];
    $category = $_POST["category"];
    $coupontype = $_POST["coupontype"];
    $value = $_POST["value"];
    $min_limit = isset($_POST["min_limit"]) ? floatval($_POST["min_limit"]) : 0; // 允许低消金额为0
    $description = $_POST["description"];
    $start_date = $_POST["start_date"];
    $end_date = $_POST["end_date"];
    $status = isset($_POST["status"]) ? intval($_POST["status"]) : 1; // 預設為可使用

    $errors = [];

    if (empty($name)) {
        $errors[] = "請輸入優惠券名稱";
    }

    if (empty($code)) {
        $errors[] = "請輸入優惠券代碼";
    }

    if (empty($category)) {
        $errors[] = "請選擇使用範圍。";
    }

    if (empty($coupontype)) {
        $errors[] = "請選擇優惠券折扣單位。";
    }

    if (empty($value)) {
        $errors[] = "請輸入百分比或金額。";
    }

    if ($min_limit === '' || !is_numeric($min_limit)) {
        $errors[] = "請輸入限制低消金額。";
    }

    if (empty($description)) {
        $errors[] = "請輸入優惠券說明。";
    }

    if (empty($start_date)) {
        $errors[] = "請輸入開始日期。";
    }

    if (empty($end_date)) {
        $errors[] = "請輸入截止日期。";
    }

    if (!empty($errors)) {
        $_SESSION["errors"] = $errors;
        $_SESSION["formData"] = $_POST;
        header("Location: update-coupon.php?id=$id");
        exit;
    }

    $sql = "UPDATE coupons SET name=?, code=?, category=?, coupontype=?, value=?, min_limit=?, description=?, start_date=?, end_date=?, status=? WHERE id=?";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        echo "SQL準備錯誤: " . $conn->error;
        exit;
    }

    $stmt->bind_param("ssissssssii", $name, $code, $category, $coupontype, $value, $min_limit, $description, $start_date, $end_date, $status, $id);

    if ($stmt->execute()) {
        echo "優惠券更新成功";
        unset($_SESSION["formData"]);
        header("Location: coupons.php");
        exit;
    } else {
        echo "更新失敗: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
