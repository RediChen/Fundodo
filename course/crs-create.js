const upload = document.querySelector("#upload-img");
const imgBox = document.querySelector("#thumbnail-box");
let counter = 0;
//================================================
{/* <div>
  <img src="" alt="" class="thumbnails object-fit-cover" style="display: none; max-width: 500px">
</div> */}
//================================================
upload.addEventListener("change", e => {
  let input = e.target;
  let reader = new FileReader(); //物件

  console.log(input);
  // reader.readAsDataURL(input.files[0]);
  // reader.onload = () => {
  //   let dataURL = reader.result;
  //   let frameNode = document.createElement('div');
  //   frameNode.innerHTML = `<div>
  //                           <img src="${dataURL}" alt="" class="crs_thumbnails object-fit-cover">
  //                         </div>`;
  //   imgBox.appendChild(frameNode);
  // }
  readImgOf(0);
  readImgOf(1);
  

  let readImgOf = i => {
    new Promise((resolve, reject) => {
      resolve({ i });
      reject(new Error(`第${i + 1}張讀取失敗`));
    }).then(() => {
      reader.readAsDataURL(input.files[i]);
    }).then(() => {
      let dataURL = reader.result;
      let frameNode = document.createElement('div');
      frameNode.innerHTML = `<div>
                              <img src="${dataURL}" alt="" class="crs_thumbnails object-fit-cover">
                            </div>`;
      imgBox.appendChild(frameNode);
    });
  }


});

//================================================
//================================================
//================================================

const popout_c = document.getElementById("popout-confirm");
const btn_act_c = document.getElementById("pop-c-act");
const btn_close_c = document.getElementById("pop-c-btn");
btn_act_c.addEventListener("click", () => {
  popout_c.style.display = "flex";
});
btn_close_c.addEventListener("click", () => {
  popout_c.style.display = "none";
});