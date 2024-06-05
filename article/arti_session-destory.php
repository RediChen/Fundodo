<?php

session_start();

session_destroy();

header("location:article_title.php");

?>