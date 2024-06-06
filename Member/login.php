<?php
session_start();
if (isset($_SESSION["user"]) && ($_SESSION["user"]["user_level"] == 20)) :
  header('Location: /Fundodo/dashboard/dashboard.php');
  exit();
endif;
?>

<!doctype html>
<html lang="en">

<head>
  <title>Fundodo login</title>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- <link href="/Fundodo-main/style.scss"> -->
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>

  <style>
    body {
      background: linear-gradient(to right, #71C4EF 25%, #EEF6FA);
    }

    .login-panel {
      width: 840px;
      height: 800px;
      background: #EEF6FA;
    }

    .sub {
      align-self: flex-start;
      margin-left: 55%;
    }
  </style>
</head>

<body>
  <div class="border vh-100 d-flex justify-content-center align-items-center">
    <div class="login-panel">
      <div class="text-center">
        <h1 class="h2 mt-2">Fundodo</h1>
        <div class="text-center">
          <img src="../dashboard/fundodo-logo.png" alt="">
        </div>
        <hr>
      </div>

      <form action="DoLogin.php" method="post">
        <div class="mt-5 mb-3 text-center">
          <label for="">帳號</label>
          <input type="text" name="account">
          <?php if (isset($_SESSION["errorMsg"]['account'])) : ?>
            <p class="text-danger text-center mb-3"><?= $_SESSION["errorMsg"]['account'] ?></p>
            <?php unset($_SESSION["errorMsg"]['account']); ?>
          <?php endif; ?>
        </div>
        <div class="mb-1 mt-3 text-center">
          <label for="">密碼</label>
          <input type="password" name="password">
          <?php if (isset($_SESSION["errorMsg"]['password'])) : ?>
            <p class="text-danger text-center mb-3"><?= $_SESSION["errorMsg"]['password'] ?></p>
            <?php unset($_SESSION["errorMsg"]['password']); ?>
          <?php endif; ?>
        </div>
        <div class="mb-2 mt-3 text-center">
          <a href="create-user.php" class="">
            <label for="">建立帳號</label>
          </a>
        </div>
        <button class="btn btn-primary sub" type="submit">
          送出
        </button>
        <?php if (isset($_SESSION["errorTimes"]) && $_SESSION["errorTimes"] >= 5) : ?>
          <div class="text-danger text-center h3 my-3">登入錯誤次數過多,請稍後再嘗試</div>
        <?php endif; ?>
      </form>

    </div>

  </div>


  <?php include("../member/js.php") ?>
</body>

</html>