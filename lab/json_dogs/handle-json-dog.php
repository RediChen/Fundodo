<?php
include("../../console-lib.php");
//USERS
$jsonStr = file_get_contents('../json_users/usersData.json');
$usersData = json_decode($jsonStr, true); //usersData: obj[]
$NUM_USERS = count($usersData); //主要停止條件

//DOGS
$jsonStr = file_get_contents('./dogs_semi.json');
$dogsData = json_decode($jsonStr, true);

$cols_dog = $dogsData["cols"];
$dogArr = $dogsData["data"];
$NUM_DOGS = count($dogArr); //備用停止條件

//NAMES
$jsonStr = file_get_contents('./dog_names.json');
$namesData = json_decode($jsonStr, true);

//functions

function num_pets()
{
    $dice = mt_rand(1, 17);
    if ($dice === 1) :
        return 0;
    elseif ($dice <= 7) :
        return 1;
    elseif ($dice <= 11) :
        return 2;
    elseif ($dice <= 14) :
        return 3;
    elseif ($dice <= 16) :
        return 4;
    else :
        return 5;
    endif;
}
function delay($pointer_user)
{
    if (mt_rand(0, 2) === 0) return mt_rand(0, 1);

    global $NUM_USERS;
    $BOUND = $NUM_USERS - 1 - $pointer_user;
    if ($BOUND > 5) :
        $max = min(30, $BOUND);
        return mt_rand(5, $max);
    else :
        return 0;
    endif;
}
function rand_name()
{
    global $namesData;
    $NUM = count($namesData);
    $dice = mt_rand(0, $NUM - 1);
    return $namesData[$dice];
}
//operation
// $pointer_user = 0;
$pointer_dog = 0;


for ($i_user = 0; $i_user < $NUM_USERS; $i_user++) :
    $NUM_PETS = num_pets();
    if ($NUM_PETS === 0) continue;

    for ($i_dog = 0; $i_dog < $NUM_PETS; $i_dog++) :
        $dogArr[$pointer_dog + $i_dog]["user_id"] = $i_user + 1;
        $dogArr[$pointer_dog + $i_dog]["created_at"] = $usersData[$i_user + delay($i_user)]["created_at"];
    endfor;
    $pointer_dog += $NUM_PETS;

endfor;

//刪除多餘的 dog data
for ($i_dog = $pointer_dog; $i_dog < $NUM_DOGS ; $i_dog++) :
    unset($dogArr[$i_dog]);
endfor;

//按建立時間排序
$created_time = array_column($dogArr, 'created_at');
array_multisort($created_time, SORT_ASC, $dogArr);

for($i = 0 ; $i < count($dogArr) ; $i++):
    unset($dogArr[$i]['animal_id']);
    $dogArr[$i]['id'] = $i+1;

    $dogArr[$i]['gender'] = ($dogArr[$i]['animal_sex'] == 'M') ? 1 : 2;
    unset($dogArr[$i]['animal_sex']);

    $dogArr[$i]['bodytype'] = $dogArr[$i]['animal_bodytype'];
    unset($dogArr[$i]['animal_bodytype']);

    $dogArr[$i]['breed'] = $dogArr[$i]['animal_Variety'];
    unset($dogArr[$i]['animal_Variety']);

    $dogArr[$i]['name'] = rand_name();
endfor;

// printArray($dogArr);
$op_json = json_encode($dogArr, JSON_UNESCAPED_UNICODE);
file_put_contents('dogs_rsl.json', $op_json);
echo "已製作 json";
