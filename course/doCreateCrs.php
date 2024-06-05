<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_fdd . "tools/tool-lib.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");
session_start();

//todo 防呆待升級
if (!isset($_POST['title'])) :
    var_dump(isset($_POST['imageArr']));
    echo '請循正常管道進入此頁。';
    exit;
endif;

if (empty($_FILES['imageArr'])) :
    echo '請上傳檔案。';
    exit;
endif;

$title = $_POST['title'];
$abstract = $_POST['abstract'];
$files = $_FILES['imageArr'];
$price = $_POST['price'];
$noFileUploaded = ($files['error'] == 4);

if (empty($title) || empty($abstract) || $noFileUploaded || empty($price)) :
    $tempArr =
        [
                "title" => $title,
                "abstract" => $abstract,
                "file" => $file,
                "price" => $price
        ];
        $errMsg = [
            "title" =>"尚未輸入課程名稱",
            "abstract" =>"尚未輸入課程摘要",
            "file" => "尚未上傳課程用圖",
            "price" =>"尚未輸入課程價格"
        ];
    foreach (array_keys($tempArr) as $key) :
        $_SESSION["error_msg"][$key] = empty($tempArr[$key]) ? $errMsg[$key] : null;
    endforeach;
    leadTo("crs-detail-create.php");
endif;

//================================================

$now = date('Y-m-d H:i:s');

$sql = "INSERT INTO `courses` (`title`, `abstract`, `price`, 'created_at') VALUES ('$title', '$abstract', '$price', '$now')";

if ($conn->query($sql) == false) :
    echo "新增進資料表 courses 失敗。";
endif;

$new_id = $conn->insert_id;

$GENRE = 'CR';
function filename($crs_id, $i_img, $format)
{
    global $GENRE;
    return $GENRE . sprintf("%06d", $crs_id) . $i_img . '.' . $format;
}

$target_path = '../images/';
$counter = 1;
$valArr = [];
foreach ($_FILES["imageArr"]["error"] as $key => $code) :
    if ($code != 0) :
        echo "圖片( $key )上傳失敗，代碼：$code";
        exit;
    endif;
    $tmp_name = $_FILES["imageArr"]["tmp_name"][$key];
    //取得該張圖片的暫時 file name
    $extension = pathinfo($_FILES["imageArr"]["name"][$key], PATHINFO_EXTENSION);
    // 取得該張圖片的副檔名

    $fileName = fileName($new_id, $counter, $extension);
    $filePath = $target_path . $fileName;
    if (move_uploaded_file($tmp_name, $filePath)) :
        $value = "('$GENRE', '$new_id', '$counter', '$fileName')";
        array_push($valArr, $value);
    endif;

    $counter++;
endforeach;

$sql = "INSERT INTO images_stored (genre, item_id, item_sub_id, file_name) VALUES " . implode(', ', $valArr);

// printArray($sql);

if ($conn->query($sql) == false) :
    echo "新增進資料表 images_stored 失敗。";
else :
    echo "新增進資料表 images_stored 成功。";
endif;
