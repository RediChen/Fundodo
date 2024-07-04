<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./toy_raw.json');
$pkg = json_decode($jsonStr, true);
$colArr = $pkg['col'];
$rawArr = $pkg['data'];

$toyArr = [];
$counter = 0;
foreach ($rawArr as $toy) :
  $newItem = [];
  for ($i = 0; $i < 8; $i++) :
    $newItem[$colArr[$i]] = $toy[$i];
  endfor;

  $newName = substr($newItem["name"], strlen($newItem["brand"]));
  $newItem["name"] = $newName;

  array_push($toyArr, $newItem);
endforeach;

$geneJson = json_encode($toyArr, JSON_UNESCAPED_UNICODE);
// file_put_contents('./toy-data.json', $geneJson);
