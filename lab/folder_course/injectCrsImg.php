<?php
require_once('C:\xampp\htdocs\connectDB_fdd.php');
include("../../tools/console-lib.php");


$images = glob("./crs_img/main/{*.gif,*.jpg,*.png}", GLOB_BRACE);

$valStrArr = [];
foreach ($images as $img) :
    $file_name = substr($img, -13);
    $name = substr($img, -13, -4);
    $genre = substr($name, 0, 2);
    $item_id =  substr($name, 2, 6);
    $item_sub_id =  substr($name, -1);

    $valueStr = "('$genre', '$item_id', '$item_sub_id', '$file_name')";
    array_push($valStrArr, $valueStr);
endforeach;

$sql_VALUES = "VALUES " . implode(", ", $valStrArr);

$sql = "INSERT INTO images_stored (genre, item_id, item_sub_id, file_name) $sql_VALUES";

if ($conn->query($sql) == true) :
    echo "匯入完成";
else :
    echo "匯入失敗";
endif;
