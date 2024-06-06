    <?php
    //* 一 請先看這邊 一
    //* 以下預期所有的 .php 檔皆為以下的結構
    // <body>
    //      <div class="container">
    //          ...
    //      </div>
    //</body>
    //* 1. 將自己的 .php 中的 div.container 折疊起來
    //* 2. 將以下所有的 html 標籤複製到剛才的 div.container 前一行
    //* 3. 將 div.container 移到下方指定位置
    //* 4. 請勿更動任何出現於本頁的樣式

    ?>
    <div class="d-flex">
      <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-aside.php"); ?>
      <div class="w-100">
        <?php include("/xampp/htdocs/Fundodo/dashboard/dashboard-header.php"); ?>
        <div class="db_content">
          <!-- 請用 div.container 取代這行  -->
        </div>
      </div>
    </div>