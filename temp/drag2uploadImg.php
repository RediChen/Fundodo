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
  <title>失敗 | 拖曳上傳圖片功能</title>
  <?php include($to_tool . "common-head.php"); ?>
  <style>
    body {
      background-color: #333;
      color: ivory;
    }

    #img-box {

      min-height: 240px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      position: relative;

      &:hover {
        box-shadow: inset 0 0 0 3px #fff;
      }

      img {
        width: 100%;
        /* height: 240px; */
        object-fit: cover;
      }

      &::before {
        content: '拖曳至此以上傳';
        background-color: #444;
        border-radius: 0.5rem;
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        z-index: -1;
      }
    }

    figure {
      text-align: center;
      transition: filter .4s;

      &:hover {
        filter: brightness(1.1);
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
          <input type="file" id="multi-input" class="form-control" multiple>
        </div>
        <div id="img-box"></div>
      </div>
    </div>
  </div>
  <script>
    const imgInput = document.querySelector("#multi-input");
    const box = document.querySelector("#img-box");

    const previewImage = (fileArr) => {
      if (!fileArr || fileArr.length <= 0) return;
      box.innerHTML = "";
      for (let file of fileArr) {
        const reader = new FileReader(); //物件
        reader.readAsDataURL(file);
        reader.onload = function() {
          let dataURL = this.result;
          box.innerHTML += `<figure><img src="${dataURL}"><p>${file.name}</p></figure>`;
        }
      }
    }

    // imgInput.addEventListener("change", previewImage(this.files));
    imgInput.addEventListener("change", previewImage(imgInput.files));

    box.addEventListener("drop", function(e) {
      e.preventDefault();
      const transfer = DataTransfer();

      const file1 = transfer.files[0];
      //todo 轉手給 input

      imgInput.files = [];
      for (let file of transfer.files) {
        imgInput.files.push(file);
      }
    });
  </script>
</body>

</html>