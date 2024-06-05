<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "/db_connect.php");
include($to_fdd . "tools/tool-lib.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");
session_start();

// $crs_id = $_GET['id'];
// $sql = "SELECT * FROM courses WHERE id = $crs_id";
// $crs = $conn->query($sql)->fetch_assoc();
// if (empty($crs)) :
//     leadTo('crs-detail.php?id=' . $crs_id);
// endif;
$BACK_LINK = "crs-list.php";

function printErrorMsg($item)
{
    if (isset($_SESSION["error_msg"][$item])) :
        echo $_SESSION["error_msg"][$item];
        unset($_SESSION["error_msg"][$item]);
    endif;
}

?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>新增課程 | Fundodo</title>
    <?php include($to_fdd . "tools/common-head.php"); ?>
</head>

<body>
    <div class="container">
        <div class="fx-center">
            <div class="row justify-content-center">
                <h1 class="col-12 text-center my-3">新增課程</h1>
                <div class="col-auto">
                    <form action="doCreateCrs.php" method="post" enctype="multipart/form-data">
                        <table class="crs-detail_table">
                            <tr>
                                <th>課程名稱</th>
                                <td>
                                    <input type="text" name="title" class="form-control text-center">
                                    <p class="text-danger">
                                        <?php printErrorMsg("title"); ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>課程摘要</th>
                                <td>
                                    <textarea name="abstract" rows='6'></textarea>
                                    <p class="text-danger">
                                        <?php printErrorMsg("abstract"); ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>課程用圖</th>
                                <td>
                                    <input type="file" name="imageArr[]" class="form-control text-center" multiple>
                                    <p class="text-danger">
                                        <?php printErrorMsg("file"); ?>
                                    </p>
                                </td>
                                </td>
                            </tr>
                            <?php
                            //todo 上傳前預覽功能
                            // if (is_uploaded_file($_FILES['images']['tmp_name'])):
                            // endif;
                            ?>
                            <tr>
                                <th>課程價格</th>
                                <td>
                                    <input type="number" name="price" class="form-control text-center">
                                    <p class="text-danger">
                                        <?php printErrorMsg("price"); ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>結束編輯</th>
                                <td>
                                    <div class="hstack justify-content-around">
                                        <button type="button" class="btn-x" id="pop-c-act">
                                            放棄新增
                                        </button>
                                        <button type="reset" class="btn-x" id="pop-c-act">
                                            清除全部
                                        </button>
                                        <button type="submit" class="btn-o">
                                            上架課程
                                        </button>
                                        <!-- todo 上傳確認 -->

                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal 1: 編輯課程完成 -->
    <!-- Modal 2: 取消確認 -->
    <div class="popout-confirm" id="popout-confirm">
        <div class="window animate__animated animate__bounceIn">
            <h2>確定中止新增流程嗎？</h2>
            <p>離開後，將會刪除此頁面中已輸入的資訊。</p>
            <div class="mt-3 hstack gap-3 justify-content-center">
                <a href="<?= $BACK_LINK ?>" class="btn-x-text px-3">確定離開</a>
                <button class="btn-o-text px-3" id="pop-c-btn">繼續編輯</button>
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