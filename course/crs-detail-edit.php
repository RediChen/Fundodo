<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");

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
if (empty($crs)) :
  leadTo("crs-detail.php?id=" . $crs_id);
endif;
//===============資料表: images_stored
$sql = "SELECT file_name FROM images_stored WHERE genre = 'CR' AND item_id = $crs_id AND item_sub_id = 1";
$crs_img_name = $conn->query($sql)->fetch_assoc()["file_name"];
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
  <title>課程管理 | Fundodo</title>
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
            <div style="width: 158px;"></div>
            <h1>編輯課程資料</h1>
            <a href="crs-list.php" class="btn btn-primary text-light fx-center">
              <i class="fa-solid fa-right-to-bracket"></i>
              <span class="ms-3">返回課程列表</span>
            </a>
          </div>
          <div class="fx-center">
            <div class="row justify-content-center">
              <div class="col-auto">
                <form action="./doUpdateCrs.php?id=<?= $crs_id ?>&edit=true" enctype="multipart/form-data" method="post">
                  <table class="table-1row">
                    <?php if (isset($_SESSION['error_msg']['crs-update'])) : ?>
                      <tr>
                        <td colspan="3">
                          <h2 class="text-danger">
                            <?= $_SESSION['error_msg']['crs-update'] ?>
                          </h2>
                          <?php unset($_SESSION['error_msg']['crs-update']); ?>
                        </td>
                      </tr>
                    <?php endif; ?>
                    <tr>
                      <td style="width: 364px;"><?= $crs["id"] ?></td>
                      <th>ID</th>
                      <td><?= $crs["id"] ?></td>
                      <input type="hidden" name="id" value="<?= $crs["id"] ?>">
                      <!-- 不允許更改 ID，但是因為接手的頁面還是需要 ID -->
                    </tr>
                    <tr>
                      <td class="text-nowrap"><?= $crs["title"] ?></td>
                      <th>課程名稱</th>
                      <td>
                        <input type="text" name="title" class="text-center" placeholder='<?= $crs["title"] ?>' value='<?= $crs["title"] ?>'>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <p style="text-align: justify;">
                          <?= $crs["abstract"] ?>
                        </p>
                      </td>
                      <th>課程摘要</th>
                      <td>
                        <textarea name="abstract" rows='6' value='<?= $crs["abstract"] ?>'><?= $crs["abstract"] ?></textarea>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <img src="../images/<?= $crs_img_name ?>" alt="" class="object-fit-cover">
                      </td>
                      <th>課程縮圖</th>
                      <td>
                        <input type="file" name="thumbnail" class="form-control text-center" id="toUpload">
                        <div id="thumbnail-box">
                          <img src="" alt="" class="thumbnails object-fit-cover" style="display: none; max-width: 500px" id="img-showcase">
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        NT$<?= number_format($crs["price"]) ?>
                      </td>
                      <th>課程價格</th>
                      <td>
                        <input type="number" name="price" class="text-center" placeholder='<?= $crs["price"] ?>' value='<?= $crs["price"] ?>'>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <?= $crs["deleted_at"]
                          ? "已於" . $crs["deleted_at"] . "下架"
                          : "在架上" ?>
                      </td>
                      <th>上架狀態</th>
                      <td>
                        <?php if ($crs["deleted_at"]) : ?>
                          <button class="btn btn-primary mx-auto" id="pop-c-act" title="下架課程">
                            重新上架
                          </button>
                        <?php else : ?>
                          <button class="btn btn-danger mx-auto" id="pop-c-act" title="下架課程">
                            下架課程
                          </button>
                        <?php endif; ?>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <a href="./crs-detail.php?id=<?= $crs_id ?>" class="btn btn-primary btn-sq rounded-circle fx-center mx-auto" title="取消變更">
                          <i class="fa-solid fa-check"></i>
                        </a>
                      </td>
                      <th>結束編輯</th>
                      <td>
                        <button type="submit" class="btn btn-danger btn-sq rounded-circle fx-center mx-auto" title="確定更新">
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
      </div>
    </div>
  </div>

  <!-- Modal 1: 編輯課程完成 -->
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
    const upload = document.querySelector("#toUpload");
    const img = document.querySelector("#img-showcase");
    let counter = 0;
    upload.addEventListener("change", e => {
      let input = e.target;
      let reader = new FileReader(); //物件

      console.log(input);
      reader.readAsDataURL(input.files[0]);
      reader.onload = () => {
        let dataURL = reader.result;
        img.setAttribute('src', dataURL);
        img.style.display = "inline";
      }
    });
  </script>
</body>

</html>