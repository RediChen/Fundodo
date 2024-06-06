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
      background: no-repeat linear-gradient(10deg, #71C4EF 25%, #EEF6FA);
      overflow: hidden;
    }

    .logo {
      padding: 2rem;
      border-radius: 50%;
    }
  </style>
</head>

<body>
  <div class="vh-100 container fx-center">
    <div class="row justify-content-center mt-5">
      <div class="col-12 col-md-6 row">
        <div class="logo col-6 bg-primary bg-opacity-50">
          <img src="../dashboard/fundodo-logo.png" alt="" class="object-fit-cover">
        </div>
      </div>

      <div class="col-12 col-md-6 col-lg-5 mt-3">
        <div class="vstack justify-content-center h-100">
          <form action="DoLogin.php" method="post" class="w-100 py-5 col-lg-4 px-5 bg-light rounded-3">
            <div class="text-center">
              <label for="">帳號</label>
              <input type="text" name="account" class="form-control mt-1">
              <?php if (isset($_SESSION["errorMsg"]['account'])) : ?>
                <p class="text-danger text-center mb-3"><?= $_SESSION["errorMsg"]['account'] ?></p>
                <?php unset($_SESSION["errorMsg"]['account']); ?>
              <?php endif; ?>
            </div>
            <div class="mb-1 mt-3 text-center">
              <label for="">密碼</label>
              <input type="password" name="password" class="form-control mt-1">
              <?php if (isset($_SESSION["errorMsg"]['password'])) : ?>
                <p class="text-danger text-center mb-3"><?= $_SESSION["errorMsg"]['password'] ?></p>
                <?php unset($_SESSION["errorMsg"]['password']); ?>
              <?php endif; ?>
            </div>
            <div class="hstack justify-content-center gap-5 mt-5">
              <a href="create-user.php" class="btn btn-success">
                註冊帳號
              </a>
              <?php if (isset($_SESSION["errorTimes"]) && $_SESSION["errorTimes"] >= 5) : ?>
                <div class="text-center">
                  <button class="btn btn-secondary" type="submit" disabled>
                    送出
                  </button>
                </div>
              <?php else : ?>
                <div class="text-center">
                  <button class="btn btn-primary" type="submit">
                    送出
                  </button>
                </div>
              <?php endif; ?>
            </div>
            <?php if (isset($_SESSION["errorTimes"]) && $_SESSION["errorTimes"] >= 5) : ?>
              <div class="text-danger text-center h3 my-3">登入錯誤次數過多,請稍後再嘗試</div>
            <?php elseif (isset($_GET["logout"]) && $_GET["logout"] == 1) : ?>
              <p class="text-primary-emphasis text-center h5 my-3">帳號或密碼錯誤</p>
              <?php unset($_GET["logout"]); ?>
            <?php endif; ?>
          </form>
        </div>
      </div>
    </div>
  </div>
  <?php include("../member/js.php") ?>
</body>

</html>