<?php
$to_htdocs = "/xampp/htdocs/";
require_once($to_htdocs . "connectDB_fdd.php");
include($to_htdocs . "Fundodo/tools/tool-lib.php");

if (!isset($_GET['id']) || !isset($_GET['edit']) || $_GET['edit'] != true) :
    echo "請循正常管道進入本頁";
    exit;
    // todo: 做 modal，點擊後待 3 秒導引至 crs-list
    sleep(3);
    leadTo('crs-list.php');
endif;

$crs_id = $_GET['id'];
$sql = "SELECT * FROM courses WHERE id = $crs_id";
$crs = $conn->query($sql)->fetch_assoc();
if (empty($crs)) :
    leadTo('crs-detail.php?id=' . $crs_id);
endif;

$sameTitle = empty($_POST['title']) || ($_POST['title'] != $crs['title']);
$sameAbstract = empty($_POST['abstract']) || ($_POST['abstract'] != $crs['abstract']);
$samePrice = empty($_POST['price']) || ($_POST['price'] != $crs['price']);

if ($sameTitle || $sameAbstract || $samePrice) :
    $valArr = [];
    if ($sameTitle) :
        array_push($valArr, "title = '" . $_POST['title']. "'");
    endif;
    if ($sameAbstract) :
        array_push($valArr, "abstract = '" . $_POST['abstract']. "'");
    endif;
    if ($samePrice) :
        array_push($valArr, "price = " . $_POST['price']);
    endif;

    $sql_SET = "SET " . implode(', ', $valArr);

    $sql = "UPDATE courses $sql_SET WHERE id = $crs_id";
    if ($conn->query($sql) === false) {
        echo '更改失敗' .  $conn->error;
    }

    leadTo("crs-detail.php?id=$crs_id&eComplete=1");
else :

endif;
