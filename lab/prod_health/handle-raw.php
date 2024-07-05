<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./health_raw.json');
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

$info['description'] = "保健用品的資料";
$info['count'] = 60;
$obj["info"] = $info;
$obj["data"] = $dataArr;

printArray($obj);
$geneJson = json_encode($obj, JSON_UNESCAPED_UNICODE);
file_put_contents('./health-data.json', $geneJson);