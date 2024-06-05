<?php
//====================== imports ==========================
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_fdd . "tools/tool-lib.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");

//====================== variables ==========================
// 定值參數
$PAGE_LIMIT = 5;
$LINK_HERE = "crs-list.php"; // 本頁連結
$URL = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

// 變數初始化
$pageTitle = "課程列表";

//抓取是否只要上架
$onlyValid = isset($_GET['onlyValid']) && ($_GET['onlyValid'] == 1);
//todo 此篩選功能尚未

//====================== sql 初始 3 值 for 一般模式 ==========================
$sql_SELECT = "SELECT courses.*, images_stored.file_name FROM courses";
$sql_JOIN = 'JOIN images_stored ON courses.id = images_stored.item_id AND images_stored.item_sub_id = 1';
$sql_WHERE = $onlyValid ? " WHERE deleted_at is NULL" : "";

//====================== 模式分流 ==========================
// 缺少必要的分頁或排序參數時
if (!isset($_GET['page']) || !isset($_GET['order'])) :
    leadTo("$LINK_HERE?page=1&order=0");
endif;
//分頁與排序的處理在後面

//*====================== tag 篩選模式
if (isset($_GET['tag_id'])) :
    if (!isset($_GET['page'])) :
        leadTo($URL . "&page=1");
    endif;

    //====搜尋 tag 名稱
    $tag_id = $_GET['tag_id'];
    $sql_get_name = "SELECT category FROM crs_categories WHERE id = $tag_id";
    $tag_name = $conn->query($sql_get_name)->fetch_assoc()['category'];
    $pageTitle = "含有 <span class='crs-list_tags'>#$tag_name</span> 的課程列表";

    //====將課程的 id 與指定類別名稱併入 courses 資料表
    $sql_SELECT = "SELECT *, course_category.course_id, course_category.category_id, images_stored.file_name FROM courses";
    $sql_JOIN = "JOIN course_category ON courses.id = course_category.course_id"
    ." JOIN images_stored ON course_category.course_id = images_stored.item_id AND images_stored.item_sub_id = 1";
    $sql_WHERE .= ($onlyValid ? "AND" : "WHERE") . " category_id = $tag_id";
endif;

//*====================== 排序
$order_code = $_GET['order'];
$order_mode_code = floor($_GET['order'] / 10);
$isASC = $order_code % 10;

switch ($order_code):
    case 0:
        $sql_ORDER = "ORDER BY courses.id DESC";
        break;
    case 1:
        $sql_ORDER = "ORDER BY courses.id ASC";
        break;
    case 10:
        $sql_ORDER = "ORDER BY courses.price DESC";
        break;
    case 11:
        $sql_ORDER = "ORDER BY courses.price ASC";
        break;
    case 20:
        $sql_ORDER = "ORDER BY courses.created_at DESC";
        break;
    case 21:
        $sql_ORDER = "ORDER BY courses.created_at ASC";
        break;
    case 30:
        $sql_ORDER = "ORDER BY courses.deleted_at DESC";
        break;
    case 31:
        $sql_ORDER = "ORDER BY courses.deleted_at ASC";
        break;
    default:
        $sql_ORDER = "ORDER BY courses.id DESC";
    endswitch;

//*====================== 分頁
$page = $_GET['page'];
$start_data = ($page - 1) * $PAGE_LIMIT;
$sql_LIMIT = "LIMIT $start_data, $PAGE_LIMIT";

//*====================== 執行 mySQL
$sqlArr = [$sql_SELECT, $sql_JOIN, $sql_WHERE, $sql_ORDER];
$sql = implode(' ', $sqlArr);

//*生成總頁數
$crsCount = $conn->query($sql)->num_rows;
$NUM_PAGES = ceil($crsCount / $PAGE_LIMIT);



//*當頁內容
$sql .= ' ' . $sql_LIMIT;
$result = $conn->query($sql);
$crsArr = $result->fetch_all(MYSQLI_ASSOC);