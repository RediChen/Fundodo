<?php
include("../../tools/console-lib.php");
$target = [""];
echo 'empty([""]): '.(empty($target)? "Yes" : "No");
br();
echo 'count([1, 2, 3]): '.count([1, 2, 3]);
br();
echo 'count(["1"])    : '.count(["1"])    ;
br();
echo 'count([""])     : '.count($target)     ;
br();
echo 'count(["", ""]) : '.count(["", ""]) ;
br();
echo 'empty([""][0]): '.(empty($target[0])? "Yes" : "No");
