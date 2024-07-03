<?php
// require_once('/tools/connectDB_fdd.php');
include("/tools/console-lib.php");
$json = file_get_contents('./toy-raw.json');
$pkg = json_decode($json, true);
// {$colArr, $toyArr}
$colArr = $pkg['col'];
$toyArr = $pkg['data'];
//todo 把產品名稱中的品牌拿掉

printArray($colArr);

printArray($toyArr[50]);
