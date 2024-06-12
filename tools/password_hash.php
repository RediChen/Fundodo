<?php
include('./console-lib.php');
if (isset($_GET['pw'])) :
  // $password = 99492342;
  $password = $_GET['pw'];
  // 原始明碼
  $output = password_hash($password, PASSWORD_DEFAULT);
// php 內建函數生成之雜湊值
else :
  $output = "";
endif;
?>

<head>
  <style>
    body {
      --bs-body-bg: #222;
      --bs-body-color: #e6e6e6;
      font-family: monospace;
    }

    pre {
      background-color: var(--bs-body-color);
      color: var(--bs-highlight-color);
      font-size: 2rem !important;
    }
  </style>
  <link rel="stylesheet" href="/fundodo/style.css">
</head>

<body>
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-auto">
        <h1 class="text-primary mb-5 text-center">
          <?php if ($output == "") : ?>
            請透過 GET 以 pw 輸入欲加密的密碼
          <?php else : ?>
            以下為 <?= $password ?> 加密過後的密碼
          <?php endif; ?>
        </h1>
        <?php printArray($output); ?>
      </div>
    </div>

  </div>
</body>