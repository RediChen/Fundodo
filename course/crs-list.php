<?php
include "./crs-list_header.php"; ?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
    <title>課程管理 | Fundodo</title>
    <?php include $to_fdd . "tools/common-head.php"; ?>
</head>

<body class="bg-light">
<div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="db_content">
        <div class="container">
        <div class="d-flex justify-content-between my-3">
            <div></div>
            <h1 class="text-center"><?= $pageTitle ?></h1>
            <a href="crs-detail-create.php" class="btn btn-primary fx-center text-light">
                新增課程
            </a>
        </div>
        <div class="crs-list_info p-3">
            <div>
                <p>
                    <?= "總共 $crsCount 筆，共 $NUM_PAGES 頁。此為第 " .
                        $_GET["page"] .
                        " 頁" ?>
                </p>
            </div>
            <div>
                <!-- 分頁切換列 -->
                <?php include "./crs_pagination.php"; ?>
            </div>
            <div class="hstack gap-3">
                <?php
                $fa_class = $isASC ? "short-wide" : "wide-short";
                $order_link = 10 * $order_mode_code + ($isASC ? 0 : 1);
                ?>
                <a href="?page=<?= $page ?>&order=<?= $order_link ?>" class="btn btn-primary text-light">
                    <i class="fa-solid fa-arrow-down-<?= $fa_class ?>"></i>
                </a>
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle text-light" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?php //$order_mode_code from _header

                        switch ($order_mode_code):
                            case 0:
                                echo "按 ID 排序";
                                break;
                            case 1:
                                echo "按價格排序";
                                break;
                            case 2:
                                echo "按上架時間排序";
                                break;
                            case 3:
                                echo "按下架時間排序";
                                break;
                            default:
                                echo "按 ID 排序";
                        endswitch; ?>
                    </button>
                    <ul class="dropdown-menu">
                        <?php function dropdownLink($code)
                        {
                            global $LINK_HERE;
                            global $page;
                            global $isASC;
                            $tagStr = isset($_GET["tag"])
                                ? "tag=" . $_GET["tag"] . "&"
                                : "";
                            $order_code = 10 * $code + $isASC;
                            return "$LINK_HERE?$tagStr" .
                                "page=$page&order=$order_code";
                        } ?>
                        <li>
                            <a class="dropdown-item" href="<?= dropdownLink(
                                                                0
                                                            ) ?>">按 ID 排序</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="<?= dropdownLink(
                                                                1
                                                            ) ?>">按價格排序</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="<?= dropdownLink(
                                                                2
                                                            ) ?>">按上架時間排序</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="<?= dropdownLink(
                                                                3
                                                            ) ?>">按下架時間排序</a>
                        </li>
                    </ul>
                </div>
                <?php if (isset($_GET["tag_id"])) : ?>
                    <a href="<?= $LINK_HERE ?>?page=1&order=<?= $_GET["order"] ?>" class="btn-x btn-sq" title="取消篩選">
                        <i class="fa-solid fa-filter-circle-xmark fa-lg"></i>
                    </a>
                <?php endif; ?>
            </div>
        </div>
        <table class="table-2d crs-list_table">
            <thead>
                <tr class="text-nowrap text-center">
                    <th scope="col">課程 ID</th>
                    <th scope="col">課程標題</th>
                    <th scope="col">課程摘要</th>
                    <th scope="col">課程縮圖</th>
                    <th scope="col">課程價格</th>
                    <th scope="col">觀看人次</th>
                    <th scope="col" class="col-status">狀態</th>
                    <th scope="col">功能鈕</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($crsArr as $course) : ?>
                    <?php $crs_id = isset($_GET["tag_id"])
                        ? $course["course_id"]
                        : $course["id"]; ?>
                    <tr class="align-middle">
                        <!-- rowspan='2'  -->
                        <th class="text-center"><?= $crs_id ?></th>
                        <td><?= $course["title"] ?></td>
                        <td><?= $course["abstract"] ?></td>
                        <td class="text-center">
                            <img src="../images/<?= $course["file_name"] ?>" alt="" class="crs-list_thumbnail">
                        </td>
                        <td class="text-end">
                            NT$<?= number_format($course["price"]) ?>
                        </td>
                        <td>（施工中）</td>
                        <?php
                        $isOn = empty($course["deleted_at"]);
                        $statusClass = $isOn ? "text-nowrap" : "";
                        $statusInfo = $isOn
                            ? "在架上"
                            : "已於 " . $course["deleted_at"] . "下架";
                        ?>
                        <td class="text-center <?= $statusClass ?>"><?= $statusInfo ?></td>
                        <td class="vstack align-items-center gap-2">
                            <a href="crs-detail.php?id=<?= $crs_id ?>" class="btn btn-primary btn-sq text-light fx-center" title="完整數據">
                                <i class="fa-solid fa-info"></i>
                            </a>
                            <a href="crs-detail-edit.php?id=<?= $crs_id ?>" class="btn btn-primary btn-sq text-light fx-center" title="編輯課程">
                                <i class="fa-solid fa-pen"></i>
                            </a>
                        </td>
                    </tr>
                    <tr class="align-middle">
                        <td></td>
                        <?php
                        //* 查詢所有的 tags 名
                        $sql = "SELECT crs_categories.* FROM course_category JOIN crs_categories ON course_category.category_id = crs_categories.id WHERE course_category.course_id = $crs_id";
                        $rows = $conn->query($sql)->fetch_all(MYSQLI_ASSOC);

                        //* 重新打包
                        $tagArr = [];
                        foreach ($rows as $row) :
                            $tagArr[$row["id"]] = $row["category"];
                        endforeach;

                        //todo 將標籤色與欄 bgc 同步
                        ?>

                        <td colspan="6">
                            <div class="hstack gap-3">
                                <?php foreach ($tagArr as $id => $category) : ?>
                                    <a href="?tag_id=<?= $id ?>&page=1&order=<?= $_GET["order"] ?>" class="crs-list_tags">
                                        #<?= $category ?>
                                    </a>
                                <?php endforeach; ?>
                            </div>
                        </td>
                        <td class="text-center">
                            <!-- <div> -->
                            <a href="#" class="btn btn-primary btn-sq text-light" title="編輯標籤">
                                <i class="fa-solid fa-hashtag"></i>
                            </a>
                            <!-- </div> -->
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <!-- 分頁切換列 -->
        <?php include "./crs_pagination.php"; ?>
    </div>
        </div>
      </div>
    </div>
    
    <!-- Modal : 下架課程成功訊息 -->
    <?php if (isset($_GET["dComplete"]) && $_GET["dComplete"] == 1) : ?>
        <style>
            body {
                overflow-y: hidden;
            }
        </style>
        <div class="popout-notice" id="popout-notice">
            <div class="window animate__animated animate__bounceIn">
                <h2>已下架課程</h2>
                <a href="<?= $LINK_HERE ?>" class="btn btn-primary mt-3 px-3" id="pop-n-btn">好的</a>
            </div>
        </div>
    <?php endif; ?>

    <?php include $to_fdd . "tools/common-script.php"; ?>
    <script>
        const popout_n = document.getElementById("popout-notice");
        const btn_close_n = document.getElementById("pop-n-btn");
        btn_close_n.addEventListener("click", () => {
            popout_n.style.display = "none";
        });
    </script>
</body>

</html>