<?php
require_once("../db_connect.php");

$sql = "SELECT * FROM article";

$re = $connect->query($sql);
$row = $re->fetch_assoc();
?>


<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <?php include("../css.php"); ?>


</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <form action="do_create_article.php" method="post" enctype="multipart/form-data">
                    <div class="mb-2">
                        <label for="" class="form-label">
                            文章類別
                        </label>
                        <select class="form-control" id="sort" name="sort">
                            <option value="1" <?= $row["id"] == 1 ? "selected" : "" ?>>領養專區</option>
                            <option value="2" <?= $row["id"] == 2 ? "selected" : "" ?>>毛孩照片</option>
                            <option value="3" <?= $row["id"] == 3 ? "selected" : "" ?>>飼養心得</option>
                            <option value="4" <?= $row["id"] == 4 ? "selected" : "" ?>>疑難雜症</option>
                        </select>
                    </div>
                    <div class="mb-2">
                        <label for="" class="form-label">
                            *文章標題
                        </label>
                        <input type="text" class="form-control" name="title">
                        <div class="text-danger">

                        </div>
                    </div>
                    <div class="mb-2">
                        <label for="" class="form-label">
                            *文章內容
                        </label>
                        <textarea name="content" class="form-control" style="height: 350px"></textarea>
                    </div>
                    <div class="mb-2">
                        <label for="" class="form-label">選擇檔案</label>
                        <input name="files[]" type="file" class="form-control" multiple>
                    </div>
                    <div class="d-flex justify-content-between">
                    <button class="btn btn-primary" type="submit">發表</button>
                    <a href="article_title.php?page=1" class="btn btn-primary">取消發表</a>
                    </div>

                </form>
            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>