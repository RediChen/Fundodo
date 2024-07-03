<?php
include("../../console-lib.php");
$jsonStr = file_get_contents('./dogs_raw.json');
$rawData = json_decode($jsonStr, true)["data"];

$jsonStr = file_get_contents('./breeds.json');
$breeds = json_decode($jsonStr, true);
$NUM_DOGS = 666;

$cols = [
    "animal_id" => true,
    "animal_subid" => false,
    "animal_area_pkid" => false,
    "animal_shelter_pkid" => false,
    "animal_place" => false,
    "animal_kind" => false,
    "animal_Variety" => true,
    "animal_sex" => true,
    "animal_bodytype" => true,
    "animal_colour" => false,
    "animal_age" => false,
    "animal_sterilization" => false,
    "animal_bacterin" => false,
    "animal_foundplace" => false,
    "animal_title" => false,
    "animal_status" => false,
    "animal_remark" => false,
    "animal_caption" => false,
    "animal_opendate" => false,
    "animal_closeddate" => false,
    "animal_update" => false,
    "animal_createtime" => false,
    "shelter_name" => false,
    "album_file" => false,
    "album_update" => false,
    "cDate" => false,
    "shelter_address" => false,
    "shelter_tel" => false
];
$cols_target = array_keys($cols, true);

function verify_type($type)
{
    if ($type === "SMALL") :
        return "MINI";
    elseif ($type === "MEDIUM") :
        if (mt_rand(0, 2) === 0) :
            return "SMALL";
        else :
            return "MEDIUM";
        endif;
    endif;
    return "BIG";
}
function rand_dog($type)
{
    global $breeds;
    $breed0 = $breeds[$type][0];
    $breed1 = $breeds[$type][1];

    if (mt_rand(1, 10) === 10) :
        return $breed1[mt_rand(0, count($breed1) - 1)];
    else :
        return $breed0[mt_rand(0, count($breed0) - 1)];
    endif;
}

$dogs_result = [];
$times = 0;
foreach ($rawData as $dog) :
    //排除狗以外的物種
    if ($dog["animal_kind"] !== "狗") continue;

    //留下指定的欄位
    $temp = [];
    foreach ($cols_target as $key) :
        $temp[$key] = $dog[$key];
    endforeach;

    $type = $temp["animal_bodytype"];
    //改變體型大小分類，將三種分成四種
    $type = verify_type($type);

    //根據體型大小隨機生成品種
    $temp["animal_Variety"] = rand_dog($type);
    $temp["animal_bodytype"] = $type;

    array_push($dogs_result, $temp);

    $times++;
    if ($times >= $NUM_DOGS) break;
endforeach;

echo "總共有 " . count($dogs_result) . " 隻狗勾。";
$output = [
    "cols" => $cols_target,
    "data" => $dogs_result
];
// printArray($output["data"]);

//* 輸出成 json
// $op_json = json_encode($output, JSON_UNESCAPED_UNICODE);
// file_put_contents('dogs_semi.json', $op_json);
// echo "已製作 json";
