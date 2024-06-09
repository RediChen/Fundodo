<?php
include("/xampp/htdocs/Fundodo/tools/adminOnly.php");
?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <title>儀表板 | 後台儀表板</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body class="db_body">
  <div class="d-flex">
    <?php include("./dashboard-aside.php"); ?>
    <div class="w-100">
      <?php include("./dashboard-header.php"); ?>

      <div class="db_content">
        <h3>會員資料</h3>
        <div class="d-flex justify-content-between align-items-center mb-3">
          <span>共 (施工中) 人</span>

        </div>
        <div class="table-responsive">
          <table class="table db_table table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>會員名字</th>
                <th>電話</th>
                <th>地址</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>汪狗狗</td>
                <td>09234568892</td>
                <td>台北市中正區羅斯福路3號4樓</td>
                <td>
                  <div class=" d-flex gap-3">
                    <button class="btn btn-primary btn-sm mr-2">
                      <i class="fa-solid fa-eye"></i>
                    </button>
                    <button class="btn btn-dark btn-sm mr-2">
                      <i class="fa-regular fa-pen-to-square"></i>
                    </button>
                    <button class="btn btn-danger btn-sm">
                      <i class="fa-solid fa-trash"></i>
                    </button>
                  </div>
                </td>
              </tr>
              <!-- Repeat this <tr> block for each row of data -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <?php include("/xampp/htdocs/Fundodo/tools/common-script.php"); ?>
</body>

</html>