<?php
require_once("../db_connect.php");

$id=$_GET["Aid"];


$sql="UPDATE article SET article_delete=1 WHERE id='$id'";


if($conn->query($sql)===true){
    echo "文章刪除成功";
}else{
    echo "文章刪除失敗".$content->error;
}
header("location: article_title.php");
?>