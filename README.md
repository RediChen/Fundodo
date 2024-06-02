# Fundodo
Fundodo website project

# 開發指南

當你 clone 此專案後，請將整個專案資料夾（fundodo）移至 XAMPP 的 htdocs 資料夾中。

接著將其中的 .vscode 資料夾移出，至 htdocs 資料夾的位置。

要上傳前，需要再將 .vscode 資料夾移回專案資料夾（fundodo）中。



# ～使用說明 - SCSS～

## 已經準備好的東西

無論在那個頁面，都請用 `<link>` 連結 `fundodo/style.css` 這個樣式檔。

其包含 Boostrap 及其 normalize、font awesome。

而當各分頁用的 scss 連結至「主要的 scss 檔」時（參：## 各分頁用的 scss 檔），

即可以使用預先設定好的主題色變數（查表請至 fundodo/scss/_variables.scss）。


## 各分頁用的 scss 檔

SCSS 檔的取名務必要以底線開始，並集中放到 scss 資料夾中（你可以參考已經在 scss 資料夾中的 .scss 檔）。

將自己的 SCSS 檔匯入到此專案資料夾最外面的 style.scss 檔（你可以參考這個檔中上下行的寫法）。


# 使用說明 - 頁面連結

連結個人負責的頁面，請至 dashboard.html 中更改。

詳細位置在 `<aside>` 中的 `<li>`，建議可以用畫面上的連結標題搜尋之。

可以直接設置「連結 href」與「連結標題 LINK」

# ～一些小事情～

## 關於 `index.txt`

因為當瀏覽器一進 fundodo 這個資料夾時，會自動讀取名為 index.html 的檔案，但這個行為對於需要資料夾目錄的我們會造成不方便，因此我暫時把它變成無效化的 txt 檔。

## 關於 `.vscode` 資料夾

這個資料夾中有一個 settings.json 檔，是為了設定轉檔出的 css 檔要擺在哪。但是為了配合 XAMPP 的設定，這個設定檔必須放在根目錄（htdocs 資料夾）中。因此請在