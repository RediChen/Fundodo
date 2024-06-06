<?php
session_start();
?>
<div class="db_header d-flex justify-content-between align-items-center">
  <span class="title">fundodo</span>
  <span class="user">Hi, <?= $_SESSION["user"]["nickname"] ?> <a href="/fundodo/dashboard/session-destory.php" class="btn btn-primary ms-3">登出</a></span>
</div>