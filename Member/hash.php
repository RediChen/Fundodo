<?php
$password = 99492342; // 原始密码
$password_hash = password_hash($password, PASSWORD_DEFAULT); // 使用默认密码哈希算法生成哈希值
var_dump($password_hash); // 输出哈希值的详细信息
?>