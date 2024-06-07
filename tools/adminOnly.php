<?php
session_start();

if (!isset($_SESSION["user"]) || ($_SESSION["user"]["user_level"] != 20)) :
  session_abort();
  header('Location: /Fundodo/member/login.php');
  exit();
else :
  session_abort();
endif;
