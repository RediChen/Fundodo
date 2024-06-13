<?php
$to_tool = "/xampp/htdocs/Fundodo/tools/";
// require_once("/xampp/htdocs/connectDB_fdd.php");
include($to_tool . "tool-lib.php");
//todo 本地測試用
include($to_tool . "console-lib.php");
?>
<!DOCTYPE html>
<html lang="zh-Hant-tw">

<head>
  <title>預覽圖片功能</title>
  <?php include($to_tool . "common-head.php"); ?>
  <style>
    body {
      background-color: #333;
      color: ivory;
    }

    .img-wrap {
      margin-bottom: 3rem;
      background-color: #444;
      border-radius: 0.5rem;
      min-height: 240px;

      img {
        width: 100%;
        max-height: 240px;
        object-fit: cover;
      }
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
    }
    figure {
      text-align: center;
      &:hover {
        box-shadow: inset 0 0 0 5px goldenrod;
      }
      p {
        text-align: center;
        background-color: #666;
      }
    }
  </style>
</head>

<body>
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-8 col-lg-6">

        <div>
          <input type="file" id="one-input" class="form-control">
        </div>
        <div class="img-wrap" id="img-case"></div>
        <div>
          <input type="file" id="multi-input" class="form-control" multiple>
        </div>
        <div class="img-wrap grid" id="img-box"></div>
      </div>
    </div>
  </div>
  <script>
    const imgInput1 = document.querySelector("#one-input");
    const imgInputN = document.querySelector("#multi-input");
    const box1 = document.querySelector("#img-case");
    const boxN = document.querySelector("#img-box");

    imgInput1.addEventListener("change", function() {
      if (!this.files || this.files.length <= 0) return;

      let reader = new FileReader(); //物件

      reader.readAsDataURL(this.files[0]);
      console.log('難道名字是：', this.files[0].name);
      reader.onload = function() {
        //todo

        console.log(reader);
        //todo
        let dataURL = this.result;
        box1.innerHTML = `<img src="${dataURL}">`;
      }
    });

    imgInputN.addEventListener("change", function() {
      if (!this.files || this.files.length <= 0) return;

      for (let file of this.files) {
        let reader = new FileReader(); //物件
        reader.readAsDataURL(file);
        reader.onload = function() {
          let dataURL = this.result;
          boxN.innerHTML += `<figure><img src="${dataURL}"><p>${file.name}</p></figure>`;
        }
      }
    });
  </script>
</body>

</html>