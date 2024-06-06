<?php
require_once("../db_connect.php");
session_start();

$sql_sort = "SELECT * FROM article_sort";
$re_sort = $conn->query($sql_sort);
$sort_rows = $re_sort->fetch_all(MYSQLI_ASSOC);

$sql_article = "SELECT * FROM article";
$re_article = $conn->query($sql_article);
$all_article = $re_article->num_rows;


$sql_where = "WHERE article_delete=0";

if (!isset($_GET["sort"]) && !isset($_GET["search"]) && !isset($_GET["page"])) {
    header("location:article_title.php?page=1");
}

if (isset($_GET["sort"])) {
    $sort = $_GET["sort"];
    $sql_where = "WHERE article.sort='$sort' AND article_delete=0";

    $sql_article = "SELECT * FROM article WHERE sort=$sort";
    $re_article = $conn->query($sql_article);
    $all_article = $re_article->num_rows;

    $page = isset($_GET["page"]) ? $_GET["page"] : 1;
    $per_page = 17;
    $fir_item = ($page - 1) * $per_page;
    $page_count = ceil($all_article / $per_page);

    $sql_limit = " LIMIT $fir_item,$per_page ";
} elseif (isset($_GET["search"])) {
    $search = $_GET["search"];
    $sql_where = "WHERE article.title Like'%$search%' AND article_delete=0";
    $page = isset($_GET["page"]) ? $_GET["page"] : 1;
    $per_page = 17;
    $fir_item = ($page - 1) * $per_page;
    $page_count = ceil($all_article / $per_page);

    $sql_limit = " LIMIT $fir_item,$per_page ";
} else {
    $page = isset($_GET["page"]) ? $_GET["page"] : 1;
    $per_page = 17;
    $fir_item = ($page - 1) * $per_page;
    $page_count = ceil($all_article / $per_page);

    $sql_limit = " LIMIT $fir_item,$per_page ";
}





$sql = "SELECT article.*,article_sort.sort AS arti_sort,users.id AS users_id,users.nickname FROM article
JOIN article_sort ON article.sort = article_sort.id 
JOIN users ON article.userid = users.id
$sql_where 
ORDER BY article.create_at DESC $sql_limit
";

$re = $conn->query($sql);
$rows = $re->fetch_all(MYSQLI_ASSOC);
$page_title = "文章列表";



?>
<!doctype html>
<html lang="en">

<head>
    <title><?= $page_title ?></title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body>
    <div class="d-flex">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
        <div class="w-100">
            <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
            <div class="db_content">
                <div class="container">
                    <div class="d-flex justify-content-between mb-2">
                        <a href="../dashboard/dashboard.php" class="btn btn-primary">首頁</a>
                        <div>
                            <?php if (empty($_SESSION)) : ?>
                                <a href="../Member/login.php" class="btn btn-primary">登入</a>
                            <?php else : ?>
                                Hi,<?= $_SESSION["user"]["nickname"] ?>
                                <a href="arti_session-destory.php" class="btn btn-primary">登出</a>
                            <?php endif ?>
                        </div>
                    </div>

                    <ul class="nav nav-tabs mb-2">
                        <li class="nav-item">
                            <a class="nav-link <?php if (!isset($_GET["sort"])) echo "active" ?>" href="article_title.php?page=1">所有文章</a>
                        </li>

                        <?php foreach ($sort_rows as $title_sort) : ?>
                            <li class="nav-tiem">
                                <a class="nav-link <?php if (isset($_GET["sort"]) && $sort == $title_sort["id"]) echo "active"; ?>" href="article_title.php?sort=<?= $title_sort["id"] ?>&page=1"><?= $title_sort["sort"] ?></a>
                            </li>
                        <?php endforeach; ?>


                    </ul>

                    <div class="d-flex 
                    <?php if(!empty($_SESSION)){echo "justify-content-between";
                    }else{
                        echo "justify-content-end";
                    } ?> 
                    mb-2">
                        <?php if (!empty($_SESSION)) : ?>
                            <a class="btn btn-primary" href="article_create.php">發表文章</a>
                        <?php endif ?>
                        <form action="" class="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="搜尋文章" name="search">
                                <button class="btn btn-info" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="fixed-height-table">

                        <table class="table table-bordered">
                            <thead>
                                <tr class="text-nowrap">
                                    <th>分類</th>
                                    <th>文章列表</th>
                                    <th>發文時間</th>
                                    <th>發文者</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($rows as $article) : ?>
                                    <tr class="text-nowrap">
                                        <td><a href="article_title.php?sort=<?= $article["sort"] ?>&page=1"><?= $article["arti_sort"] ?></a></td>
                                        <td>
                                            <div class="arti-title"><a href="article_content.php?Aid=<?= $article["id"] ?>"><?= $article["title"] ?></a></div>
                                        </td>
                                        <td><?= $article["create_at"] ?></td>
                                        <td><?= $article["nickname"] ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <?php if (isset($_GET["page"])) : ?>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <?php if (isset($_GET["page"]) && isset($_GET["sort"])) : ?>
                                    <?php for ($i = 1; $i <= $page_count; $i++) : ?>
                                        <li class="page-item"><a class="page-link
                            <?php if ($i == $page) echo "active" ?>
                            " href="?sort=<?= $sort ?>&page=<?= $i ?>"><?= $i ?></a></li>
                                    <?php endfor; ?>
                                <?php elseif (isset($_GET["page"])) : ?>
                                    <?php for ($i = 1; $i <= $page_count; $i++) : ?>
                                        <li class="page-item"><a class="page-link
                            <?php if ($i == $page) echo "active" ?>
                            " href="?page=<?= $i ?>"><?= $i ?></a></li>
                                    <?php endfor; ?>
                                <?php endif ?>

                            </ul>
                        </nav>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>

</html>