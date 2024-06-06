<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_fdd . "tools/tool-lib.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");

if (!isset($_GET['tag_id'])) :
    echo "請循正常管道進入本頁";
    // todo: 做 modal，點擊後待 3 秒導引至 crs-list
    exit;
    sleep(3);
    leadTo('crs-list.php');
endif;
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>課程 tags 編輯 | Fundodo</title>
    <?php include($to_fdd . "tools/common-head.php"); ?>
</head>

<body>
    <div class="container">

    </div>

</body>

</html>