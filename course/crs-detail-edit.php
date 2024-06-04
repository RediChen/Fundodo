<?php
$to_tools = "/xampp/htdocs/Fundodo/tools/";
require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_tools . "tool-lib.php");
//todo 本地測試用
include($to_tools . "/console-lib.php");

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
if (empty($crs)) :
    leadTo('crs-detail.php?id=' . $crs_id);
endif;

?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>課程管理 | Fundodo</title>
    <?php include($to_tools . "common-head.php"); ?>
</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-between">
            <div></div>
        <h1>編輯課程資料</h1>
            <a href="crs-list.php" class="btn-o">
                <i class="fa-solid fa-right-to-bracket"></i>
                <span class="MS-3">返回課程列表</span>
            </a>
        </div>
        <div class="fx-center">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <form action="./doUpdateCrs.php?id=<?= $crs_id ?>&edit=true" method="post">
                        <table class="crs-detail_table">
                            <tr>
                                <td style="width: 364px;"><?= $crs['id'] ?></td>
                                <th>ID</th>
                                <td><?= $crs['id'] ?></td>
                                <input type="hidden" name="id" value="<?= $crs['id'] ?>">
                                <!-- 不允許更改 ID，但是因為接手的頁面還是需要 ID -->
                            </tr>
                            <tr>
                                <td class="text-nowrap"><?= $crs['title'] ?></td>
                                <th>課程名稱</th>
                                <td>
                                    <input type="text" name="title" class="text-center" placeholder='<?= $crs['title'] ?>' value='<?= $crs['title'] ?>'>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="text-align: justify;">
                                        <?= $crs['abstract'] ?>
                                    </p>
                                </td>
                                <th>課程摘要</th>
                                <td>
                                    <textarea name="abstract" rows='6' value='<?= $crs['abstract'] ?>'><?= $crs['abstract'] ?></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>（施工中）</td>
                                <th>課程縮圖</th>
                                <td>（施工中）</td>
                            </tr>
                            <tr>
                                <td>
                                    NT$<?= number_format($crs['price']) ?>
                                </td>
                                <th>課程價格</th>
                                <td>
                                    <input type="number" name="price" class="text-center" placeholder='<?= $crs['price'] ?>' value='<?= $crs['price'] ?>'>
                                </td>
                            </tr>
                            <tr>
                                <td>（施工中）</td>
                                <th>觀看人次</th>
                                <td>（施工中）</td>
                                <input type="hidden" name="view" value="0">
                            </tr>
                            <tr>
                                <td>
                                    <?= $crs['deleted_at'] ? '已於' . $crs['deleted_at'] . '下架' : '在架上' ?>
                                </td>
                                <th>上架狀態</th>
                                <td>
                                    <?php if ($crs['deleted_at']) : ?>
                                        <button class="btn-o mx-auto" id="pop-c-act" title="下架課程">
                                            重新上架
                                        </button>
                                    <?php else : ?>
                                        <button class="btn-x mx-auto" id="pop-c-act" title="下架課程">
                                            下架課程
                                        </button>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="./crs-detail.php?id=<?= $crs_id ?>" class="btn-o btn-circle mx-auto" title="取消變更">
                                        <i class="fa-solid fa-check"></i>
                                    </a>
                                </td>
                                <th>結束編輯</th>
                                <td>
                                    <button type="submit" class="btn-x btn-circle mx-auto" title="確定更新">
                                        <i class="fa-solid fa-check"></i>
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
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