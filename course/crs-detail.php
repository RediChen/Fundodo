<?php
$to_tools = "/xampp/htdocs/tools/";
require_once($to_tools . "connectDB_fdd.php");
//todo 本地測試用
include($to_tools . "console-lib.php");

/** 本頁連結 */
$linkHere = "crs-detail.php";
$pageTitle = "課程詳細資料";

if (!isset($_GET['id'])) :
    echo "請循正常管道進入本頁";
    // todo: 做 modal，點擊後待 3 秒導引至 crs-list
    exit;
    sleep(3);
    leadTo('crs-list.php');
else :
endif;
