<?php
include('./console-lib.php');
include('./tool-lib.php');
// ('SET time_zone="-12:00"');
?>

<head>
  <title>時區檢測器</title>
  <?php include("./common-head.php"); ?>
  <link rel="shortcut icon" href="./favicon_S.png" type="image/x-icon">
  <style>
    /* 思源黑體 */
    @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap");

    body {
      background-color: #333;
      color: #eee;
      font-family: "Noto Sans TC", "Helvetica Neue";
      text-align: center;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-auto col-lg-6">
        <div class="my-3 p-5 text-bg-dark rounded-3">
          <h1>現在時間是：<?= date('y-m-d h:i:s') ?></h1>
          <h2>現在時區為：<?= date_default_timezone_get() ?></h2>
        </div>

        <h1>更改時區</h1>
        <?php date_default_timezone_set('Asia/Taipei'); ?>
        <div class="my-3 p-5 text-bg-success rounded-3">
          <h1>現在時間是：<?= date('y-m-d h:i:s') ?></h1>
          <h2>現在時區為：<?= date_default_timezone_get() ?></h2>
        </div>
      </div>
    </div>
  </div>
</body>