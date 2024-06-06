<?php
session_start();
include("/xampp/htdocs/Fundodo/tools/tool-lib.php");

if (!isset($_SESSION["user"]) || ($_SESSION["user"]["user_level"] != 20)) :
  header('Location: /Fundodo/member/login.php');
endif;
?>