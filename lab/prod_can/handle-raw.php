<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./raw.json');
$pkg = json_decode($jsonStr, true);
$colArr = $pkg['col'];
$rawArr = $pkg['data'];
$BOUND = count($colArr);

$dataArr = [];
foreach ($rawArr as $data) :
  $newItem = [];
  for ($i = 0; $i < $BOUND; $i++) :
    if (empty($data[$i][0])) :
      $newItem[$colArr[$i]] = [];
    else :
      $newItem[$colArr[$i]] = $data[$i];
    endif;
  endfor;

  if (empty($newItem["ageArr"])) :
    $newItem["ageArr"] = ["幼犬", "成犬", "高齡犬"];
  endif;
  array_push($dataArr, $newItem);
endforeach;

$info['description'] = "罐頭品項的資料";
$info['count'] = count($rawArr);
$obj["info"] = $info;
$obj["data"] = $dataArr;

printArray($obj);
$geneJson = json_encode($obj, JSON_UNESCAPED_UNICODE);
file_put_contents('./data.json', $geneJson);
