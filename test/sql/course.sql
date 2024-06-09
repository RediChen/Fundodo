-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-06-02 18:23:51
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `fundodo`
--

-- --------------------------------------------------------

--
-- 資料表結構 `courses`
--

CREATE TABLE `courses` (
  `id` mediumint(6) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `abstract` varchar(400) NOT NULL,
  `description` text DEFAULT NULL,
  `price` mediumint(6) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `courses`
--

INSERT INTO `courses` (`id`, `title`, `abstract`, `description`, `price`, `created_at`, `deleted_at`) VALUES
(1, '玩出好感情！與狗兒的互動遊戲課', '與狗兒的線上遊戲課程，一起練習合作遊戲，加深彼此的信任關係！', NULL, 1200, '2023-10-18 11:02:37', NULL),
(2, '【狗狗教養實作】線上體驗課', '6/13 (四) ：不同狗兒教養方式全面解析 ！+ 吠叫案例詳解 【好評加開！報名截止日到 6/12（三） 23:59】6/23 （日）：破解常見狗狗教養迷思！+ 戶外撿拾案例詳解【報名截止日到 6/21（五） 23:59】', NULL, 350, '2023-10-18 19:32:47', NULL),
(3, '正向教養生活課－吃飯啃咬', '餵正餐時狗兒愛吃不吃，非得要過一兩小時才肯吃光，一邊趕上班一邊配合狗兒步調，情緒好崩潰！散步又會到處撿拾，不知道吃到什麼東西，實在很擔心牠的安全。面對這類生活裡經常發生的養狗情境，如何才能找到最理想的解決方案？', NULL, 1200, '2023-10-19 00:00:50', NULL),
(4, '正向教養生活課－洗澡美容', '每月固定要去美容室洗澡的狗兒，總是對於前往表現得異常緊張，拼命往反方向走；甚至對美容師表現躁動，不給剪指甲也不給梳理。面對這類生活裡經常發生的養狗情境，如何才能找到最理想的解決方案？', NULL, 650, '2023-10-19 07:28:00', NULL),
(5, '正向教養生活課－看醫生', '正向教養是以「人狗關係」為核心的沈浸式課程，透過學習如何處理與狗兒的關係，找到問題解法，建立起與狗兒之間的良好溝通。想進一步知道生活中有哪些情境可以運用正向教養嗎？', NULL, 650, '2023-10-19 09:34:01', NULL),
(6, 'Chew Box 操作守則', '如同我們壓力大的時候，會依靠美食來紓壓，「啃咬」除了滿足狗兒的食物多樣性需求，也是狗兒調節情緒的方式，Chew Box 能夠給予狗狗自主使用情緒調節工具的機會。', NULL, 1200, '2023-12-19 20:51:10', NULL),
(7, '2024 狗狗正向教養 6 週高階課程', '在正向教養中，我們會重新學習擁抱自己的情緒，從不同的視角看看與狗兒的關係，重新釐清溫柔與堅定的意涵。', NULL, 9000, '2023-12-20 11:58:19', NULL),
(8, '安全感與五大需求講座', '一些狗兒常見的行為問題可能是源於需求為被滿足，而理解狗兒的需求便是解決行為問題及創造更和諧的人狗關係的第一步。', NULL, 1200, '2023-12-21 04:14:20', NULL),
(9, '2024 狗狗正向教養 6 週初階課程', '透過正向教養工作坊，一起了解溫和與堅定背後的含義，發掘與狗兒生活的更多可能性！', NULL, 9000, '2024-02-21 11:32:23', NULL),
(10, '吠叫講座－聽懂狗兒叫什麼', '吠叫是狗兒用來傳遞訊息、表達情緒的一種方式。理解狗兒吠叫背後想要傳遞的訊息，滿足狗兒的需求，才能最終改善狗兒的吠叫行為並建立良好人狗關係。', NULL, 1200, '2024-02-21 12:46:24', NULL),
(11, '2024 狗狗正向教養 6 週中階課程', '在正向教養中，我們會重新學習擁抱自己的情緒，從不同的視角看看與狗兒的關係，重新釐清溫柔與堅定的意涵。', NULL, 9000, '2024-02-22 05:13:35', NULL),
(12, '看懂狗兒在說什麼！肢體語言講座課程', '學習狗兒的肢體語言，理解狗兒在表達什麼，尊重與滿足狗兒的需求，才能建立起雙向溝通的管道，增進人狗關係。', NULL, 1200, '2024-02-22 10:39:38', NULL),
(13, '壓力與情緒復原力講座', '當狗兒的壓力滿到臨界點時，常常伴隨著激烈反應。一些常見的行為問題，如：吠叫、攻擊，背後的原因都可能是因為「累積過多壓力」。', NULL, 1200, '2024-03-10 18:45:42', NULL),
(14, '狗狗社交講座(上) - 狗兒社交語言大解析', '- 掌握3大玩樂訊號- 6個社交肢體訊號- 4種不同互動狀態的判別（和平社交、激烈玩樂、過度社交、吵架）了解狗兒的社交語言，正確判斷狗兒的社交狀態，累積更多良好社交體驗！', NULL, 1200, '2024-03-13 06:56:53', NULL),
(15, '社交講座(下) - 良好的社交守則', '社交挫敗可能導致狗兒出現對其他狗兒的攻擊行為。講座裡將告訴你怎麼安排狗兒良好的社交活動，避免狗兒社交挫敗，重新建立好的社交經驗!', NULL, 1200, '2024-03-18 21:07:58', NULL),
(16, '完整社交講座大合集', '看懂狗兒的社交語言，評估狗兒的社交狀態，預防社交挫敗的發生。- 掌握3大玩樂訊號- 6個社交肢體訊號- 4種不同互動狀態的判別（和平社交、激烈玩樂、過度社交、吵架）', NULL, 2280, '2024-03-21 13:37:07', NULL),
(17, '嗅聞講座', '透過嗅聞，狗兒可以建構出一個世界! 嗅聞對狗兒來說是很重要的一個需求和減壓方式。', NULL, 1200, '2024-03-25 02:03:10', NULL),
(18, '戶外狗兒也穩定！狗兒專注力 Level Up 實戰訓練課程', '【可無限次重複觀看！】現在開通課程，即加贈 2 篇 Bonus 指令「不衝門」、「等等」訓練！課程將會透過一整套以「人狗信任關係」為核心設計的訓練遊戲，共 9 大指令來鍛鍊我們抓住狗兒的注意力、培養 3 大關鍵能力！透過這些訓練遊戲，培養狗兒在戶外的專注力和穩定性，並強化我們的訓練技巧，過程中更能加深我們和狗兒的信任關係！', NULL, 2900, '2024-04-05 11:09:11', NULL),
(19, '青少年狗！線上行為知識講座', '從抓狂到合作，培養情緒穩定的青少年狗！', NULL, 1200, '2024-04-18 15:12:19', NULL),
(20, '玩出好狗兒！教會狗兒玩玩具、放嘴以及拾回', '可無限次重複觀看！！和狗狗玩玩具，增加狗狗的快樂清單! 這場講座除了會教拔麻怎麼玩玩具以外，也會教導 No 指令的運用和拾回訓練，讓拔麻多一個可以跟狗狗一起快樂的活動！', NULL, 1900, '2024-04-29 18:31:19', NULL),
(21, '戶外遊戲、STAY及召回指令', '可無限次重複觀看！！和狗狗在戶外一起玩遊戲，提升好感情學會STAY和召回，關鍵時刻一召保命', NULL, 2500, '2024-05-06 04:48:21', NULL),
(22, '帶狗出國二三事 - 狗兒出國分享會', '帶狗出國不是夢？帶狗出國的文件流程與訓練細節大公開', NULL, 650, '2024-05-09 09:56:23', NULL),
(23, 'Plenty in Life is Free - 導讀會', '當我們釐清理想中與狗兒關係的樣子，訓練背後對於狗兒和關係的影響，我們的期待與目標，才能找到最合適於我們的練習方式', NULL, 650, '2024-05-13 20:26:23', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `course_category`
--

CREATE TABLE `course_category` (
  `id` int(8) UNSIGNED NOT NULL,
  `course_id` mediumint(6) UNSIGNED NOT NULL,
  `category_id` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `course_category`
--

INSERT INTO `course_category` (`id`, `course_id`, `category_id`) VALUES
(1, 1, 2),
(2, 2, 104),
(3, 3, 104),
(4, 3, 103),
(5, 4, 104),
(6, 4, 103),
(7, 5, 104),
(8, 5, 103),
(9, 6, 3),
(10, 6, 5),
(11, 7, 101),
(12, 7, 104),
(13, 8, 2),
(14, 8, 3),
(15, 8, 101),
(16, 8, 102),
(17, 9, 104),
(18, 10, 101),
(19, 10, 102),
(20, 11, 104),
(21, 12, 101),
(22, 12, 102),
(23, 13, 101),
(24, 13, 102),
(25, 14, 4),
(26, 14, 102),
(27, 15, 4),
(28, 15, 102),
(29, 16, 4),
(30, 16, 102),
(31, 17, 3),
(32, 17, 5),
(33, 17, 102),
(34, 18, 103),
(35, 19, 102),
(36, 20, 2),
(37, 20, 3),
(38, 20, 5),
(39, 21, 2),
(40, 21, 3),
(41, 21, 1),
(42, 22, 103),
(43, 23, 2),
(44, 23, 102);

-- --------------------------------------------------------

--
-- 資料表結構 `crs_categories`
--

CREATE TABLE `crs_categories` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `genre` tinyint(2) UNSIGNED NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `crs_categories`
--

INSERT INTO `crs_categories` (`id`, `genre`, `category`) VALUES
(1, 1, '外出禮儀'),
(2, 1, '感情增溫'),
(3, 1, '情緒穩定'),
(4, 1, '狗兒社交'),
(5, 1, '放鬆紓壓'),
(6, 2, '狗拔麻必修課'),
(7, 2, '線上行為知識講座'),
(8, 2, '主題分享會'),
(9, 2, '正向教養體驗式課程');

-- --------------------------------------------------------

--
-- 資料表結構 `crs_categ_genre`
--

CREATE TABLE `crs_categ_genre` (
  `id` tinyint(2) UNSIGNED NOT NULL,
  `name` varchar(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `crs_categories`
--

INSERT INTO `crs_categ_genre` (`id`, `name`) VALUES
(1, '單一主題'),
(2, '綜合主題');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `crs_categories`
--
ALTER TABLE `crs_categories`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `crs_categ_genre`
--
ALTER TABLE `crs_categ_genre`
  ADD PRIMARY KEY (`id`);


--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `courses`
--
ALTER TABLE `courses`
  MODIFY `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_category`
--
ALTER TABLE `course_category`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `crs_categories`
--
ALTER TABLE `crs_categories`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `crs_categ_genre`
--
ALTER TABLE `crs_categ_genre`
  MODIFY `id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
