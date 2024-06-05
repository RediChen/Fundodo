# Fundodo ‧ 開發指南
Fundodo website project

# ──&emsp;clone 專案&emsp;──

1. 在 clone 本專案時，請將 clone 的位置選擇 htdocs 資料夾。也就是專案資料夾在 `htdocs/fundodo` 的位址。

2. 接著請以 fundodo 為 VS Code 的工作區域

當你 clone 此專案時，VS Code 會問你要不要開啟此資料夾，請答應。

3. 此模式下：
- VS Code 的檔案總管只能看到 fundodo 資料夾內的檔案。
- 無須移動 .vscode 資料夾。
- 不影響 XAMPP 的運行

---
# ──&emsp;已經準備好的東西&emsp;──

- `.sql` for 資料匯入
- `tools/` for 常用函數與 CDN、字型的匯入
- `fundodo/style.css` for 共用樣式與 Bootstrap、normalize


# ──&emsp;SCSS&emsp;──

#### 關於 `fundodo/style.css`

此為透過 SCSS 合併的總樣式檔，所有的樣式、模組，還有 Bootstrap 的設定都可以使用。

並且也會合併我們各自的頁面所設定的樣式，即不必在不同頁面連結不同的樣式檔。

各分頁用的樣式如何合併？方式參下方段落（## 各分頁用的 scss 檔）

## 連結方式

請在 `<head>` 中直接使用以下指令，無論使用的 php 檔身在何處，都能成功讀到。

```php
<?php include("/xampp/htdocs/Fundodo/tools/common-head.php"); ?>
```

### 說明

`common-head.php` 會一併匯入：
- `fundodo/style.css`（總樣式檔）
- font awesome
- animate CSS（modal 等需求）
- `<head>` 共通的 RWD 設定。

## 顏色選項

我們已經設定好色票組，設定於 `fundodo/scss/_variables.scss`。顏色不用自己配，只需要從中挑選即可。

Bootstrap 中可以用的顏色關鍵字: `primary`, `danger`, `light`, `secondary`
其餘如 warning 則請避免使用，並從色票組中選擇。


即可以使用預先設定好的主題色變數（查表請至 fundodo/scss/_variables.scss）。


## 各分頁用的 scss 檔

SCSS 檔的取名務必要以底線開始，並集中放到 scss 資料夾中（你可以參考已經在 scss 資料夾中的 .scss 檔）。

將自己的 SCSS 檔匯入到此專案資料夾最外面的 style.scss 檔（你可以參考這個檔中上下行的寫法）。

# ──&emsp;頁面串接&emsp;──

大家的頁面都會連結至後台的管理儀表板 dashboard，請至 dashboard.html 中更改。

詳細位置在 `<aside>` 中的 `<li>`，建議可以用畫面上的連結標題搜尋之。

可以直接設置「連結（href）」與「連結標題（LINK）」

# ──&emsp;一些小事情&emsp;──

### 關於 `index.txt`

因為當瀏覽器一進 fundodo 這個資料夾時，會自動讀取名為 index.html 的檔案，但這個行為對於需要資料夾目錄的我們會造成不方便，因此「暫時」把它變成無效化的 txt 檔。

### 關於 `.vscode` 資料夾

這個資料夾中有一個 settings.json 檔，是為了設定轉檔出的 css 檔要擺在哪。但是為了配合 XAMPP 的設定，這個設定檔必須放在根目錄（htdocs 資料夾）中。因此請在