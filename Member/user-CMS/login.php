<?php
session_start();

//var_dump($_SESSION);
// if(isset($_SESSION["user"])){
//     header("location: dashboard.php");
//     exit;
// }

?>

<!doctype html>
<html lang="en">

<head>
    <title>Fundodo login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- <link href="/Fundodo-main/style.scss"> -->
    <?php include("../connect_tools/css.php") ?>
    <style>
        body {
            background: linear-gradient(to right, #71C4EF 25%, #EEF6FA);
        }

        .login-panel {
            width: 840px;
            height: 560px;
            background: #EEF6FA;
        }

        .sub {
            align-self: flex-start;
            margin-left: 55%;
        }
    </style>
</head>

<body>
    <div class="border vh-100 d-flex justify-content-center align-items-center">
        <div class="login-panel">
            <div class="text-center">
                <h1 class="h2 mt-2">Fundodo</h1>
                <a href="../create-user/create-user.php" class="btn bnt-primary" title="前往創建會員頁">
                    <img src="../images/logo.jpg" alt="">
                </a>
                <hr>
            </div>

            <form action="DoLogin.php" method="post">
                <div class="mt-5 mb-3 text-center">
                    <label for="">帳號</label>
                    <input type="text" name="account">
                </div>
                <div class="mb-1 mt-3 text-center">
                    <label for="">密碼</label>
                    <input type="password" name="password">
                </div>
                <div class="mb-2 mt-3 text-center">
                    <a href="create-user.php" class="">
                        <label for="">建立帳號</label>
                    </a>
                </div>
                <?php if(isset($_SESSION["errorTimes"]) && $_SESSION["errorTimes"]>=5): ?>
                <div class="text-danger text-center h3 my-3">登入錯誤次數過多,請稍後再嘗試</div>
                <?php else: ?>
                   
                <?php endif ;?>
                    <button class="btn btn-primary sub" type="submit">
                    送出
                </button> 
                
            </form>

        </div>

    </div>


    <?php include("../connect_tools/js.php") ?>
</body>

</html>