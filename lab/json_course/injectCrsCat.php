<?php
$to_tools = "/xampp/htdocs/tools/";
require_once($to_tools . "connectDB_fdd.php");
//todo 本地測試用
include($to_tools . "console-lib.php");

//* 從 json 取出資料
$json = file_get_contents('./course.json');
$crsArr = json_decode($json, true)['data'];

$rawArr = [];

foreach ($crsArr as $course) :
    $temp = [];
    $temp['id'] = $course[0];
    $temp['tags'] = $course[4];
    array_push($rawArr, $temp);
endforeach;

//* 排

$valArr = [];
foreach ($rawArr as $course) :
    $course_id = $course['id'];
    $tagArr = $course['tags'];
    foreach ($tagArr as $tag) :
        $sql_search = "SELECT id FROM crs_categories WHERE category = '$tag'";
        $result = $conn->query($sql_search);
        $category_id = $result->fetch_assoc()['id'];
        array_push($valArr, "($course_id, $category_id)");
    endforeach;
endforeach;

$valStr = implode(', ', $valArr);

$sql = "INSERT INTO course_category (course_id, category_id) VALUES $valStr";
// echo $sql;
if ($conn->query($sql) === FALSE) :
    echo "匯入失敗";
else:
    echo "匯入完成";
endif;
