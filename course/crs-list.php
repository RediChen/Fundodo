<?php
$to_tools = "/xampp/htdocs/tools/";
require_once($to_tools . "connectDB_fdd.php");
//todo 本地測試用
include($to_tools . "console-lib.php");

/** 本頁連結 */
$linkHere = "crs-list.php";
$pageTitle = "課程列表";

//* tag 篩選模式
if (isset($_GET['tag_id'])) :
    $tag_id = $_GET['tag_id'];
    $sql_get_name = "SELECT category FROM crs_categories WHERE id = $tag_id";
    $tag_name = $conn->query($sql_get_name)->fetch_assoc()['category'];
    $pageTitle = "含有 <span class='crs-list_tags'>#$tag_name</span> 的課程列表";

    $sql_search = "SELECT course_id FROM course_category WHERE course_category.category_id = " . $tag_id;
    $rows = $conn->query($sql_search)->fetch_all(MYSQLI_ASSOC);

    $target_strArr = [];
    foreach ($rows as $row) :
        array_push($target_strArr, "id = " . $row['course_id']);
    endforeach;
    $sql_SELECT = "SELECT * FROM courses WHERE " . implode(' OR ', $target_strArr);
//* 一般模式
else :
    $sql_SELECT = "SELECT * FROM courses";
endif;

$sql_ORDER = "ORDER by id";
$sql = $sql_SELECT . ' ' . $sql_ORDER;
$crsArr = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>課程管理 | Fundodo</title>
    <?php include($to_tools . "common-head.php"); ?>
</head>

<body class="text-bg-dark">
    <div class="container">
        <h1 class="text-center my-3"><?= $pageTitle ?></h1>
        <div class="crs-list_info p-3">
            <div></div>
            <div>
                <a href="<?= $linkHere ?>" class="btn-x crs-list_edit-btn" title="取消篩選">
                    <i class="fa-solid fa-filter-circle-xmark fa-lg"></i>
                </a>
            </div>
        </div>
        <table class="crs-list_table">
            <thead>
                <tr class="text-nowrap">
                    <th scope="col">課程 ID</th>
                    <th scope="col">課程標題</th>
                    <th scope="col">課程摘要</th>
                    <th scope="col">課程縮圖</th>
                    <th scope="col">課程價格</th>
                    <th scope="col">觀看人次</th>
                    <th scope="col" class="col-status">狀態</th>
                    <th scope="col">功能鈕</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($crsArr as $course) : ?>
                    <tr class="align-middle">
                        <th rowspan='2' class="text-center"><?= $course['id'] ?></th>
                        <td><?= $course['title'] ?></td>
                        <td><?= $course['abstract'] ?></td>
                        <td>
                            <img src="https://fakeimg.pl/160x90/?retina=1&text=課程縮圖&font=noto" class="crs-list_thumbnail">
                        </td>
                        <td class="text-end">NT$<?= number_format($course['price']) ?></td>
                        <td>（施工中）</td>
                        <?php $isOn = !empty($course['deleted_at']); ?>
                        <td class="<?= $isOn ? '' : 'text-nowrap' ?>"><?= $isOn ? $course['deleted_at'] : '在架上' ?></td>
                        <td class="text-center">
                            <a href="#" class="btn-o crs-list_edit-btn" title="完整數據">
                                <i class="fa-solid fa-info"></i>
                            </a>
                        </td>
                    </tr>
                    <tr class="align-middle">
                        <?php
                        //* 查詢所有的 tags 名
                        $sql = "SELECT crs_categories.* FROM course_category JOIN crs_categories ON course_category.category_id = crs_categories.id WHERE course_category.course_id = " . $course['id'];
                        $rows = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);

                        //* 重新打包
                        $tagArr = [];
                        foreach ($rows as $row) :
                            $tagArr[$row['id']] = $row['category'];
                        endforeach;
                        ?>
                        <td colspan="6">
                            <div class="hstack gap-3">
                                <?php foreach ($tagArr as $id => $category) : ?>
                                    <a href="?tag_id=<?= $id ?>" class="crs-list_tags">
                                        #<?= $category ?>
                                    </a>
                                <?php endforeach; ?>
                            </div>
                        </td>
                        <td class="text-center">
                            <!-- <div> -->
                            <a href="#" class="btn-o crs-list_edit-btn" title="編輯標籤">
                                <i class="fa-solid fa-hashtag"></i>
                            </a>
                            <!-- </div> -->
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>