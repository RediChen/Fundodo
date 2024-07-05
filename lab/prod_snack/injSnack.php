<?php
// require_once('/tools/connectDB_fdd.php');
include("../../tools/console-lib.php");
$jsonStr = file_get_contents('./snack_raw.json');
$pkg = json_decode($jsonStr, true);
$colArr = $pkg['col'];
$rawArr = $pkg['data'];
$BOUND = count($colArr);
$snackArr = [];
foreach ($rawArr as $snack) :
  $newItem = [];
  for ($i = 0; $i < $BOUND; $i++) :
    $newItem[$colArr[$i]] = $snack[$i];
  endfor;

  array_push($snackArr, $newItem);
endforeach;

printArray($snackArr);
// $geneJson = json_encode($snackArr, JSON_UNESCAPED_UNICODE);

// file_put_contents('./snack-data.json', $geneJson);

echo '完成';
