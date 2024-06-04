<?php
require_once("../midterm/midterm_connect.php");

$sql = "SELECT * FROM minterm.citys WHERE "
?>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <?php include("../midterm/css.php") ?>
</head>

<body>
    <div class="container">
        <div class="py-2">
            <h2>會員註冊</h2>
            <div class="d-flex justify-content-center">
                <a href="create-user.php" class="btn bnt-primary">
                    <img src="/midterm/images/logo.jpg" alt="">
                </a>
            </div>
        </div>
        <hr>
        <div class="py-2">
            <form action="DoCreateUser.php" method="post">
                <div class="mb-2 justify-content-center">
                    <div class="row mb-2">
                        <div class="col-6 justify-content-start">
                            <label for="" class="form-label">*姓名</label>
                            <input type="name" class="form-control" name="name">
                        </div>
                        <div class="col-6 justify-content-end">
                            <label for="" class="form-label">*暱稱</label>
                            <input type="name" class="form-control" name="nickname">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 pt-4">
                        <label for="male">男性</label>
                        <input type="radio" name="gender" value="1">
                        <label for="female">女性</label>
                        <input type="radio" name="gender" value="2">
                    </div>
                    <div class="col-6 mb-2">
                        <label for="" class="form-label">信箱</label>
                        <input type="email" class="form-control" name="email">
                    </div>
                </div>


                <div class="mb-2">
                    <label for="" class="form-label">帳號</label>
                    <input type="text" class="form-control" name="account">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">密碼</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">重複密碼</label>
                    <input type="password" class="form-control" name="repassword">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">生日</label>
                    <input type="date" class="form-control" name="dob">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">電話</label>
                    <input type="tel" class="form-control" name="tel">
                </div>
                <div class="mb-2">
                    <label for="" class="form-label">地址: </label>
                    <input class="js-demeter-tw-zipcode-selector" data-city="#city" data-dist="#dist" placeholder="請輸入郵遞區號" />
                    <select id="city" placeholder="請選擇縣市" name="adr_city"></select>
                    <select id="dist" placeholder="請選擇鄉鎮區" name="adr_district"></select>
                    <input type="text" class="form-control" name="address">
                </div>
                <button class="btn btn-primary justify-content-end" type="submit">送出</button>
            </form>
        </div>


    </div>





    <?php include("../midterm/js.php") ?>
    <script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
    <script>
        $(function() {
            $Demeter.initTWZipcodeSelector(); // 初始化郵遞區號選擇器

            // 添加事件監聽器，監聽選擇器的變化
            $(".js-demeter-tw-zipcode-selector").on("change", function() {
                var selectedZipcode = $(this).val(); // 獲取所選的郵遞區號值
                console.log("使用者所選的郵遞區號為：" + selectedZipcode);

                // 獲取所選縣市的值
                var selectedCity = $("#city").val();
                console.log("使用者所選的縣市為：" + selectedCity);

                // 獲取所選鄉鎮區的值
                var selectedDistrict = $("#dist").val();
                console.log("使用者所選的鄉鎮區為：" + selectedDistrict);
            });
        });
    </script>
</body>

</html>