<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./test.json');
$pkg = json_decode($jsonStr, true);
$colArr = $pkg['col'];
$rawArr = $pkg['data'];
//todo 把產品名稱中的品牌拿掉

// printArray($colArr);

// printArray($rawArr[50]);

// $temp = $rawArr[50];

// $newName = substr($temp[2], strlen($temp[1]));

// printArray($newName);
$toyArr = [];
foreach ($rawArr as $toy) :
  $newItem = [];
  for ($i = 0; $i < 8; $i++) :
    $newItem[$colArr[$i]] = $toy[$i];
  endfor;
  array_push($toyArr, $newItem);
endforeach;

printArray($toyArr);
