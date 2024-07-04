<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./outdoor_raw.json');
$pkg = json_decode($jsonStr, true);
$colArr = $pkg['col'];
$rawArr = $pkg['data'];
$BOUND = count($colArr);
$dataArr = [];
foreach ($rawArr as $data) :
  $newItem = [];
  for ($i = 0; $i < $BOUND; $i++) :
    $newItem[$colArr[$i]] = $data[$i];
  endfor;

  array_push($dataArr, $newItem);
endforeach;

printArray($dataArr);
$geneJson = json_encode($dataArr, JSON_UNESCAPED_UNICODE);
file_put_contents('./outdoors-data.json', $geneJson);