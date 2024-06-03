<?php
include('./console-lib.php');
session_start();
?>

<head>
    <title>SESSION</title>
    <?php include("./common-head.php"); ?>
    <link rel="shortcut icon" href="./favicon_S.png" type="image/x-icon">
    <style>
        /* 思源黑體 */
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap");

        body {
            background-color: #333;
            color: #eee;
            font-family: "Noto Sans TC", "Helvetica Neue";
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="text-center mt-5">以下為 $_SESSION 的所有內容：</h1>
        <?php
        printArray($_SESSION);
        ?>
    </div>
    <div class="text-center mt-3">
        <h3>點擊以清除 SESSION</h3>
        <a href="?clear=true" class="btn btn-danger">清除 SESSION</a>
    </div>
</body>
<?php
if (isset($_GET['clear']) && $_GET['clear'] == 'true') :
    session_destroy();
    leadTo("./printSession.php");
endif;
?>