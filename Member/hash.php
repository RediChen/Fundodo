<style>
body {
  font-family: monospace;
}

</style>
<?php
if (isset($_GET['pw'])):
$password = 99492342;
$password = $_GET['pw'];
// 原始明碼
$password_hash = password_hash($password, PASSWORD_DEFAULT);
// php 內建函數生成之雜湊值
var_dump($password_hash);
else:
  echo "請以 pw 輸入欲加密的密碼。";
endif;