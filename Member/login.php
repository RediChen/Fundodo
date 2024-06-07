<?php
session_start();
if (isset($_SESSION["user"]) && ($_SESSION["user"]["user_level"] == 20)) :
  header('Location: /Fundodo/dashboard/dashboard.php');
  exit();
endif;
if (isset($_SESSION["user"])) :
  header('Location: /Fundodo/member/Member-center.php');
  exit();
endif;
?>

<!doctype html>
<html lang="en">

<head>
  <title>Fundodo login</title>
  <?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
</head>

<body class="login-body">
  <div class="container fx-center">
    <div class="vh-100 row">
      <div class="col-12 col-md-6 col-lg-5 mt-3">
        <div class="vstack justify-content-center h-100">
          <form action="DoLogin.php" method="post" class="login-form w-100 py-5 col-lg-4 px-5 bg-light bg-opacity-75 rounded-3 shadow">
            <div class="text-center">
              <label for="">帳號</label>
              <input type="text" name="account" class="form-control mt-1">
              <p class="text-danger text-center mb-3">
                <?php if (isset($_SESSION["errorMsg"]['account'])) : ?>
                  <?= $_SESSION["errorMsg"]['account'] ?>
                  <?php unset($_SESSION["errorMsg"]['account']); ?>
                <?php else : ?>
                  &emsp;
                <?php endif; ?>
              </p>
            </div>
            <div class="mb-1 mt-3 text-center">
              <label for="">密碼</label>
              <input type="password" name="password" class="form-control mt-1">
              <p class="text-danger text-center mb-3">
                <?php if (isset($_SESSION["errorMsg"]['password'])) : ?>
                  <?= $_SESSION["errorMsg"]['password'] ?>
                  <?php unset($_SESSION["errorMsg"]['password']); ?>
                <?php else : ?>
                  &emsp;
                <?php endif; ?>
              </p>
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
      <div class="col-12 col-md-5 row pt-5 vstack justify-content-center">
        <div class="login-logo col-6 rounded-5 py-3">
          <img src="../dashboard/fundodo-logo.png" alt="" class="object-fit-cover">
        </div>
      </div>
      <div class="col-lg-2"></div>
    </div>
  </div>
  <?php include("../member/js.php") ?>
</body>

</html>