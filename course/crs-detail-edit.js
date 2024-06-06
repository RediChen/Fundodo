const popout_c = document.getElementById("popout-confirm");
const btn_act_c = document.getElementById("pop-c-act");
const btn_close_c = document.getElementById("pop-c-btn");
btn_act_c.addEventListener("click", () => {
  popout_c.style.display = "flex";
});
btn_close_c.addEventListener("click", () => {
  popout_c.style.display = "none";
});
const upload = document.querySelector("#toUpload");
const img = document.querySelector("#img-showcase");
let counter = 0;
upload.addEventListener("change", e => {
  let input = e.target;
  let reader = new FileReader(); //物件

  console.log(input);
  reader.readAsDataURL(input.files[0]);
  reader.onload = () => {
    let dataURL = reader.result;
    img.setAttribute('src', dataURL);
    img.style.display = "inline";
  }
});