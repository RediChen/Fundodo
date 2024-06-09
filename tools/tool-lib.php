<?php
function leadTo(string $path)
{
    header("Location: $path");
    exit;
}
/**
 * @description 生成歸檔圖片的格式化檔名
 * @param string $genre:兩個大寫字母以代表網站區域
 * @param int $id: 對應的項目 id
 * @param int $i_img: 圖片在該項目所屬下的子序號
 * @param string $format: 圖片的副檔名
 */
function formatFileName(string $genre,int $id, int $i_img, string $format)
{
    return $genre . sprintf("%06d", $id) . $i_img . '.' . $format;
}
?>