<?php
$to_tools = "/xampp/htdocs/Fundodo/tools/";
require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_tools . "tool-lib.php");
//todo 本地測試用
include($to_tools . "/console-lib.php");

/** 本頁連結 */
$linkHere = "crs-detail.php";
$pageTitle = "課程詳細資料";

if (!isset($_GET['id'])) :
    echo "請循正常管道進入本頁";
    // todo: 做 modal，點擊後待 3 秒導引至 crs-list
    exit;
    sleep(3);
    leadTo('crs-list.php');
endif;

$crs_id = $_GET['id'];
$sql = "SELECT * FROM courses WHERE id = $crs_id";
$crs = $conn->query($sql)->fetch_assoc();

?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>課程管理 | Fundodo</title>
    <?php include($to_tools . "common-head.php"); ?>
</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-end">
            <a href="crs-list.php" class="btn-o">
                <i class="fa-solid fa-right-to-bracket"></i>
                <span class="MS-3">返回課程列表</span>
            </a>
        </div>
        <div class="fx-center">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-9">
                    <table class="crs-detail_table">
                        <tr>
                            <th>ID</th>
                            <td><?= $crs['id'] ?></td>
                        </tr>
                        <tr>
                            <th>課程名稱</th>
                            <td><?= $crs['title'] ?></td>
                        </tr>
                        <tr>
                            <th>課程摘要</th>
                            <td><?= $crs['abstract'] ?></td>
                        </tr>
                        <tr>
                            <th>課程縮圖</th>
                            <td>（施工中）</td>
                        </tr>
                        <tr>
                            <th>課程價格</th>
                            <td><?= $crs['price'] ?></td>
                        </tr>
                        <tr>
                            <th>觀看人次</th>
                            <td>（施工中）</td>
                        </tr>
                        <tr>
                            <th>上架狀態</th>
                            <td>
                                <?= $crs['deleted_at'] ? '已於' . $crs['deleted_at'] . '下架' : '在架上' ?>
                            </td>
                        </tr>
                        <tr>
                            <th>編輯課程</th>
                            <td class="hstack gap-2 justify-content-center">
                                <a href="" class="btn-o btn-sq" title="編輯課程">
                                    <i class="fa-regular fa-pen-to-square"></i>
                                </a>
                                <button class="btn-x btn-sq" id="pop-c-act" title="下架課程">
                                    <i class="fa-solid fa-video-slash"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal 1: 編輯課程完成 -->
    <!-- Modal 2: 刪除課程確認 -->
    <div class="popout-confirm" id="popout-confirm">
        <div class="window animate__animated animate__bounceIn">
            <h2>確定下架課程嗎？</h2>
            <div class="mt-3 hstack gap-3 justify-content-center">
                <a href="doDeleteCrs.php?delete=true&id=<?= $crs_id ?>" class="btn-x-text px-3">下架</a>
                <button class="btn-o-text px-3" id="pop-c-btn">算了</button>
            </div>
        </div>
    </div>

    <script>
        const popout_c = document.getElementById("popout-confirm");
        const btn_act_c = document.getElementById("pop-c-act");
        const btn_close_c = document.getElementById("pop-c-btn");
        btn_act_c.addEventListener("click", () => {
            popout_c.style.display = "flex";
        });
        btn_close_c.addEventListener("click", () => {
            popout_c.style.display = "none";
        });
    </script>
</body>

</html>