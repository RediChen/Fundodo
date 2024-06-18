<?php
$to_fdd = "/xampp/htdocs/Fundodo/";
require_once($to_fdd . "db_connect.php");
//todo 本地測試用
include($to_fdd . "tools/console-lib.php");
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");

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
  <?php include $to_fdd . "tools/common-head.php"; ?>
</head>

<body>
  <div class="container">
    <div class="fx-center">
      <div class="row justify-content-center">
        <h1 class="col-12 text-center my-3">新增課程</h1>
        <div class="col-auto">
          <form action="doCreateCrs.php" method="post" enctype="multipart/form-data">
            <table class="table-1row">
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
                  <input type="file" name="imageArr[]" class="form-control text-center" multiple id="upload-img">
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
                  <input type="number" name="price" class="form-control text-center no-arrow">
                  <p class="text-danger">
                    <?php printErrorMsg("price"); ?>
                  </p>
                </td>
              </tr>
              <tr>
                <th>結束編輯</th>
                <td>
                  <div class="hstack justify-content-around">
                    <button type="button" class="btn btn-danger text-light" id="pop-c-act">
                      放棄新增
                    </button>
                    <button type="reset" class="btn btn-danger text-light" id="pop-c-act">
                      清除全部
                    </button>
                    <button type="submit" class="btn btn-primary text-light">
                      上架課程
                    </button>
                    <!-- todo 上傳確認 -->

                  </div>
                </td>
              </tr>
            </table>
          </form>
        </div>
        <div class="col-6">
          <div id="thumbnail-box">
            <img src="" alt="" class="thumbnails object-fit-cover" style="display: none; max-width: 500px">
          </div>
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
        <a href="<?= $BACK_LINK ?>" class="btn btn-danger text-light px-3">確定離開</a>
        <button class="btn btn-primary text-light px-3" id="pop-c-btn">繼續編輯</button>
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
  <script>
    // const upload = document.querySelector("#upload-img");
    // const box = document.querySelector("#thumbnail-box");
    // let counter = 0;
    // upload.addEventListener("change", e => {
    //   let input = e.target;
    //   let reader = new FileReader(); //物件
    //   let outputStr = "";
    //   //================================================
    //   for (let file of input.files) {

    //     //以.readAsDataURL將上傳檔案轉換為base64字串
    //     let async = () => {
    //       return new Promise((resolve) => {
    //         resolve(reader.readAsDataURL(file));
    //       });
    //     }
    //     async().then(() => {
    //       console.log("在這");
    //       let dataURL = reader.result;
    //       outputStr += `<img src="${dataURL}" class="thumbnails object-fit-cover" style="max-width: 500px">`;
    //       console.log('現在 outputStr = ' + outputStr);
    //     });

    //   }
    //   //================================================
    //   Promise.all(outputStr).then(() => {
    //     console.log('最後: ' + outputStr);
    //     box.innerHTML = outputStr;
    //   });
    // });
  </script>
</body>

</html>