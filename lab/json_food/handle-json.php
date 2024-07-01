<style>
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap');

    pre {
        padding: 1rem;
        background-color: #013c5a;
        color: #fdfcfa;
        border-radius: 1rem;
        font-family: "IBM Plex Mono", "Helvetica Neue";
        text-align: left;
    }
</style>
<?php
function printArray($array)
{
    echo '<p><pre>';
    print_r($array);
    echo '</pre></p>';
}

$json_user = file_get_contents("./dog-food-simple.json");
$USER_DATA = json_decode($json_user, true);
$colArr = [
    "img", "brand", "prod_name", "flavor", "price"
];
$prodArr = $USER_DATA["products"];

$data_result = [];
foreach ($prodArr as $prod) :
    $temp = [];
    for ($i = 0; $i < count($colArr); $i++) :
        $temp[$colArr[$i]] = $prod[$i];
    endfor;
    printArray($temp);
    array_push($data_result, $temp);
endforeach;

// printArray($data_result);


//連線資料庫
$sql_INSERT = "INSERT INTO users (img, brand, prod_name, flavor, price) VALUES ";

$valuesArr = [];
foreach ($data_result as $data) :
    $value_item = '("'.$data['img'] . ', ' . $data['brand'] . ', ' . $data['price'] . '")'; 
    array_push($valuesArr, $value_item);
endforeach;
$sql_VALUES = implode(', ', $valuesArr);

$sql = $sql_INSERT . $sql_VALUES;

echo $sql;

//$result = $conn->query()
// if ($conn->query($sql) === true) {
//     echo '成功' . $target;
// } else {
//     echo $target . '失敗';
// }