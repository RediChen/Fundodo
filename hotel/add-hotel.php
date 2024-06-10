<?php
include("/xampp/htdocs/Fundodo/db_connect.php");

// 房型下拉選單
$sql = "SELECT id, room_type FROM room_category";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  $room_types = $result->fetch_all(MYSQLI_ASSOC);
} else {
  $room_types = [];
}

// 地區下拉選單
$sql2 = "SELECT id, location FROM area_category";
$result2 = $conn->query($sql2);

if ($result2->num_rows > 0) {
  $locations = $result2->fetch_all(MYSQLI_ASSOC);
} else {
  $locations = [];
}

$conn->close();
?>



<!DOCTYPE html>
<html lang="en">

<head>

  <title> 新增旅館</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
  <style>
    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
    }

    .form-floating {

      max-width: 600px;
      margin: 0 auto;
    }

    .form-control textarea {
      resize: none;
      height: 200px;

    }

    .form-group {
      max-width: 600px;
      margin: 0 auto;
    }

    .form-group label {
      font-weight: bold;
    }

    .image-preview {
      display: flex;
      gap: 10px;
      margin-top: 10px;
    }

    .image-preview img {
      width: 200px;
      height: 200px;
    }
  </style>

</head>

<div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="layout_content">
        <body>

<div class="container">
<h3 class="px-2">新增旅館</h3>
  <div class="py-2">
    <a class="btn btn-secondary" href="hotel-list.php"><i class="fa-solid fa-arrow-left"></i> 回狗狗旅館列表</a>
  </div>

  <form action="doAddHotel.php" method="post" enctype="multipart/form-data">

    <div class="form-group mb-3">
      <label class="py-2" for="name">旅館名稱</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>


    <div class="form-floating pb-3">
      <textarea class="form-control" placeholder="Leave a comment here" id="description" name="description" style="height: 100px" required></textarea>
      <label class="py-2" for="description">介紹</label>
    </div>

    <div class="form-group mb-3 pb-3">
      <label class="py-2" for="images">圖片</label>
      <input type="file" class="form-control" id="images" name="images[]" multiple accept="image/*" onchange="previewImages()">

      <label class="py-2" for="images">預覽圖片</label>
      <div class="image-preview" id="imagePreview"></div>
    </div>

    <div class="form-group mb-3">
      <label class="py-2" for="room_type">房間類型</label>
      <select class="form-select" id="room_type" name="room_type" aria-label="房間類型">
        <?php foreach ($room_types as $room_type) : ?>
          <option value="<?= $room_type['id'] ?>"><?= $room_type['room_type'] ?></option>
        <?php endforeach; ?>
      </select>


    </div>
    <div class="form-group mb-3">
      <label class="py-2" for="location">縣市</label>
      <select class="form-select" id="location" name="location" aria-label="市">
        <?php foreach ($locations as $location) : ?>
          <option value="<?= $location['id'] ?>"><?= $location['location'] ?></option>
        <?php endforeach; ?>
      </select>


    </div>
    <div class="form-group mb-3">
      <label class="py-2" for="address">詳細地址</label>
      <input type="text" class="form-control" id="address" name="address" required>
    </div>

    <div class="form-group mb-3">
      <label class="py-2" for="phone">聯絡電話</label>
      <input type="text" class="form-control" id="phone" name="phone" required>
    </div>
    <div class="form-group mb-3 d-flex justify-content-end">
      <button type="submit" class="btn btn-dark">確定</button>
    </div>
  </form>
</div>

</body>
        </div>
      </div>
    </div>




<script>
  function previewImages() {
    const preview = document.getElementById('imagePreview');
    preview.innerHTML = '';
    const files = document.getElementById('images').files;

    if (files.length > 3) {
      alert("最多上傳3張圖片");
      document.getElementById('images').value = '';
      return;
    }

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const reader = new FileReader();

      reader.onload = function(e) {
        const img = document.createElement('img');
        img.src = e.target.result;
        preview.appendChild(img);
      }

      reader.readAsDataURL(file);
    }
  }
</script>

</html>