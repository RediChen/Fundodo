<?php
require_once("../db_connect.php");
if (!isset($_GET["Aid"])) {
    header("location: aritcle_title.php");
    exit;
}
$url = '/upload_img/';
$arti_id = $_GET["Aid"];

$sql = "SELECT * FROM article WHERE id=$arti_id AND article_delete=0";
$sql_img="SELECT * FROM article_img WHERE article_id='$arti_id'";
$sql_sort="SELECT * FROM article_sort";

$re = $connect->query($sql);
$re_img=$connect->query($sql_img);
$re_sort=$connect->query($sql_sort);
$row = $re->fetch_assoc();


if ($re->num_rows > 0) {
    $arti_exist = true;
    $title = $row["title"];
} else {
    $arti_exist = false;
}


?>
<!doctype html>
<html lang="zh-Hant">

<head>
    <title><?= htmlspecialchars($title) ?></title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
    <script src="https://cdn.ckeditor.com/4.17.1/standard/ckeditor.js"></script>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <form action="do_edit_article.php" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<?= $arti_id ?>">
                    <div class="mb-2">
                        <label for="sort" class="form-label">文章類別</label>
                        <select class="form-control" id="sort" name="sort">
                        <?php while ($row_sort = $re_sort->fetch_assoc()): ?>
                            <option value="<?= $row_sort["id"] ?>" <?= $row["sort"] == $row_sort["id"] ? "selected" : "" ?>><?= $row_sort["sort"] ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="mb-2">
                        <label for="title" class="form-label">*文章標題</label>
                        <input type="text" class="form-control" id="title" name="title" value="<?= htmlspecialchars($row["title"]) ?>">
                    </div>
                    <div class="mb-2">
                        <label for="editor" class="form-label">*文章內容</label>
                        <textarea id="editor" name="content" class="form-control" style="height: 350px"><?= htmlspecialchars($row["content"]) ?></textarea>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">圖片</label><br>
                        <input name="files[]" type="file" class="form-control" multiple>
                        <?php
                        if ($re_img->num_rows > 0) {
                            while ($img_row = $re_img->fetch_assoc()) {
                                echo '<div class="img-container">';
                                echo '<img src="' . $img_row['img_path'] . '" alt="Article Image" style="max-width: 100%;"><br>';
                                echo '<input type="checkbox" name="delete_img[]" value="' . $img_row['id'] . '"> 刪除<br>';
                                echo '</div>';
                            }
                        }
                        ?>
                    </div>
                    <div class="d-flex justify-content-between">
                    <button class="btn btn-primary" type="submit">編輯</button>
                    <a href="article_content.php?Aid=<?= $arti_id ?>" class="btn btn-primary">取消編輯</a>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQ+Vc4jQ+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>

</html>