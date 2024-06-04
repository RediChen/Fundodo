<?php
require_once("../db_connect.php");

function filename($article_id,$index,$extension){
    return "arti_img_". $article_id."_" . $index . "." . $extension;
}

$title = $_POST["title"];
$content = $_POST["content"];
$sort = $_POST["sort"];
$now = date('Y-m-d H:i:s');
$article_del = "0";
// $img_path = "";
$img_path = [];

$sql = "INSERT INTO article (title,content,sort,create_at,article_delete)
VALUES('$title','$content','$sort','$now',$article_del)";

if(!isset($title)){
    echo "文章標題不可為空白";
    exit;
}

if ($connect->query($sql) === true) {
    $article_id = $connect->insert_id;
    $count =1;

    foreach ($_FILES["files"]["error"] as $key => $error) {
        if ($error == 0) {
            $tmp_name = $_FILES["files"]["tmp_name"][$key];
            $extension = pathinfo($_FILES["files"]["name"][$key], PATHINFO_EXTENSION);
            $name = filename($article_id,$count,$extension);

            if (move_uploaded_file($tmp_name, "../upload_img/" .$name)) {
                $img_paths[] ="../upload_img/". $name;
                $sql_img = "INSERT INTO article_img (article_id,img_path) VALUE ('$article_id','$name')";
                if($connect->query($sql_img)==true){
                    echo "success";
                }
                $count ++;
            }
        }
    }

    header("location:article_title.php");
} else {
    echo "文章發表錯誤" . $connect->error;
}



// 將圖片路徑存儲為 JSON 格式
// $img_paths_json = json_encode($img_paths);


// if($_FILES["file"]["error"]==0){
//     if(move_uploaded_file($_FILES["file"]["tmp_name"],"../upload_img/".$_FILES["file"]["name"])){
//         echo "upload success";
//     }else{
//         echo "upload failed";
//     }
// }


// $img_path="../upload_img/".$_FILES["file"]["name"];

// $content .= '<img src="' . $img_path . '" alt="Uploaded Image">';
