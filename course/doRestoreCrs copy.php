<?php
$to_htdocs = "/xampp/htdocs/";
require_once($to_htdocs . "connectDB_fdd.php");
include($to_htdocs . "Fundodo/tools/tool-lib.php");

if (!isset($_GET['id']) || !isset($_GET['delete']) || $_GET['delete'] != true) :
    echo "請循正常管道進入本頁";
    exit;
    // todo: 做 modal，點擊後待 3 秒導引至 crs-list
    sleep(3);
    leadTo('crs-list.php');
endif;

$crs_id = $_GET['id'];

$sql = "UPDATE courses SET deleted_at = 'NULL' WHERE id = $crs_id";
if ( $conn->query($sql) === false) {
    echo '恢復失敗' .  $conn->error;
}

leadTo('crs-list.php?dComplete=1');