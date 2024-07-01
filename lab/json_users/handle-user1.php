<?php
include("../../console-lib.php");

$json_user = file_get_contents("./json/fack_user_datum.json");
$USER_DATA = json_decode($json_user, true);
$colArr = $USER_DATA["columns"];
$dataArr = $USER_DATA["datum"];

$json_noun = file_get_contents("./json/random_noun.json");
$NOUN_DATA = json_decode($json_noun, true);
$nounArr = $NOUN_DATA["nounArr"];

//將關聯式陣列的欄位按此排序
$ordered_col = [
    "account",
    "password",
    "name_zh",
    "name_en",
    "gender",
    "email",
    "dob_ce",
    "cellphone_num",
    "city",
];

function generate_acc($name_en)
{
    global $nounArr;
    $dice4 = rand(0, 4);
    $dice13 = rand(0, 13);
    $dice1000 = rand(0, 1000);
    $result_acc = "";
    if ($dice4 === 0) :
        $result_acc = $nounArr[$dice1000 % count($nounArr)];
    else :
        $result_acc = explode(" ", $name_en)[0];
    endif;
    $result_acc .= (($dice13 === 0) ? '' : $dice1000);
    return $result_acc;
}

$dataFormated = [];

for ($i = 0; $i < count($dataArr); $i++) :
    // printArray($dataArr[$i]);
    //* 接合出關聯式陣列
    $temp_arr = [];
    for ($j = 0; $j < count($colArr); $j++) :
        if ($colArr[$j] === "dob_roc") continue;

        $temp_arr[$i]["$colArr[$j]"] = $dataArr[$i][$j];
    endfor;

    // printArray($temp_arr[$i]);

    //* 陣列中欄位排序
    foreach ($ordered_col as $key) :
        if ($key === "account") :
            $dataFormated[$i]["$key"] = generate_acc($temp_arr[$i]['name_en']);
        else :
            $dataFormated[$i]["$key"] = $temp_arr[$i]["$key"];
        endif;
    endforeach;

    // printArray($dataFormated[$i]);
endfor;

// printArray($dataFormated);