<?php
session_start();
$to_htdocs = "/xampp/htdocs/";
require_once($to_htdocs . "connectDB_fdd.php");
include($to_htdocs . "Fundodo/tools/tool-lib.php");
include($to_htdocs . "Fundodo/tools/console-lib.php"); //todo for debugging

//擋沒有 POST 的情形
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

//擋沒有 id 不存在之情形
if (empty($crs)) :
  leadTo('crs-detail.php?id=' . $crs_id);
endif;

$sameTitle = empty($_POST['title']) || ($_POST['title'] == $crs['title']);
$sameAbstract = empty($_POST['abstract']) || ($_POST['abstract'] == $crs['abstract']);
$samePrice = empty($_POST['price']) || ($_POST['price'] == $crs['price']);
$sameThumbnail = $_FILES['thumbnail']['error'] == 4;

//擋沒有更新內容
if ($sameTitle && $sameAbstract && $samePrice && $sameThumbnail) :
  $_SESSION["error_msg"]['crs-update'] = "請輸入與原本不同的內容。";
  leadTo("crs-detail-edit.php?id=$crs_id");
  exit;
endif;

//* 非圖片的更新
if (($sameTitle && $sameAbstract && $samePrice) == false) :
  $valArr = [];
  if (!$sameTitle) :
    array_push($valArr, "title = '" . $_POST['title'] . "'");
  endif;
  if (!$sameAbstract) :
    array_push($valArr, "abstract = '" . $_POST['abstract'] . "'");
  endif;
  if (!$samePrice) :
    array_push($valArr, "price = " . $_POST['price']);
  endif;

  $sql_SET = "SET " . implode(', ', $valArr);

  $sql = "UPDATE courses $sql_SET WHERE id = $crs_id";
  if ($conn->query($sql) === false) {
    echo '更改失敗' .  $conn->error;
  }
endif;


//* 圖片的更新
if (!$sameThumbnail) :
  if ($_FILES["thumbnail"]["error"] != 0) :
    //todo 如果只有更新圖片，但上傳失敗
    echo "圖片( $key )上傳失敗，代碼：" . $_FILES["thumbnail"]["error"];
  endif;

  $GENRE = 'CR';
  $target_dir = '../images/';
  $tmp_name = $_FILES["thumbnail"]["tmp_name"];
  //取得該張圖片的暫時 file name
  $extension = pathinfo($_FILES["thumbnail"]["name"], PATHINFO_EXTENSION);
  // 取得該張圖片的副檔名

  $file_name = formatFileName($GENRE, $crs_id, 1, $extension);
  $target_path = $target_dir . $file_name;
  if (move_uploaded_file($tmp_name, $target_path) == false) :
    echo "移動圖片檔失敗しました";
  endif;

  $sql = "UPDATE images_stored SET file_name = '$file_name'
  WHERE genre = '$GENRE' AND item_id = $crs_id AND item_sub_id = 1";
  if ($conn->query($sql) === false) {
    echo '更改失敗' .  $conn->error;
  }

endif;

leadTo("crs-detail.php?id=$crs_id&eComplete=1");
