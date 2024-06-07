<?php
require_once("../db_connect.php");

// 使用 category_id 進行關聯
$sql = "SELECT coupons.*, coupons_category.name AS category_name 
        FROM coupons 
        JOIN coupons_category ON coupons.category = coupons_category.id 
        ORDER BY coupons.id ASC";

$result = $conn->query($sql);
$rows = $result->fetch_all(MYSQLI_ASSOC);
?>

<pre>
    <?php print_r($rows); ?>
</pre>