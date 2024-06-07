<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include $to_fdd . "tools/console-lib.php";
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");

/** 本頁連結 */
$linkHere = "crs-detail.php";

if (!isset($_GET["id"])) :
  echo "請循正常管道進入本頁";
  // todo: 做 modal，點擊後待 3 秒導引至 crs-list
  exit();
  sleep(3);
  leadTo("crs-list.php");
endif;

$crs_id = $_GET["id"];
//===============資料表: courses
$sql = "SELECT * FROM courses WHERE id = $crs_id";
$crs = $conn->query($sql)->fetch_assoc();
//===============資料表: images_stored
$sql = "SELECT file_name FROM images_stored WHERE genre = 'CR' AND item_id = $crs_id AND item_sub_id = 1";
$crs_img_name = $conn->query($sql)->fetch_assoc()["file_name"];

$pageTitle = empty($crs) ? "查無課程" : "課程完整資料";
$LINK_HERE = "crs-detail.php?id=$crs_id";
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
  <title><?= $pageTitle ?> | Fundodo</title>
  <?php include $to_fdd . "tools/common-head.php"; ?>
</head>

<body>
  <div class="d-flex">
    <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
    <div class="w-100">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
      <div class="db_content">
        <div class="container">
          <div class="my-3 d-flex justify-content-between align-items-center">
            <div></div>
            <h1><?= empty($crs) ? "" : "課程詳細資料" ?></h1>
            <a href="crs-list.php" class="btn btn-primary text-light">
              <i class="fa-solid fa-right-to-bracket"></i>
              <span class="MS-3">返回課程列表</span>
            </a>
          </div>
          <div class="fx-center">
            <div class="row justify-content-center">
              <?php if ($crs != null) : ?>
                <div class="col-lg-6 col-9">
                  <table class="table table-1d">
                    <tr>
                      <th>ID</th>
                      <td><?= $crs["id"] ?></td>
                    </tr>
                    <tr>
                      <th>課程名稱</th>
                      <td><?= $crs["title"] ?></td>
                    </tr>
                    <tr>
                      <th>課程摘要</th>
                      <td><?= $crs["abstract"] ?></td>
                    </tr>
                    <tr>
                      <th>課程縮圖</th>
                      <td><img src="../images/<?= $crs_img_name ?>" alt="" class="object-fit-cover"></td>
                    </tr>
                    <tr>
                      <th>課程價格</th>
                      <td>
                        NT$<?= number_format($crs["price"]) ?>
                      </td>
                    </tr>
                    <tr>
                      <th>觀看人次</th>
                      <td>（施工中）</td>
                    </tr>
                    <tr>
                      <th>上架狀態</th>
                      <td>
                        <?= $crs["deleted_at"]
                          ? "已於" . $crs["deleted_at"] . "下架"
                          : "在架上" ?>
                      </td>
                    </tr>
                    <tr>
                      <th>編輯課程</th>
                      <td class="hstack gap-2 justify-content-center">
                        <a href="crs-detail-edit.php?id=<?= $crs_id ?>" class="btn btn-primary btn-sq fx-center" title="編輯課程">
                          <i class="fa-regular fa-pen-to-square"></i>
                        </a>
                        <button class="btn btn-danger btn-sq fx-center" id="pop-c-act" title="下架課程">
                          <i class="fa-regular fa-eye-slash"></i>
                        </button>
                      </td>
                    </tr>
                  </table>
                </div>
              <?php else : ?>
                <div class="col-9">
                  <table class="crs-detail_table">
                    <tr>
                      <th>
                        <h1>查無 ID 為 <?= $crs_id ?> 之課程</h1>
                      </th>
                    </tr>
                  </table>

                </div>
              <?php endif; ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 1: 編輯課程完成 -->
  <?php if (isset($_GET["eComplete"]) && $_GET["eComplete"] == 1) : ?>
    <style>
      body {
        overflow-y: hidden;
      }
    </style>
    <div class="popout-notice" id="popout-notice">
      <div class="window animate__animated animate__bounceIn">
        <h2>已更新課程資料</h2>
        <a href="<?= $LINK_HERE ?>" class="btn btn-primary mt-3 px-3" id="pop-n-btn">好的</a>
      </div>
    </div>
    <script>
      //* Modal 1: 編輯課程完成
      const popout_n = document.getElementById("popout-notice");
      const btn_close_n = document.getElementById("pop-n-btn");
      btn_close_n.addEventListener("click", () => {
        popout_n.style.display = "none";
      });
    </script>
  <?php endif; ?>
  <!-- Modal 2: 刪除課程確認 -->
  <div class="popout-confirm" id="popout-confirm">
    <div class="window animate__animated animate__bounceIn">
      <h2>確定下架課程嗎？</h2>
      <div class="mt-3 hstack gap-3 justify-content-center">
        <a href="doDeleteCrs.php?delete=true&id=<?= $crs_id ?>" class="btn btn-danger px-3">下架</a>
        <button class="btn btn-primary px-3" id="pop-c-btn">算了</button>
      </div>
    </div>
  </div>

  <script>
    //* Modal 2: 刪除課程確認
    const popout_c = document.getElementById("popout-confirm");
    const btn_act_c = document.getElementById("pop-c-act");
    const btn_close_c = document.getElementById("pop-c-btn");
    btn_act_c.addEventListener("click", () => {
      console.log('點')
      popout_c.style.display = "flex";
    });
    btn_close_c.addEventListener("click", () => {
      popout_c.style.display = "none";
    });
  </script>
</body>

</html>