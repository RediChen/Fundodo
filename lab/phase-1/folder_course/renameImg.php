<?php
include("../../tools/console-lib.php");

//*========================================
$site = __DIR__ . "/crs_img/";
$site_t = __DIR__ . "/crs_img/main/";

//原先格式：class$（無固定位數）
//目標格式：crs_$$$$$$_$（固定位數）

// for ($i = 1 ; $i <= 23 ; $i++) :
//     switch ($i) {
//         case 8:
//         case 10:
//         case 12:
//         case 13:
//         case 14:
//         case 15:
//         case 16:
//         case 17:
//         case 21:
//             $tail = '.jpg';
//             break;
//         default:
//             $tail = '.png';
//             break;
//     }
//     $from = $site . "class$i" . $tail;
//     $to = $site_t. "crs_". sprintf("%06d", $i) . "1$tail";
//     rename($from, $to);
// endfor;

// printArray("檔案命名完畢。");


//*========================================
// $site = __DIR__ . "/crs_img/results/";
// $site_t = __DIR__ . "/crs_img/main/";
// $jpg = '.jpg';

// for ($i = 1; $i <= 23; $i++) :
//     for ($j = 0; $j < 3; $j++) :
//         $from = $site . sprintf("%04d", $j) . $jpg;
//         $to = $site_t . "crs_" . sprintf("%06d", $i) . ($j + 2) . $jpg;
        // printArray([$from => $to]);
//         copy($from, $to);
//     endfor;

// endfor;

//*========================================
$site = __DIR__ . "/crs_img/main/";
$jpg = '.jpg';

for ($i = 1; $i <= 23; $i++) :
    for ($j = 1; $j <= 4; $j++) :
        $tail = sprintf("%06d", $i) . $j . $jpg;
        $from = $site . "crs_" . $tail;
        $to = $site . "CR" . $tail;
        // printArray([$from => $to]);
        rename($from, $to);
    endfor;
endfor;
printArray("檔案命名完畢。");
