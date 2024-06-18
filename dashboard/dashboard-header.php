<?php
session_start();
?>
<div class="db_header hstack justify-content-end">
  <div class="hstack">
    <span>Hi, <?= $_SESSION["user"]["nickname"] ?> </span>
    <a href="/fundodo/dashboard/session-destory.php?logout=1" class="btn btn-primary ms-3">登出</a>
  </div>
</div>