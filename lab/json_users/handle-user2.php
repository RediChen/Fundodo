<?php
include("../../console-lib.php");

//*================================================
$NUM_USERS = 300;
//*================================================

$json_user = file_get_contents("./fake_users2.json");
$USER_DATA = json_decode($json_user, true);
$colArr = $USER_DATA["cols"];
$rawArr = $USER_DATA["data"];

$json_noun = file_get_contents("./random_noun.json");
$NOUN_DATA = json_decode($json_noun, true);
$nounArr = $NOUN_DATA["nounArr"];

$colArr_t = [
    "name",
    "nickname",
    "account",
    "password_hash",
    "gender",
    "dob",
    "tel",
    "email",
    "adr_city",
    "adr_district",
    "address",
    "created_at",
    "deleted_at",
    "user_level"
];
//================================================
//* 接合出關聯式陣列

$semiArr = [];
foreach ($rawArr as $user) :
    $temp_arr = [];
    for ($j = 0; $j < count($colArr); $j++) :
        $temp_arr[$colArr[$j]] = $user[$j];
    endfor;
    array_push($semiArr, $temp_arr);
endforeach;

//================================================

function generateFrom($name_en, $email)
{
    global $nounArr;
    $dice4 = rand(0, 3);
    $dice10 = rand(1, 10);
    $dice1000 = rand(0, 1000);
    $result_nick = "";
    $result_acc = "";
    //eng name-> acc .= 123
    //emial ->直接用
    //random names -> acc .= 123

    if ($dice4 === 0) :
        //五分之一的機率使用隨機名
        $result_nick = $nounArr[$dice1000 % count($nounArr)];
    elseif ($dice10 % 2 === 0) :
        //剩下中的一半使用英文名字
        $result_nick = explode(' ', $name_en)[0];
    else :
        //剩下使用 email
        $result_nick = explode('@', $email)[0];
    endif;
    $result_acc = $result_nick . (($dice10 === 0) ? '' : $dice1000);

    return [$result_nick, $result_acc];
}
function city_code($city_zh)
{
    switch ($city_zh):
        case '台北市':
        case '臺北市':
            return 1;
        case '新北市':
            return 2;
        case '基隆市':
            return 3;
        case '桃園市':
            return 4;
        case '新竹市':
            return 5;
        case '新竹縣':
            return 6;
        case '苗栗縣':
            return 7;
        case '台中市':
        case '臺中市':
            return 8;
        case '彰化縣':
            return 9;
        case '南投縣':
            return 10;
        case '嘉義市':
            return 11;
        case '嘉義縣':
            return 12;
        case '雲林縣':
            return 13;
        case '台南市':
        case '臺南市':
            return 14;
        case '高雄市':
            return 15;
        case '屏東縣':
            return 16;
        case '宜蘭縣':
            return 17;
        case '花蓮縣':
            return 18;
        case '台東縣':
        case '臺東縣':
            return 19;
        case '澎湖縣':
            return 20;
        case '金門縣':
            return 21;
        case '連江縣':
            return 22;
    endswitch;
}
//隨機生成給定時間後的時間點 in timestamp format(int)
function rand_time($time_i)
{
    $d_h = rand(0, 17);
    $d_m = rand(0, 31);
    $d_s = rand(0, 12);
    $time_f = strtotime("+$d_h hours $d_m minutes $d_s seconds", $time_i);
    return $time_f;
}
function f_time($int_time)
{
    return date('y-m-d H:i:s', $int_time);
}
$rslArr = [];
//todo
$time = 0;
$the_time = mktime(12, 0, 0, 4, 10, 2023);

foreach ($semiArr as $user) :
    //* nickname & account
    [$nickname, $account] = generateFrom($user["name_en"], $user["email"]);
    $user["nickname"] = $nickname;
    $user["account"] = $account;

    //* password_hash
    $user["password_hash"] = password_hash($user["password"], PASSWORD_DEFAULT);

    //* adr_city & adr_district
    $user["adr_city"] = city_code($user["adr_city"]);
    $user["adr_district"] = substr($user["zipcode"], 0, 3);

    //* created_at & deleted_at
    $user["created_at"] = f_time($the_time);
    $the_time = rand_time($the_time);
    $user["deleted_at"] = null;

    //* user_level
    $user["user_level"] = 0;


    $temp = [];
    foreach ($colArr_t as $key):
        $temp[$key] = $user[$key];
    endforeach;
    array_push($rslArr, $temp);

    $time++;
    if ($time > $NUM_USERS) break;
endforeach;

// printArray($rslArr);

$op_json = json_encode($rslArr, JSON_UNESCAPED_UNICODE);
file_put_contents('./usersData.json', $op_json);
echo "處理完成";