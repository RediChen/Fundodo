<?php

if (!isset($_GET["id"])) {
  $id = 1;
} else {
  $id = $_GET["id"];
}

include("/xampp/htdocs/Fundodo/db_connect.php");

$sql = "SELECT hotel_list.*, room_category.room_type, area_category.location FROM hotel_list 
        JOIN room_category ON hotel_list.room_type_id = room_category.id
        JOIN area_category ON hotel_list.location_id = area_category.id
        WHERE hotel_list.id = $id AND hotel_list.valid = 1";


$result = $conn->query($sql);
$row = $result->fetch_assoc();


// 圖片區
$sqlImg = "SELECT path FROM hotel_img WHERE hotel_id = $id AND valid = 1";
$resultImg = $conn->query($sqlImg);
$images = $resultImg->fetch_all(MYSQLI_ASSOC);



?>

<!DOCTYPE html>
<html lang="en">

<head>
<?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
  <title><?= $row["name"] ?></title>
 

  <style>
    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }

    .table th {
      white-space: nowrap;
    }

    .form-group {
      max-width: 700px;
      margin: 0 auto;
    }
  </style>

</head>

<div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="db_content">
        <body>


<div class="container">
<h3 class="px-2">旅館編輯</h3>
  <div class="py-2">
    <a class="btn btn-primary" href="hotel-list.php"><i class="fa-solid fa-arrow-left"></i> 回狗狗旅館列表</a>
  </div>

  <!-- 顯示alert -->
  <?php if (isset($_GET['status']) && $_GET['status'] == 'success'): ?>
    <div class="alert alert-success alert-dismissble fade show" role="alert">
      旅館資訊更新完成!
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>  
    </div>
    <?php elseif (isset($_GET['status']) && $_GET['status'] == 'error'): ?>
    <div class="alert alert-danger alert-dismissble fade show" role="alert">
      編輯失敗!
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>  
    </div>
    <?php endif;?>


  <form action="doUpdateHotel.php" method="post">
    <table class="table table-bordered">
      <tr>
        <th>ID</th>
        <td><?= $row["id"] ?></td>
      </tr>
      <tr>
        <th>地區</th>
        <td><?= $row["location"] ?></td>
      </tr>
      <tr>
        <th>旅館名稱</th>
        <td><?= $row["name"] ?></td>
      </tr>
      <tr>
        <th>介紹</th>
        <td><?= $row["description"] ?></td>
      </tr>
      <tr>
        <th>圖片</th>
        <td>
          <?php foreach ($images as $image) : ?>
            <img src="../hotels_img/<?= $image["path"] ?>" class="hotel-image" alt="<?= $row["name"] ?>">
          <?php endforeach; ?>
        </td>
      </tr>
      <tr>
        <th>房間類型</th>
        <td><?= $row["room_type"] ?></td>
      </tr>
      <tr>
        <th>詳細地址</th>
        <td><?= $row["address"] ?></td>
      </tr>
      <tr>
        <th>聯絡電話</th>
        <td><?= $row["phone"] ?></td>
      </tr>
    </table>
  </form>
</div>


<div class="form-group  d-flex justify-content-end">
  <a class="btn btn-outline-dark" href="hotel-edit2.php?id=<?= $id ?>">編輯</a>

</div>


</body>
        </div>
      </div>
    </div>


</html>