<?php
//檔案命名的批次處理
$dir = './dog_images/';
$png = '.png';
$target = $dir . '*' . $png;

$i = 1;
foreach (glob($target) as $fileName) :
    $file = realpath($fileName);
    $newName = $dir . "dogimg_" . str_pad($i, 3, '0', STR_PAD_LEFT);
    // echo "No. $i: $file<br>-> " . $newName . '<br><br>';
    //*================ 關鍵指令
    // rename($file, $newName . '.png');
    //*================ 關鍵指令
    $i++;
endforeach;

echo 'THE END';
