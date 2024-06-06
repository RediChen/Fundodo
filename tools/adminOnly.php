<?php
include "/xampp/htdocs/Fundodo/tools/tool-lib.php";
session_start();

$fundodo = "localhost/fundodo/";
if (!isset($_SESSION["user"]) || ($_SESSION["user"]["user_level"] != 20)) :
  leadTo('/Fundodo/member/login.php');
endif;
?>