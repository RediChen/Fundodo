<?php

require_once("../connect_tools/midterm_connect.php");

session_start();

if(!isset($_POST["account"])){
    echo "請循正常管道";
    exit;
}

$account=$_POST["account"];
$password=$_POST["password"];

if(empty($account)){
    echo "請輸入帳號";
    $_SESSION["errorMsg"]=$errorMsg;
    header("location: login.php");
    exit;
}

if(empty($password)){
    echo "請輸入密碼";
    $_SESSION["errorMsg"]=$errorMsg;
    header("location: login.php");
    exit;
}

//echo "$account, $password";

$sql="SELECT * FROM users WHERE account = '$account' AND password_hash = '$password'";
$result=$conn->query($sql);
$userCount=$result->num_rows;

//echo $userCount;

if($userCount==0){
    $errorMsg="帳號或密碼錯誤";
    if(!isset($_SESSION["errorTimes"])){
        $_SESSION["errorTimes"]=1;
    }else{
        $_SESSION["errorTimes"]++;
    }
    $_SESSION["errorMsg"]=$errorMsg;
    header("location: login.php");
    exit;
}


$row=$result->fetch_assoc();
// var_dump($row);
unset($_SESSION["errorMsg"]);
unset($_SESSION["errorTimes"]);

$_SESSION["user"]=[
    "id"=>$row["id"],
    "account"=>$row["account"],
    "nickname"=>$row["nickname"],
    "name"=>$row["name"],
    "email"=>$row["email"],
    "user_level"=>$row["user_level"],
];

if ($row["user_level"] == 20) {
    // 用户等级为 20，重定向到 users.php
    header("Location:users.php");
    exit();
} else {
    // 用户等级不为 20，重定向到其他页面或执行其他操作
    header("location: Member-center.php");
    exit();
}
?>