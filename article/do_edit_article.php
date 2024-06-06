<?php
require_once("../db_connect.php");

function filename($article_id,$index,$extension){
    return "arti_img_ud_". $article_id."_" . $index . "." . $extension;
}

$sort = $_POST["sort"];
$title = $_POST["title"];
$content = $_POST["content"];
$id = intval($_POST["id"]);


$sql="UPDATE article SET sort='$sort', title='$title',content='$content' WHERE id='$id'";




if ($conn->query($sql) === true) {
    $article_id = $id;
    $count =1;

    foreach ($_FILES["files"]["error"] as $key => $error) {
        if ($error == 0) {
            $tmp_name = $_FILES["files"]["tmp_name"][$key];
            $extension = pathinfo($_FILES["files"]["name"][$key], PATHINFO_EXTENSION);
            $name = filename($article_id,$count,$extension);

            if (move_uploaded_file($tmp_name, "../upload_img/" .$name)) {
                $img_paths[] ="../upload_img/". $name;
                $sql_img = "INSERT INTO article_img (article_id,img_path) VALUE ('$article_id','$name')";
                if($conn->query($sql_img)==true){
                    echo "success";
                }
                $count ++;
            }
        }
    }

    if (isset($_POST['delete_img'])) {
        foreach ($_POST['delete_img'] as $img_id) {
            $img_id = intval($img_id);

            // 獲取圖片路徑
            $sql_img = "SELECT img_path FROM article_img WHERE id='$img_id'";
            $result_img = $conn->query($sql_img);
            if ($result_img->num_rows > 0) {
                $row_img = $result_img->fetch_assoc();
                $img_path = "../upload_img/" . $row_img['img_path'];

                // 從文件系統中刪除圖片
                if (file_exists($img_path) && unlink($img_path)) {
                    // 從數據庫中刪除圖片記錄
                    $sql_delete_img = "DELETE FROM article_img WHERE id='$img_id'";
                    if ($conn->query($sql_delete_img) !== true) {
                        echo "圖片刪除失敗: " . $conn->error;
                    }
                } else {
                    echo "圖片文件不存在或刪除失敗。";
                }
            }
        }
    }
    header("Location: article_title.php");
    exit;
} else {
    echo "文章編輯失敗: " . $conn->error;
}

?>