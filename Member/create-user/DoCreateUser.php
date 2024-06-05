<?php
require_once("../connect_tools/midterm_connect.php");
if(!isset($_POST["name"])) {
    echo "請循正常管道進入此頁";
    exit;
}

$name=$_POST["name"];
$nickname=$_POST["nickname"];
$gender=$_POST["gender"];
$email=$_POST["email"];
$account=$_POST["account"];
$password=$_POST["password"];
$repassword=$_POST["repassword"];
$dob=$_POST["dob"];
$tel=$_POST["tel"];
$address=$_POST["address"];

$sqlCheckUser="SELECT * FROM users Where account = '$account'";
$resultCheck=$conn->query($sqlCheckUser);
if($resultCheck->num_rows>0){
    echo "此帳號已有人註冊";
    exit;
}


if(empty($name) || empty($gender)|| empty($email)  ||empty($account) ||empty($password) ||empty($tel)){
    echo "請填入必要欄位";
    exit;
}
$accountLength=strlen($account);
if($accountLength<4 || $accountLength>20){
    echo "請輸入 4~20字元的帳號";
    exit;
}
if($password!=$repassword){
    echo "前後密碼不一致";
    exit;
}

//echo "$name, $nickname, $gender, $email, $account, $password, $repassword, $dob,  $tel, $address";

$password_hash = password_hash($password, PASSWORD_DEFAULT);

$now=date('Y-m-d H:i:s');

$sql="INSERT INTO users (name, nickname, gender, email, account, password_hash, dob, tel, address, created_at)
VALUES ('$name', '$nickname', '$gender', '$email', '$account', '$password_hash', '$dob', '$tel', '$address', '$now')";
//echo $sql;
//exit;

if ($conn->query($sql) === TRUE) {
    $last_id = $conn->insert_id;
    echo "新資料輸入成功, id為 $last_id";
} 
else {
    echo "error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
header("location: ../user-CMS/login.php");
