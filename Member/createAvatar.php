<?php
session_start();
if (!isset($_SESSION["user"])) {
  header("Location: login.php");
  exit();
}
require_once("/xampp/htdocs/Fundodo/db_connect.php");
if (isset($_GET["id"])) {
  $user_id = $_GET['id'];
  $sql = "SELECT * FROM users WHERE id = $user_id";
  $result = $conn->query($sql);
} else {
  $user_id = $_SESSION['user']['id'];
  $sql = "SELECT * FROM users WHERE id = $user_id";
  $result = $conn->query($sql);
}

if ($result->num_rows > 0) {
  $row = $result->fetch_assoc();
} else {
  echo "未找到用户信息";
}

$sql_images = "SELECT * FROM users WHERE id = $user_id";
$result_images = $conn->query($sql_images);
$rows_images = $result_images->fetch_all(MYSQLI_ASSOC);

$conn->close();
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
  <title>會員中心</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
  <div class="db_header hstack">
    <span class="title">Fundodo</span>
    <a href="../article/article_title.php" class="btn btn-primary ms-3">文章首頁</a>

    <span class="user ms-auto">Hi, <?= $_SESSION["user"]["nickname"] ?> <a href="/fundodo/dashboard/session-destory.php?logout=1" class="btn btn-primary ms-3">登出</a></span>
  </div>

  <div class="container">
    <div class="row justify-content-center">
      <h2 class="col-12 text-center">上傳頭像</h2>
      <!-- <div class="col-lg-12">
        <form action="DoAvatarUpload.php?id=<?= $row["id"] ?>" method="post" enctype="multipart/form-data">
          <div class="mb-2">
            <label for="" class="form-label">選擇檔案</label>
            <input type="file" class="form-control" name="avatar_file">
          </div>
          <button class="btn btn-info" type="submit">送出</button>
        </form>
      </div> -->
      <!-- <div class="col-lg-6">
        <div class="row g-3">
          <?php foreach ($rows_images as $image) : ?>
            <div class="col-lg-4 col-md-6">
              <div class="ratio ratio-1x1">
                <img src="../avatar/<?= $image["avatar_file"] ?>" alt="" class="object-fit-cover">
                <h2 class="h4"><?= $image["avatar"] ?></h2>
              </div>
            </div>
          <?php endforeach; ?>
        </div>
      </div> -->

      <form action="DoAvatarUpload.php?id=<?= $row["id"] ?>" method="post" enctype="multipart/form-data" class="table-1d col-8">
        <table class="mx-auto">
          <tr>
            <th>原先頭像</th>
            <th></th>
            <th>將改頭像</th>
          </tr>
          <tr>
            <td></td>
            <th></th>
            <td>
              <div class="hstack">
                <input type="file" name="avatar" class="form-control text-center" id="toUpload">
              </div>

            </td>
          </tr>
          <tr>
            <td style="min-width: 320px;">
              <div class="ratio ratio-1x1">
                <img src="../avatar/<?= $image["avatar_file"] ?>" alt="" class="object-fit-cover">
                <h2 class="h4"><?= $image["avatar"] ?></h2>
              </div>
            </td>
            <th class="text-light display-5"><i class="fa-solid fa-circle-right fa-lg"></i>
            <br>
              <button class="btn btn-primary" type="submit">送出</button>
            </th>
            <td style="min-width: 320px;">
              <div id="thumbnail-box">
                <img src="" alt="" class="thumbnails object-fit-cover" style="display: none; max-width: 500px" id="img-showcase">
              </div>
            </td>
          </tr>
        </table>
      </form>
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