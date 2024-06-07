<?php
require_once("../db_connect.php");
session_start();

$sql_sort = "SELECT * FROM article_sort";
$re_sort = $conn->query($sql_sort);
$sort_rows = $re_sort->fetch_all(MYSQLI_ASSOC);


if (isset($_GET["Aid"])) {
  $arti_id = $_GET["Aid"];

  $sql = "SELECT article.*,article_sort.sort AS arti_sort,users.id AS users_id,users.nickname FROM article
    JOIN article_sort ON article.sort = article_sort.id
    JOIN users ON article.userid = users.id
    WHERE article.id='$arti_id'
    ";
  $sql_img = "SELECT * FROM article_img WHERE article_id='$arti_id'";
} else {
  header("location: article_title.php");
}

$re = $conn->query($sql);
$re_img = $conn->query($sql_img);
$row = $re->fetch_assoc();
$title = $row["title"];

$user_lv = !empty($_SESSION) ? $_SESSION["user"]["user_level"] : 0;
$user_nickname = !empty($_SESSION) ? $_SESSION["user"]["nickname"] : "遊客";
$user_userid = !empty($_SESSION) ? $_SESSION["user"]["id"] : "";


?>

<!doctype html>
<html lang="en">

<head>
  <title><?= $title ?></title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
  <!-- Vertically centered modal -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal fade" id="del_arti_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="del_modal_label" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="del_modal_label">Modal title</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            確定刪除此文章?
          </div>
          <div class="modal-footer">
            <a href="do_article_del.php?Aid=<?= $row["id"] ?>" type="button" class="btn btn-primary">確認</a>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="container">

    <div class="d-flex justify-content-between mb-2">
      <div>
        <?php if (isset($_SESSION["user"]) && ($_SESSION["user"]["user_level"] == 20)) : ?>
          <a href="../dashboard/dashboard.php" class="btn btn-primary">後台首頁</a>
        <?php endif; ?>
      </div>

      <div>
        <?php if (empty($_SESSION)) : ?>
          <a href="../member/user-CMS/login.php" class="btn btn-primary">登入</a>
        <?php else : ?>
          Hi, <?= $user_nickname ?>
          <a href="arti_session-destory.php" class="btn btn-primary ms-3">登出</a>
        <?php endif ?>
      </div>
    </div>

    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link <?php if (!isset($_GET["sort"])) echo "active" ?>" href="article_title.php?page=1">所有文章</a>
      </li>

      <?php foreach ($sort_rows as $title_sort) : ?>
        <li class="nav-tiem">
          <a class="nav-link <?php if (isset($_GET["sort"]) && $sort == $title_sort["id"]) echo "active"; ?>" href="article_title.php?sort=<?= $title_sort["id"] ?>&page=1"><?= $title_sort["sort"] ?></a>
        </li>
      <?php endforeach; ?>


    </ul>
    <div class="post_header">
      <div class="post_title">
        <h1><?= $row["title"] ?></h1>
      </div>
      <div class="sort">
        <a href="article_title.php?sort=<?= $row["sort"] ?>&page=1"><?= $row["arti_sort"] ?></a>
      </div>

      <div class="d-flex justify-content-between">
        <div class="user mt-3">
          <a href=""><?= $row["nickname"] ?></a>
        </div>
        <?php if ($user_lv == 20 || $user_userid == $row["userid"]) : ?>
          <div class="btn-area">
            <a href="article_edit.php?Aid=<?= $row["id"] ?>" class="btn btn-primary">
              編輯
            </a>
            <button class="btn btn-primary" title="刪除文章" data-bs-toggle="modal" data-bs-target="#del_arti_modal">刪除</button>
          </div>
      </div>
    <?php endif ?>

    </div>
    <hr>
    <div class="post_content">
      <p>
        <?= nl2br($row["content"]) ?>
        <?php
        if ($re_img->num_rows > 0) {
          while ($img_row = $re_img->fetch_assoc()) {
            echo '<div class="ratio ratio-1x1">';
            echo '<img src="' . "../upload_img/" . $img_row['img_path'] . '" alt="Article Image" class="object-fit-contain"><br>';
            echo '</div>';
          }
        }
        ?>
      </p>
    </div>
  </div>


  </div>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>