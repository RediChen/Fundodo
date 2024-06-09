SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- 資料表結構 `cities`
--

CREATE TABLE `cities` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, '台北市'),
(2, '新北市'),
(3, '基隆市'),
(4, '桃園市'),
(5, '新竹市'),
(6, '新竹縣'),
(7, '苗栗縣'),
(8, '台中市'),
(9, '彰化縣'),
(10, '南投縣'),
(11, '嘉義市'),
(12, '嘉義縣'),
(13, '雲林縣'),
(14, '台南市'),
(15, '高雄市'),
(16, '屏東縣'),
(17, '宜蘭縣'),
(18, '花蓮縣'),
(19, '台東縣'),
(20, '澎湖縣'),
(21, '金門縣'),
(22, '連江縣');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `account` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `user_level` tinyint(2) UNSIGNED NOT NULL,
  `valid` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `dob` date NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(50) NOT NULL,
  `avatar_file` varchar(150) NOT NULL,
  `address` varchar(100) NOT NULL,
  `adr_city` tinyint(4) UNSIGNED NOT NULL,
  `adr_district` int(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `name`, `nickname`, `account`, `password_hash`, `gender`, `user_level`, `valid`, `dob`, `tel`, `email`, `avatar`, `avatar_file`, `address`, `adr_city`, `adr_district`, `created_at`, `deleted_at`) VALUES
(1, '管理者', 'admin', 'admin', '$2y$10$4KiuieHHRmbB72tKPqLHL.a997wzgQrbB.RnDTfD6mvp1zji.txEi', '1', 20, 1, '1990-01-19', '0900000000', 'admin@outlook.com', '龜龜', '1.png', '聖德學院', 6, 312, '2023-04-10 12:00:00', NULL),
(2, '邱越靈', 'Betty', 'Betty119', '12345', '2', 0, 3, '1997-09-20', '0960008329', 'mallette7168@outlook.com', '', '0', '新光路16號6樓', 8, 412, '2023-04-10 22:02:02', NULL),
(3, '余林瑄', 'otter', 'otter740', '$2y$10$trENTd0bXogTky0gWVqAdOsV644wbp/Xxm1whbqndoscWpBuFcvkG', '2', 3, 1, '2008-05-16', '0919491929', 'belinda3377@yahoo.com', '', '0', '重慶路36號', 8, 407, '2023-04-11 08:24:08', NULL),
(4, '詹庭樂', 'Sarah', 'Sarah38', '$2y$10$sYZbmw2Lfz0PrxXJCYju5eqiAxBxrfKiAPTXmv9AgLrQ3EiBm2jey', '2', 3, 1, '1962-11-21', '0930290396', 'cullen7136@outlook.com', '', '0', '朝富一街56號', 8, 407, '2023-04-11 13:39:19', NULL),
(5, '鄒淳隆', 'hen', 'hen68', '$2y$10$YF64276GR/OdCcj7BEUvdO2o6ETMGcfOdgXqYCKxMgn3uC4Qh/KPK', '1', 0, 1, '1991-06-10', '0916870324', 'tristan9092@outlook.com', '', '0', '更生路51號之6', 19, 950, '2023-04-12 01:06:31', NULL),
(6, '嚴然羣', 'jarrett9223', 'jarrett9223758', '$2y$10$FMYAU66lbG7gbMGDhf.agezA/J6VwpoP6exwZ7Dg6O7kEMBFW/YVS', '1', 0, 1, '1971-06-01', '0968650439', 'jarrett9223@gmail.com', '', '0', '興隆路４段38號', 1, 116, '2023-04-12 05:15:42', NULL),
(7, '李嚴銘', 'Ethan', 'Ethan645', '$2y$10$younCe44d40HjPF1eRDzmOPI1V4AEQ9rakY58lus3O6CPa0c6HnIO', '1', 0, 1, '2013-07-13', '0952931801', 'butler9852@gmail.com', '', '0', '中周寮21號', 14, 723, '2023-04-12 11:40:53', NULL),
(8, '許楚霜', 'horse', 'horse964', '$2y$10$KI8LRPj7nimRKo7R12NrTOoNpqz9HkfyA/7./Qaml3.KtcMDCrrLm', '1', 0, 1, '2013-12-16', '0938736271', 'alvarez3206@yahoo.com', '', '0', '光中路75號', 2, 235, '2023-04-12 15:41:54', NULL),
(9, '楊強瑾', 'bison', 'bison126', '$2y$10$6MMQGq5qX9P7AyDKSdLSRehh.PfyzB71vqse1mXW5JbkCBbD3bxBC', '1', 0, 1, '1990-11-11', '0953760801', 'eduardo5947@hotmail.com', '', '0', '法院後街34號', 4, 330, '2023-04-13 01:44:06', NULL),
(10, '張依越', 'christian9490', 'christian9490969', '$2y$10$RxBytjST8qqJoNfTyTBy4OKMj0/oWoIbC.TwrzjHStu36owiwh6NW', '1', 0, 1, '1965-05-27', '0918600774', 'christian9490@hotmail.com', '', '0', '普仁32號', 4, 320, '2023-04-13 11:01:06', NULL),
(11, '謝君啟', 'Bryson', 'Bryson486', '$2y$10$dLuxXWc.ser1sSXKH/1Q9ucd0T/QfQwCuU0TssqWE2wYYU7rfyJki', '1', 0, 1, '2002-02-03', '0989184758', 'bryson5111@gmail.com', '', '0', '大馬路47號9樓', 8, 438, '2023-04-13 18:15:10', NULL),
(12, '張嘉常', 'Mike', 'Mike777', '$2y$10$Yz/toU/y38D5rJnTGtKcl.56B44DrLKxQjRsq54edX361xAVdKlam', '1', 0, 1, '2009-05-26', '0924540888', 'mike8845@gmail.com', '', '0', '民權西路80號之13', 1, 103, '2023-04-13 19:46:12', NULL),
(13, '黃丞月', 'zebra', 'zebra579', '$2y$10$xG.OQtd7xOOZ2WNvg8ECbeN1ulSfkLhKYuq/UsORT0IkLjRcQfjZW', '2', 0, 1, '1998-05-29', '0914492178', 'kiley1011@outlook.com', '', '0', '中正路16號', 13, 654, '2023-04-13 20:05:16', NULL),
(14, '陳啟振', 'trenton9996', 'trenton9996675', '$2y$10$yUcbBkNK5/8tHAQNmKk63eKOxlVYgj94nXiFHkEU96nyrnGwg/KMu', '1', 0, 1, '1971-10-10', '0934179509', 'trenton9996@gmail.com', '', '0', '民生南路62號之4', 11, 600, '2023-04-14 08:14:21', NULL),
(15, '張媛宗', 'paisley9413', 'paisley9413262', '$2y$10$sxpZxW0wMZWMYoTU2ZrKNOE6kH.pEgtUFjYjSzGp8fuNBNkI4LRq.', '2', 0, 1, '1974-04-13', '0918771496', 'paisley9413@outlook.com', '', '0', '建國路5號之13', 16, 900, '2023-04-14 12:35:33', NULL),
(16, '林水祐', 'matthew5279', 'matthew5279385', '$2y$10$rwiUEHvZEnhNAcTPQWgSmuFHyfmQPGev0VWsxIKClYX1TeLvFFMp.', '1', 0, 1, '2012-12-22', '0937857984', 'matthew5279@hotmail.com', '', '0', '下林14號', 14, 737, '2023-04-15 04:41:40', NULL),
(17, '黎可樹', 'rahman3940', 'rahman3940797', '$2y$10$tGNeT82pUAmT8qZGAam1/.UVdibb.O21AiogqRtcyYiIEtKf6bmBS', '1', 0, 1, '1965-11-05', '0917661715', 'rahman3940@outlook.com', '', '0', '白地街36號', 6, 302, '2023-04-15 16:42:44', NULL),
(18, '陳曄軒', 'orange', 'orange164', '$2y$10$PMG.NgdB9qp9PdNekraqeuwpG4tBHC0VcGItZTKv1OhsEsaD6EqDC', '2', 0, 1, '2013-01-13', '0921111615', 'tiffany8667@gmail.com', '', '0', '遼寧二街23號之11', 11, 600, '2023-04-15 20:53:47', NULL),
(19, '陳磊道', 'arcticfox', 'arcticfox543', '$2y$10$GoeTIWqGHR7Kfc4va4tCL.B1QDIaLPaKYH5vSpvIEIarl.74tcuki', '1', 0, 1, '2007-03-04', '0910633885', 'clements3462@icloud.com', '', '0', '復興三路40號', 17, 268, '2023-04-16 10:21:57', NULL),
(20, '黃然萱', 'blaine2641', 'blaine2641653', '$2y$10$kTuiN.9ZLliLFEWwGYQ.2OwR6MbGJiig7NnKL5YcD/Jngs.TV9Pdm', '2', 0, 1, '1995-09-30', '0932742033', 'blaine2641@gmail.com', '', '0', '保健路92號3樓', 2, 235, '2023-04-17 03:29:08', NULL),
(21, '李婭靄', 'stanford7163', 'stanford7163179', '$2y$10$kELn/fnjqjSLI/JTv2GyMurtSSvf99cYGtlpZwlIaFI8IWarH9BoW', '2', 0, 1, '2001-12-02', '0955459590', 'stanford7163@gmail.com', '', '0', '員鹿路２段85號', 9, 514, '2023-04-17 05:51:12', NULL),
(22, '陳瑤純', 'gaddis2827', 'gaddis2827551', '$2y$10$5qvZN.U//29iBJByf72/8es7YxlYfLp7k4zYO2BlY69mS5OpipUxa', '2', 0, 1, '1998-01-31', '0924917263', 'gaddis2827@outlook.com', '', '0', '文華街2號4樓', 11, 600, '2023-04-17 19:19:19', NULL),
(23, '曾梅玟', 'Alyssa', 'Alyssa765', '$2y$10$Ge5396fJWCE0QXOTvxBkwOBUcn/KdAWOVwWe7gPfdDt29SlGZaHxu', '2', 0, 1, '2007-05-03', '0927064963', 'alyssa4220@gmail.com', '', '0', '豐東路93號12樓之17', 8, 420, '2023-04-18 06:29:22', NULL),
(24, '許懋朋', 'fox', 'fox536', '$2y$10$BPlYkuxGkvG6MJ4JMVXzlOazYXl8Taerl/VfjMVYpQgsmp6DEcKgG', '1', 0, 1, '2011-10-14', '0986121777', 'swift518@gmail.com', '', '0', '新生路60號', 19, 961, '2023-04-18 12:53:24', NULL),
(25, '洪庭韻', 'ava1583', 'ava1583641', '$2y$10$aio.Nt1IqsQclEM1CbChdep7bnFf3Omku8/OYrxlrZRmbCItEKKsW', '2', 0, 1, '1971-10-12', '0989605493', 'ava1583@gmail.com', '', '0', '西莊69號', 19, 956, '2023-04-18 17:54:33', NULL),
(26, '彭和於', 'lawson3603', 'lawson360313', '$2y$10$Z3iov1uteZAWDWDaLnyUU.ZDYlRQPv1KXRvJml6T.ZdExblWGvAPm', '2', 0, 1, '1984-05-03', '0982305265', 'lawson3603@gmail.com', '', '0', '倒茄苳91號3樓', 14, 737, '2023-04-18 19:59:36', NULL),
(27, '鄭璇茹', 'bianca6194', 'bianca6194760', '$2y$10$T/hHTESwCRi/eE4BHJBkOuZ6R7PYicKW2MWnvVfBTqk/ESGq2LYvu', '2', 0, 1, '1966-11-24', '0960596942', 'bianca6194@gmail.com', '', '0', '平興街1號', 8, 406, '2023-04-19 02:17:42', NULL),
(28, '魏昕鈺', 'iguana', 'iguana572', '$2y$10$2j4ENHfs6xczJ.gUef4MV.LnEQPPZmW8MNA4t0MNaiLgKrmL3vmva', '2', 0, 1, '1983-08-23', '0914150859', 'sarita8239@gmail.com', '', '0', '萬富三路50號', 17, 266, '2023-04-19 17:26:46', NULL),
(29, '陳嶽清', 'Donald', 'Donald901', '$2y$10$ziJUTtHTO9P7QrTRA.AD2e438fuN1l2ts3WRkYLVBfzplBy2/Vqvu', '1', 0, 1, '1989-05-10', '0972454584', 'donald4893@gmail.com', '', '0', '福州一街88號', 11, 600, '2023-04-20 01:47:49', NULL),
(30, '溫珈進', 'isabel4801', 'isabel4801159', '$2y$10$oMIV0/OqSmGHa4ADNncu/O/.TJNDDLxov1WGSk712tuEkoEeYAwnC', '2', 0, 1, '1978-12-08', '0955020983', 'isabel4801@hotmail.com', '', '0', '信德路71號', 6, 303, '2023-04-20 05:14:00', NULL),
(31, '李嬈宛', 'Pamela', 'Pamela736', '$2y$10$TtJSGqtPZNsovJxyX1f5aepl7egBnN//NPvd/xtMAWPDkng4t/NVG', '2', 0, 1, '2002-10-22', '0917823894', 'pamela989@hotmail.com', '', '0', '新生路86號', 19, 961, '2023-04-20 06:40:10', NULL),
(32, '鄭媗涵', 'leopard', 'leopard361', '$2y$10$gVipvY6wYX4ObNehGXAD6./MT22jyMCDWxgEp0aHoePmZ4qRq96ei', '2', 0, 1, '1992-07-30', '0925034266', 'rebecca1705@gmail.com', '', '0', '興南街84號', 7, 369, '2023-04-20 13:10:15', NULL),
(33, '邱勁霄', 'Clyde', 'Clyde857', '$2y$10$FzcSaanyRMrNrHLNF3x2a.kjz84JJmHRtZQZxwAjRrLMnca7uCbKC', '1', 0, 1, '2019-05-05', '0954967434', 'clyde1857@gmail.com', '', '0', '鹿環東路71號之3', 12, 611, '2023-04-21 03:14:21', NULL),
(34, '溫卓樂', 'Tony', 'Tony853', '$2y$10$IlCbSgQIlWp9N6h7KyYgw.JIhlrDBPzWfqKT4a73SD01n2uzFrEuW', '1', 0, 1, '1965-05-02', '0955214055', 'tony3747@outlook.com', '', '0', '四維街55號', 6, 302, '2023-04-21 14:27:30', NULL),
(35, '田于馨', 'Debbie', 'Debbie964', '$2y$10$yqoYKCPLVQP8dRYVq6nlxuaGpDsps.spefAjp/Ufoixw5dTvWFG8.', '2', 0, 1, '2000-12-09', '0934559877', 'debbie1215@outlook.com', '', '0', '百好街14號', 6, 305, '2023-04-22 04:32:32', NULL),
(36, '鄒任蓁', 'anthony901', 'anthony901686', '$2y$10$AfnnSMSS1fFJJxsVUxR8D.fsx9sxsKnTkv6Sc39vpeQ9LzjXvo4Sa', '1', 0, 1, '2020-07-09', '0958099301', 'anthony901@yahoo.com', '', '0', '縣民大道２段96號', 17, 263, '2023-04-22 05:03:34', NULL),
(37, '賴揚芳', 'haye8870', 'haye8870964', '$2y$10$52MNbheV.iDwWpHWNQB0YOq6k43R9J6d9AqpNeqWNdYQF1pXOxkhC', '2', 0, 1, '1984-02-10', '0910977102', 'haye8870@icloud.com', '', '0', '大成路12號4樓之3', 16, 928, '2023-04-22 06:27:39', NULL),
(38, '許瞻霆', 'logan1346', 'logan1346538', '$2y$10$eBpPN.P7oyzL4.vtbbrHsujMguQcxD4rpV.WHAAdYzrhKXG4vrG2.', '1', 0, 1, '1996-07-31', '0987169370', 'logan1346@yahoo.com', '', '0', '大容西街86號', 8, 408, '2023-04-22 10:55:46', NULL),
(39, '張流祥', 'barlow7599', 'barlow7599431', '$2y$10$eFtoERNsqqYybkOhrArUUe/MzI1v4gCXM6kb7qvKcIfux5Y1rCdz6', '1', 0, 1, '1980-03-10', '0918203668', 'barlow7599@outlook.com', '', '0', '海安路２段55號之2', 14, 700, '2023-04-22 13:12:51', NULL),
(40, '王博叡', 'Hunter', 'Hunter940', '$2y$10$E5wA8pZpPe3FeRT1DRVhBuCqqQZqURg9PUItgPIvBHrnMQ01NT4c.', '1', 0, 1, '1966-02-18', '0961273465', 'price6223@gmail.com', '', '0', '泰昌街50號', 8, 423, '2023-04-23 04:15:58', NULL),
(41, '陸如鷺', 'bonnie5294', 'bonnie5294666', '$2y$10$5zpzt8czhi2lg9WqUUKRJeKKiRl5shg3nDh5ZNlDkthUN6kQA4dkK', '2', 0, 1, '1993-03-08', '0924729835', 'bonnie5294@hotmail.com', '', '0', '紹安路99號4樓', 13, 649, '2023-04-23 20:20:59', NULL),
(42, '楊聰駱', 'birch7861', 'birch7861355', '$2y$10$u59SWJFnPIfmS80Np2zJhO233ar4t6uXpUtfAN8gEPVtoePuYqN4a', '1', 0, 1, '1967-04-14', '0963154557', 'birch7861@gmail.com', '', '0', '新莊路23號', 2, 242, '2023-04-24 13:21:02', NULL),
(43, '盧懋羽', 'Jerry', 'Jerry619', '$2y$10$R/VbyD8T93f9XsInjcnLaew63sYBDOHfFsDTFeONdzpm/TEW5kjEa', '1', 0, 1, '2016-08-23', '0986945658', 'patel2806@icloud.com', '', '0', '隆豐路振昌巷27號', 15, 825, '2023-04-25 05:38:12', NULL),
(44, '鄭材羽', 'beagle', 'beagle393', '$2y$10$dRFhC/U9AWjWjol8iHbJgu6WWSoJDmCG9FCUxp1pw3Sf.pwcLPy..', '1', 0, 1, '1972-04-02', '0920775365', 'kim2189@gmail.com', '', '0', '沙田路24號3樓之15', 8, 433, '2023-04-25 13:05:15', NULL),
(45, '張珊紈', 'lemur', 'lemur448', '$2y$10$jQeQ60iCVn.noZk.ZbQVQuJFjsQCg2ezEuIefFbeakDMNHcCsrXGS', '2', 0, 1, '1968-07-20', '0930895687', 'emma1523@outlook.com', '', '0', '長壽街77號', 2, 241, '2023-04-26 03:17:27', NULL),
(46, '嚴強道', 'peppernell3374', 'peppernell3374954', '$2y$10$lgMRplGgLDAj9nwbwSMuleLJuvt0.ymHQT0tkgAsqNyZswpIxxq6C', '1', 0, 1, '2016-02-22', '0919444479', 'peppernell3374@hotmail.com', '', '0', '文前路綠莊巷38號', 15, 833, '2023-04-26 12:21:37', NULL),
(47, '姚莘詠', 'sonia2147', 'sonia2147395', '$2y$10$ZCVNtXLL0q72Xo5e7W7xhuXxpewvGXCsMA0goMKiTd8TMfLW./sKi', '2', 0, 1, '1979-12-11', '0989473408', 'sonia2147@gmail.com', '', '0', '庵下24號7樓', 21, 894, '2023-04-26 13:50:49', NULL),
(48, '姚亦建', 'shrimp', 'shrimp804', '$2y$10$J206GuNF5AHTjovRx.rvXu8Ivs0ErfxUq6km77j/hn68QSef6iK9i', '2', 0, 1, '1979-04-12', '0911146032', 'benton5891@gmail.com', '', '0', '林仔內49號之16', 12, 624, '2023-04-27 05:59:00', NULL),
(49, '鄧懿晴', 'soda', 'soda786', '$2y$10$FL0DGO1OmxUvP4fiYjw5Zu6g8y3Rij1qNK61bnVIqf7eunBAh9Bxi', '2', 0, 1, '2002-05-05', '0915502876', 'samantha4340@gmail.com', '', '0', '中山南路25號10樓', 8, 439, '2023-04-27 11:11:09', NULL),
(50, '黃易馳', 'Arthur', 'Arthur109', '$2y$10$gC.fKDYPhE31mi7jB1/mV.AkvX3UQ6YMEvcFq5hYM87R.S0lEuc3K', '1', 0, 1, '1969-07-31', '0955365025', 'gonzales783@gmail.com', '', '0', '五權南路61號', 8, 402, '2023-04-28 00:14:13', NULL),
(51, '程祟衞', 'dog', 'dog353', '$2y$10$Yfj3s7Tmgm2GlV/sOA.sBe4MFlrg7LX3AZFYuEsA98szHAXw/3GJG', '1', 0, 1, '2002-09-25', '0963099024', 'robert3769@gmail.com', '', '0', '和睦路團管區巷36號2樓', 17, 260, '2023-04-28 16:25:16', NULL),
(52, '黃玉瑛', 'leopard', 'leopard665', '$2y$10$RbnEdAPvDKWcdh4bAa5wnevVhtEpefaV1PxLHpzwQs1JNsIHiaCMK', '2', 0, 1, '1964-04-25', '0955336271', 'carol5574@gmail.com', '', '0', '新興街50號', 8, 421, '2023-04-29 03:53:23', NULL),
(53, '葉來顏', 'shrimp', 'shrimp956', '$2y$10$EQziiooK9D25ABehKVE1ce9.3D3uv4oIczIP03/ye/e8etChHb9iu', '1', 0, 1, '1962-10-18', '0931054998', 'jared2623@icloud.com', '', '0', '小埤頭16號', 14, 721, '2023-04-29 15:19:23', NULL),
(54, '趙冉芳', 'bonnie2078', 'bonnie2078999', '$2y$10$/ZqLsNdDvrRhjRLBvanv9Ov8K8yZ7tUO7Mm96/ytul3r2PaOS22ZG', '2', 0, 1, '1970-04-12', '0988659455', 'bonnie2078@outlook.com', '', '0', '瑞雄街53號', 15, 806, '2023-04-29 19:41:35', NULL),
(55, '鄭濮瑜', 'beaver', 'beaver245', '$2y$10$IDah/go8qlTUmySP766VzObrnaPVhBtWB.g2Ki75nYC3BLPK.0gEm', '2', 0, 1, '2009-11-12', '0982572506', 'joyce1231@yahoo.com', '', '0', '通潮路32號之12', 16, 920, '2023-04-30 09:59:39', NULL),
(56, '蘇文韻', 'bear', 'bear515', '$2y$10$SfGDMgCXgqkUtMX4/enXWuC7LsE.PJRDzwUrWY3p/b/NhxSvVYmWq', '1', 0, 1, '2003-03-05', '0925460559', 'rodney5346@yahoo.com', '', '0', '漁市場60號9樓', 21, 891, '2023-04-30 21:19:47', NULL),
(57, '王嬡立', 'pudding', 'pudding304', '$2y$10$UH2Rf1KeEVCfFG4p1ISjaeMOB6wcjcdPp5CytbNvuTAhS4izKRY4.', '2', 0, 1, '2007-05-05', '0963186789', 'garland7149@gmail.com', '', '0', '台元街28號4樓之13', 6, 302, '2023-05-01 09:31:48', NULL),
(58, '鄒庭融', 'mushrooms', 'mushrooms501', '$2y$10$EfiG1GOb8HJ5.up0Tg5eneJnR2NIJOGt9Pja/kBjPjsMpBUNgGgxS', '1', 0, 1, '2001-07-27', '0939346330', 'ruben6018@gmail.com', '', '0', '永華一街35號', 18, 973, '2023-05-01 22:41:50', NULL),
(59, '卓採濮', 'brenda4523', 'brenda452354', '$2y$10$IgZRLPGixNlw4cTFnrNR1OjUjCurjZPYQ1pSPSVMfq4ZwGMlR/Sku', '2', 0, 1, '1973-09-18', '0918088355', 'brenda4523@gmail.com', '', '0', '金印山莊79號', 7, 351, '2023-05-02 12:59:57', NULL),
(60, '林初葉', 'Kelly', 'Kelly649', '$2y$10$85wligb3aNNPv5VxHfED2OYbBG4qWUJJN5Wq4ag7.RU6RMQLqQDQu', '2', 0, 1, '1982-06-11', '0923704524', 'kelly4893@hotmail.com', '', '0', '青仔宅38號', 12, 602, '2023-05-02 19:23:01', NULL),
(61, '何奕雲', 'mcgowan5866', 'mcgowan5866888', '$2y$10$k4Q1RiE2qJlwhbRmgXKvFejhOuVbQ6altD2ly96elz2g5dClpxcfC', '1', 0, 1, '1966-05-17', '0968481922', 'mcgowan5866@gmail.com', '', '0', '民享街87號', 12, 608, '2023-05-03 01:43:02', NULL),
(62, '戴利晏', 'croissant', 'croissant497', '$2y$10$en1KiSL4f1gY9kG59OVTWekCjzqbi3ofO6dA4om5oN0VfoSAyrTHC', '2', 0, 1, '2002-08-18', '0963104462', 'gunter4552@gmail.com', '', '0', '新安路44號', 5, 300, '2023-05-03 01:47:12', NULL),
(63, '李柯韜', 'Ralph', 'Ralph777', '$2y$10$MQbIAmnWy7Cknsf8MM8fe.63xtOli5EhMfQfXcFvoOmYwD8TtDdB.', '1', 0, 1, '2005-02-13', '0910736807', 'ralph1994@gmail.com', '', '0', '民興街52號之3', 8, 402, '2023-05-03 10:07:14', NULL),
(64, '金以初', 'frog', 'frog986', '$2y$10$mI5mtEUut.cOldTjIy4AkOcZ.ROt8jPD4CWu0gKwux4PM0LBXc67y', '2', 0, 1, '1993-04-25', '0932015821', 'anna2956@gmail.com', '', '0', '海口88號之13', 4, 337, '2023-05-03 12:10:26', NULL),
(65, '戴曉琪', 'hen', 'hen524', '$2y$10$TzSXWYayWnJcpPludSlQI.HCn27ym1T0ph5SKENdaj8uTL.ck83ky', '1', 0, 1, '1983-07-19', '0923229013', 'bledel4266@gmail.com', '', '0', '中正南路20號', 6, 310, '2023-05-03 21:30:31', NULL),
(66, '周浚辰', 'Brody', 'Brody756', '$2y$10$xlPK.RmYBtLIhu9poGw1UebjndpmnPAfuRxc1YwWpfZ3t59zAY3M2', '1', 0, 1, '1981-08-09', '0989315422', 'brody5944@outlook.com', '', '0', '第六十四號碼頭100號', 15, 806, '2023-05-04 09:32:32', NULL),
(67, '劉孝泓', 'morgan6752', 'morgan6752971', '$2y$10$CcLo3BUpyFQbQrbu0xMLUeHyDqbKDd9WsKumPkMVBaS14ZomaD5dW', '1', 0, 1, '1962-07-07', '0956832790', 'morgan6752@outlook.com', '', '0', '榮安一村82號之5', 4, 335, '2023-05-05 00:58:40', NULL),
(68, '黃泓煒', 'icecream', 'icecream11', '$2y$10$KQmtzjvCjX2yb6j/gzGMBu.b3fS8lEzA9ImvfOjLUTZTNB169NI4W', '1', 0, 1, '1982-12-22', '0953034560', 'walton9811@gmail.com', '', '0', '金山十五街59號3樓之18', 5, 300, '2023-05-05 05:26:43', NULL),
(69, '孫德霄', 'Carl', 'Carl894', '$2y$10$0DnKlRpA2BTA84CdGpvlieRsLDx/cUGddBBXSST0kVKGMUWJIsdLa', '1', 0, 1, '1992-11-03', '0925550569', 'carl4094@yahoo.com', '', '0', '大和街6號4樓', 14, 735, '2023-05-05 17:29:54', NULL),
(70, '林得林', 'Fernando', 'Fernando299', '$2y$10$5o/IHrxVo0P3p.jLhD5s7e92WHF4QNFQAJ1vTFX0Nnns23v8uRUke', '1', 0, 1, '2012-10-12', '0934962606', 'fernando3423@hotmail.com', '', '0', '太平路65號4樓', 8, 411, '2023-05-06 00:31:06', NULL),
(71, '林澍育', 'Daxton', 'Daxton746', '$2y$10$RSurHoLbUsm6S9ol0xUdXO/3bKBggfZ6Uzmm/ugx.j/aos6hQLllG', '1', 0, 1, '1988-01-31', '0963648974', 'cruz6469@yahoo.com', '', '0', '大中一路75號2樓', 15, 807, '2023-05-06 03:00:08', NULL),
(72, '韓漢熹', 'shayla9700', 'shayla9700496', '$2y$10$iN.lwbTl1mWWJWIX9wL//etVjy0Rj/O.sQXZWCqyBwzhtmkLwc4uK', '2', 0, 1, '1961-09-23', '0923722467', 'shayla9700@outlook.com', '', '0', '三光街55號', 2, 241, '2023-05-06 13:24:20', NULL),
(73, '馮俞煒', 'chimpanzee', 'chimpanzee699', '$2y$10$oQHs/qK0QQO05jd/G0akdeaEC8mVIwdF8DoBJOqsSmXyWzmNsTK8O', '1', 0, 1, '1960-04-12', '0928735332', 'trevor750@gmail.com', '', '0', '中正一路碧龍巷22號2樓', 2, 239, '2023-05-06 23:44:28', NULL),
(74, '黃諄韻', 'matthias8559', 'matthias8559506', '$2y$10$GZxLP5dkQjpau4R72DO91.aW48Xvn9Qyn8/f5K7q21wuO64Gw6Hpm', '1', 0, 1, '1983-06-08', '0961304753', 'matthias8559@hotmail.com', '', '0', '祥和三路西段59號3樓', 12, 613, '2023-05-07 10:58:33', NULL),
(75, '葉優揚', 'lemur', 'lemur904', '$2y$10$R0O9wR2Tyfx6em1Mxp9R0Omxfzsmu8vK3Qx2oV8Y.v2bt2hpIeGKe', '2', 0, 1, '1967-10-05', '0913562622', 'turner324@hotmail.com', '', '0', '瑪鋉下街70號', 2, 207, '2023-05-08 00:26:35', NULL),
(76, '姚佩芮', 'Stacie', 'Stacie102', '$2y$10$1waokl61WN.grBKqgUHZ9.Frki7zi8C8l8UnxvCb7fJVCmFwRSTMS', '2', 0, 1, '2002-07-09', '0952501076', 'chavez6784@gmail.com', '', '0', '內挖路47號之5', 2, 227, '2023-05-08 05:37:45', NULL),
(77, '游歆逸', 'bobby1599', 'bobby1599503', '$2y$10$RbR5wxnbr5trTCnc.tcU/uBEA.gsvkqVRZOyU0JuHJGaiIaWx32B2', '1', 0, 1, '2018-12-17', '0968414436', 'bobby1599@gmail.com', '', '0', '中山北路２段93號', 1, 104, '2023-05-08 15:43:48', NULL),
(78, '莊波睿', 'bluewhale', 'bluewhale908', '$2y$10$XdUSYcCW.DzHfb5zT1QApeEtEyI4hezbGNryNjt4E1xKTAkuX.X5S', '1', 0, 1, '1971-11-13', '0917975981', 'eric4669@icloud.com', '', '0', '崇善十六街60號', 14, 701, '2023-05-08 21:04:58', NULL),
(79, '劉如蕾', 'Scarlett', 'Scarlett89', '$2y$10$ThgS8Ba/BW0gsug80l6i8eoDKV/vDYaQdkg7V9/gPp6bJDMzYYdEK', '2', 0, 1, '2008-08-01', '0963992289', 'scarlett8955@outlook.com', '', '0', '光復路２段11號之13', 15, 830, '2023-05-09 01:19:00', NULL),
(80, '王棠薇', 'chloe703', 'chloe70386', '$2y$10$eDLk1t5QrSLqylddR5RVJOlpgvtC6nKnOZBr90BiUBAUroeYG10p6', '2', 0, 1, '1994-01-24', '0934139471', 'chloe703@gmail.com', '', '0', '濱海路４段31號', 15, 852, '2023-05-09 09:20:08', NULL),
(81, '林愛藴', 'bailey1170', 'bailey1170852', '$2y$10$YODMXlKoDjVOUnP93rK5U.WruELNc5SNqHeHszYEnaZTe9MNjPEOW', '2', 0, 1, '1969-09-13', '0982781400', 'bailey1170@icloud.com', '', '0', '中山三路20號', 8, 428, '2023-05-10 02:49:16', NULL),
(82, '黃浩融', 'Michael', 'Michael709', '$2y$10$ACbMAopFVI700iIlEOJ/E.zmgT8fTZnDVOIrXT6.XR4ikK6o1jhS2', '1', 0, 1, '1978-03-19', '0963656549', 'michael9357@gmail.com', '', '0', '港尾80號', 12, 612, '2023-05-10 13:04:26', NULL),
(83, '姚亞言', 'orange', 'orange164', '$2y$10$q./G78tpsieGLUYKHpASXOnATZW/8tnRkKLQ77y0tY9WfFTULxJi.', '2', 0, 1, '1978-11-22', '0933510630', 'mullally9186@gmail.com', '', '0', '員集路３段73號6樓之18', 9, 530, '2023-05-10 21:17:26', NULL),
(84, '謝可晨', 'marcus6405', 'marcus6405733', '$2y$10$e3ApweuI48Bebmh5OW7S1uMQeSs/qabH2n5JWqJfraC9Eh4hDt2VG', '1', 0, 1, '2018-10-19', '0911125344', 'marcus6405@gmail.com', '', '0', '平和南路64號', 15, 812, '2023-05-11 00:30:38', NULL),
(85, '鄒彥益', 'Leilani', 'Leilani479', '$2y$10$bnoW1ZYUfgzHy4haT/jqGOlvxqcVyqsO5JQPmWMVDIFyHuYDOG/fq', '2', 0, 1, '2008-03-18', '0963008114', 'leilani5413@outlook.com', '', '0', '敦富七街82號9樓之9', 8, 406, '2023-05-11 08:51:42', NULL),
(86, '廖政羽', 'breslin9529', 'breslin9529833', '$2y$10$MewB7atUq6mCJBPEP20Y1OJarUl1cErm2QFcZ.Y2Y5ZwYxDfFiUG.', '1', 0, 1, '1994-06-23', '0922322629', 'breslin9529@hotmail.com', '', '0', '建興街24號', 16, 907, '2023-05-11 21:18:53', NULL),
(87, '盧玫賢', 'reyes2031', 'reyes2031115', '$2y$10$wNWkklJT9CMPzB15u6mx8OgaQoFiVn3emOJB1Lq5RcianQ1wmAfRW', '2', 0, 1, '1991-01-09', '0913265032', 'reyes2031@hotmail.com', '', '0', '嘉興街36號12樓', 1, 106, '2023-05-12 10:44:01', NULL),
(88, '涂呈希', 'Shayla', 'Shayla225', '$2y$10$erR7LDXApNeW50EPBsWrheoWn6qde.D3V9YzuDgTeAj7d.LZpFg3S', '2', 0, 1, '2002-09-30', '0954262943', 'whittaker3661@gmail.com', '', '0', '東信路66號', 3, 201, '2023-05-12 23:46:13', NULL),
(89, '謝恩瑗', 'Megan', 'Megan782', '$2y$10$.eQvlsjg6mMPG1Re5hx0mec9/ihU5znpWot5pa6ZBr.Op00oaCb3W', '2', 0, 1, '2007-04-12', '0936192348', 'megan2724@gmail.com', '', '0', '跨港路6號', 17, 270, '2023-05-13 16:47:22', NULL),
(90, '丁懷道', 'sutton5697', 'sutton5697901', '$2y$10$Cv.zt.EeHfbnZWoTRpFPVObViZPR8KZffEYq2GxonF2hW1omkgz0G', '1', 0, 1, '1991-11-25', '0913919341', 'sutton5697@outlook.com', '', '0', '五權西四街13號之1', 8, 403, '2023-05-13 19:01:29', NULL),
(91, '林琳真', 'sierra3738', 'sierra3738440', '$2y$10$WDElwL/kcQxhrZ5FZGGeReKGljUPJ9l2VqLfZ1sasEd8HGtvQM2Da', '2', 0, 1, '2019-05-03', '0989702369', 'sierra3738@gmail.com', '', '0', '中興路73號', 4, 326, '2023-05-13 21:32:38', NULL),
(92, '許晉研', 'Caitlin', 'Caitlin626', '$2y$10$A2zFGxZgZS8tZdXoNzF.RO5xlH6hQCfK5hySa52I3GmxudI1E6GXa', '2', 0, 1, '1986-07-21', '0927386200', 'scott3945@gmail.com', '', '0', '公義路55號', 7, 350, '2023-05-14 01:32:41', NULL),
(93, '葉容語', 'Kathryn', 'Kathryn770', '$2y$10$xQP0zvzOY66YTpOpgP99YOwS3m4Oe3jIDrp1g4wbZMfm5WnD6SbnS', '2', 0, 1, '1991-09-14', '0952090554', 'kathryn5655@icloud.com', '', '0', '三民路25號5樓', 15, 815, '2023-05-14 12:57:50', NULL),
(94, '洪洋海', 'Betty', 'Betty654', '$2y$10$Ka08km59DFddEowK3s6rAu/uz.9pOx/Ec6VY8g6TQIwOYs5YCxIZa', '2', 0, 1, '2000-11-10', '0982011565', 'buckley229@icloud.com', '', '0', '吳竹子53號11樓之10', 12, 613, '2023-05-14 13:26:54', NULL),
(95, '吳羽雄', 'sebastian2902', 'sebastian290262', '$2y$10$5D6wG9bMGowvyMnWu0YeWOYsDGPQwI7MDWwDli5dfHZLy28gt.PV.', '1', 0, 1, '2017-04-06', '0939019916', 'sebastian2902@gmail.com', '', '0', '中油街23號', 4, 337, '2023-05-14 19:41:54', NULL),
(96, '丁偲穎', 'Eva', 'Eva379', '$2y$10$4jWV9Z8N3fWTNWomPMzfuObJkL9DY4EPqoTXH9mV6MVutZhQ9V1ye', '2', 0, 1, '1985-09-01', '0932176192', 'eva6736@icloud.com', '', '0', '昌平路２段92號', 8, 406, '2023-05-14 20:50:05', NULL),
(97, '陸孝育', 'Bryan', 'Bryan828', '$2y$10$g1VUjU0xKFNPUYBzAb87.uwtj04F7srhz6mFN/zuSBXKAplUNscjS', '1', 0, 1, '1999-05-22', '0954844693', 'thomas2400@gmail.com', '', '0', '新龍路66號7樓之13', 4, 325, '2023-05-15 07:07:11', NULL),
(98, '許博家', 'Matthias', 'Matthias560', '$2y$10$5.fXe82y8Sk9gZZn123enOQXSjCs7jPFDyj1M9L3jQkGouzoMLtiG', '1', 0, 1, '1960-12-19', '0925732039', 'matthias4352@gmail.com', '', '0', '安寧街56號之14', 15, 830, '2023-05-15 14:19:17', NULL),
(99, '劉凝於', 'turner8188', 'turner8188443', '$2y$10$0E4l63NPqzo7CEaR6SrZ0OhbXpXuV.28KjNTRtK3ZMTtmD85u1oby', '2', 0, 1, '1980-02-01', '0953390812', 'turner8188@gmail.com', '', '0', '八德路１段13號', 6, 303, '2023-05-15 18:29:28', NULL),
(100, '胡志英', 'randolph9797', 'randolph9797471', '$2y$10$krMjFOR2SbALSBrmA1ySsOd77yO4FgW2HyY4X1/gZZciwsdi4RKLS', '2', 0, 1, '2000-03-27', '0955224128', 'randolph9797@gmail.com', '', '0', '四竹路60號', 9, 512, '2023-05-16 02:51:32', NULL),
(101, '石影月', 'fish', 'fish224', '$2y$10$BWZakshDQf5tYy0..T6Yre8mDU1y6bIJ13p6i4tdUblGh2tA8FQKC', '2', 0, 1, '2010-04-10', '0930597139', 'oliver8272@gmail.com', '', '0', '太康2號5樓', 14, 736, '2023-05-16 09:00:32', NULL),
(102, '謝乾霆', 'Noah', 'Noah496', '$2y$10$pQ5aykSS9hChr.v8Ym258OH/0eGy6tRKEwuD4MdpKnV2Bh5AqYqNW', '1', 0, 1, '1986-04-12', '0934629318', 'noah1666@gmail.com', '', '0', '館前18號之1', 7, 350, '2023-05-16 23:21:38', NULL),
(103, '周月秉', 'gaddis9938', 'gaddis9938155', '$2y$10$N1jvYbBpZMLmPTDI3iNSluuJ.aZxEXLNITdDKW4pPoImwelSowEoS', '1', 0, 1, '1966-05-30', '0914351295', 'gaddis9938@gmail.com', '', '0', '文化路89號之10', 13, 640, '2023-05-17 05:32:49', NULL),
(104, '林育鈺', 'Miriam', 'Miriam332', '$2y$10$yRG7qdLEfmWasC74G0TfUOvqtf328m1mVTwsDU6htIko4CWcth/s6', '2', 0, 1, '2006-11-04', '0988228227', 'white4065@gmail.com', '', '0', '海興街48號9樓', 12, 625, '2023-05-17 19:49:57', NULL),
(105, '林珺莎', 'grace9434', 'grace9434667', '$2y$10$RymPuCXjC9532HELPlFrzuXkgzpfB7Qpsi42gKbyRBcSnHRKLrMH2', '2', 0, 1, '1975-01-05', '0921834777', 'grace9434@gmail.com', '', '0', '仁福一街75號', 4, 320, '2023-05-18 09:11:01', NULL),
(106, '汪微靜', 'panda', 'panda252', '$2y$10$57EePpGcLDeQLQwYMHSl8egtRwSfDFOGEVFPj5nXebstUIDRt.6GG', '2', 0, 1, '2011-12-04', '0938751585', 'chantel131@icloud.com', '', '0', '協力街45號之9', 15, 846, '2023-05-18 19:23:05', NULL),
(107, '林冉泓', 'alligator', 'alligator76', '$2y$10$wSv8yHzA0Yf.8Hw3egGF4OVONZAZEjPdLkbaWcNzfvz8eTUdid6Qy', '2', 0, 1, '1979-06-24', '0958144872', 'beverly6944@gmail.com', '', '0', '烏山頭92號', 14, 719, '2023-05-18 22:37:12', NULL),
(108, '阮嚴棋', 'raymond2727', 'raymond2727642', '$2y$10$4FhfGDEht6pH42T5Jr.u3udMOMIEzJzt3mHTLcS7mMPk6JMNZryn6', '1', 0, 1, '1987-03-10', '0927097176', 'raymond2727@gmail.com', '', '0', '中正路立功巷56號5樓', 16, 909, '2023-05-19 06:56:16', NULL),
(109, '白姿清', 'Cassie', 'Cassie928', '$2y$10$kxKUHe/0W0yJVDBibDiPZOPP.xLyWj/1EBpH/gxuEqY/sXhr1pnRO', '2', 0, 1, '2002-06-12', '0968342219', 'cassie2453@yahoo.com', '', '0', '松竹二路30號6樓之6', 8, 406, '2023-05-19 20:10:26', NULL),
(110, '林碩耿', 'Christian', 'Christian388', '$2y$10$CEYG.V9AszZP24zBv9LlkOXio32V3NXxIF411fh6mMvwPuOl88I96', '1', 0, 1, '2019-07-05', '0989235136', 'kelly4609@hotmail.com', '', '0', '建國路65號11樓', 2, 239, '2023-05-19 23:23:28', NULL),
(111, '葉聖蓓', 'Lakshmi', 'Lakshmi827', '$2y$10$b.o47bgWAOO3QmwMOD32ZezT2Jb55bVPGYcw7VIgyLCYXeANjjWAi', '2', 0, 1, '2011-02-16', '0963391906', 'lakshmi2412@gmail.com', '', '0', '海山中街79號', 4, 338, '2023-05-20 05:54:31', NULL),
(112, '翁折祺', 'seth5936', 'seth593699', '$2y$10$NaKusfrcAENpWTMyzB4LCeXjPMc9H7pKiklX4jbqcT2GKamy.F3Wu', '1', 0, 1, '1981-11-11', '0931203726', 'seth5936@outlook.com', '', '0', '大崁三街42號4樓', 2, 249, '2023-05-20 15:16:40', NULL),
(113, '黃哲鶴', 'shrimp', 'shrimp652', '$2y$10$Y4tGzGIcK0QrlJ1cGllGF.6QK8wzojzFpsvj0ufGiBgD0.mbxJHNG', '1', 0, 1, '1990-08-09', '0937311931', 'mcadams1836@yahoo.com', '', '0', '維新路66號', 15, 830, '2023-05-20 15:26:42', NULL),
(114, '林璐術', 'monkey', 'monkey244', '$2y$10$G58QSuFScIbX7fSpzKprLuTLuHtpTa0e5GXDffaSgm5ZOHxv9UqNK', '2', 0, 1, '1975-07-05', '0932846223', 'allison1574@gmail.com', '', '0', '順安街67號7樓', 2, 231, '2023-05-20 21:32:43', NULL),
(115, '朱夕娜', 'Sonia', 'Sonia611', '$2y$10$ujWysXGUmh6LTxRm4OFjPOp8ldNEp.cVwYKOWfdi3pEfbT9kAgNqu', '2', 0, 1, '2018-01-21', '0988013085', 'jimenez3248@gmail.com', '', '0', '南華一街48號9樓', 4, 338, '2023-05-21 04:58:44', NULL),
(116, '梁語連', 'soymilk', 'soymilk762', '$2y$10$JUjlxOKxfC8i.FcMIp//vOoJjXKwY/dyxXTilPyUNGzJUe45AQq6G', '2', 0, 1, '1971-05-05', '0924887793', 'adames6050@gmail.com', '', '0', '人和二街84號', 14, 735, '2023-05-21 09:19:56', NULL),
(117, '羅海眾', 'leopard', 'leopard361', '$2y$10$zVXE8Cwkel0cihYBC5VPiehPAoMS/WbsT1BGffxDsjdMmq4uGAEl2', '1', 0, 1, '1989-05-29', '0919326588', 'campbell4872@gmail.com', '', '0', '樹林三街18號', 4, 330, '2023-05-22 00:24:06', NULL),
(118, '梁仁浩', 'diaz2911', 'diaz2911328', '$2y$10$Tw3vy0fm0xh1vKcbsZVxv.qZnRTqOBGxWAIO95EKTJXOMf5t/oyoa', '1', 0, 1, '2005-10-03', '0926830876', 'diaz2911@gmail.com', '', '0', '三民街3號4樓', 14, 710, '2023-05-22 06:43:08', NULL),
(119, '侯博夫', 'vegetables', 'vegetables806', '$2y$10$dFKGPGQdWfH.ojhSVZGQt.pNTHx4VL/5P1a6jaJuIXWIU/C21lqzu', '1', 0, 1, '2020-11-13', '0958104906', 'dwight3144@gmail.com', '', '0', '大屯路光華三巷57號', 1, 112, '2023-05-22 23:53:15', NULL),
(120, '賴瀾瑞', 'deer', 'deer258', '$2y$10$Hz.TKzXiHdK/PqjucVZnHOePROVv9Dm0P4mqUEjHWYQ8tL66mV/Ym', '2', 0, 1, '1968-09-23', '0989204903', 'randolph6258@gmail.com', '', '0', '大埔路85號', 9, 500, '2023-05-23 12:01:15', NULL),
(121, '范禎蒨', 'Teresa', 'Teresa205', '$2y$10$1c4WPL9FokN.IvwfDHCarOXsvsqc6tj2PhGai.0guzLw4EsVzCtWW', '2', 0, 1, '2016-03-23', '0956296378', 'spielberg3056@outlook.com', '', '0', '志華巷79號', 15, 842, '2023-05-23 15:25:22', NULL),
(122, '林和瑜', 'Abigail', 'Abigail419', '$2y$10$RORePQoqKJkdYrhOOG6r2ew29gmby.d50.LlzUHQOb/v0hVxoxvuW', '2', 0, 1, '1965-11-12', '0918434062', 'abigail5359@gmail.com', '', '0', '豐正路95號', 18, 974, '2023-05-24 01:34:33', NULL),
(123, '劉晴熹', 'culver2396', 'culver2396872', '$2y$10$p37sFtXhf7k4MUgCZYuPbeh1KXQejpNAkFvj4MneskjrPdeMG5jGm', '2', 0, 1, '2010-07-19', '0933990574', 'culver2396@gmail.com', '', '0', '筆秀路信義巷97號', 15, 825, '2023-05-24 16:44:44', NULL),
(124, '姜彥郜', 'Anthony', 'Anthony663', '$2y$10$Me0Gn5VrfTmcqGqdhozJreF6CtTjwkiix0GK/iMcDNY6bOUmk1m3S', '1', 0, 1, '1978-09-02', '0932924402', 'anthony3691@icloud.com', '', '0', '中正路75號8樓', 2, 235, '2023-05-25 01:57:46', NULL),
(125, '歐卓娜', 'flamingo', 'flamingo896', '$2y$10$Pa4k6YujYoF.j1G4Vt/7/OQNVj2G51I6i.sHRgeJlSA7FdP5/FI.2', '2', 0, 1, '1976-07-15', '0915400973', 'hill3849@gmail.com', '', '0', '大昌路7號', 15, 825, '2023-05-25 16:01:50', NULL),
(126, '蔣恬軒', 'shelley9794', 'shelley9794674', '$2y$10$IcVOgDkHMaU6UoVeHTSAQu.j7R5L678fDnC1HFfW1v5c7dxvSE80m', '2', 0, 1, '1970-11-18', '0913543926', 'shelley9794@yahoo.com', '', '0', '大昌路大德巷59號', 15, 833, '2023-05-26 08:19:57', NULL),
(127, '石愛聖', 'Elizabeth', 'Elizabeth753', '$2y$10$qKsITcmXvT/srEsVOcV4nOg9W5IsL4ndZHOVHX6P6aAB1VpIZJus.', '2', 0, 1, '1966-08-25', '0989377704', 'jimenez5830@gmail.com', '', '0', '大眾五街92號12樓', 14, 709, '2023-05-26 15:50:00', NULL),
(128, '許以慶', 'simmons1176', 'simmons1176597', '$2y$10$8F8ktInDyyU3.oJwwIcesuHg8SqnRhEo3Evd.HSnakIRxWj7oJ8hC', '2', 0, 1, '2011-03-12', '0982156283', 'simmons1176@gmail.com', '', '0', '和平路62號', 14, 721, '2023-05-27 05:12:10', NULL),
(129, '嚴馳鶴', 'Rick', 'Rick564', '$2y$10$J9kYIllLKwZvSC7YLqqMAeNICYOZhDHOQdQhN.BCO8lZRDjKc5ys6', '1', 0, 1, '2014-08-09', '0933137546', 'giles8202@outlook.com', '', '0', '東安路36號6樓之17', 8, 437, '2023-05-27 22:18:15', NULL),
(130, '姚容蓉', 'hamster', 'hamster861', '$2y$10$8Hb9O2CpOjvgHJG3kwCT/uIB8zyCTzAXGyDZ2hP7msVL2E5ThE8k.', '2', 0, 1, '2018-02-17', '0956030740', 'jazmin3981@gmail.com', '', '0', '中興路65號', 8, 434, '2023-05-28 00:22:16', NULL),
(131, '程羣郜', 'Bradford', 'Bradford709', '$2y$10$yJ8ZO43o1cuCehj19YLO4OszKAzfO4NHUqhGKisf1FjF9P/x4Uz4.', '1', 0, 1, '1996-08-10', '0954928883', 'torres5998@hotmail.com', '', '0', '狗頸崙73號9樓之3', 14, 719, '2023-05-28 14:33:17', NULL),
(132, '溫微禎', 'Finley', 'Finley409', '$2y$10$14G6K79q9BlQsPTb1ehYIuSM0c2U4998HusVun2McY4ZMkPEcfR1i', '2', 0, 1, '1985-10-25', '0923292146', 'finley412@hotmail.com', '', '0', '信義新村行政大樓16號', 12, 611, '2023-05-29 05:37:21', NULL),
(133, '曾和永', 'Laura', 'Laura46', '$2y$10$wNpyUMw39sIMtDqcTW8dluEvCTR1JqPhkCTO0ruNP6ysY63IGX.jC', '2', 0, 1, '2015-06-19', '0953577781', 'laura6345@hotmail.com', '', '0', '建成街87號', 16, 907, '2023-05-29 10:37:27', NULL),
(134, '鐘嚴駱', 'gilbert7210', 'gilbert7210386', '$2y$10$9PBG2L9TYKUfBvGc6DW77uQLcIsvPKtyV0Zy0v7ze1XxmghpIJyOS', '1', 0, 1, '1973-05-22', '0928837096', 'gilbert7210@gmail.com', '', '0', '公安路49號', 13, 632, '2023-05-29 19:04:37', NULL),
(135, '游洪祉', 'alan7856', 'alan785611', '$2y$10$yjZEQnnEDEKmspu6kx7Z9O52A482EhYpNMCOci6.Gc7KUD7idmtWW', '1', 0, 1, '1973-08-02', '0914423137', 'alan7856@outlook.com', '', '0', '冷泉路77號', 17, 270, '2023-05-30 11:17:43', NULL),
(136, '蔡尚融', 'blaine3331', 'blaine3331919', '$2y$10$3YixMafguPap6hTus0CNL.FBYp4ZN.YnLhiFNNAPzdYAnlylwMBDK', '1', 0, 1, '1963-07-04', '0934023209', 'blaine3331@gmail.com', '', '0', '新生路吉立巷75號之6', 4, 328, '2023-05-30 22:21:44', NULL),
(137, '邱海燕', 'peterson2449', 'peterson2449859', '$2y$10$UQBaBCbfxwI1SSdHNgK/8eovleAIRTJUaeH2zcI6qT/4RVGncVmyK', '2', 0, 1, '2007-06-23', '0968801987', 'peterson2449@gmail.com', '', '0', '彰南路１段台化一莊44號', 9, 500, '2023-05-31 09:48:53', NULL),
(138, '張琪鷺', 'Tiana', 'Tiana742', '$2y$10$BzH8m3JUUEvzDKn/4G7kVezwKsYEyJ718dqICt.eNdtPDquJ.a6hS', '2', 0, 1, '2000-10-11', '0914493933', 'ross1633@gmail.com', '', '0', '六巷一路56號', 16, 911, '2023-05-31 19:16:55', NULL),
(139, '錢奕添', 'sandwich', 'sandwich617', '$2y$10$2R7H/9LQgRYHmf6aIH.CF.YJjT/HCCWuGNZgiAf7wbFl9oZE9LP8C', '2', 0, 1, '1965-05-02', '0914124202', 'chelsea4370@yahoo.com', '', '0', '泉興巷5號', 17, 270, '2023-05-31 23:36:56', NULL),
(140, '許宥樂', 'Larry', 'Larry644', '$2y$10$ohJg/PQgFsiEHnI6gPJiXOuW9DnOT8MlLSUyynZjexcnde.J.P/BS', '1', 0, 1, '2009-12-01', '0913000428', 'gerard5647@gmail.com', '', '0', '萬仙街36號', 8, 422, '2023-06-01 11:47:01', NULL),
(141, '薛又瀾', 'Angela', 'Angela649', '$2y$10$8h8AQj3dvKfpDUxNL0Pw7unwZDf7RYK6IdIBKZi5n2gsWFT3axqK6', '2', 0, 1, '1998-12-28', '0953972454', 'angela7436@gmail.com', '', '0', '樹林街２段47號', 14, 702, '2023-06-01 20:54:04', NULL),
(142, '黎舟鬆', 'wright3997', 'wright3997102', '$2y$10$GZ/G520cuvrCN/3e7BFFp.yGw/JEF60BYlRXs/kHiiafo2rGXT0Qu', '1', 0, 1, '2015-04-02', '0963734281', 'wright3997@yahoo.com', '', '0', '保安路19號', 4, 327, '2023-06-02 12:04:16', NULL),
(143, '鄭孝麗', 'hart679', 'hart679262', '$2y$10$tS3KgMKWegc6u5jIOh3rI.Ohwk/CHhxZQQ/wtg1X07Ye3KzP/Yi9a', '2', 0, 1, '1993-04-18', '0954632868', 'hart679@gmail.com', '', '0', '潭頭路46號', 15, 832, '2023-06-02 14:18:21', NULL),
(144, '紀凝姣', 'Tara', 'Tara994', '$2y$10$YCLjusjTZqBnqN9ADRwroO3rKJN9tBEqYiawv3IAirXxbiWR3pRF2', '2', 0, 1, '2012-07-16', '0971454584', 'shields4772@gmail.com', '', '0', '民生路１段村頭巷36號3樓', 9, 524, '2023-06-02 14:48:30', NULL),
(145, '姜昭瑞', 'Kimberly', 'Kimberly43', '$2y$10$NHbyUdNpMQ.8E6DYh.fD6e0Ex7KVz66LmcZGvjnP7KwA7V/uZZ6Dq', '2', 0, 1, '1964-12-02', '0917832360', 'kelly1504@outlook.com', '', '0', '市中一路81號之16', 15, 807, '2023-06-03 07:10:38', NULL),
(146, '蔡年業', 'cobra', 'cobra710', '$2y$10$dYdsrUolFwhjzb/b95myAO.lQAU6IkWY8rY0AxbUmIVw2o51kXGyW', '1', 0, 1, '2001-05-23', '0955915475', 'orson7265@gmail.com', '', '0', '元市街21號之14', 9, 521, '2023-06-03 21:26:50', NULL),
(147, '李家義', 'swift2288', 'swift228830', '$2y$10$kExUsB80iOKeTuJZGg37p.Q78Zf4Wg3jzEBESYGA2E8jwzqWowqe.', '2', 0, 1, '2010-08-15', '0910771895', 'swift2288@gmail.com', '', '0', '九甲六路16號4樓', 8, 421, '2023-06-04 14:45:59', NULL),
(148, '丁舒靈', 'rat', 'rat605', '$2y$10$7cTZLVt8Mk5JU8n979d04ubltTJj/uoQ5jdDpsdyJy1Wct0JFNBqm', '2', 0, 1, '1998-07-10', '0931297719', 'gerard8823@gmail.com', '', '0', '竹五路25號9樓', 9, 525, '2023-06-05 06:04:04', NULL),
(149, '邱泰雄', 'Jaden', 'Jaden866', '$2y$10$mpp9WxnzA4A6OD73iY4OVesDy/4MWU1UyRFkSJtRUW38s24GUfJhe', '1', 0, 1, '1989-01-12', '0935571166', 'butler8554@gmail.com', '', '0', '安居街9號之14', 1, 106, '2023-06-05 12:17:06', NULL),
(150, '涂懿琳', 'Amy', 'Amy70', '$2y$10$ixTrlkem.4SmtJJ20kQIMO8CJXqaQwZe0CJlc3rlfNEuvRmQar9X6', '2', 0, 1, '1996-10-03', '0920578545', 'amy5272@gmail.com', '', '0', '崙仔93號', 4, 334, '2023-06-05 22:44:08', NULL),
(151, '江功召', 'Jalen', 'Jalen152', '$2y$10$8.7nWRwWixbCoNj9Qw3/x.J7NiuzENttav/.WWTvdmxdCVqqtZg/O', '1', 0, 1, '1976-02-03', '0923272681', 'jalen6782@gmail.com', '', '0', '軍福十二路88號6樓', 8, 406, '2023-06-06 16:13:18', NULL),
(152, '戴宸睿', 'peppernell1018', 'peppernell101827', '$2y$10$10euaovXMwAsZoNhc0n76uD9nXH3DGcmlGPrzba55yRZdq./9bDPK', '1', 0, 1, '2000-01-04', '0926590815', 'peppernell1018@gmail.com', '', '0', '慶東街慶成二巷57號', 8, 423, '2023-06-07 06:28:24', NULL),
(153, '邱洪黛', 'goose', 'goose390', '$2y$10$TfJXTxQjmBaCUcHkkKJYmOuOJoE4rSJKuOjmryVRImz0f4vO40dTa', '2', 0, 1, '2016-06-12', '0933426816', 'nadia2644@icloud.com', '', '0', '山前路8號', 17, 264, '2023-06-07 22:41:32', NULL),
(154, '馮冬琪', 'Chiara', 'Chiara557', '$2y$10$XoElfpxex8U3qTEkFk0g/uxjTDxzhTGCk9/LQP6V0Yxk41IpmUFqy', '2', 0, 1, '2004-08-19', '0987646311', 'richards4563@gmail.com', '', '0', '南京西路11號', 1, 104, '2023-06-08 13:00:39', NULL),
(155, '林強楠', 'David', 'David730', '$2y$10$H8jDQCxrmKVsQEEHb2tYT.wGYgt0x.sh5J4OH95ZKSSeRumgzuBA2', '1', 0, 1, '1998-11-23', '0954164364', 'david3708@gmail.com', '', '0', '延平路２段92號之17', 13, 630, '2023-06-09 05:22:45', NULL),
(156, '李帆拓', 'Morgan', 'Morgan52', '$2y$10$tD.pc8Uf9y0/fv2FN1J5Zeimdpsu8LmjqWCdm/xElC.pwubu8HPJu', '1', 0, 1, '2001-02-13', '0927738917', 'morgan2711@gmail.com', '', '0', '梓官路73號', 15, 826, '2023-06-09 19:28:54', NULL),
(157, '邱森祉', 'johnson6717', 'johnson6717837', '$2y$10$VMMhsE/hxmS4NKyyzsRhr.Csy6dr5dSjDhYyQSV8kTrRjb40ZRptO', '1', 0, 1, '2012-10-26', '0960217966', 'johnson6717@yahoo.com', '', '0', '豐勢路中盛巷79號4樓', 8, 423, '2023-06-10 06:50:59', NULL),
(158, '張眾靖', 'Rick', 'Rick85', '$2y$10$GKpmJpU3af4IaztbNa07.OHFjrSOAfpwHURORI8Ew0vI0bhihOfiG', '1', 0, 1, '1974-10-30', '0928831832', 'rick717@icloud.com', '', '0', '敦化北路21號2樓', 1, 105, '2023-06-10 18:02:02', NULL),
(159, '董秋翊', 'Nadia', 'Nadia982', '$2y$10$sF3KlJ9/FxnJXMM/UlDkXOJH.PTiSFAj.Sfsi2/pJCC1C9j2Tffpu', '2', 0, 1, '1979-03-10', '0936679497', 'nadia6420@gmail.com', '', '0', '梅亭街83號之14', 8, 404, '2023-06-11 08:16:07', NULL),
(160, '宋均斯', 'poundcakes', 'poundcakes781', '$2y$10$K1YJYpMs0yIUJ2mOVAAa2O6ZY2BujwpETDMmA1HlwI0Z.Pp/3LiLa', '1', 0, 1, '1983-02-17', '0921664417', 'duffy8665@gmail.com', '', '0', '民生街11號', 18, 981, '2023-06-11 11:22:18', NULL),
(161, '李宛蓓', 'zebra', 'zebra427', '$2y$10$QeJ32XXTR/g6dexZU5gTmuqJWRePsoB2y6yvsQRruYaSHutmASlbC', '2', 0, 1, '2002-01-21', '0952349332', 'carey1378@gmail.com', '', '0', '瓦厝子21號之16', 14, 733, '2023-06-11 15:31:26', NULL),
(162, '馮棋華', 'dolphin', 'dolphin529', '$2y$10$.shDxjJP2v3PdcVybCULY.iIaEKhUmZ0t.yRHTaTuuVOayuUUyY1i', '1', 0, 1, '2003-04-13', '0929534948', 'taft6604@hotmail.com', '', '0', '吉林路２段77號', 19, 950, '2023-06-12 07:41:35', NULL),
(163, '洪楠瑋', 'franco1156', 'franco1156100', '$2y$10$EYQnu7gTleogVC3gBpxcP.qBRzRGh/C8KJnd/DsOUKdEj3F7Fk7wa', '1', 0, 1, '2014-07-12', '0935611201', 'franco1156@gmail.com', '', '0', '忠孝街100號2樓', 4, 338, '2023-06-12 22:07:40', NULL),
(164, '吳可建', 'shrimp', 'shrimp652', '$2y$10$DJUceru4/d27vE49mYISw.M5b5Veozb2HLRxSZo7wgiJiGZj/7oPS', '1', 0, 1, '1984-02-17', '0935301706', 'tony3567@gmail.com', '', '0', '西邊路49號', 16, 931, '2023-06-13 02:12:40', NULL),
(165, '程剛齊', 'maddux3834', 'maddux3834267', '$2y$10$.6JG.lIe34I1JZSKdCZCO.jiyo8U.NSIQpO0uJ/TaNLRz99dJ8dFW', '1', 0, 1, '2000-09-17', '0911281537', 'maddux3834@outlook.com', '', '0', '中山路38號6樓', 18, 970, '2023-06-13 17:38:43', NULL),
(166, '楊樂珍', 'Gabriella', 'Gabriella632', '$2y$10$zn9WozNaVxolmUbFKMyd2eiS5wPhcvEj30cuYmPlr5uHa1g3v540S', '2', 0, 1, '1983-10-10', '0910404310', 'gabriella8390@gmail.com', '', '0', '錦安巷35號10樓', 9, 510, '2023-06-14 06:55:50', NULL),
(167, '汪懋琪', 'Jalen', 'Jalen38', '$2y$10$CCC/RNFZ2CWwDI2Ck/LlS.TxQkwUdbhU/0aIRt3RNteoFaEmzvipG', '1', 0, 1, '1961-10-14', '0933835269', 'cecil5229@gmail.com', '', '0', '航盛街73號', 16, 900, '2023-06-14 18:09:52', NULL),
(168, '蕭忠洋', 'spongecake', 'spongecake22', '$2y$10$prpN3I7sQDv98EBfZ85MSOtZomX4reV9xcGAeqduz1FE8xida8HEK', '1', 0, 1, '1968-04-24', '0923377873', 'blake5202@yahoo.com', '', '0', '忠明南路93號', 8, 403, '2023-06-15 04:36:52', NULL),
(169, '羅嶽達', 'Gabriel', 'Gabriel29', '$2y$10$sFkEscY4AbLUH7h12nP8XeQDRutkVuYy2/Zojaj8yQ6.iGei35Nzu', '1', 0, 1, '1973-03-29', '0922231680', 'gabriel8874@outlook.com', '', '0', '自強北路83號', 6, 302, '2023-06-15 07:02:03', NULL),
(170, '李堇業', 'Russell', 'Russell856', '$2y$10$q7XGOHMNEyU8/ELBSH5MW.M9WnRvMGkGJsZ9x3Ojqb3hyTjl6RlJK', '1', 0, 1, '1987-06-03', '0961937392', 'russell4858@yahoo.com', '', '0', '港三街86號10樓之12', 15, 826, '2023-06-15 22:31:06', NULL),
(171, '胡懷芬', 'Chantel', 'Chantel621', '$2y$10$fTIEIb3oGv0vJVqwiCjGlulowGtr7H07EsKzAVjj5M/50iBqi5tJ2', '2', 0, 1, '1990-11-28', '0929553224', 'gonzales4081@gmail.com', '', '0', '坑尾42號4樓之18', 4, 328, '2023-06-16 06:42:11', NULL),
(172, '林珂萍', 'Kelly', 'Kelly409', '$2y$10$p50Jm8nJwDT5YV52mNbGk.gi6.LGBZhVhaBXWDZJHYtOBLzKSjO.C', '2', 0, 1, '1995-02-13', '0960207717', 'kelly8815@hotmail.com', '', '0', '吉林路66號4樓之6', 1, 104, '2023-06-16 13:44:11', NULL),
(173, '彭凰潮', 'roy1124', 'roy1124987', '$2y$10$YyWFNYvTXgf5RyBvspMg4.ADGXQs9bRv/TRWGtZETj.RX1qgwkomW', '1', 0, 1, '2015-07-07', '0986586716', 'roy1124@outlook.com', '', '0', '玉泉路82號', 16, 940, '2023-06-17 00:03:19', NULL),
(174, '鄒瑋祟', 'justin9958', 'justin9958658', '$2y$10$tzZ46SupynWxMw/oYnWuMuoDxlWIGT5LJlqNeQJD0EKJBLn/Oz7iu', '1', 0, 1, '2011-03-30', '0919727247', 'justin9958@outlook.com', '', '0', '平生巷82號4樓', 9, 522, '2023-06-17 00:07:24', NULL),
(175, '吳年昌', 'greg2147', 'greg2147757', '$2y$10$Iogt8pOpfbjq.3s.pf0f3eLFlJl7ubABzIkpresB1Kld4c514P/ia', '1', 0, 1, '2002-02-14', '0932912382', 'greg2147@outlook.com', '', '0', '民族路18號', 2, 251, '2023-06-17 08:27:35', NULL),
(176, '蘇潞真', 'Julie', 'Julie974', '$2y$10$wClm48Co/uCp.CrcRh6Lt.ziBpAxdgThLOt6K/8YgYJBOeyepleiS', '2', 0, 1, '1995-02-09', '0987588490', 'owen8029@gmail.com', '', '0', '府南二路16號10樓之18', 10, 540, '2023-06-17 14:39:41', NULL),
(177, '姜俞曉', 'donkey', 'donkey205', '$2y$10$dlXpAmDyvePLby.DMgi0teza9V7X5oa8yVssWD3qyd5Qa5eeMZlVu', '1', 0, 1, '1975-08-19', '0932193825', 'dennis7881@gmail.com', '', '0', '復興路47號之13', 2, 235, '2023-06-17 16:54:44', NULL),
(178, '梁影秋', 'Carolyn', 'Carolyn369', '$2y$10$UAEr2yhU/M7vYIahsdM6LOkB567tcawNLEJ5A3/CNZBS4vwApx61C', '2', 0, 1, '1987-01-07', '0938847817', 'kirk8994@icloud.com', '', '0', '南埔十一街48號', 18, 973, '2023-06-18 09:16:45', NULL),
(179, '林睿雄', 'shelley3962', 'shelley3962445', '$2y$10$tQd1qwwwBf8RQrW8ABdkzOfUAjUlhUvii/vYzrRfhHouMKDE2iTeW', '1', 0, 1, '2013-11-21', '0971322126', 'shelley3962@outlook.com', '', '0', '紹興南街76號', 1, 100, '2023-06-18 18:45:50', NULL),
(180, '林建翊', 'stacie2316', 'stacie2316728', '$2y$10$qt3yjhdDbAgFsz8DazlzF.KmYr78YXFILJbMzitfxZD7f810/vyRW', '2', 0, 1, '1967-06-30', '0922661907', 'stacie2316@gmail.com', '', '0', '後潭路35號之15', 14, 720, '2023-06-18 18:45:57', NULL),
(181, '黃海瑜', 'austin9929', 'austin9929313', '$2y$10$DAQ90zX6ZydonmHHAU2JXuaemsrtfej0FpOwEW1lzaofdzF2TXNgy', '1', 0, 1, '1993-06-27', '0936670368', 'austin9929@yahoo.com', '', '0', '蛇舌子79號', 2, 223, '2023-06-19 03:16:00', NULL),
(182, '黃子容', 'Benjamin', 'Benjamin321', '$2y$10$4ekC9axcAxCYxVtbhrbGVeSEPAwUunSgF7mmTyH4Qq4IqdULmQLFW', '1', 0, 1, '2020-06-26', '0919023814', 'benjamin1998@gmail.com', '', '0', '東民五街42號', 7, 351, '2023-06-19 10:16:08', NULL),
(183, '阮嬋潔', 'Bailey', 'Bailey712', '$2y$10$Qamt/6pocHOAZihv4jViX.9ecrcwtNY8RxSoAD8IS75ix/rGvH22S', '2', 0, 1, '2020-02-09', '0968109760', 'asher6156@hotmail.com', '', '0', '光路龍田二巷37號5樓', 4, 333, '2023-06-20 02:32:18', NULL),
(184, '吳珊茜', 'Julie', 'Julie192', '$2y$10$wKMVBMQk3A0YVx0fVjxHhe7AVjgtFMeCW2LsgtpONC5CeeP54sWdS', '2', 0, 1, '1984-10-20', '0936692072', 'landrum7391@gmail.com', '', '0', '中豐路２段36號', 6, 306, '2023-06-20 11:34:30', NULL),
(185, '蔡歆瑗', 'Sandra', 'Sandra154', '$2y$10$z5x5v30lCi3Ti0IT6pcHOO/EvlU6HR.wk33fcCmsBPrrXwz6HOnh2', '2', 0, 1, '2015-08-04', '0928951791', 'carter3212@icloud.com', '', '0', '文化路50號11樓', 8, 421, '2023-06-20 14:58:34', NULL),
(186, '林歆盧', 'Dorothy', 'Dorothy323', '$2y$10$HUNs2/qP6LqSigx49oZm0uwDbbdbz8e3uAXZZjISs1gmKU3Gz5keS', '2', 0, 1, '1977-05-17', '0958341225', 'orrico4435@hotmail.com', '', '0', '仁愛路４段70號', 1, 106, '2023-06-21 00:04:41', NULL),
(187, '廖君齊', 'Benjamin', 'Benjamin56', '$2y$10$sXTPg7e3lweU4zqgpCOi6.HHt0GjYAVVaW3ffP6V05WVyFIBWC5h6', '1', 0, 1, '2008-05-07', '0934150940', 'abkarian6741@hotmail.com', '', '0', '新北八街32號9樓', 14, 730, '2023-06-21 00:25:45', NULL),
(188, '廖亦瓊', 'Virginia', 'Virginia562', '$2y$10$ZUfPOwRXki2M7Ze1yGuQh.2/zTCRCVcfkyl9f6egMD9rfXiaVLm8S', '2', 0, 1, '1982-03-28', '0968571090', 'virginia6531@outlook.com', '', '0', '福興一街21號之2', 18, 973, '2023-06-21 05:33:50', NULL),
(189, '洪乾旭', 'snake', 'snake302', '$2y$10$npojUuZ63d1uS6oNZObzKOs6NfYXM6MyTXz/1gaoH3ZkXTugGdFIy', '1', 0, 1, '1994-10-13', '0939462969', 'trent3406@outlook.com', '', '0', '大車路88號12樓之20', 4, 334, '2023-06-21 15:36:00', NULL),
(190, '余津茜', 'racoon', 'racoon441', '$2y$10$wfzhvRX9C3ZrTj5wXO4j0OhuotFbbLv5EP2ATvgIcVisTs7i0ZT4C', '2', 0, 1, '1969-08-16', '0936003008', 'lester352@gmail.com', '', '0', '華興三街8號', 6, 302, '2023-06-22 02:05:04', NULL),
(191, '鍾瑾藍', 'mozzarella', 'mozzarella199', '$2y$10$e.KTp.fAzvTYzcluignzreQQcJNen/SIHLTvHlt6LDdK76FNoQu4G', '2', 0, 1, '1979-05-31', '0955546487', 'robinson2088@gmail.com', '', '0', '山西路３段29號', 8, 406, '2023-06-22 14:31:10', NULL),
(192, '汪婉宛', 'Katherine', 'Katherine128', '$2y$10$Ud3HrRClXIg/.s/S83Y6nO/s5CO.tADBRY35oNgjt0/Bl3HUdPis2', '2', 0, 1, '1963-01-28', '0952467817', 'katherine458@gmail.com', '', '0', '望古坑32號7樓', 2, 226, '2023-06-22 19:44:11', NULL),
(193, '吳子清', 'christine1283', 'christine1283647', '$2y$10$7mukr4y2DTY22i7DkUACteaPWPNlX1aMjU1RlO8HUqqus9QWUXDFu', '2', 0, 1, '1968-05-21', '0920823969', 'christine1283@gmail.com', '', '0', '東勢寮77號10樓', 14, 722, '2023-06-23 08:44:16', NULL),
(194, '李伯慈', 'blacktea', 'blacktea156', '$2y$10$LMCqq4PkXBT15YVB/sHMA.vUuCIf2sN12Qv9LdnQGWmsH8dl6bKgm', '1', 0, 1, '1987-02-12', '0937001455', 'brian6693@gmail.com', '', '0', '林內路3段92號7樓', 13, 643, '2023-06-24 00:09:25', NULL),
(195, '林茜軒', 'Tiana', 'Tiana184', '$2y$10$YCz1XGhgy/SqZY6O.MmcO.84B7jecPpdZRxNMv.L/gHYUlVJCq5Aq', '2', 0, 1, '2017-09-11', '0972393940', 'peretti6406@yahoo.com', '', '0', '金山街19號3樓', 4, 320, '2023-06-24 14:17:33', NULL),
(196, '陳妹榕', 'vulture', 'vulture287', '$2y$10$4.fuvoy6Q8MKSSz.z1jMUuUiYE6DxqFInR5Yyc00OJM2g.tsL5n4W', '2', 0, 1, '1963-11-11', '0914665005', 'lautner1122@outlook.com', '', '0', '漁港中二路93號3樓', 15, 806, '2023-06-25 01:17:33', NULL),
(197, '徐勳善', 'icecream', 'icecream11', '$2y$10$yYjcXdrlV3xyuimtMSjxHOs9R2sZY9sFAjKeD7o8NnysW9KTXG9zW', '1', 0, 1, '2002-01-12', '0972654130', 'duncan639@hotmail.com', '', '0', '復華六街40號之4', 14, 710, '2023-06-25 01:21:34', NULL),
(198, '王純飛', 'Anaya', 'Anaya502', '$2y$10$GkFShAk6Ay.BVmQCMKhHsuCHxYgwRk/8ngiY0CjgJyEFbel9Sbr5i', '2', 0, 1, '1993-04-04', '0961109932', 'anaya9444@yahoo.com', '', '0', '東新街97號之16', 18, 974, '2023-06-25 10:26:41', NULL),
(199, '李洢筑', 'lion', 'lion815', '$2y$10$mlqZii2CcjeTckUShXkzJu04sZYwmfGRMqBm8.buZyUmts9Vs6Fzu', '2', 0, 1, '1996-06-05', '0913319049', 'bagshawe2508@gmail.com', '', '0', '史路53號', 10, 542, '2023-06-26 01:28:49', NULL),
(200, '鐘丹璐', 'elk', 'elk294', '$2y$10$Z278.W6Jg07f1yb3sayCKeRGbSHWUzU9tLgBruJ1Ko20DnSlcXH3S', '2', 0, 1, '1973-10-08', '0911862012', 'hopper1422@outlook.com', '', '0', '桃源街70號4樓之4', 9, 500, '2023-06-26 03:49:52', NULL),
(201, '黃海盛', 'Sheldon', 'Sheldon487', '$2y$10$DJsqjCLb8s4GwUfAizlLgOQsR5TtK/qrrkd4vDIVeRJfJ0L54Efo2', '1', 0, 1, '1999-02-14', '0956614808', 'orrico4279@gmail.com', '', '0', '倡和路90號12樓', 9, 530, '2023-06-26 07:19:54', NULL),
(202, '朱孝羚', 'zebra', 'zebra275', '$2y$10$nUP3L2kqOWXUBF.iyGIiVO1TyU0fuCa75vb9zroWtC8ylqqACDxUi', '2', 0, 1, '1967-05-24', '0913198286', 'tiana8385@icloud.com', '', '0', '前洲子87號之18', 2, 251, '2023-06-26 13:37:06', NULL),
(203, '吳妍瓊', 'Maggie', 'Maggie728', '$2y$10$dNQh7TN0ZorPbQgQcfXHNubFWcoamDd4VjAg8u0XC5VPYabDCednS', '2', 0, 1, '1995-03-27', '0912501824', 'maggie337@icloud.com', '', '0', '頂新路93號之7', 16, 913, '2023-06-27 02:55:12', NULL),
(204, '張星雙', 'randy8888', 'randy8888107', '$2y$10$2.7NU2TYPECvd9RN.DcEjOvvFebSnP./RbqdsJoy/7XYumxwdaMj.', '1', 0, 1, '2018-12-16', '0987147105', 'randy8888@yahoo.com', '', '0', '成功十一街87號2樓之2', 10, 552, '2023-06-27 09:20:15', NULL),
(205, '謝祥達', 'Logan', 'Logan307', '$2y$10$U4HvITdMwmHr4wE8khF24uNT6LPs0nkw3at1E3nNlvafTwN.Vmat2', '1', 0, 1, '1975-12-12', '0920203369', 'logan890@gmail.com', '', '0', '十股27號', 4, 325, '2023-06-27 18:31:26', NULL),
(206, '林婷潞', 'Kennedy', 'Kennedy101', '$2y$10$aOXWjPz9vA5ryLx/RzoDDetAS7bH8a8NnA.cA99hOE1bQpcXv1JzG', '2', 0, 1, '1972-08-09', '0933033273', 'asher594@gmail.com', '', '0', '清埔巷15號6樓之1', 9, 530, '2023-06-28 08:32:38', NULL),
(207, '曾國輝', 'kingcobra', 'kingcobra871', '$2y$10$Yb8i8KYUYEwXijFcS/UiOeMZHqhC55PSvOqA/ew1KgrjmCezii.W.', '1', 0, 1, '2001-05-04', '0933546983', 'kyle8842@gmail.com', '', '0', '溪陽路40號11樓', 9, 525, '2023-06-28 22:40:38', NULL),
(208, '林濮語', 'Katherine', 'Katherine570', '$2y$10$Bulqz0arFGfs0RztLsB7..sLO0eIcDMVOC3RBoPyfYWyFpokDzBEa', '2', 0, 1, '1970-07-07', '0960582830', 'mckenzie9244@yahoo.com', '', '0', '國昌三街64號之16', 8, 433, '2023-06-29 02:10:38', NULL),
(209, '周藴韻', 'elephant', 'elephant60', '$2y$10$9JB47d2Xqp3fQm0XctFDgugEM/unISkk9uVyXZx83bb4WmP9tprMu', '2', 0, 1, '2006-09-30', '0963110202', 'alexia8168@icloud.com', '', '0', '五分寮47號9樓', 2, 226, '2023-06-29 15:10:41', NULL),
(210, '林旭諄', 'omid8926', 'omid8926943', '$2y$10$vjH3HmW3K5gBc2Ng9kLTsu0NOPVFbzc5tnkV7s4//2o0iVyuEjKUO', '1', 0, 1, '1983-04-10', '0924141253', 'omid8926@gmail.com', '', '0', '民生街15號9樓', 2, 236, '2023-06-30 03:35:51', NULL),
(211, '蔣俞驥', 'racoon', 'racoon289', '$2y$10$Slp2XAbaZsLPcN2uztyIo.itKZLYAMnjl0rjVVXVZNOsyWBePcjUi', '1', 0, 1, '2011-05-29', '0939272090', 'joe8027@gmail.com', '', '0', '中正路80號', 1, 111, '2023-06-30 16:36:54', NULL),
(212, '曾宛穎', 'Nerissa', 'Nerissa155', '$2y$10$nsOyl2WPc6w5IAxxLQoCP.hiXNMnH5/5Z.85WZ4p3FuZHO0fRI0y6', '2', 0, 1, '2020-11-08', '0922902194', 'nerissa5567@gmail.com', '', '0', '向上路６段76號之1', 8, 433, '2023-07-01 00:51:06', NULL),
(213, '邱庸樺', 'ibex', 'ibex416', '$2y$10$ZR.289mhFF5W.RKJYXuL0OwLupmNNymvqYBCywmTNR0/KVcZ80SJm', '1', 0, 1, '1997-07-19', '0920712286', 'stella7505@outlook.com', '', '0', '廣興一街79號之4', 18, 973, '2023-07-01 06:14:15', NULL),
(214, '康嘉輝', 'Dylan', 'Dylan175', '$2y$10$inPdMwj3gQnZpelahSiExunk5L5yZrxkg2QY5NL6E.irTujacOIES', '1', 0, 1, '1997-07-02', '0924101752', 'dylan741@gmail.com', '', '0', '大連路１段10號11樓', 8, 406, '2023-07-01 20:32:18', NULL),
(215, '王姝金', 'laura6443', 'laura6443670', '$2y$10$Pn4yCuiidZElpnYu4l4jYOvWXIJZNkRcg5LWrLfAk90sBTKmoLUAW', '2', 0, 1, '1983-01-22', '0912977838', 'laura6443@gmail.com', '', '0', '學士路65號之8', 2, 236, '2023-07-02 07:00:20', NULL),
(216, '龔思永', 'Rick', 'Rick218', '$2y$10$nyt17frRSMBC3bwRbdr4WehidM7UNNXB8psOoXfc0/wLFDlmVfJ6a', '1', 0, 1, '2004-07-23', '0916352740', 'rick8537@gmail.com', '', '0', '三民路３段73號', 8, 436, '2023-07-02 08:11:30', NULL),
(217, '陳千逞', 'Alexander', 'Alexander176', '$2y$10$LFZTlHny2iT6UcZjattwOeSreIp566PM088dzm42uaRmjRIlror0W', '1', 0, 1, '2006-10-15', '0923183765', 'alexander3225@outlook.com', '', '0', '信義路４段53號7樓之18', 1, 106, '2023-07-02 09:38:35', NULL),
(218, '陳夏寶', 'blaine7609', 'blaine7609705', '$2y$10$7hmE/uOLobVGZzViDrLmi.flKn1Mu56H3Q7k92x9qi3dfHZJMprcS', '2', 0, 1, '1983-08-31', '0970055245', 'blaine7609@gmail.com', '', '0', '旱溪東路１段65號', 8, 401, '2023-07-02 18:55:40', NULL),
(219, '邵宥芪', 'albatross', 'albatross222', '$2y$10$jYlQZrVLqstclORyQlwtzu8AKXy8fOIYyZc72APuxVD9puog09HMO', '2', 0, 1, '1990-12-04', '0928707310', 'mcneil8040@outlook.com', '', '0', '埔頭街5號', 10, 557, '2023-07-03 07:16:45', NULL),
(220, '邱悦捷', 'Kathryn', 'Kathryn253', '$2y$10$I.nz4yN9AT5tdA21fjl9hOqZxNS7cVnCtwpl9DQhRLKfZNoAcErYi', '2', 0, 1, '1965-10-26', '0912337738', 'scott7176@gmail.com', '', '0', '崇文街60號10樓之10', 15, 831, '2023-07-03 09:25:52', NULL),
(221, '賴嬡怡', 'alice3466', 'alice346631', '$2y$10$MIMjduhPPFxwL37A2JEZMuqwXRK3HYR87q8zvuNJ05OAVwqewrRlS', '2', 0, 1, '1974-03-14', '0938289223', 'alice3466@gmail.com', '', '0', '南園二路57號4樓', 4, 320, '2023-07-03 19:38:56', NULL),
(222, '陳保寶', 'Gustavo', 'Gustavo652', '$2y$10$5fz2fVT/htXO5O2E/qFVdu0sGTK5jMHrWAdKStUtHokLtELDIGdYy', '1', 0, 1, '2020-11-01', '0938944836', 'gustavo5247@hotmail.com', '', '0', '家興新村80號', 4, 320, '2023-07-04 04:07:03', NULL),
(223, '張楠清', 'everett196', 'everett196266', '$2y$10$uvcdA3cXeN245JlZE/oZN.9I.eXhXSOC96KUd6a2LDM.sKKTCRsqm', '1', 0, 1, '2011-03-01', '0932213039', 'everett196@yahoo.com', '', '0', '光復街50號', 9, 510, '2023-07-04 20:28:08', NULL);
INSERT INTO `users` (`id`, `name`, `nickname`, `account`, `password_hash`, `gender`, `user_level`, `valid`, `dob`, `tel`, `email`, `avatar`, `avatar_file`, `address`, `adr_city`, `adr_district`, `created_at`, `deleted_at`) VALUES
(224, '鄭瑄立', 'jackal', 'jackal386', '$2y$10$EAmXrBsRrWYxzkIzMmS.sOpM/MiY83sxqaK7fp5XQzjeT.Lc.2gbi', '2', 0, 1, '1979-08-22', '0954496196', 'liya4045@hotmail.com', '', '0', '藝術世家31號', 13, 630, '2023-07-04 21:39:14', NULL),
(225, '劉昊翔', 'Noah', 'Noah534', '$2y$10$voiLI0v5ZOXfRJYIU4/KzOcpu4PoMSFCD57PNy9HuALuVLy5l71x6', '1', 0, 1, '1963-12-30', '0918109721', 'sanders6580@gmail.com', '', '0', '中民路69號', 15, 824, '2023-07-04 21:48:19', NULL),
(226, '陳柯維', 'rodney4383', 'rodney4383706', '$2y$10$85sqP88XJ4fqryu3s9hx8.UNw4C2nOcGo/WYTq3l6IGqANZedxQcW', '1', 0, 1, '1970-06-11', '0935495068', 'rodney4383@gmail.com', '', '0', '東橫巷53號', 9, 524, '2023-07-05 13:19:20', NULL),
(227, '王帆棟', 'Carson', 'Carson3', '$2y$10$i4BGAlkRybU/4oVs6ytS1u4rtsVxIUzlduSBwv9ED7AuHiUF0itWa', '1', 0, 1, '2009-05-21', '0929971369', 'carson3661@hotmail.com', '', '0', '竹後巷79號', 9, 512, '2023-07-05 16:30:29', NULL),
(228, '李和雪', 'grape', 'grape14', '$2y$10$uMZdCdmmdkoNy9BD2sZYxOYXwbzbvSPGmljQxPddWd3QXLCnjH4Ja', '2', 0, 1, '1996-03-26', '0912299020', 'margolyes3196@gmail.com', '', '0', '中華路２段62號6樓之8', 19, 950, '2023-07-05 22:54:39', NULL),
(229, '尤萍鳳', 'Patricia', 'Patricia511', '$2y$10$l8W.gXaOP1GflZZ3v87DReohRW0XfPuqobGPPAPwwexxzKUNcGfvS', '2', 0, 1, '1967-08-10', '0915782052', 'wright5265@outlook.com', '', '0', '溪厝村溪埔巷53號10樓', 9, 524, '2023-07-05 23:09:48', NULL),
(230, '鄭常樂', 'christophe2227', 'christophe2227457', '$2y$10$B1Z2/UILVQJv.rczK08uVewktfwVoSm4ZKwv1m9lytk0F/Fm/fa7e', '1', 0, 1, '1981-12-20', '0986387909', 'christophe2227@gmail.com', '', '0', '佐倉街60號', 18, 970, '2023-07-06 07:31:58', NULL),
(231, '蔡亦嬌', 'hamster', 'hamster101', '$2y$10$SRx2L9ixPtCfo7Jt6UIBnOCOJXSnt1LjtICU3.oCCNVRrnL/MP0q2', '2', 0, 1, '2010-05-06', '0963203052', 'erin3766@hotmail.com', '', '0', '豐年路19號', 7, 360, '2023-07-06 08:01:58', NULL),
(232, '田昊青', 'kevin6999', 'kevin6999429', '$2y$10$DQPs3zi/3NBB/1SGCu1JK.rMDSkcczgRnk1savCruuGuVf9MZargS', '1', 0, 1, '2006-07-30', '0917908602', 'kevin6999@gmail.com', '', '0', '柯厝坑94號10樓', 2, 243, '2023-07-06 22:16:59', NULL),
(233, '施慈琛', 'cockburn8777', 'cockburn8777962', '$2y$10$i9MIU5.heaTcv/A5KabRD.tvDpsCnQfR3AJWAIiFNslknT49tDfaW', '1', 0, 1, '1992-03-17', '0921932257', 'cockburn8777@hotmail.com', '', '0', '惠中路１段23號12樓', 8, 407, '2023-07-07 12:23:02', NULL),
(234, '胡峻茂', 'Trevor', 'Trevor618', '$2y$10$14TslaDrvlHiwKiP61dQ7ewnIcJfWYaOlMn0pOSyzfHF.MaaNfDTi', '1', 0, 1, '1989-01-13', '0913357688', 'lyn9382@hotmail.com', '', '0', '福和二路87號', 17, 268, '2023-07-07 18:52:05', NULL),
(235, '卓悦晶', 'hillary6941', 'hillary6941958', '$2y$10$/pRrEn0Kss5mqT3nE1XyUOBxYwLCekdxfY3KrVmg9Lh3ib8wdKROS', '2', 0, 1, '1968-04-15', '0925230026', 'hillary6941@gmail.com', '', '0', '富世76號之18', 18, 972, '2023-07-07 18:58:13', NULL),
(236, '周敬許', 'Peter', 'Peter353', '$2y$10$dE.Gw7o7v/aqQHY/c.GfkudbfH0oNQZfXHutvgvzGZ9LyqvcIynSy', '1', 0, 1, '1978-10-27', '0918627104', 'peter4212@yahoo.com', '', '0', '頂草路２段73號8樓', 9, 505, '2023-07-08 00:24:24', NULL),
(237, '嚴威育', 'Stefan', 'Stefan176', '$2y$10$Ygy6TB36kFmcAhxnOE5Q3e9CVt3hrUtzFq03tMBN56nhzYJPAPomG', '1', 0, 1, '1989-07-27', '0927907358', 'stefan8000@gmail.com', '', '0', '建國路２段54號', 18, 973, '2023-07-08 14:36:33', NULL),
(238, '唐冉升', 'baboon', 'baboon602', '$2y$10$azM2Tk9/in6g6oaLyPzlkODQJUvzLuKNpb4MVI4Yg.IxFbOBD12oy', '2', 0, 1, '2012-08-25', '0918401940', 'burton6934@yahoo.com', '', '0', '福吉四街90號', 14, 702, '2023-07-08 21:53:36', NULL),
(239, '謝均培', 'leonard6781', 'leonard6781524', '$2y$10$OUdk8fMzk2rpq6NVk9XKG.7UWhNLPkIHr25Pj.fABkhpNIuxim1Km', '2', 0, 1, '2012-07-20', '0986102224', 'leonard6781@outlook.com', '', '0', '忠平路69號12樓之15', 17, 266, '2023-07-08 22:09:43', NULL),
(240, '黎家庸', 'kurt261', 'kurt261732', '$2y$10$w8rYJvVc2R/8UhAdNg0BDugxnwUwQVHtBp5S8pwPxzkTUYR6Mu3S.', '1', 0, 1, '1995-01-06', '0935211620', 'kurt261@gmail.com', '', '0', '建國東路45號9樓之17', 9, 500, '2023-07-09 11:38:48', NULL),
(241, '許功靖', 'fish', 'fish347', '$2y$10$alhx2XUFk6laJhTXT6bUMee77eCHT1//Ixn0XkLgycKwkP.KE9iwa', '1', 0, 1, '1973-08-05', '0971584842', 'mickey9898@gmail.com', '', '0', '勵志二村25號', 20, 880, '2023-07-10 01:41:59', NULL),
(242, '鄭俠煒', 'Mark', 'Mark334', '$2y$10$XcnIeoxlQBKiOsE898lFge2qJ3DjAIMJ1NNLt/mUpBBagygHh7NhW', '1', 0, 1, '2013-03-19', '0988445736', 'evans3694@gmail.com', '', '0', '和平街10號7樓', 8, 413, '2023-07-10 05:08:10', NULL),
(243, '汪宸育', 'eagle', 'eagle533', '$2y$10$RRa0RGBndWYEfUK/Gs1isu03Gt8brEaYfY00iTWM.a0K5aTnOrhNC', '1', 0, 1, '1974-09-25', '0936825292', 'jaden1504@icloud.com', '', '0', '仁愛街51號之13', 4, 338, '2023-07-10 21:19:13', NULL),
(244, '紀峻恩', 'Charles', 'Charles55', '$2y$10$w6V3CLRU2eVqwz2EqyWpoek2jOaHGTAbbSU3nJxxTC5egaEFI9.xW', '1', 0, 1, '1982-03-17', '0970004949', 'charles6844@hotmail.com', '', '0', '北興路16號9樓', 16, 931, '2023-07-11 05:32:20', NULL),
(245, '王子森', 'nicholas7372', 'nicholas7372979', '$2y$10$oEO8LCA.i4QGANPNXMlOvOyqlt21xFRfUIXrsJWXo/peKmK49ilj2', '1', 0, 1, '2005-05-21', '0952816466', 'nicholas7372@gmail.com', '', '0', '宮邊巷44號', 9, 528, '2023-07-11 22:52:32', NULL),
(246, '溫培羽', 'vanessa1879', 'vanessa1879659', '$2y$10$1O3kDm0Ejp8lVooA8bI/dOn8ePdVHKjSqxPfR/YDpdgelkjW96ZPy', '2', 0, 1, '1984-05-13', '0916747623', 'vanessa1879@gmail.com', '', '0', '昌平路３段36號之2', 8, 428, '2023-07-12 14:08:40', NULL),
(247, '黃啟樹', 'Sergey', 'Sergey200', '$2y$10$dmWAPxQDJBscKcu.igFLuOJYzPBZBt/mkOWfceE2EtjC0dDBfzK8q', '1', 0, 1, '1992-02-16', '0970366691', 'breslin5328@yahoo.com', '', '0', '南京東路５段72號之6', 1, 105, '2023-07-13 04:19:52', NULL),
(248, '賴堯鶴', 'Noah', 'Noah731', '$2y$10$w4hLTmQOgbvOI02aGU9YNuMcKDIQ9m1DXmg17CstkkbTDviKRE88S', '1', 0, 1, '2011-04-22', '0919344080', 'murphy148@outlook.com', '', '0', '炮子崙47號', 2, 222, '2023-07-13 20:48:03', NULL),
(249, '張強禧', 'chet5821', 'chet582160', '$2y$10$Np3JbF8hH3Ff0T2SCdrN4uKoLEuVkKevpcDPubYW8Shb8mSf.KdXq', '1', 0, 1, '1966-01-30', '0988952127', 'chet5821@hotmail.com', '', '0', '大屯寮66號', 14, 735, '2023-07-14 07:57:12', NULL),
(250, '王禎黛', 'chinchillas', 'chinchillas574', '$2y$10$KZK73n14atbSNwlJOJlJnuXv9VwvKwOr4r78v0T1w2AOk3KxA8BWG', '2', 0, 1, '1980-07-09', '0920258723', 'margolyes6138@yahoo.com', '', '0', '博愛路68號之8', 14, 721, '2023-07-14 20:20:13', NULL),
(251, '王梓軒', 'Maracay', 'Maracay310', '$2y$10$wXfsugS/DQ2ZcpWEmDZ1u.7pLI1qMKQ8RTtKv05634VNb8aPzdr0e', '1', 0, 1, '2009-03-11', '0927966255', 'maracay656@icloud.com', '', '0', '溪角仔49號6樓', 12, 604, '2023-07-14 22:26:14', NULL),
(252, '范巖龍', 'Reggie', 'Reggie710', '$2y$10$oEjw.rpZcgy9d7jz4S1sHOKowaZejTK4Vq2pL4L6TQVbDlFSAHFEy', '1', 0, 1, '1975-04-27', '0960296598', 'peterson9250@hotmail.com', '', '0', '萬順路２段17號', 16, 913, '2023-07-15 08:31:22', NULL),
(253, '林美舒', 'shields6629', 'shields6629918', '$2y$10$3MaVb2JC6hUBxMW2oEwTv.rWCdKlbWgdG9Q5ljJptaXfPf.vZZg4e', '2', 0, 1, '1984-07-01', '0988712155', 'shields6629@gmail.com', '', '0', '上利路63號', 16, 913, '2023-07-15 22:47:31', NULL),
(254, '馬洪濱', 'leland6358', 'leland6358858', '$2y$10$7FjDELYgtCKMGCbwylW9qOXsZ1waHwRZhhAQPyfrAQYYmeZab4lMa', '1', 0, 1, '1996-12-09', '0989990058', 'leland6358@gmail.com', '', '0', '安吉路１段53號之16', 14, 709, '2023-07-16 12:57:37', NULL),
(255, '許文鈞', 'Willy', 'Willy216', '$2y$10$GJk0Hs0oUG10wlNZsiWNpukKPygSyViz.01OzOP0NKMFBu/XF7Ly6', '1', 0, 1, '2020-07-18', '0937756327', 'willy9056@hotmail.com', '', '0', '海景五街74號', 2, 252, '2023-07-16 15:08:47', NULL),
(256, '邱堇謙', 'Sean', 'Sean92', '$2y$10$DD1qktxGaZ2/tYx2oKL1EetWApuFH5t3Ir/v2Ck/jaG07WBlDwvTe', '1', 0, 1, '2000-08-29', '0939593159', 'mcgowan8841@gmail.com', '', '0', '北糖三街100號4樓', 13, 651, '2023-07-17 03:31:58', NULL),
(257, '張祥華', 'kenny6805', 'kenny680546', '$2y$10$2Kknij1Ss.1KQOEQKKDf8u6c9U3XOF5eYmB0/oO2aeTjWmBrhvvn6', '1', 0, 1, '1984-12-29', '0938047770', 'kenny6805@yahoo.com', '', '0', '學府路１段23號3樓', 2, 236, '2023-07-17 04:49:07', NULL),
(258, '戴涵靜', 'taylor5620', 'taylor5620606', '$2y$10$X6SHrDpt0kS.Popn6zXicuGjfBL0iO1XisVwXcSEI8mMdHGU3z.qq', '2', 0, 1, '1976-03-06', '0952187079', 'taylor5620@hotmail.com', '', '0', '粉寮醒吾新村22號', 2, 244, '2023-07-17 13:58:16', NULL),
(259, '唐芯蒨', 'Denise', 'Denise309', '$2y$10$4X9Xe4bEAY6SiwKpdxdFmulwZheThq/afuaFLq2cdC5dIotUKht5m', '2', 0, 1, '2018-01-13', '0961742673', 'asher2119@yahoo.com', '', '0', '崙仔路54號之16', 13, 640, '2023-07-18 06:07:26', NULL),
(260, '康晏琳', 'hermitcrab', 'hermitcrab99', '$2y$10$14KLYbqTxj9p17bNWtG9our7b5fIWYwkKL1JWwtfUNF9InH.ftqsm', '2', 0, 1, '1991-03-23', '0938786785', 'maggie6781@gmail.com', '', '0', '建國路31號', 4, 334, '2023-07-18 12:16:37', NULL),
(261, '傅棟瑞', 'gates6409', 'gates6409818', '$2y$10$itxIY6fSKeYnr0I993l60es8iUOwDmbHdlx8zIy/DASLY1YhNXMSC', '1', 0, 1, '1986-01-12', '0968121074', 'gates6409@icloud.com', '', '0', '造豐路88號8樓之7', 7, 356, '2023-07-18 23:31:49', NULL),
(262, '陳亦晉', 'caulfield712', 'caulfield712855', '$2y$10$vGxepKavfniqn1ghTNGEaOi6ZVo2HWS5.WPo5FRIR6F0eZzR2RnD2', '2', 0, 1, '2019-01-27', '0960432260', 'caulfield712@hotmail.com', '', '0', '俊英街78號12樓之3', 2, 238, '2023-07-19 16:40:51', NULL),
(263, '陳亞婷', 'grecic5796', 'grecic5796827', '$2y$10$OK9Uj4INAzlwuHjKqMue5eR22LtrUwtaAHk3A.BQtIHsmy.aOtbhO', '2', 0, 1, '1962-01-14', '0954749544', 'grecic5796@gmail.com', '', '0', '新建南路48號之3', 15, 811, '2023-07-20 05:55:52', NULL),
(264, '尤影榮', 'hughes5620', 'hughes5620574', '$2y$10$HyYNvwDI.tDPPtmpnUcZc.OoKozdQ7Cu7w.4HzvbbGIxtegV3nW5O', '1', 0, 1, '2006-01-18', '0925678429', 'hughes5620@gmail.com', '', '0', '亭22號3樓', 2, 207, '2023-07-20 06:10:55', NULL),
(265, '洪寶許', 'gorilla', 'gorilla394', '$2y$10$/FBRjlUB09T0IvUxtUXxkerz3gCYHa9J1b.xRsYUn416WUeNvawOy', '1', 0, 1, '1964-11-06', '0921119026', 'richard5020@outlook.com', '', '0', '大同東路23號', 12, 613, '2023-07-20 15:21:04', NULL),
(266, '吳玥璐', 'Sandra', 'Sandra649', '$2y$10$/IIcpKM85bkBk3LaB.5j3OhgYt8fFbQr2SGcNH/tnzmSZzpGl/4z2', '2', 0, 1, '2003-07-16', '0989408487', 'sandra4776@gmail.com', '', '0', '美港公路２段33號', 9, 509, '2023-07-21 03:44:05', NULL),
(267, '袁温齊', 'Tom', 'Tom354', '$2y$10$kdIGBb3PvFWNeVQOPp1g6uC70V3n6fS9UxhHDcdzYr5QwGhNHZonq', '1', 0, 1, '2003-05-16', '0954579522', 'tom2573@gmail.com', '', '0', '中正路20號', 13, 632, '2023-07-21 19:09:11', NULL),
(268, '鄭梓萱', 'christina6961', 'christina6961699', '$2y$10$/0mRDrHMGrQM9vsMEGLIWOxD/QPq3MmTD/2Dx1zALLyw1UKyHOlzm', '2', 0, 1, '1975-12-23', '0961585433', 'christina6961@yahoo.com', '', '0', '廣興14號', 19, 956, '2023-07-22 06:38:15', NULL),
(269, '黃嫣蓁', 'donovan4750', 'donovan4750999', '$2y$10$bXM6sOIiPHZ/ylFAYoo6/utNr1bvSopg391jUQaR2hEw45h25814i', '2', 0, 1, '2013-02-27', '0917123443', 'donovan4750@gmail.com', '', '0', '和平街14號', 8, 402, '2023-07-22 20:45:26', NULL),
(270, '蔡肇飄', 'iguana', 'iguana724', '$2y$10$hmAj6Y1MHZO8.lrGXsmWLeYljE59OYSwpb7xZpeusvLXWdE/5kj3y', '2', 0, 1, '1988-06-01', '0926008358', 'debbie2783@gmail.com', '', '0', '永二街73號2樓之2', 14, 710, '2023-07-23 01:09:30', NULL),
(271, '羅園真', 'Marissa', 'Marissa357', '$2y$10$sDUgCOofm23B9Piz/z4yAeqeThyLnu8xuNHIWE76wQ14Wr3Yn1fUW', '2', 0, 1, '2005-07-24', '0911585290', 'carter2779@gmail.com', '', '0', '向陽一街39號', 4, 325, '2023-07-23 14:37:37', NULL),
(272, '陳易肇', 'sloth', 'sloth437', '$2y$10$YchGf4Oh/oEH/xfy.bFfruO6C9Clkd98l99kBVq/544IcWIsjzPzm', '2', 0, 1, '2008-09-03', '0913795724', 'velazquez981@yahoo.com', '', '0', '保安街65號11樓', 14, 741, '2023-07-24 02:37:49', NULL),
(273, '曾克璧', 'Mia', 'Mia246', '$2y$10$lKzd3b1YbxBbmtXiqUFKSeK2.uAUc6YVXprfGNXpJ1/6gLKFyXTP.', '2', 0, 1, '1980-06-17', '0916872716', 'mia619@hotmail.com', '', '0', '重陽路３段84號', 2, 241, '2023-07-24 19:51:51', NULL),
(274, '游婕惠', 'Christy', 'Christy889', '$2y$10$vInKM4EMrxLz9k6iSRU3U.IUZDvqLBN0OBJIfaAYIhQCgIjWDBRdi', '2', 0, 1, '2008-08-27', '0922229519', 'bell6007@outlook.com', '', '0', '賴華街35號', 4, 325, '2023-07-25 02:16:00', NULL),
(275, '姜乾修', 'asher3545', 'asher3545348', '$2y$10$vfxR4kurx8TsyJKv0S4BQeaV0RtW1QXbyXZ0ONR1u6uuCMqXoSsFe', '1', 0, 1, '1963-05-24', '0910345845', 'asher3545@icloud.com', '', '0', '寶興街5號', 1, 108, '2023-07-25 12:47:07', NULL),
(276, '黃保晟', 'damian186', 'damian186744', '$2y$10$6t1e..fWLLQ.pRNlY03L9Od.iHxL8W4ZhJQvWJB.4AehlJW7jmbge', '1', 0, 1, '1986-08-12', '0934426478', 'damian186@gmail.com', '', '0', '新生北路１段22號', 1, 104, '2023-07-26 00:51:19', NULL),
(277, '傅于璟', 'kelly1413', 'kelly1413727', '$2y$10$ZDgEYyibtkZkk8Apis.8m.iV.ORDkzeo0..My4Y5zkVOZcFvSaIWO', '2', 0, 1, '1997-05-31', '0956617269', 'kelly1413@outlook.com', '', '0', '三份79號', 7, 354, '2023-07-26 13:03:26', NULL),
(278, '賴哲祥', 'cheese', 'cheese314', '$2y$10$NAsFwyY.JqPeNNmuPwFAQuQM6OL9LSFmqih2sc1BaGzEA4vF51PkK', '1', 0, 1, '2017-09-20', '0953204168', 'gerard1408@gmail.com', '', '0', '中華路55號11樓', 7, 351, '2023-07-26 22:34:34', NULL),
(279, '許弘星', 'Philip', 'Philip186', '$2y$10$c3i5Cq05y//MoL6s0QQyU.GDAq8IN6cOs3NXH4S.YkIx1Ci9tBUTG', '1', 0, 1, '1976-09-04', '0912274049', 'spielberg731@gmail.com', '', '0', '永和路２段83號7樓', 2, 234, '2023-07-27 15:41:44', NULL),
(280, '嚴宗語', 'chinchillas', 'chinchillas878', '$2y$10$vmYkwCl51V9MnLhqpAGEi.vOfEedEF/pFneT9Fy/2z.WMH/kyU/9i', '1', 0, 1, '2014-05-29', '0911210171', 'silas1299@hotmail.com', '', '0', '溝皂43號4樓', 13, 651, '2023-07-28 09:07:55', NULL),
(281, '蕭暢楠', 'Peter', 'Peter409', '$2y$10$Q0rWYmEsjtidxNDhyMKQ4.FNGJbeF1PNoYd2EfxiaFgQvXZ8PGTzu', '1', 0, 1, '1973-06-07', '0954258053', 'percy4136@hotmail.com', '', '0', '信義路18號', 16, 929, '2023-07-29 02:26:58', NULL),
(282, '溫婭葉', 'Carlin', 'Carlin770', '$2y$10$u63Ms/MYShXLiz.3f4K0duQ.ihkbUgElD6UsVy9X7LVO61UiDPE8S', '2', 0, 1, '1987-09-23', '0925957246', 'wright8723@gmail.com', '', '0', '文揚街25號之5', 15, 807, '2023-07-29 07:41:07', NULL),
(283, '蔡楚瑞', 'Noah', 'Noah291', '$2y$10$NtQl2JAkrfyFqVdJXsebZ.xiqF5siS5/DC9hutC2y4MDx3ibu6Cli', '1', 0, 1, '1985-09-06', '0954666330', 'noah8166@gmail.com', '', '0', '中正路54號12樓', 16, 900, '2023-07-29 09:45:12', NULL),
(284, '朱妹瑄', 'kelly174', 'kelly174259', '$2y$10$duBrHoE07ab4S3p0aYIJH.fQditJxKFMBawrNZ1USdIplQPVS8Edi', '2', 0, 1, '1978-08-08', '0989880999', 'kelly174@yahoo.com', '', '0', '安心十橫巷7號', 16, 900, '2023-07-29 17:07:19', NULL),
(285, '吳慈潔', 'Martha', 'Martha597', '$2y$10$5cmhGAIDk8kIq69hI//RWONrD9mLlCl.H.rLSAOGvS7BDXaDUBThu', '2', 0, 1, '1967-02-13', '0954713935', 'martha895@outlook.com', '', '0', '大全二巷45號', 15, 814, '2023-07-29 23:07:25', NULL),
(286, '賴夕綺', 'Carlin', 'Carlin794', '$2y$10$Tcqh./HfnbR1LSY6cMgmZO5eytzl91HSZLyMqSArro5sYxpqLHuaC', '2', 0, 1, '1974-06-29', '0928664138', 'brookes6017@hotmail.com', '', '0', '文安71號', 13, 630, '2023-07-30 01:36:25', NULL),
(287, '朱於蒨', 'izabella4315', 'izabella431596', '$2y$10$vv69Yytk/GDnX6pJZIfEPeBqpMQ5DI74xCL/wflpz19n1ZTU2Zpce', '2', 0, 1, '2015-08-19', '0939633710', 'izabella4315@yahoo.com', '', '0', '中山路２段98號7樓', 9, 521, '2023-07-30 08:57:28', NULL),
(288, '杜瞻風', 'duck', 'duck595', '$2y$10$nHp5mmCgT56C2pZ5LpvTBO9I0cqKUpMzqlY3n869H9CdaDY/HOUiW', '1', 0, 1, '1993-10-09', '0911717026', 'daxton9550@yahoo.com', '', '0', '區界西路77號之2', 17, 270, '2023-07-30 23:06:29', NULL),
(289, '高南宸', 'Christina', 'Christina655', '$2y$10$JCLGdj7ZxV07TSmLyQAbgugm0G2FtNNYDk/7cdxhWrQufRmaS1xHW', '2', 0, 1, '1988-12-24', '0931226278', 'christina5012@yahoo.com', '', '0', '世賢路４段80號之20', 11, 600, '2023-07-31 06:30:39', NULL),
(290, '溫彤珮', 'walker2335', 'walker2335685', '$2y$10$Xe6os1vJlOa7Ac927/uQqOc1tI3BBypLD9/5dsKh04UqHraPk4Qz6', '2', 0, 1, '1974-10-14', '0932196890', 'walker2335@yahoo.com', '', '0', '文化路59號4樓', 12, 604, '2023-07-31 19:33:46', NULL),
(291, '蔡佑羽', 'spongecake', 'spongecake326', '$2y$10$v5awpSgerkaqUsWf0lbAU.dRPlBSnNUt2eXllbP66aJ/xDQ6//wBO', '1', 0, 1, '1968-02-14', '0938634744', 'benjamin7522@gmail.com', '', '0', '思源路47號', 2, 242, '2023-08-01 03:35:49', NULL),
(292, '郭廷瑋', 'rabbit', 'rabbit217', '$2y$10$YuYQyhlJpG87mAmwaSkpGO3pt9tp8bxWqWYWpKSJuvcIv19ln8tCK', '1', 0, 1, '1994-11-22', '0923809558', 'bryan883@gmail.com', '', '0', '桃和街70號3樓', 4, 334, '2023-08-01 05:52:50', NULL),
(293, '洪召洪', 'evan4620', 'evan4620937', '$2y$10$RtwKCO52x1NBwrZvx.qE6uz2BZn7pTpRdvkadwLUO9DqUco6MXzd6', '1', 0, 1, '1965-10-29', '0930490095', 'evan4620@outlook.com', '', '0', '高鐵五路98號', 6, 302, '2023-08-01 10:03:52', NULL),
(294, '李新霄', 'charles4511', 'charles4511887', '$2y$10$8Ab0wfmKSkDymNzcny3YEe3DDvMJtJWhN2pio72pZt2FnAkxumHWe', '1', 0, 1, '2005-04-17', '0970414054', 'charles4511@gmail.com', '', '0', '梅園62號', 7, 360, '2023-08-02 00:23:58', NULL),
(295, '賴彥輝', 'Alex', 'Alex29', '$2y$10$wMF2KPqiOlvZquZn/FpBNOImM1LxEGX41BZjTLUvEy./0AZmb0hIu', '1', 0, 1, '1986-06-07', '0914996318', 'clements3092@gmail.com', '', '0', '徐州二街52號之2', 11, 600, '2023-08-02 14:41:00', NULL),
(296, '洪帆隆', 'Teddy', 'Teddy404', '$2y$10$gGbpRMcNV/Iq/HdQANbZkOJqjnpSvjlhoWdG1.TEs.Ttz/iHz15mG', '1', 0, 1, '2011-10-19', '0922617230', 'henson8768@outlook.com', '', '0', '後龍街6號11樓', 4, 320, '2023-08-03 02:42:03', NULL),
(297, '蔡淑淳', 'Carol', 'Carol836', '$2y$10$G4DW51DPjxsHFtPt12QLCus295eWOZyR5ViJEKCVXtRmdrUFXVpxy', '2', 0, 1, '2004-10-13', '0915836006', 'gutierrez1988@gmail.com', '', '0', '下厝仔46號2樓', 12, 606, '2023-08-03 11:56:08', NULL),
(298, '袁濤祐', 'haskell7983', 'haskell7983429', '$2y$10$ogO8hlV7McJ2xtpuOD5RCOMBrH8wEmOXet1.4fPP2zgFjOsgVKc.i', '1', 0, 1, '1966-06-12', '0936393164', 'haskell7983@gmail.com', '', '0', '林森北路82號8樓', 1, 104, '2023-08-04 02:11:09', NULL),
(299, '袁勝博', 'Devin', 'Devin318', '$2y$10$iqiuHwpv5sL0kp1BhxK9x.aEK2acwrDrn/jGozlrQrFGbFyhP9Ms.', '1', 0, 1, '2020-12-19', '0915868818', 'devin5867@hotmail.com', '', '0', '黎明七路65號之20', 12, 614, '2023-08-04 16:12:19', NULL),
(300, '郭玉鈺', 'hawkins6007', 'hawkins6007585', '$2y$10$6mIqvcSTorRVo4fZc98mxuyEuvKaNnSHbHeMXeZahPLgjAqlLWdFe', '2', 0, 1, '1983-03-01', '0970016242', 'hawkins6007@gmail.com', '', '0', '三民西路49號之16', 8, 403, '2023-08-04 17:32:31', NULL),
(301, '黃梓津', 'kathryn9679', 'kathryn9679665', '$2y$10$17egUKtwR8F6Xbsdy3uU1ON7vwhpb0khy/bHGrBa0eRbngdLOAJFG', '2', 0, 1, '1985-08-14', '0938498201', 'kathryn9679@outlook.com', '', '0', '僑信街54號', 9, 510, '2023-08-05 05:56:33', NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

  --
-- 資料表索引 `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

  --
-- 使用資料表自動遞增(AUTO_INCREMENT) `cities`
--
ALTER TABLE `cities`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 資料表結構 `article`
--

CREATE TABLE `article` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `sort` int(5) UNSIGNED NOT NULL,
  `create_at` datetime NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL,
  `article_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `sort`, `create_at`, `userid`, `article_delete`) VALUES
(1, 'aaaaaa', 'aaaaaaaa', 4, '2024-05-21 18:47:54', 1, 1),
(2, '領養狗狗要知道的事！領養前評估、流程及網站懶人包', '你適合領養狗狗嗎？評估適不適合的4個問題\n1.居住環境有適合狗狗活動的空間嗎？\n養個毛小孩就像養小孩一樣，跑跑跳跳的空間是一定要有的！毛孩們不像我們一樣平常可以滑手機、跟家人聊天或是做其他休閒活動，因此足夠的空間對領養狗狗來說便是一大前提考量，在決定領養狗狗前，務必要想想居住環境能不能創造出狗狗的活動空間、休息空間及用餐空間。\n\n2.有足夠的時間可以陪伴狗狗嗎？\n陪伴，是最重要也是最容易被忽略的一點，許多人領養狗狗的目的是希望可以給牠一個家，但更重要的是要給牠一個溫暖的家，特別是被領養的狗狗過去可能經歷過多次環境轉換，使得狗狗的情緒會較敏感和不穩定，這時候就需要我們的陪伴來建立信任感及安全感，如果平常的生活、工作相對繁忙，可能就要謹慎思考是否要領養狗狗。\n\n3.有時間和精力帶狗狗出去散散步嗎？\n如同前面提到的，狗狗在家裡不能滑手機、跟其他狗狗互動，因此散步時間就顯得相當重要，狗狗在散步時除了運動及上廁所，更重要的時可以東聞聞西聞聞來認識世界，熟悉不同的刺激與聲音，對於狗狗社會化的過程有很大的幫助，決定是否領養狗狗前想想看每天是否可以有一個小時左右的散步時間吧！\n\n4.你的經濟條件是否可以負擔另一個生命？\n這是一個很現實，卻也很重要的問題，分別從定期開銷、不定期開銷及一次性開銷來看，定期開銷可能會有飼料、鮮食、零食及洗澡；不定期開銷可能會有疫苗、玩具、除蟲藥及醫藥費等；一次性開銷則會有晶片註冊及結紮費用，領養狗狗後會多出很多開銷，你準備好了嗎？', 1, '2024-05-23 12:33:42', 38, 0),
(3, '吉娃娃 (Chihuahua)', '原產地：墨西哥\r\n身 高：15 ~ 23公分\r\n體 重：1 ~ 4公斤\r\n平均壽命：15 ~ 18歲\r\n1. 外貌特徵\r\n牠們「體型小巧」，有一個飽滿的圓腦袋、大而圓的眼睛、直立的耳朵。\r\n\r\n通常有分「長毛」和「短毛」兩種類型。毛色大部分為「奶油色」、「紅色」、「褐色」、「黑色」、「白色」等種混色組合。\r\n\r\n2. 個性\r\n「生性懦弱」但非常「敏感機警」。\r\n\r\n有些「神經質」，遇見陌生人或是有些許動靜就會吠叫，而且有點「自我中心」，需要一些適當的社交化和訓練。\r\n\r\n所以不建議在都市裡公寓大樓等人口密集區飼養。\r\n但由於身形小且力氣不大，非常「適合陪伴老人」，牽繩時也比較沒有危險。\r\n\r\n3. 生活需求\r\n由於其「體型小」，吉娃娃可以住在「公寓」或「小套房」。\r\n\r\n但牠們依然需要適量的戶外運動和玩耍，但和體型比牠大的犬種玩耍時容易受傷，要特別注意安全。\r\n\r\n吉娃娃「天生畏寒」，冬天須注意保暖。\r\n\r\n此外，吉娃娃的毛需要被定期梳理，尤其是長毛吉娃娃。\r\n\r\n4. 好發問題\r\n齒齦疾病：由於吉娃娃的小嘴巴，牙齒容易積累「牙垢」和「齒石」，這可能導致牙齒疾病。「定期刷牙」和「口腔護理」對維護口腔健康很重要。\r\n呼吸困難：吉娃娃擁有「扁平的臉部」，這可能導致呼吸困難，尤其在炎熱天氣或劇烈運動時。要特別注意他們的「體溫」和「呼吸」。\r\n身體構造脆弱：有「膝蓋骨脫臼」、「四肢易骨折」等風險。玩耍時需特別注意安全。', 3, '2024-05-23 13:39:31', 106, 0),
(4, '『協尋』台中北屯潭子虎斑米克斯走失', '01. 是「拾獲」or 「協尋」:協尋\r\n\r\n02. 狗狗品種：虎斑米克斯\r\n\r\n03. 走失時間： 113年 2月 28日 中午12\r\n:02\r\n\r\n04. 地點：台中潭子 潭春7-11門市附近\r\n\r\n05. 性別：女生\r\n\r\n06. 毛色 or 明顯特徵：虎斑短毛、大耳\r\n朵、一邊耳朵尖端微垂、短尾巴，叫聲略\r\n為低沈\r\n07. 身高、身長、體重：中大型犬 體重\r\n約17公斤\r\n\r\n08. 照片聯結：\r\n\r\nhttps://i.imgur.com/7qmhGtl.jpeg\r\nhttps://i.imgur.com/vE5pwrN.jpeg\r\nhttps://i.imgur.com/Ds2BMF5.jpeg\r\nhttps://i.imgur.com/PFFh9uO.jpeg\r\n9. 年齡：3歲\r\n\r\n10. 結紮：已結紮\r\n\r\n11. 晶片號碼：有打晶片\r\n\r\n12. 寵物小名：班比\r\n\r\n13. 聯絡人：洪小姐\r\n\r\n14. 手機：0979-220-602\r\n\r\n15. 聯絡信箱/站內信箱：可站內信\r\n\r\n16. 其他特徵/走失經過：\r\n狗狗交由於北屯寵物保母照顧時，\r\n保母未鎖門狗狗自己開門走出去，\r\n後狗狗一路由北屯跑到潭子 7-11潭春門\r\n市附近跟丟，\r\n最後監視器拍到於雅豐街132巷消失\r\n狗狗生性害羞、不親陌生人,\r\n走失時沒戴項圈是一隻光溜溜的狗狗\r\n如果有看到她可以偷偷跟著她或立刻通知\r\n，\r\n再麻煩各位熱情廣大版友了\r\n', 4, '2024-05-31 09:36:24', 88, 0),
(5, '狗會攻擊鳥', '家裡養了一隻台灣土狗\r\n因為家裡是三合院，所以沒事就讓狗在院子自由活動，院子裡經常會有鳥在活動\r\n在兩歲前都好好的，沒什麼異常\r\n可是最近，它忽然開始攻擊八哥這類的大一點，會在地上走得鳥\r\n麻雀之類小一點的它似乎沒啥興趣\r\n一開始都碰不到鳥，所以還覺的蠻有趣的\r\n可是上個禮拜它終於咬到了...\r\n直接咬著甩來甩去的，弄的有點驚悚，在跑來找我炫耀？？\r\n小弟也是做了點心裡準備，才敢去處理八哥的屍體...\r\n請問有大神有處理過這種情形嗎？有訓練方法可以轉移狗的注意力，不要做這件事情嗎....\r\n不太想再處理鳥的屍體....', 4, '2024-05-31 09:37:24', 199, 0),
(6, '原來是緣分', '上個月老婆在花蓮七星潭旁邊的大水溝撿了2隻狗狗問我怎麼辦?\r\n問就是三杯阿還用問~結果被已讀不回....應該是喜歡清蒸吧QQ\r\n\r\n收編狗狗也相處滿一個月了，狗狗真的有令人憐愛的魅力，也會因為狗狗帶家人小鬼去運動場玩滑板騎車也溜狗，挺不賴\r\n難能可貴的是家裡的小孩也很願意陪伴小狗狗，甚至要擠在一起睡覺呢！\r\n', 2, '2024-05-31 09:41:12', 18, 0),
(7, '怎麼訓練母狗在外面尿尿', '家裡有隻母狗，從小養現在大概快1歲了，但是有個問題就是他只會在家裡大小便，帶他去外面走，完全不會大小便，有另一隻公狗示範給他看都沒用\r\n\r\n詢問過獸醫，就是母狗從小就在家裡大小便，長大後就很難在外面大小便，想問問有沒有相關經驗的朋友是怎麼解決的', 4, '2024-05-31 09:46:59', 53, 0),
(8, '以後再也不敢養寵物了..', '家裡養了七、八年的狗狗，今天早上無預警的就突然去世了，雖然我不是他認定的第一順位主人，但心情還是很難過...\r\n\r\n早上還在睡夢時被家人緊急叫醒，說小狗快死掉不行了，要我趕快載他去醫院，我驚醒去現場看時發現他已經倒臥在地上，幾乎一動也不動，只剩下手腳跟眼球\"疑似\"還有還有在微微的抽搐轉動，可隔不到五分鐘送到最近的醫院時，已經沒有任何心跳了，大概在半路上就已經走了吧.....?\r\n\r\n帶回去時問了一下家人，說是走到一半就突然沒力氣倒下了，然後很快的就走了。雖然前幾天看他要死不活的樣子，家人心裡裡就有一點不安了，但類似情況之前也發生過好多次，但每次過幾天就自然好了，沒想這次真的就這樣離開我們了。\r\n\r\n這幾天他的一邊眼睛總是沒辦法睜開，前兩天是右眼張不開，等右眼好了換左眼不行了。整天也是有氣無力的樣子，給他東西也吃不太下，一些平常愛吃的零食不是咬不動就是沒吃完剩下，由於以前類似情況也發生過幾次，帶去醫院檢查也找不出個所以然，加上他已經算很老關係，所以一直在猶豫要不要帶他去醫院再看看，但沒想到已經沒有這樣的機會了\r\n\r\n對他主人我們還是他說，他是自然老死的，這一兩年狗狗老化的速度非常快，以前還有帶他出門散步，但這一兩年他根本都只在家裡附近走走而已，這幾個月更是連稍為高一點的樓梯都跳不上去，也不願意去嘗試了，動一下就喘個不停，體能退化的相當嚴重\r\n\r\n我不知道是不是吉娃娃的壽命本來就這麼短，想起當初他剛到家裡時似乎才一個月左右，看著他從小變老，那時因為在考大學關係沒有辦法太過照顧到，結果卻被其他家人搶了他心中的主人位置，此後不管我對他有多好，似乎也只能排第二順位而已，但他真正的飲食起居照顧啥，卻幾乎都是我跟我媽在一手照顧，而他的主人完全就是陪他玩而已\r\n\r\n下午在處理他遺物時，看到他那包日前特地幫他買而沒吃完的肉乾時，眼淚一不小心又掉出來了。想起日前冬天他怕冷，每晚都要幫他蓋被子免得讓他發抖一整晚，當時還想說要不要買個蒙古包式的被窩給他，結果最後還是沒買成，因為價格關係家裡當時非常反對，最後只好每晚自己辛苦點幫他蓋被子熬過冬天了\r\n\r\n狗狗走得這麼突然，而且看一些資料說吉娃娃的壽命似乎有十五年左右，但家裡這知吃好的用好的，整天算是養尊處優過的最幸福，卻只走了一半的路就這樣離開我們了，實在是不知道怎麼會這樣就離開了\r\n\r\n當然...我私下是在懷疑可能跟他整天待在他主人身邊關係，成為家裡二手菸吸最多的重度患者有關聯.....\r\n\r\n真相是什麼，我已經沒有任何心情再去對他指責什麼了。或許他會這麼早就離開我們，是其他我們疏忽的原因，但我也不敢、不願、也不想真的再去追根究柢什麼了\r\n\r\n想起前些天才剛換手機，順手幫他拍了幾張照片，沒想到現在居然變成他最後的遺照了\r\n\r\n\r\n\r\n狗狗的後事，家人怕天氣太熱會導致遺體腐敗，因此處理的非常快速，幾乎我才剛平復一下心情去吃飯，狗狗就已經送去給醫院處理了，覺得有些匆忙到讓我反應不急。(不知情下就自行處理了...讓我到現在還有點生氣)\r\n\r\n由於不是辦理個人火化關係，導致沒啥東西能留下來當紀念，只剩下手機中的僅存照片，可以給人睹物思念而已，家裡跟他最親的幾個家人，一天下來不時可以看到眼眶經常在泛紅，甚至晚上看睡到一半還難過到起來痛哭\r\n\r\n常聽有人說，寵物在死前都會跑到主人看不到的地方躲起來，現在我是相信了。因為這幾天晚上，他居然很反常的自己主動跑來我房間裡休息，而且還不只一晚過來。在那之前他是打死都不願意在我房間裡久待的，因為他怕我就這樣把他留在那邊，不讓他出去找他主人\r\n\r\n現在想想，當時情況其實已經很詭異了，因為他跑來我房間休息時不是對著門口，也不是對著我，而是完全背對著我，直接跑到不起眼的牆角對著牆壁靜躺，好像這樣就沒人會注意到他似的，可能那時他自己就已經有預感了吧?\r\n\r\n現在回想起他那喬巴式的躲藏行為，笨拙到讓我一回想眼淚就一不小心再度落下了....\r\n\r\n媽媽說家裡以後不會再養寵物了，因為失去一個朝夕相處，真心對待復出的家人的痛，實在是很不想再承擔一次了。\r\n\r\n從高中到大學，在從大學到現在工作，他陪伴過我人生中最重要的幾個時期，雖然到他走前我只是他第二順位的小主人而已，但我還是感謝他這段時間的陪伴，希望他一路好走了\r\n\r\n\r\n\r\n打到這裡實在已經打不下去了，衛生紙也不知道已經抽了幾張了，似乎壓抑了一天的情緒全部在這時後爆發出來了，努力讓自己不要去在意的打算，似乎在重新看到照片時整個撐不下去了。\r\n\r\n以後回家時再也不會有人再房們口搖尾巴歡迎你了\r\n\r\n晚上出房門時再也不會看到他對你打招呼了\r\n\r\n少了一個家人陪伴的夜晚，不知還要多久才能習慣...', 3, '2024-05-31 09:48:58', 67, 0),
(9, '狗狗一起上廁所', '如標題 有人家的汪汪也會這樣嗎?\r\n\r\n主人進廁所小便 他也會跟著進去小便... (沒特別教過)\r\n\r\n已經持續快兩年了\r\n', 3, '2024-05-31 09:55:24', 273, 0),
(10, '寶貝的笑容把我的心都融化了', '藍色星期一想必大家都鬱鬱寡歡( o̴̶̷᷄﹏o̴̶̷̥᷅ )\r\n第一次在這邊跟大家分享家裡的狗兒子，\r\n是一隻超怪胎的柴柴，跟主人個性超級像-/-\r\n\r\n由於是藍色星期一，所以跟大家分享兒子的天真無邪的超大笑容，希望能把大家禮拜一的壞心情趕走：）\r\n也歡迎大家跟我分享你家寵物最天真無邪的笑容！\r\n', 3, '2024-05-31 09:57:43', 161, 0),
(11, '幫狗做了間狗屋', '之前的狗屋爛了\r\n所以幫家裡笨狗做了間狗屋\r\n但是做好後笨狗寧願在橘子樹下躲雨\r\n也不願意進新的屋子裡面\r\n有沒有什麼辦法可以讓他進去啊？', 3, '2024-05-31 10:45:09', 290, 0),
(12, '請問狗狗可以喝豆漿嗎?', '不是我想餵她=_+\r\n\r\n是每次我喝豆漿她就在旁邊盯著看，一副不給她喝就翻臉的主子氣勢\r\n\r\n可是不知道狗狗能不能喝豆漿不敢給她喝 (自己煮的，無糖無添加)\r\n\r\n請問狗狗可以喝豆漿嗎?\r\n', 4, '2024-05-31 10:46:41', 177, 0),
(13, '請問有推薦的狗狗預防藥？？', '本人剛養了一隻博美正在為預防藥做資料\r\n發現全能狗S 似乎能預防較多種 一個月吃一次\r\n還有些人會給狗狗吃一錠除加上犬新寶 也能跟全能狗S的功效差不多\r\n亦或者是給狗狗打防心絲的針劑 一年打一針 再吃防跳蚤 壁蝨的藥   \r\n而且還要考慮到抗藥性 一直吃同種的太久 還要換牌子等等...\r\n到時候會帶狗狗去動物醫院檢查 打針並購買預防藥等等   想先詢問各位飼主的建議或心得和推薦的吃法', 4, '2024-05-31 10:47:54', 211, 0),
(14, '狗狗去當天使了，我確完全無法放下', '我跟女友最心愛的狗狗馬泥昨天去當天使了，本來只是屁股腫一顆，醫生建議切掉，我覺得還好可以再看看，我女友覺得還是割掉比較好，結果手術成功，但是回家後因為氣管心臟的問題吐了血，又馬上帶回醫院，醫院讓它住院，然後我們第二天去時已經是冰冷的遺體，我真的覺得好痛苦，如果他是年紀大或長期病痛我還能釋懷，可是它才八歲，而且它很膽小，可是我確讓它一個人在醫院死去，它一定很希望我們去接它，我真的好痛苦好痛苦，雖然養了很多狗也走了很多，可是我這次真的放不下去，馬泥的個性真的很討人喜歡，又特別乖，我女友帶它去上班上課，它全程都是不叫不鬧的，我現在一想到還是會痛哭，不知道往後該怎麼過', 3, '2024-05-31 10:48:16', 35, 0),
(15, '柴犬-米修與歐歐', '這是我們家的毛孩們\r\n目前7個月大\r\n', 2, '2024-05-31 10:49:20', 49, 0),
(16, '請問柴犬誤食魚刺怎麼辦ˉ會怎樣', '如題，\r\n\r\n剛剛吃魚發現地上有一支一半小牙籤大小的魚刺，\r\n\r\n正要撿起時柴犬就跑過來舔進嘴巴裡面了，\r\n\r\n應該是被吞進去了，\r\n\r\n大概過了10分鐘，還沒有什麼異狀，\r\n\r\n請問如果有問題的話大概多久會出現症狀？\r\n\r\n有沒有可能順順的進去然後被便便出來？\r\n\r\n謝謝您\r\n\r\n柴犬是成犬大小 一歲多 穿衣服那隻', 4, '2024-05-31 11:05:32', 66, 0),
(17, '我家可愛拉拉與小幫手', '曬一下我家的拉拉。\r\n \r\n有夠可愛，嘻嘻。\r\n是一隻阿柴，不服請貼自己的阿狗跟阿貓(絕對不是要騙照片。)\r\n \r\n原本是朋友家的狗，但他出國念書就送養給我~~\r\n當時自己剛單身，備感寂寞，當時覺得拉拉可以陪我，就抱回家了>////<。\r\n有夠活潑，所以在教它的時候好辛苦QQ\r\n \r\n但現在就是一個，家人、妹妹的感覺，非常黏我。\r\n \r\n會咬著我幫他買的玩偶跟她拔河，一開始沒有關在籠子裡，它會跑來我旁邊睡，直到現在我交到女朋友，但它會咬我女朋友把她趕走XDDDD\r\n \r\n搶正宮的拉拉XDD。\r\n', 2, '2024-05-31 11:21:20', 166, 0),
(18, '狗狗吃飯的碗', '請問狗狗吃飯的碗可以用菜瓜布洗嗎(塑膠的)\r\n\r\n應為碗旁邊長了一圈紅紅的很難刷掉\r\n\r\n超噁心的...', 3, '2024-05-31 11:21:51', 299, 0),
(19, '有關狗狗大小便', '我領養了一隻兩個月大的米克斯，養了兩天就會到固定的地方大便（在廁所有尿布墊），可是尿尿怎麼都教不會每次都在客廳上，而且還每次換位置，請問是為什麼？\r\n\r\nP S：偶爾還是成功過，代表她是知道的\r\n         而且大便是她自己跑進去的，都不用引導', 3, '2024-05-31 11:22:13', 78, 0),
(20, '有什麼胸背帶不會被咬斷的？', '用了ezydog和tails and me的都立馬被咬斷\r\n\r\n帶在身上也能咬到\r\n\r\n錢都丟水裡了\r\n\r\n求解', 4, '2024-05-31 11:25:56', 98, 0),
(21, '幼犬愛咬人該怎麼辦？', '請問一下大約4-5個月大的幼犬愛咬人要怎麼辦？\r\n今天帶牠去散步如果不是褲子比較厚 不然左右腳又要多兩個洞……orz\r\n', 4, '2024-05-31 13:17:34', 90, 0),
(22, '阿胖，另一個世界過的好嗎', '15年前\r\n阿胖來到我們家\r\n\r\n想不到這麼快就要跟你說再見了\r\n到現在我還覺得你好像都待在我旁邊一樣\r\n\r\n感覺才生病沒幾天你就馬上離開我們家了\r\n\r\n-----------------\r\n\r\n\r\n前陣子被醫生檢查出身體有腫瘤\r\n醫生認為年紀太大也不適合這樣開刀受苦\r\n建議我們家給他吃抗癌藥物自然走\r\n\r\n哀......\r\n吃過藥的阿胖\r\n一天比一天癱軟\r\n我媽每天看到他都大哭，跟我們商量說要讓他安樂死\r\n\r\n好捨不得啊\r\n但是看到你無助的眼神，只能拼命喘息，走不太動吃不太下\r\n好可憐..\r\n\r\n最後我們還是這樣送你走了\r\n\r\n至少\r\n\r\n最後這一段路有我們一起陪著你\r\n你看起來就像睡著一樣\r\n\r\n\r\n阿胖，再另外一個世界也要快樂喔', 3, '2024-05-31 13:18:33', 75, 0),
(23, '中國大陸的狗狗怎麼帶回臺灣', '請問大家一下\r\n請問中國大陸出生購買的狗狗(邊境牧羊犬)，要怎麼帶回臺灣，我要回臺灣了但狗狗不知道怎麼帶回來，請大家有經驗的教教我，感激不盡', 4, '2024-05-31 13:26:38', 22, 0),
(25, '測試一下', '真的測試', 1, '2024-06-05 13:55:38', 1, 0),
(26, '找狗領養', '找狗拉', 1, '2024-06-05 14:26:41', 2, 0),
(27, '問狗狗清潔用品 天氣熱家裡狗味特別重', '當初可是經過家庭革命我媽才讓我養狗\r\n只要天氣悶熱 地板怎麼拖怎麼擦還是有味道\r\n我媽每天唸我家狗哥臭T^T\r\n求寵物地板清潔~\r\n怕用到不好的對狗哥皮膚有害', 4, '2024-06-06 11:02:04', 3, 0),
(28, '家裡新來的妹妹', '', 2, '2024-06-06 11:04:04', 3, 0),
(29, '零食要怎麼挑比較好，有推薦的天然的狗狗零食嗎？', '我的狗狗體質比較敏感一點\r\n之前有吃到會讓牠拉肚子的零食\r\n醫生建議說盡量買純天然的零食會比較好\r\n這次挑選想要更謹慎一點\r\n想請教大家有挑選零食的要點嗎\r\n或是有不錯的天然寵物零食可以推薦給我嗎', 3, '2024-06-06 11:08:59', 4, 0),
(30, '賀 三個月大白熊', '我家狗兒子Haru滿三個月啦\r\n可喜可賀\r\n', 2, '2024-06-06 11:09:31', 4, 0),
(31, '想訓練狗咬飛盤.球請教前輩', '寵物種類：狗\r\n\r\n求助類型：訓練咬東西\r\n\r\n寵物資料：3歲臺灣犬\r\n\r\n諮詢期限：\r\n\r\n其他備註：\r\n\r\n我家的狗不太會去咬食物以外的東西，益智餌食玩具也沒什麼在玩，想說訓練下讓牠好好運動。結果我發現我好難讓牠咬東西，他只有撒嬌跟吃東西會開口\r\n', 4, '2024-06-06 11:19:19', 4, 0),
(32, '這裡有狗', '看看狗\r\n\r\n', 1, '2024-06-06 13:47:01', 1, 1),
(33, '有狗', '狗', 1, '2024-06-06 14:48:44', 1, 0),
(34, '測試一下', '測試一下', 1, '2024-06-06 15:38:53', 2, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `article_img`
--

CREATE TABLE `article_img` (
  `id` int(11) UNSIGNED NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `article_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `article_img`
--

INSERT INTO `article_img` (`id`, `img_path`, `article_id`) VALUES
(1, 'arti_img_6_1.jfif', 6),
(2, 'arti_img_8_1.jpg', 8),
(3, 'arti_img_8_2.jpg', 8),
(4, 'arti_img_9_1.jfif', 9),
(6, 'arti_img_ud_10_2.jfif', 10),
(7, 'arti_img_ud_10_3.jfif', 10),
(8, 'arti_img_ud_10_1.jfif', 10),
(9, 'arti_img_12_1.jfif', 12),
(10, 'arti_img_15_1.jpeg', 15),
(11, 'arti_img_15_2.jpeg', 15),
(12, 'arti_img_16_1.jfif', 16),
(13, 'arti_img_17_1.jfif', 17),
(14, 'arti_img_21_1.jfif', 21),
(18, 'arti_img_25_1.jfif', 25),
(19, 'arti_img_28_1.jfif', 28),
(20, 'arti_img_28_2.jfif', 28),
(21, 'arti_img_28_3.jfif', 28),
(22, 'arti_img_30_1.jfif', 30),
(23, 'arti_img_31_1.jfif', 31),
(25, 'arti_img_ud_32_1.jfif', 32),
(26, 'arti_img_34_1.jfif', 34);

-- --------------------------------------------------------

--
-- 資料表結構 `article_sort`
--

CREATE TABLE `article_sort` (
  `id` int(11) UNSIGNED NOT NULL,
  `sort` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `article_sort`
--

INSERT INTO `article_sort` (`id`, `sort`) VALUES
(1, '領養專區'),
(2, '毛孩照片'),
(3, '飼養心得'),
(4, '疑難雜症');

-- --------------------------------------------------------

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `article_img`
--
ALTER TABLE `article_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`);

--
-- 資料表索引 `article_sort`
--
ALTER TABLE `article_sort`
  ADD PRIMARY KEY (`id`);


  --
-- 使用資料表自動遞增(AUTO_INCREMENT) `article`
--
ALTER TABLE `article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article_img`
--
ALTER TABLE `article_img`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `article_sort`
--
ALTER TABLE `article_sort`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------
--
-- 資料表結構 `coupons`
--

CREATE TABLE `coupons` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `category` smallint(4) UNSIGNED NOT NULL,
  `coupontype` varchar(10) NOT NULL,
  `value` decimal(5,0) NOT NULL,
  `description` varchar(50) NOT NULL,
  `min_limit` decimal(5,0) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `category`, `coupontype`, `value`, `description`, `min_limit`, `start_date`, `end_date`, `created_at`, `status`) VALUES
(1, '全館商品滿額85折', '1IKPZT', 1, '%折扣', 85, '全館商品滿1000元85折', 1000, '2024-05-28', '2024-06-30', '2024-06-06 01:37:21', 1),
(2, '新客9折券', '0O554K', 2, '%折扣', 90, '新客享9折', 500, '2024-05-29', '2024-06-30', '2024-06-06 09:15:19', 1),
(3, '端午節88折券', '7N5HJ6', 1, '%折扣', 88, '端午節88折', 1000, '2024-05-29', '2024-06-30', '2024-06-06 09:15:50', 1),
(4, '國際小狗日8折券', 'CYR0JF', 1, '%折扣', 80, '3/23 國際小狗日8折券', 1000, '2024-03-23', '2024-03-23', '2024-06-06 01:47:43', 1),
(5, '3/20週年慶7折券', 'HYMESQ', 1, '%折扣', 70, '翻肚肚週年慶7折', 2000, '2024-03-15', '2024-03-25', '2024-06-06 01:47:39', 1),
(6, '滿1000元 減100', '6BZLZL', 2, '固定金額', 100, '滿1000元 減100', 1000, '2024-05-28', '2024-06-30', '2024-06-06 09:15:57', 1),
(7, '滿1000元 減200', 'LRYG2X', 3, '固定金額', 200, '滿1500元 減200', 1500, '2024-05-29', '2024-06-30', '2024-06-06 09:15:34', 1),
(8, '一起寵汪汪', 'PEJZB4', 1, '固定金額', 111, '一起寵汪汪 滿1111元-111', 1111, '2024-07-01', '2024-07-31', '2024-06-06 09:16:03', 1),
(9, '汪汪跨年500元券', 'PYX6TH', 1, '固定金額', 500, '迎接2024 滿3000-500', 3000, '2023-12-27', '2023-12-31', '2024-06-03 01:47:40', 1),
(10, '新春666元券', 'VSLSZH', 1, '2', 666, '歡慶新春666', 1680, '2024-02-08', '2024-02-10', '2024-06-06 03:46:23', 1),
(11, '商品滿額85折', 'KMFUUD', 1, '%折扣', 85, '滿1000元 享85折', 1000, '2024-05-28', '2024-06-30', '2024-06-06 01:44:33', 1),
(12, '商品滿額9折', 'D82PZL', 1, '%折扣', 90, '滿800元 享9折', 800, '2024-06-01', '2024-06-30', '2024-06-06 01:46:38', 1),
(13, '商品滿500減50', 'B74HFM', 1, '固定金額', 50, '滿500元 減50', 500, '2024-07-01', '2024-07-31', '2024-06-02 01:35:02', 1),
(14, '新品85折', '6B6AG5', 1, '%折扣', 85, '新品享85折', 1500, '2024-08-01', '2024-08-31', '2024-06-06 07:49:03', 1),
(15, '商品春季大促88折', 'E605KK', 1, '%折扣', 88, '春季大促 享88折', 880, '2024-09-01', '2024-09-30', '2024-06-06 07:49:12', 1),
(16, '新客滿200減50', '6C15FU', 1, '固定金額', 20, '滿200元 減20', 200, '2024-05-01', '2026-12-31', '2024-06-02 01:35:02', 1),
(17, '新客住宿85折', '7FISUA', 2, '%折扣', 85, '住宿享85折', 1000, '2024-05-01', '2026-12-31', '2024-06-06 07:49:18', 1),
(18, '住宿9折', 'QCYE1E', 2, '%折扣', 90, '住宿享9折', 1000, '2024-06-01', '2024-06-30', '2024-06-06 07:49:22', 1),
(19, '住宿滿3晚減100', 'FM96TU', 2, '固定金額', 100, '住宿滿3晚 減100', 2000, '2024-07-01', '2024-07-31', '2024-06-06 07:48:23', 1),
(20, '暑假特惠85折', 'XQZ5WY', 2, '%折扣', 85, '暑假特惠 享85折', 1500, '2024-08-01', '2024-08-31', '2024-06-06 07:49:26', 1),
(21, '寒假大促9折', '7QCMRL', 2, '%折扣', 90, '寒假大促 享9折', 1500, '2024-12-01', '2024-12-31', '2024-06-06 07:49:30', 1),
(22, '週末特惠減50', 'IIU252', 2, '固定金額', 50, '週末特惠 減50', 500, '2024-12-01', '2024-12-31', '2024-06-06 07:48:12', 1),
(23, '新客課程85折', 'QVSE6O', 3, '%折扣', 85, '課程享85折', 1000, '2024-05-01', '2026-12-31', '2024-06-06 07:47:08', 1),
(24, '課程9折', 'B9516V', 3, '%折扣', 90, '課程享9折', 1000, '2024-06-01', '2024-06-30', '2024-06-06 07:47:12', 1),
(25, '滿1000減100', 'T3RJIW', 3, '固定金額', 100, '滿1000元 減100', 1000, '2024-07-01', '2024-07-31', '2024-06-02 01:35:02', 1),
(26, '新課程85折', 'INKIDU', 3, '%折扣', 85, '新課程享85折', 1000, '2024-08-01', '2024-08-31', '2024-06-06 07:47:15', 1),
(27, '限時優惠9折', 'NK394F', 3, '%折扣', 90, '限時優惠 享9折', 1000, '2024-09-01', '2024-09-30', '2024-06-06 07:47:18', 1),
(28, '新年特惠減50', '7QJZTR', 3, '固定金額', 50, '新年特惠 減50', 500, '2024-01-01', '2024-01-31', '2024-06-02 01:35:02', 1),
(29, '商品滿額85折', 'E94QQO', 1, '%折扣', 85, '滿1000元 享85折', 1000, '2024-05-28', '2024-06-30', '2024-06-06 01:44:20', 1),
(30, '商品滿額9折', '9AOODU', 1, '%折扣', 90, '滿800元 享9折', 800, '2024-06-01', '2024-06-30', '2024-06-06 01:45:27', 1),
(31, '商品滿500減50', 'PY1WQY', 1, '固定金額', 50, '滿500元 減50', 500, '2024-07-01', '2024-07-31', '2024-06-02 01:45:18', 1),
(32, '新品85折', 'UZFUZ8', 1, '%折扣', 85, '新品享85折', 1000, '2024-08-01', '2024-08-31', '2024-06-06 07:47:23', 1),
(33, '春季大促88折', 'OJ9IMK', 1, '%折扣', 88, '春季大促 享88折', 1000, '2024-09-01', '2024-09-30', '2024-06-06 09:48:10', 1),
(34, '新客滿200減20', 'IE39P5', 1, '固定金額', 20, '滿200元 減20', 200, '2024-05-01', '2026-12-31', '2024-06-02 01:45:18', 1),
(35, '新客住宿85折', 'KMCF15', 2, '%折扣', 85, '住宿享85折', 1000, '2024-05-01', '2026-12-31', '2024-06-06 07:47:30', 1),
(36, '住宿9折', 'WUWTCN', 2, '%折扣', 90, '住宿享9折', 1000, '2024-06-01', '2024-06-30', '2024-06-06 07:47:33', 1),
(37, '住宿滿3晚減100', 'MWPDTG', 2, '固定金額', 100, '住宿滿3晚 減100', 2000, '2024-07-01', '2024-05-01', '2024-05-31 01:45:18', 1),
(38, '暑假特惠85折', '44BL50', 2, '%折扣', 85, '暑假特惠 享85折', 1000, '2024-08-01', '2024-08-31', '2024-06-06 07:47:36', 1),
(39, '寒假大促9折', '41XI3I', 2, '%折扣', 90, '寒假大促 享9折', 1000, '2024-12-01', '2024-12-31', '2024-06-06 07:47:39', 1),
(40, '週末特惠減50', '4M21VA', 2, '固定金額', 50, '週末特惠 減50', 500, '2024-11-01', '2024-11-30', '2024-06-06 07:47:56', 1),
(41, '新客課程85折', 'QSYFQE', 3, '%折扣', 85, '課程享85折', 1500, '2024-05-01', '2026-12-31', '2024-06-06 07:49:57', 1),
(42, '課程9折', 'NLLJEP', 3, '%折扣', 90, '課程享9折', 1500, '2024-06-01', '2024-06-30', '2024-06-06 07:49:00', 1),
(43, '滿1000減100', 'J3C813', 3, '固定金額', 100, '滿1000元 減100', 1000, '2024-07-01', '2024-07-31', '2024-06-02 01:45:18', 1),
(44, '新課程85折', 'B2YWJI', 3, '%折扣', 85, '新課程享85折', 1500, '2024-08-01', '2024-08-31', '2024-06-06 07:49:51', 1),
(45, '限時優惠9折', 'Z8R7CE', 3, '%折扣', 90, '限時優惠 享9折', 1500, '2024-09-01', '2024-09-30', '2024-06-06 07:49:43', 1),
(46, '新年特惠減50', '41S347', 3, '固定金額', 50, '新年特惠 減50', 500, '2024-01-01', '2024-01-31', '2024-06-02 01:45:18', 1),
(47, '春節特惠85折', 'BQSG1B', 1, '%折扣', 85, '春節特惠 享85折', 1500, '2024-02-01', '2024-02-28', '2024-06-06 07:49:59', 1),
(48, '夏日特惠9折', '8TRWEZ', 1, '%折扣', 90, '夏日特惠 享9折', 1500, '2024-03-01', '2024-03-31', '2024-06-06 07:49:33', 1),
(49, '秋季特惠95折', 'E1FRYZ', 1, '%折扣', 95, '秋季特惠 享95折', 800, '2024-04-01', '2024-04-30', '2024-06-06 07:49:36', 1),
(50, '冬季特惠8折', '3W880P', 1, '%折扣', 80, '冬季特惠 享8折', 1500, '2024-05-01', '2024-05-31', '2024-06-06 07:49:54', 1),
(51, '週年慶9折', '3HF7UC', 1, '%折扣', 90, '週年慶 享9折', 1000, '2024-06-01', '2024-06-30', '2024-06-06 07:47:02', 1),
(52, '感恩節特惠85折', 'V2ASQ6', 1, '%折扣', 85, '感恩節特惠 享85折', 1500, '2024-07-01', '2024-07-31', '2024-06-06 07:49:48', 1),
(53, '聖誕節特惠9折', 'QCNVFD', 1, '%折扣', 90, '聖誕節特惠 享9折', 1500, '2024-12-01', '2024-12-31', '2024-06-06 07:49:40', 1),
(54, '黑五特惠8折', 'UG2WBK', 1, '%折扣', 80, '黑五特惠 享8折', 1500, '2024-11-01', '2024-11-30', '2024-06-06 07:49:46', 1),
(55, '汪汪端午住飯店', 'J2PIUU', 2, '固定金額', 100, '汪汪住旅館', 1000, '2024-06-06', '2024-06-10', '2024-06-06 11:23:59', 1),
(56, '汪汪住飯店-寒假', '1BMSIK', 2, '固定金額', 500, 'test', 1000, '2025-01-20', '2025-02-20', '2024-06-06 10:37:06', 1),
(57, '汪汪住飯店-暑假', 'A990B2', 2, '%折扣', 80, 'test', 1000, '2024-07-01', '2024-08-31', '2024-06-06 10:36:15', 1),
(58, '暑期課程85折', '0VFRXI', 3, '%折扣', 85, '暑假上課85折', 2000, '2024-07-01', '2024-08-31', '2024-06-06 11:30:16', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `coupons_category`
--

CREATE TABLE `coupons_category` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `coupons_category`
--

INSERT INTO `coupons_category` (`id`, `name`) VALUES
(1, '商品'),
(2, '寵物旅館'),
(3, '線上課程');

-- --------------------------------------------------------


--
-- 資料表索引 `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `coupons_category`
--
ALTER TABLE `coupons_category`
  ADD PRIMARY KEY (`id`);


--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupons_category`
--
ALTER TABLE `coupons_category`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;



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
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `crs_categories`
--

INSERT INTO `crs_categ_genre` (`id`, `name`) VALUES
(1, '單一主題'),
(2, '綜合主題');

-- --------------------------------------------------------

--
-- 資料表結構 `images_stored`
--

CREATE TABLE `images_stored` (
  `id` int(9) UNSIGNED NOT NULL,
  `genre` varchar(2) NOT NULL,
  `item_id` int(8) UNSIGNED NOT NULL,
  `item_sub_id` tinyint(2) UNSIGNED NOT NULL,
  `file_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `images_stored`
--

INSERT INTO `images_stored` (`id`, `genre`, `item_id`, `item_sub_id`, `file_name`) VALUES
(1, 'CR', 1, 2, 'CR0000012.jpg'),
(2, 'CR', 1, 3, 'CR0000013.jpg'),
(3, 'CR', 1, 4, 'CR0000014.jpg'),
(4, 'CR', 2, 2, 'CR0000022.jpg'),
(5, 'CR', 2, 3, 'CR0000023.jpg'),
(6, 'CR', 2, 4, 'CR0000024.jpg'),
(7, 'CR', 3, 2, 'CR0000032.jpg'),
(8, 'CR', 3, 3, 'CR0000033.jpg'),
(9, 'CR', 3, 4, 'CR0000034.jpg'),
(10, 'CR', 4, 2, 'CR0000042.jpg'),
(11, 'CR', 4, 3, 'CR0000043.jpg'),
(12, 'CR', 4, 4, 'CR0000044.jpg'),
(13, 'CR', 5, 2, 'CR0000052.jpg'),
(14, 'CR', 5, 3, 'CR0000053.jpg'),
(15, 'CR', 5, 4, 'CR0000054.jpg'),
(16, 'CR', 6, 2, 'CR0000062.jpg'),
(17, 'CR', 6, 3, 'CR0000063.jpg'),
(18, 'CR', 6, 4, 'CR0000064.jpg'),
(19, 'CR', 7, 2, 'CR0000072.jpg'),
(20, 'CR', 7, 3, 'CR0000073.jpg'),
(21, 'CR', 7, 4, 'CR0000074.jpg'),
(22, 'CR', 8, 1, 'CR0000081.jpg'),
(23, 'CR', 8, 2, 'CR0000082.jpg'),
(24, 'CR', 8, 3, 'CR0000083.jpg'),
(25, 'CR', 8, 4, 'CR0000084.jpg'),
(26, 'CR', 9, 2, 'CR0000092.jpg'),
(27, 'CR', 9, 3, 'CR0000093.jpg'),
(28, 'CR', 9, 4, 'CR0000094.jpg'),
(29, 'CR', 10, 1, 'CR0000101.jpg'),
(30, 'CR', 10, 2, 'CR0000102.jpg'),
(31, 'CR', 10, 3, 'CR0000103.jpg'),
(32, 'CR', 10, 4, 'CR0000104.jpg'),
(33, 'CR', 11, 2, 'CR0000112.jpg'),
(34, 'CR', 11, 3, 'CR0000113.jpg'),
(35, 'CR', 11, 4, 'CR0000114.jpg'),
(36, 'CR', 12, 1, 'CR0000121.jpg'),
(37, 'CR', 12, 2, 'CR0000122.jpg'),
(38, 'CR', 12, 3, 'CR0000123.jpg'),
(39, 'CR', 12, 4, 'CR0000124.jpg'),
(40, 'CR', 13, 1, 'CR0000131.jpg'),
(41, 'CR', 13, 2, 'CR0000132.jpg'),
(42, 'CR', 13, 3, 'CR0000133.jpg'),
(43, 'CR', 13, 4, 'CR0000134.jpg'),
(44, 'CR', 14, 1, 'CR0000141.jpg'),
(45, 'CR', 14, 2, 'CR0000142.jpg'),
(46, 'CR', 14, 3, 'CR0000143.jpg'),
(47, 'CR', 14, 4, 'CR0000144.jpg'),
(48, 'CR', 15, 1, 'CR0000151.jpg'),
(49, 'CR', 15, 2, 'CR0000152.jpg'),
(50, 'CR', 15, 3, 'CR0000153.jpg'),
(51, 'CR', 15, 4, 'CR0000154.jpg'),
(52, 'CR', 16, 1, 'CR0000161.jpg'),
(53, 'CR', 16, 2, 'CR0000162.jpg'),
(54, 'CR', 16, 3, 'CR0000163.jpg'),
(55, 'CR', 16, 4, 'CR0000164.jpg'),
(56, 'CR', 17, 1, 'CR0000171.jpg'),
(57, 'CR', 17, 2, 'CR0000172.jpg'),
(58, 'CR', 17, 3, 'CR0000173.jpg'),
(59, 'CR', 17, 4, 'CR0000174.jpg'),
(60, 'CR', 18, 2, 'CR0000182.jpg'),
(61, 'CR', 18, 3, 'CR0000183.jpg'),
(62, 'CR', 18, 4, 'CR0000184.jpg'),
(63, 'CR', 19, 2, 'CR0000192.jpg'),
(64, 'CR', 19, 3, 'CR0000193.jpg'),
(65, 'CR', 19, 4, 'CR0000194.jpg'),
(66, 'CR', 20, 2, 'CR0000202.jpg'),
(67, 'CR', 20, 3, 'CR0000203.jpg'),
(68, 'CR', 20, 4, 'CR0000204.jpg'),
(69, 'CR', 21, 1, 'CR0000211.jpg'),
(70, 'CR', 21, 2, 'CR0000212.jpg'),
(71, 'CR', 21, 3, 'CR0000213.jpg'),
(72, 'CR', 21, 4, 'CR0000214.jpg'),
(73, 'CR', 22, 2, 'CR0000222.jpg'),
(74, 'CR', 22, 3, 'CR0000223.jpg'),
(75, 'CR', 22, 4, 'CR0000224.jpg'),
(76, 'CR', 23, 2, 'CR0000232.jpg'),
(77, 'CR', 23, 3, 'CR0000233.jpg'),
(78, 'CR', 23, 4, 'CR0000234.jpg'),
(79, 'CR', 1, 1, 'CR0000011.png'),
(80, 'CR', 2, 1, 'CR0000021.png'),
(81, 'CR', 3, 1, 'CR0000031.png'),
(82, 'CR', 4, 1, 'CR0000041.png'),
(83, 'CR', 5, 1, 'CR0000051.png'),
(84, 'CR', 6, 1, 'CR0000061.png'),
(85, 'CR', 7, 1, 'CR0000071.png'),
(86, 'CR', 9, 1, 'CR0000091.png'),
(87, 'CR', 11, 1, 'CR0000111.png'),
(88, 'CR', 18, 1, 'CR0000181.png'),
(89, 'CR', 19, 1, 'CR0000191.png'),
(90, 'CR', 20, 1, 'CR0000201.png'),
(91, 'CR', 22, 1, 'CR0000221.png'),
(92, 'CR', 23, 1, 'CR0000231.png');

-- --------------------------------------------------------


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
-- 資料表索引 `images_stored`
--
ALTER TABLE `images_stored`
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



  -- --------------------------------------------------------

--
-- 資料表結構 `area_category`
--

CREATE TABLE `area_category` (
  `id` int(5) UNSIGNED NOT NULL,
  `location` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `area_category`
--

INSERT INTO `area_category` (`id`, `location`) VALUES
(1, '台北市'),
(2, '新北市'),
(3, '桃園市');

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_img`
--

CREATE TABLE `hotel_img` (
  `id` int(6) UNSIGNED NOT NULL,
  `hotel_id` int(6) UNSIGNED NOT NULL,
  `path` varchar(50) NOT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `hotel_img`
--

INSERT INTO `hotel_img` (`id`, `hotel_id`, `path`, `valid`) VALUES
(1, 1, '1_1.jpg', 1),
(2, 1, '1_2.jpg', 1),
(3, 1, '1_3.jpg', 1),
(4, 2, '2_1.jpg', 1),
(5, 2, '2_2.jpg', 1),
(6, 2, '2_3.jpg', 1),
(7, 3, '3_1.jpg', 1),
(8, 3, '3_2.jpg', 1),
(9, 3, '3_3.jpg', 1),
(10, 4, '4_1.jpg', 1),
(11, 4, '4_2.jpg', 1),
(12, 4, '4_3.jpg', 1),
(13, 5, '5_1.jpg', 1),
(14, 5, '5_2.jpg', 1),
(15, 5, '5_3.jpg', 1),
(16, 6, '6_1.jpg', 1),
(17, 6, '6_2.jpg', 1),
(18, 6, '6_3.jpg', 1),
(19, 7, '7_1.jpg', 1),
(20, 7, '7_2.jpg', 1),
(21, 7, '7_3.jpg', 1),
(22, 8, '8_1.jpg', 1),
(23, 8, '8_2.jpg', 1),
(24, 8, '8_3.jpg', 1),
(25, 9, '9_1.jpg', 1),
(26, 9, '9_2.jpg', 1),
(27, 9, '9_3.jpg', 1),
(28, 10, '10_1.jpg', 1),
(29, 10, '10_2.jpg', 1),
(30, 10, '10_3.jpg', 1),
(31, 11, '11_1.jpg', 1),
(32, 11, '11_2.jpg', 1),
(33, 11, '11_3.jpg', 1),
(34, 12, '12_1.jpg', 1),
(35, 12, '12_2.jpg', 1),
(36, 12, '12_3.jpg', 1),
(37, 13, '13_1.jpg', 1),
(38, 13, '13_2.jpg', 1),
(39, 13, '13_3.jpg', 1),
(40, 14, '14_1.jpg', 1),
(41, 14, '14_2.jpg', 1),
(42, 14, '14_3.jpg', 1),
(43, 15, '15_1.jpg', 1),
(44, 15, '15_2.jpg', 1),
(45, 15, '15_3.jpg', 1),
(46, 16, '16_1.jpg', 1),
(47, 16, '16_2.jpg', 1),
(48, 16, '16_3.jpg', 1),
(49, 17, '17_1.jpg', 1),
(50, 17, '17_2.jpg', 1),
(51, 17, '17_3.jpg', 1),
(52, 18, '18_1.jpg', 1),
(53, 18, '18_2.jpg', 1),
(54, 18, '18_3.jpg', 1),
(55, 19, '19_1.jpg', 1),
(56, 19, '19_2.jpg', 1),
(57, 19, '19_3.jpg', 1),
(58, 20, '20_1.jpg', 1),
(59, 20, '20_2.jpg', 1),
(60, 20, '20_3.jpg', 1),
(61, 21, '21_1.jpg', 1),
(62, 21, '21_2.jpg', 1),
(63, 21, '21_3.jpg', 1),
(64, 22, '22_1.jpg', 1),
(65, 22, '22_2.jpg', 1),
(66, 22, '22_3.jpg', 1),
(67, 23, '23_1.jpg', 1),
(68, 23, '23_2.jpg', 1),
(69, 23, '23_3.jpg', 1),
(70, 24, '24_1.jpg', 1),
(71, 24, '24_2.jpg', 1),
(72, 24, '24_3.jpg', 1),
(73, 25, '25_1.jpg', 1),
(74, 25, '25_2.jpg', 1),
(75, 25, '25_3.jpg', 1),
(76, 26, '26_1.jpg', 1),
(77, 26, '26_2.jpg', 1),
(78, 26, '26_3.jpg', 1),
(79, 27, '27_1.jpg', 1),
(80, 27, '27_2.jpg', 1),
(81, 27, '27_3.jpg', 1),
(82, 28, '28_1.jpg', 1),
(83, 28, '28_2.jpg', 1),
(84, 28, '28_3.jpg', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `hotel_list`
--

CREATE TABLE `hotel_list` (
  `id` int(5) UNSIGNED NOT NULL,
  `location_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `room_type_id` int(6) UNSIGNED NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `hotel_list`
--

INSERT INTO `hotel_list` (`id`, `location_id`, `name`, `description`, `room_type_id`, `address`, `phone`, `created_at`, `valid`) VALUES
(1, '1', 'W SPA寵物旅館', 'W SPA 寵物旅館位於台電大樓附近，以寵物美容、SPA、住宿安親服務為主，提供貓咪超大獨立挑高空間，而狗狗則採不關籠半開方式照顧，並都提供24H監視器（有夜視鏡功能），讓飼主可隨時觀看毛孩動態。消費者表示：「狗狗在這邊玩得很開心，環境乾淨」、「保姆姐姐對我們家小朋友超級好！！很仔細照顧毛孩子們」、「公館一帶，寵物住宿首選！！乾淨，有耐心，可雲端監控毛孩狀況」、「收費合理，並且很細心的照顧毛小孩」。', 1, '台北市中正區羅斯福路三段139號1F', '0223675899', '2024-06-01 10:18:44', 1),
(2, '1', '有間狗旅精品度假中心', '有間狗旅位於中正紀念堂站附近，強調專注狗狗房與公共空間的設計，除了備有基本的 24 小時全天候監視器外，甚至還有狗狗行為諮商師駐館，協助狗狗們快速安穩地適應環境，服務相當貼心。家長大力推薦：「老闆非常細心，對於狗狗的動向都有仔細掌握」、「整體氛圍感覺非常溫馨悠閒，老闆也非常的專業」、「環境很漂亮整潔，服務也非常專業細心」、「很用心了解寵物的喜好及需求，有問題的時候回覆也都很即時」。', 2, '台北市中正區南昌路一段14號二樓', '0223963963', '2024-06-01 10:28:44', 1),
(3, '1', 'VERY旺寵物旅館', 'VERY旺以打造市中心的寵物樂園為出發點，提供貓狗美容、SPA、住宿、安親臨托等，也有販售寵物用品及鮮食，旅館除了採貓狗獨立分層空間外，最大特色就是頂樓有設計戶外運動場，能讓住宿的狗狗自由自在奔跑玩耍。住過都說讚：「是真心愛寵物的寵物旅館，住宿價格很實惠，還有狗狗們的放風時間」、「每天回報狗狗狀態，可以視訊看寶貝狀況，頂樓有空地可以讓寶貝放風」、「保姆都非常細心 帶寶貝來住宿都很放心」、「服務好，對待毛寶貝們都很友善」。', 3, '台北市松山區八德路二段429號2樓', '0293048836', '2024-06-01 10:38:44', 1),
(4, '1', '家裡寵物旅館-幼幼館', '家裡寵物旅館是全台唯一專門收幼犬的寵物旅館，主打為幼犬、小型犬提供寄宿、安親、美容、訓練等服務，環境相當溫馨自由，尤其在遊戲安親班的活動，更是採一對一引導，而不是團體一起玩，這樣才能避免寵物之間產生護食引起衝突，從細節可見其用心。飼主好評不斷：「環境乾淨沒有異味，看得出來非常用心維護」、「環境溫馨舒適，狗狗都很安心住在這邊」、「對狗勾非常親切有耐心，並且認真觀察每隻狗狗狀況」、「非常細心體貼的寵物旅館，很放心把家裡寶貝交給她們」、「保姆非常細心，住宿過很多次，從來沒有失望過」。', 4, '台北市中山區長安東路二段195號1樓', '0227319200', '2024-06-01 10:48:44', 1),
(5, '1', '狗窩窩愛犬旅社', '希望所有毛小孩來到狗窩窩愛犬旅社能可以像「在家」一般，這是狗窩窩的理念，主要提供美容、住宿、安親等服務，並採不關籠的寄宿方式，讓每個毛孩都有自己的小房間可以睡覺，且保姆也都是經驗豐富的狗奴才，飼主再也不怕狗狗寄宿受委屈！推薦理由：「服務很貼心，每次預約都有配合我們的需求，值得推薦的店家」、「挺好的，狗狗去安親有時他們都會幫狗狗拍照片」、「保姆回訊息都很快， 24  小時監視器，都看的到，也都會回報狗狗的狀況」、「每次我們家狗狗去了都很開心」、「裡面小姐都很客氣而已很有耐心」。', 1, '台北市松山區民生東路五段137巷2-5號', '0227666185', '2024-06-01 10:58:44', 1),
(6, '1', '好時光寵物旅館', '鄰近內湖四期重劃住宅區的好時光寵物旅館，會依照毛小孩的體型、個性分區照顧，每天還有帶去公園散步、放風的戶外活動時間，甚至連睡覺都是一隻一間獨立空間，讓毛小孩休息不會互相影響。另外，寵物住宿也都備有攝影機，讓飼主可遠端連線觀看！飼主紛紛表示：「對人、寵物都很親切，也會定時回報狀況」、「讓人放心的專業店家、保姆」、「保姆超級貼心，定時回報寵物的狀況，還會陪玩拍照錄影片」、「難得碰到這麽細心的寵物旅館，把毛小孩照顧得很好」、「愛犬住了都不想回家了」。', 1, '台北市內湖區民權東路六段170號1F', '0287917135', '2024-06-02 10:08:44', 1),
(7, '1', 'D&Y 寵物美容時尚旅店', 'D&Y不僅提供寵物旅館服務，還有協助狗狗中途，尤其在旅館住宿方面，老闆堅持提供毛小孩24小時專業照顧，確保狗狗身旁有寵物保姆，而且會隨時記錄、主動告知飼主毛小孩狀況，飼主也能透過手機視訊查看自己寶貝的現況，環境相當令人安心。狗奴們激推：「我家狗狗超愛這裡的」、「空間舒適，保姆姐姐們都超有耐心又細心」、「每次都很期待保姆分享狗狗在那邊的照片」、「找不到比這裡更讓我們放心的旅館了」、「寶貝交給D&Y 我們很放心」、「非常用心照顧狗狗，住宿期間常傳狗狗狀況」。', 3, '台北市中山區中山北路三段55巷22號', '0225923252', '2024-06-02 10:18:44', 1),
(8, '1', 'FamilyDog-宜家宜犬', '宜家宜犬有提供安親、住宿、才藝訓練、居家照護、生日派對等服務，並引進韓國寵物美容，不少明星寵物也都曾在這裡住宿過，主打「專人照顧毛孩」，且還能讓狗狗學習社會化，也有協助羅志祥母親照顧救援回來的狗狗，是許多毛小孩的第二個家。狗狗飼主都推薦：「待人親切，狗狗顧得很好」、「看到狗狗每次來都頭也不回的跑進去，就知道來這裡有多開心」、「環境乾淨明亮，照顧狗狗也很細心」、「老闆對狗狗的照顧是發自內心的愛」、「在宜家可以享受陪伴照護、學習社會化，一舉數得」。', 1, '台北市松山區八德路四段259號', '0227485660', '2024-06-02 10:28:44', 1),
(9, '1', 'Happy愛犬屋', '位於大安捷運站附近的Happy愛犬屋，沒來過的狗狗都須先安親一次，進而讓訓練師評估狗狗狀態是否合適半開放式的居住空間，並強調每日都會去公園遛狗陪玩，依照每一隻毛孩的個性安排適當社交，更厲害是還會把基礎服從，社會化及減敏訓練融入寵物照護， 讓毛孩住宿兼學習！奴才都愛送主子到這寄宿：「台北市狗狗安親住宿最佳體驗」、「老闆娘很親切，也隨時傳圖片讓我們知道我家狗狗入住的很開心」、「孩子們能在住宿的地方開懷笑，都要感謝愛犬屋的照顧」、「毛寶貝每回入住都是一股勁地搖尾巴，我開心也放心」。', 1, '台北市大安區復興南路一段321號6樓', '0988859959', '2024-06-02 10:38:44', 1),
(10, '1', '北歐寵物旅館', '北歐寵物旅館有兩間分店，都榮獲動保處評鑑特優，主打將北歐幼兒教育精神，落實在台灣寵物照護上，不僅積極推廣狗狗游泳運動，在住宿方面則強調不關籠、 24小時保姆照顧，也會天天遛狗讓毛孩放風玩，每個體型的狗狗到貓咪都能寄宿。飼主能安心出門無負擔：「住宿還能有即時影像跟不定時回報，很棒」、「保姆對毛小孩都非常有愛心」、「很棒的環境，不管是游泳還是安親，都很乾凈」、「託付自己的寶貝給北歐真的很安心，保姆三餐報備狀況」、「來這裡寵物寄宿，超級放心」。', 1, '台北市大安區新生南路二段60-1號', '0223224358', '2024-06-02 10:48:44', 1),
(11, '2', '毛起來住寵物旅館', '「毛起來住」於2020年開始營業，住宿環境舒適、乾淨，設有獨立空調包廂，配備獨立排風系統、空氣清新系統。所有包廂均設有24小時監控系統，讓飼主可以隨時查看毛孩的情況，工作人員亦會定時拍照回報毛孩是否有進食、便便、睡覺等等情況，讓飼主安心。另外，工作人員會帶狗狗出來放風、陪玩，並沒有額外收費。除了提供寄宿之外，還有提供寵物美容服務。', 2, '新北市板橋區富山街89號', '0919330540', '2024-06-02 10:58:44', 1),
(12, '2', '維拉薇菈寵物旅館', '維拉薇菈寵物旅館主打給狗狗自由自在的住宿體驗，是一間十分溫馨的全預約制寵物旅館。為了更好地暸解每位毛孩的性格與生活習慣，第一次住宿須先安親4小時。工作人員也會定時拍照回報毛孩的情況，讓飼主出門在外能夠放心將毛孩交給保姆照顧。', 3, '新北市新莊區幸福東路115號', '0229908900', '2024-06-03 10:08:44', 1),
(13, '3', '柴町寵物旅舍', '柴町寵物旅舍提供寬敞舒適的居住環境，專為狗狗設計，讓牠們享受家一般的溫暖。我們有專業的保姆24小時照顧，每天帶狗狗們散步，確保牠們得到充分的運動和關愛。客戶評價：「旅舍環境乾淨整潔，狗狗在這裡玩得很開心」、「保姆非常細心，讓我很放心」、「有即時影像功能，隨時都能看到毛孩的狀況，安心不少」。', 4, '桃園市桃園區文中路10號', '0336013130', '2024-06-03 10:18:44', 1),
(14, '3', '花居寵物生活別館', '花居寵物生活別館融合自然景觀與現代設施，為狗狗提供一個放鬆的度假勝地。每日的戶外活動和專業的照顧服務讓狗狗們充滿活力和快樂。「這裡的環境非常優美，狗狗可以盡情玩耍」、「員工們都很有愛心，讓我非常放心」、「看到狗狗在這裡玩得那麼開心，我也很安心」、「每次來這裡，狗狗都不想回家」。', 4, '桃園市桃園區中正三街389號', '0968622815', '2024-06-03 10:28:44', 1),
(15, '3', '快樂尾巴寵物旅館', '快樂尾巴寵物旅館致力於讓每一隻狗狗都感受到快樂與愛。我們提供不關籠的自由空間和全天候的專業照顧，讓您的毛孩在這裡享受一個愉快的假期。「這裡的服務真的很棒，狗狗每天都很開心」、「有專業的保姆全天照顧，讓我很放心」、「即時影像功能讓我能隨時看到毛孩的狀況，安心不少」、「環境非常適合狗狗，真的是毛孩的天堂」。', 3, '桃園市桃園區中正路348號', '0334791894', '2024-06-03 10:38:44', 1),
(16, '3', '萊恩寵物美容住宿 Lion Pets', ' Lion Pets結合美容與住宿服務，為狗狗提供全方位的呵護。我們擁有專業的美容師和24小時的照顧團隊，確保您的狗狗在這裡得到最好的待遇。「這裡的美容服務很專業，狗狗每次都變得很漂亮」、「環境舒適，狗狗在這裡住得很開心」、「保姆照顧得非常細心，讓我很放心」、「有即時影像功能，可以隨時看到毛孩，真是太好了」。', 2, '桃園市桃園區文中三路60號', '0336086932', '2024-06-03 10:48:44', 1),
(17, '3', '汪森市寵物友善咖啡廳&寵物旅館', '汪森市寵物友善咖啡廳&寵物旅館是狗狗們的快樂樂園，我們不僅提供舒適的住宿環境，還有寵物友善的咖啡廳，讓飼主和狗狗都能享受愉快的時光。「這裡的環境很棒，狗狗和我都很喜歡」、「工作人員非常有愛心，狗狗在這裡過得很開心」、「有即時影像功能，讓我可以隨時看到狗狗的狀況，很安心」、「這裡的服務非常周到，真的很棒」。', 1, '桃園市桃園區延壽街162號', '0336012325', '2024-06-03 10:58:44', 1),
(18, '3', '捲毛叔叔寵物美容旅館', '寵物美容旅館提供頂級的美容和住宿服務，讓狗狗們在這裡享受全方位的呵護。我們的專業團隊確保每隻狗狗都得到最好的照顧和美容。「美容師非常專業，狗狗每次都變得很漂亮」、「環境乾淨舒適，狗狗在這裡住得很開心」、「保姆照顧得非常細心，讓我很放心」、「即時影像功能讓我隨時都能看到毛孩的狀況，安心不少」。', 2, '桃園市中壢區龍岡路二段71號', '0345930553', '2024-06-04 10:00:44', 1),
(19, '3', '布居寵物生活別館', '布居寵物生活別館擁有寬敞的活動空間和舒適的住宿設施，讓狗狗們在這裡度過愉快的時光。我們的專業團隊24小時照顧，確保您的毛孩得到最好的待遇。「這裡的環境非常適合狗狗們玩耍」、「員工們都很有愛心，讓我非常放心」、「看到狗狗在這裡玩得那麼開心，我也很安心」、「每次來這裡，狗狗都不想回家」。', 4, '桃園市桃園區同安街576號1F', '0988363908', '2024-06-04 10:08:44', 1),
(20, '3', '悠遊狗寵物旅館', '提供自由的活動空間和貼心的照顧服務，讓狗狗們在這裡享受快樂的假期。我們的專業團隊確保每隻狗狗都能得到充分的關愛和運動。「這裡的服務真的很棒，狗狗每天都很開心」、「有專業的保姆全天照顧，讓我很放心」、「即時影像功能讓我能隨時看到毛孩的狀況，安心不少」、「環境非常適合狗狗，真的是毛孩的天堂」。', 4, '桃園市觀音區崙坪里12鄰崙坪210-6號', '0349819368', '2024-06-04 10:18:44', 1),
(21, '3', 'DoDo寵物沙龍旅館', '旅館結合了高品質的美容和舒適的住宿服務，為狗狗提供全方位的呵護。我們擁有專業的美容師和全天候的照顧團隊，確保您的狗狗在這裡得到最好的待遇。「這裡的美容服務很專業，狗狗每次都變得很漂亮」、「環境舒適，狗狗在這裡住得很開心」、「保姆照顧得非常細心，讓我很放心」、「有即時影像功能，可以隨時看到毛孩，真是太好了」。', 3, '桃園市觀音區德一街92號', '0348348590', '2024-06-04 10:28:44', 1),
(22, '3', '陽陽寵物 YangYangPet', '提供寬敞舒適的住宿空間，配備先進的設施和專業的照顧團隊，讓您的狗狗享受最優質的住宿體驗。「旅舍環境乾淨整潔，狗狗在這裡玩得很開心」、「保姆非常細心，讓我很放心」、「有即時影像功能，隨時都能看到毛孩的狀況，安心不少」、「這裡的服務非常周到，真的很棒」。', 2, '桃園市蘆竹區後面坑路', '0332466926', '2024-06-04 10:38:44', 1),
(23, '3', '阿曼達寵物精品旅館-平鎮店', '擁有豪華的住宿設施和貼心的服務，為狗狗們提供一個舒適、安全的居所。我們的專業團隊24小時照顧，確保每隻狗狗都能得到最好的待遇。「這裡的環境非常優美，狗狗可以盡情玩耍」、「員工們都很有愛心，讓我非常放心」、「看到狗狗在這裡玩得那麼開心，我也很安心」、「每次來這裡，狗狗都不想回家」。', 1, '桃園市平鎮區上海路311號', '0343913117', '2024-06-04 10:48:23', 1),
(24, '1', '2014 pet salon hotel', '提供寬敞舒適的住宿環境，配備高級設施，讓您的狗狗享受最優質的住宿體驗。我們有專業的美容師和24小時的照顧團隊，確保您的愛犬得到最好的待遇。「這裡的美容服務非常專業，狗狗每次都變得很漂亮」、「環境舒適，狗狗在這裡住得很開心」、「保姆照顧得非常細心，讓我很放心」、「有即時影像功能，可以隨時看到毛孩，真是太好了」', 3, '桃園市中壢區慈惠三街142號', '0222675899', '2024-06-05 04:36:06', 1),
(25, '3', 'So Sweet 真貼心寵物美容旅館', '擁有溫馨的環境和先進的設施，讓狗狗們感受到家的溫暖。我們的專業保姆24小時照顧，確保您的狗狗得到充分的關愛和運動。「這裡的環境非常舒適，狗狗在這裡玩得很開心」、「工作人員非常有愛心，讓我非常放心」、「有即時影像功能，讓我能隨時看到狗狗的狀況，安心不少」、「每次來這裡，狗狗都不想回家」。', 2, '桃園市中壢區新生路36號2樓', '0968528319', '2024-06-06 14:53:29', 1),
(26, '1', '就甘心Ponpon寵物旅館', '提供寬敞的活動空間和舒適的住宿設施，讓狗狗們在這裡度過愉快的時光。我們的專業團隊全天候照顧，確保您的毛孩得到最好的待遇。「這裡的服務真的很棒，狗狗每天都很開心」、「有專業的保姆全天照顧，讓我很放心」、「即時影像功能讓我能隨時看到毛孩的狀況，安心不少」、「環境非常適合狗狗，真的是毛孩的天堂」。', 4, '台北市中山區新生北路二段60巷16號4樓', '0225682751', '2024-06-06 14:53:29', 1),
(27, '1', '吃手手寵物精品旅館The Paw Pet Hotel', '擁有豪華的住宿設施和貼心的服務，為狗狗們提供一個舒適、安全的居所。我們的專業團隊24小時照顧，確保每隻狗狗都能得到最好的待遇。「這裡的環境非常優美，狗狗可以盡情玩耍」、「員工們都很有愛心，讓我非常放心」、「看到狗狗在這裡玩得那麼開心，我也很安心」、「每次來這裡，狗狗都不想回家」。', 1, '台北市中正區濟南路二段35-1號1樓', '0223222020', '2024-06-06 14:54:41', 1),
(28, '1', '狗狗日常寵物旅館', '提供溫馨的居住環境，配備先進的設施和專業的照顧團隊，讓您的狗狗享受最優質的住宿體驗。「旅舍環境乾淨整潔，狗狗在這裡玩得很開心」、「保姆非常細心，讓我很放心」、「有即時影像功能，隨時都能看到毛孩的狀況，安心不少」、「這裡的服務非常周到，真的很棒」。', 3, '台北市文山區羅斯福路六段85號', '0982920852', '2024-06-06 14:54:41', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `room_category`
--

CREATE TABLE `room_category` (
  `id` int(6) UNSIGNED NOT NULL,
  `room_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `room_category`
--

INSERT INTO `room_category` (`id`, `room_type`) VALUES
(1, '迷你犬'),
(2, '小型犬'),
(3, '中型犬'),
(4, '大型犬');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `area_category`
--
ALTER TABLE `area_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_img`
--
ALTER TABLE `hotel_img`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `hotel_list`
--
ALTER TABLE `hotel_list`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `room_category`
--
ALTER TABLE `room_category`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `area_category`
--
ALTER TABLE `area_category`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_img`
--
ALTER TABLE `hotel_img`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hotel_list`
--
ALTER TABLE `hotel_list`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `room_category`
--
ALTER TABLE `room_category`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

  --
-- 資料表結構 `prod_brands`
--

CREATE TABLE `prod_brands` (
  `id` int(7) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `prod_brands`
--

INSERT INTO `prod_brands` (`id`, `name`) VALUES
(1, 'Farmina 法米納'),
(2, 'go!'),
(3, 'Hyperr 超躍'),
(4, 'HALO 嘿囉'),
(5, 'Nurture PRO 天然密碼'),
(6, 'now'),
(7, 'Orijen 歐睿健'),
(8, 'ZiwiPeak 巔峰'),
(9, '優格'),
(10, '本牧'),
(11, '尊爵'),
(12, '莫比'),
(13, '紐頓'),
(14, '洛特夫'),
(15, '紐崔斯'),
(16, '柏萊富'),
(17, 'K9 Natural'),
(18, 'ACANA愛肯拿'),
(19, '第一饗宴'),
(20, '法國皇家'),
(21, '自然邏輯'),
(22, '小犬威利'),
(23, '陪心寵糧'),
(24, '汪喵星球'),
(25, '沙發馬鈴薯');

-- --------------------------------------------------------

--
-- 資料表結構 `prod_categories`
--

CREATE TABLE `prod_categories` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `prod_categories`
--

INSERT INTO `prod_categories` (`id`, `name`) VALUES
(1, '飼料'),
(2, '零食'),
(3, '罐頭'),
(4, '玩具'),
(5, '保健'),
(6, '外出');

-- --------------------------------------------------------

--
-- 資料表結構 `prod_images`
--

CREATE TABLE `prod_images` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `prod_id` bigint(12) UNSIGNED DEFAULT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `prod_images`
--

INSERT INTO `prod_images` (`id`, `prod_id`, `image_name`) VALUES
(1, 1, 'product_id1.jpg'),
(2, 2, 'product_id2.jpg'),
(3, 3, 'product_id3.jpg'),
(4, 4, 'product_id4.jpg'),
(5, 5, 'product_id5.jpg'),
(6, 6, 'product_id6.jpg'),
(7, 7, 'product_id7.jpg'),
(8, 8, 'product_id8.jpg'),
(9, 9, 'product_id9.jpg'),
(10, 10, 'product_id10.jpg'),
(11, 11, 'product_id11.jpg'),
(12, 12, 'product_id12.jpg'),
(13, 13, 'product_id13.jpg'),
(14, 14, 'product_id14.jpg'),
(15, 15, 'product_id15.jpg'),
(16, 16, 'product_id16.jpg'),
(17, 17, 'product_id17.jpg'),
(18, 18, 'product_id18.jpg'),
(19, 19, 'product_id19.jpg'),
(20, 20, 'product_id20.jpg'),
(21, 21, 'product_id21.jpg'),
(22, 22, 'product_id22.jpg'),
(23, 23, 'product_id23.jpg'),
(24, 24, 'product_id24.jpg'),
(25, 25, 'product_id25.jpg'),
(26, 26, 'product_id26.jpg'),
(27, 27, 'product_id27.jpg'),
(28, 28, 'product_id28.jpg'),
(29, 29, 'product_id29.jpg'),
(30, 30, 'product_id30.jpg'),
(31, 31, 'product_id31.jpg'),
(32, 32, 'product_id32.jpg'),
(33, 33, 'product_id33.jpg'),
(34, 34, 'product_id34.jpg'),
(35, 35, 'product_id35.jpg'),
(36, 36, 'product_id36.jpg'),
(37, 37, 'product_id37.jpg'),
(38, 38, 'product_id38.jpg'),
(39, 39, 'product_id39.jpg'),
(40, 40, 'product_id40.jpg'),
(41, 41, 'product_id41.jpg'),
(42, 42, 'product_id42.jpg'),
(43, 43, 'product_id43.jpg'),
(44, 44, 'product_id44.jpg'),
(45, 45, 'product_id45.jpg'),
(46, 46, 'product_id46.jpg'),
(47, 47, 'product_id47.jpg'),
(48, 48, 'product_id48.jpg'),
(49, 49, 'product_id49.jpg'),
(50, 50, 'product_id50.jpg'),
(51, 51, 'product_id51.jpg'),
(52, 52, 'product_id52.jpg'),
(53, 53, 'product_id53.jpg'),
(54, 54, 'product_id54.jpg'),
(55, 55, 'product_id55.jpg'),
(56, 56, 'product_id56.jpg'),
(57, 57, 'product_id57.jpg'),
(58, 58, 'product_id58.jpg'),
(59, 59, 'product_id59.jpg'),
(60, 60, 'product_id60.jpg'),
(61, 61, 'product_id61.jpg'),
(62, 62, 'product_id62.jpg'),
(63, 63, 'product_id63.jpg'),
(64, 64, 'product_id64.jpg'),
(65, 65, 'product_id65.jpg'),
(66, 66, 'product_id66.jpg'),
(67, 67, 'product_id67.jpg'),
(68, 68, 'product_id68.jpg'),
(69, 69, 'product_id69.jpg'),
(70, 70, 'product_id70.jpg'),
(71, 71, 'product_id71.jpg'),
(72, 72, 'product_id72.jpg'),
(73, 73, 'product_id73.jpg'),
(74, 74, 'product_id74.jpg'),
(75, 75, 'product_id75.jpg'),
(76, 76, 'product_id76.jpg'),
(77, 77, 'product_id77.jpg'),
(78, 78, 'product_id78.jpg'),
(79, 79, 'product_id79.jpg'),
(80, 80, 'product_id80.jpg'),
(81, 81, 'product_id81.jpg'),
(82, 82, 'product_id82.jpg'),
(83, 83, 'product_id83.jpg'),
(84, 84, 'product_id84.jpg'),
(85, 85, 'product_id85.jpg'),
(86, 86, 'product_id86.jpg'),
(87, 87, 'product_id87.jpg'),
(88, 88, 'product_id88.jpg'),
(89, 89, 'product_id89.jpg'),
(90, 90, 'product_id90.jpg'),
(91, 91, 'product_id91.jpg'),
(92, 92, 'product_id92.jpg'),
(93, 93, 'product_id93.jpg'),
(94, 94, 'product_id94.jpg'),
(95, 95, 'product_id95.jpg'),
(96, 96, 'product_id96.jpg'),
(97, 97, 'product_id97.jpg'),
(98, 98, 'product_id98.jpg'),
(99, 99, 'product_id99.jpg'),
(100, 100, 'product_id100.jpg'),
(101, 101, 'product_id101.jpg'),
(102, 102, 'product_id102.jpg'),
(103, 103, 'product_id103.jpg'),
(104, 104, 'product_id104.jpg'),
(105, 105, 'product_id105.jpg'),
(106, 106, 'product_id106.jpg'),
(107, 107, 'product_id107.jpg'),
(108, 108, 'product_id108.jpg'),
(109, 109, 'product_id109.jpg'),
(110, 110, 'product_id110.jpg'),
(111, 111, 'product_id111.jpg'),
(112, 112, 'product_id112.jpg'),
(113, 113, 'product_id113.jpg'),
(114, 114, 'product_id114.jpg'),
(115, 115, 'product_id115.jpg'),
(116, 116, 'product_id116.jpg'),
(117, 117, 'product_id117.jpg'),
(118, 118, 'product_id118.jpg'),
(119, 119, 'product_id119.jpg'),
(120, 120, 'product_id120.jpg'),
(121, 121, 'product_id121.jpg'),
(122, 122, 'product_id122.jpg'),
(123, 123, 'product_id123.jpg'),
(124, 124, 'product_id124.jpg'),
(125, 125, 'product_id125.jpg'),
(126, 126, 'product_id126.jpg'),
(127, 127, 'product_id127.jpg'),
(128, 128, 'product_id128.jpg'),
(129, 129, 'product_id129.jpg'),
(130, 130, 'product_id130.jpg'),
(131, 131, 'product_id131.jpg'),
(132, 132, 'product_id132.jpg'),
(133, 133, 'product_id133.jpg'),
(134, 134, 'product_id134.jpg'),
(135, 135, 'product_id135.jpg'),
(136, 136, 'product_id136.jpg'),
(137, 137, 'product_id137.jpg'),
(138, 138, 'product_id138.jpg'),
(139, 139, 'product_id139.jpg'),
(140, 140, 'product_id140.jpg'),
(141, 141, 'product_id141.jpg'),
(142, 142, 'product_id142.jpg'),
(143, 143, 'product_id143.jpg'),
(144, 144, 'product_id144.jpg'),
(145, 145, 'product_id145.jpg'),
(146, 146, 'product_id146.jpg'),
(147, 147, 'product_id147.jpg'),
(148, 148, 'product_id148.jpg'),
(149, 149, 'product_id149.jpg'),
(150, 150, 'product_id150.jpg'),
(151, 151, 'product_id151.jpg'),
(152, 152, 'product_id152.jpg'),
(153, 153, 'product_id153.jpg'),
(154, 154, 'product_id154.jpg'),
(155, 155, 'product_id155.jpg'),
(156, 156, 'product_id156.jpg'),
(157, 157, 'product_id157.jpg'),
(158, 158, 'product_id158.jpg'),
(159, 159, 'product_id159.jpg'),
(160, 160, 'product_id160.jpg'),
(161, 161, 'product_id161.jpg'),
(162, 162, 'product_id162.jpg'),
(163, 163, 'product_id163.jpg'),
(164, 164, 'product_id164.jpg'),
(165, 165, 'product_id165.jpg'),
(166, 166, 'product_id166.jpg'),
(167, 167, 'product_id167.jpg'),
(168, 168, 'product_id168.jpg'),
(169, 169, 'product_id169.jpg'),
(170, 170, 'product_id170.jpg'),
(171, 171, 'product_id171.jpg'),
(172, 172, 'product_id172.jpg'),
(173, 173, 'product_id173.jpg'),
(174, 174, 'product_id174.jpg'),
(175, 175, 'product_id175.jpg'),
(176, 176, 'product_id176.jpg'),
(177, 177, 'product_id177.jpg'),
(178, 178, 'product_id178.jpg'),
(179, 179, 'product_id179.jpg'),
(180, 180, 'product_id180.jpg'),
(181, 181, 'product_id181.jpg'),
(182, 182, 'product_id182.jpg'),
(183, 183, 'product_id183.jpg'),
(184, 184, 'product_id184.jpg'),
(185, 185, 'product_id185.jpg'),
(186, 186, 'product_id186.jpg'),
(187, 187, 'product_id187.jpg'),
(188, 188, 'product_id188.jpg'),
(189, 189, 'product_id189.jpg'),
(190, 190, 'product_id190.jpg'),
(191, 191, 'product_id191.jpg'),
(192, 192, 'product_id192.jpg'),
(193, 193, 'product_id193.jpg'),
(194, 194, 'product_id194.jpg'),
(195, 195, 'product_id195.jpg'),
(196, 196, 'product_id196.jpg'),
(197, 197, 'product_id197.jpg'),
(198, 198, 'product_id198.jpg'),
(199, 199, 'product_id199.jpg'),
(200, 200, 'product_id200.jpg'),
(201, 201, 'product_id201.jpg'),
(202, 202, 'product_id202.jpg'),
(203, 203, 'product_id203.jpg'),
(204, 204, 'product_id204.jpg'),
(205, 205, 'product_id205.jpg'),
(206, 206, 'product_id206.jpg'),
(207, 207, 'product_id207.jpg'),
(208, 208, 'product_id208.jpg'),
(209, 209, 'product_id209.jpg'),
(210, 210, 'product_id210.jpg'),
(211, 211, 'product_id211.jpg'),
(212, 212, 'product_id212.jpg'),
(213, 213, 'product_id213.jpg'),
(214, 214, 'product_id214.jpg'),
(215, 215, 'product_id215.jpg'),
(216, 216, 'product_id216.jpg'),
(217, 217, 'product_id217.jpg'),
(218, 218, 'product_id218.jpg'),
(219, 219, 'product_id219.jpg'),
(220, 220, 'product_id220.jpg'),
(221, 221, 'product_id221.jpg'),
(222, 222, 'product_id222.jpg'),
(223, 223, 'product_id223.jpg'),
(224, 224, 'product_id224.jpg'),
(225, 225, 'product_id225.jpg'),
(226, 226, 'product_id226.jpg'),
(227, 227, 'product_id227.jpg'),
(228, 228, 'product_id228.jpg'),
(229, 229, 'product_id229.jpg'),
(230, 230, 'product_id230.jpg'),
(231, 231, 'product_id231.jpg'),
(232, 232, 'product_id232.jpg'),
(233, 233, 'product_id233.jpg'),
(234, 234, 'product_id234.jpg'),
(235, 235, 'product_id235.jpg'),
(236, 236, 'product_id236.jpg'),
(237, 237, 'product_id237.jpg'),
(238, 238, 'product_id238.jpg'),
(239, 239, 'product_id239.jpg'),
(240, 240, 'product_id240.jpg'),
(241, 241, 'product_id241.jpg'),
(242, 242, 'product_id242.jpg'),
(243, 243, 'product_id243.jpg'),
(244, 244, 'product_id244.jpg'),
(245, 245, 'product_id245.jpg'),
(246, 246, 'product_id246.jpg'),
(247, 247, 'product_id247.jpg'),
(248, 248, 'product_id248.jpg'),
(249, 249, 'product_id249.jpg'),
(250, 250, 'product_id250.jpg'),
(251, 251, 'product_id251.jpg'),
(252, 252, 'product_id252.jpg'),
(253, 253, 'product_id253.jpg'),
(254, 254, 'product_id254.jpg'),
(255, 255, 'product_id255.jpg'),
(256, 256, 'product_id256.jpg'),
(257, 257, 'product_id257.jpg'),
(258, 258, 'product_id258.jpg'),
(259, 259, 'product_id259.jpg'),
(260, 260, 'product_id260.jpg'),
(261, 261, 'product_id261.jpg'),
(262, 262, 'product_id262.jpg'),
(263, 263, 'product_id263.jpg'),
(264, 264, 'product_id264.jpg'),
(265, 265, 'product_id265.jpg'),
(266, 266, 'product_id266.jpg'),
(267, 267, 'product_id267.jpg'),
(268, 268, 'product_id268.jpg'),
(269, 269, 'product_id269.jpg'),
(270, 270, 'product_id270.jpg'),
(271, 271, 'product_id271.jpg'),
(272, 272, 'product_id272.jpg'),
(273, 273, 'product_id273.jpg'),
(274, 274, 'product_id274.jpg'),
(275, 275, 'product_id275.jpg'),
(276, 276, 'product_id276.jpg'),
(277, 277, 'product_id277.jpg'),
(278, 278, 'product_id278.jpg'),
(279, 279, 'product_id279.jpg'),
(280, 280, 'product_id280.jpg'),
(281, 281, 'product_id281.jpg'),
(282, 282, 'product_id282.jpg'),
(283, 283, 'product_id283.jpg'),
(284, 284, 'product_id284.jpg'),
(285, 285, 'product_id285.jpg'),
(286, 286, 'product_id286.jpg'),
(287, 287, 'product_id287.jpg'),
(288, 288, 'product_id288.jpg'),
(289, 289, 'product_id289.jpg'),
(290, 290, 'product_id290.jpg'),
(291, 291, 'product_id291.jpg'),
(292, 292, 'product_id292.jpg'),
(293, 293, 'product_id293.jpg'),
(294, 294, 'product_id294.jpg'),
(295, 295, 'product_id295.jpg'),
(296, 296, 'product_id296.jpg'),
(297, 297, 'product_id297.jpg'),
(298, 298, 'product_id298.jpg'),
(299, 299, 'product_id299.jpg'),
(300, 300, 'product_id300.jpg'),
(301, 301, 'product_id301.jpg'),
(302, 302, 'product_id302.jpg'),
(303, 303, 'product_id303.jpg'),
(304, 304, 'product_id304.jpg'),
(305, 305, 'product_id305.jpg'),
(306, 306, 'product_id306.jpg'),
(307, 307, 'product_id307.jpg'),
(308, 308, 'product_id308.jpg'),
(309, 309, 'product_id309.jpg'),
(310, 310, 'product_id310.jpg'),
(311, 311, 'product_id311.jpg'),
(312, 312, 'product_id312.jpg'),
(313, 313, 'product_id313.jpg'),
(314, 314, 'product_id314.jpg'),
(315, 315, 'product_id315.jpg'),
(316, 316, 'product_id316.jpg'),
(317, 317, 'product_id317.jpg'),
(318, 318, 'product_id318.jpg'),
(319, 319, 'product_id319.jpg'),
(320, 320, 'product_id320.jpg'),
(321, 321, 'product_id321.jpg'),
(322, 322, 'product_id322.jpg'),
(323, 323, 'product_id323.jpg'),
(324, 324, 'product_id324.jpg'),
(325, 325, 'product_id325.jpg'),
(326, 326, 'product_id326.jpg'),
(327, 327, 'product_id327.jpg'),
(328, 328, 'product_id328.jpg'),
(329, 329, 'product_id329.jpg'),
(330, 330, 'product_id330.jpg'),
(331, 331, 'product_id331.jpg'),
(332, 332, 'product_id332.jpg'),
(333, 333, 'product_id333.jpg'),
(334, 334, 'product_id334.jpg'),
(335, 335, 'product_id335.jpg'),
(336, 336, 'product_id336.jpg'),
(337, 337, 'product_id337.jpg'),
(338, 338, 'product_id338.jpg'),
(339, 339, 'product_id339.jpg'),
(340, 340, 'product_id340.jpg'),
(341, 341, 'product_id341.jpg'),
(347, 348, 'product_id348a.png'),
(350, 350, 'product_id350a.png'),
(372, 354, 'product_id354a.png'),
(373, 354, 'product_id354b.png'),
(374, 354, 'product_id354c.png'),
(376, 347, 'product_id347a.png');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` int(6) UNSIGNED NOT NULL,
  `brand_id` int(7) UNSIGNED DEFAULT NULL,
  `price` int(7) UNSIGNED NOT NULL,
  `on_shelves_time` datetime NOT NULL,
  `stock` int(6) UNSIGNED NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `brand_id`, `price`, `on_shelves_time`, `stock`, `valid`) VALUES
(1, 'Farmina 法米納VD-4 Vet Life 犬用腸胃道配方', '針對腸胃問題設計，幫助舒緩犬隻消化不良、腹瀉等腸胃不適。', 1, 1, 1190, '2024-03-02 00:00:00', 44, 0),
(2, 'Farmina 法米納VD-5 Vet Life 犬用肝臟配方', '特別針對肝臟疾病的犬隻設計，促進肝功能健康。', 1, 1, 1190, '2024-03-22 00:00:00', 74, 0),
(3, 'Farmina 法米納VD-6 Vet Life 犬用泌尿道磷酸銨鎂結石配方', '預防和管理磷酸銨鎂結石，維持泌尿系統健康。', 1, 1, 1190, '2024-02-19 00:00:00', 76, 0),
(4, 'Farmina 法米納VD-8 Vet Life 犬用草酸鈣結石配方', '針對草酸鈣結石問題設計，幫助防止結石形成。', 1, 1, 1190, '2024-02-19 00:00:00', 52, 0),
(5, 'Farmina 法米納VD-9 Vet Life 犬用腎臟配方', '支持腎臟功能，適合有腎臟疾病的犬隻。', 1, 1, 1190, '2024-01-25 00:00:00', 84, 0),
(6, 'Farmina 法米納VD-10 Vet Life 犬用心血管配方', '促進心血管健康，幫助維持犬隻心臟功能。', 1, 1, 1190, '2024-02-01 00:00:00', 5, 0),
(7, 'Farmina 法米納VD-11 Vet Life 犬用體重控制配方', '幫助犬隻控制體重，適合容易肥胖的犬隻。', 1, 1, 1190, '2024-01-05 00:00:00', 55, 0),
(8, 'Farmina 法米納VD-12 Vet Life 犬用血糖管理配方', '幫助管理犬隻血糖水平，適合有糖尿病風險的犬隻。', 1, 1, 1190, '2024-01-23 00:00:00', 80, 0),
(9, 'Farmina 法米納VD-13 Vet Life 犬用極低敏(水解蛋白)配方', '針對過敏犬隻設計，使用水解蛋白降低過敏反應。', 1, 1, 1680, '2024-03-02 00:00:00', 81, 0),
(10, 'Farmina 法米納VD-14 Vet Life 犬用低敏配方(魚肉+地瓜)', '低敏配方，使用魚肉和地瓜，適合敏感體質犬隻。', 1, 1, 1290, '2024-02-09 00:00:00', 6, 0),
(11, 'Farmina 法米納VD-15 Vet Life 犬用低敏配方(雞蛋+白米)', '低敏配方，使用雞蛋和白米，減少過敏風險。', 1, 1, 1290, '2024-03-18 00:00:00', 25, 0),
(12, '洛特夫犬用 紐西蘭風乾主食糧 - 牛肉', '選用來自紐西蘭的頂級草飼牛肉，通過先進的風乾技術保留肉類的天然風味和營養成分。', 1, 14, 1825, '2024-04-30 00:00:00', 34, 0),
(13, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 牛肉', '高肉含量，使用新鮮牛肉製作，適合各類犬隻。', 1, 8, 1990, '2024-01-29 00:00:00', 81, 0),
(14, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 羊肚羊肉', '含有豐富的羊肉和羊肚，提供全面營養。', 1, 8, 1990, '2024-01-31 00:00:00', 85, 0),
(15, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 鯖魚羊肉', '結合鯖魚和羊肉，提供優質蛋白和Omega-3脂肪酸。', 1, 8, 2200, '2024-04-11 00:00:00', 38, 0),
(16, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 鹿肉', '使用優質鹿肉，適合敏感體質犬隻。', 1, 8, 3190, '2024-02-28 00:00:00', 87, 0),
(17, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 羊肉', '高含量羊肉配方，適合各階段犬隻。', 1, 8, 1990, '2024-05-25 00:00:00', 98, 0),
(18, 'ZiwiPeak 巔峰96% 鮮肉犬糧 - 放牧雞肉', '使用自由放養雞肉，提供高品質營養。', 1, 8, 1990, '2024-01-19 00:00:00', 14, 0),
(19, '優格幼犬 經典系列乾糧 - 羊肉 (聰明成長配方)', '針對幼犬設計，含有豐富的羊肉，促進健康成長。', 1, 9, 1226, '2024-02-06 00:00:00', 50, 0),
(20, '優格成犬 經典系列乾糧 - 雞肉 (高適口性配方)', '使用優質雞肉，適合成犬食用，提升適口性。', 1, 9, 1226, '2024-03-18 00:00:00', 18, 0),
(21, '優格成犬 經典系列乾糧 - 小顆粒羊肉 (毛髮柔亮配方)', '小顆粒設計，富含羊肉，促進毛髮健康。', 1, 9, 1226, '2024-02-13 00:00:00', 7, 0),
(22, '優格成犬 經典系列乾糧 - 大顆粒羊肉 (骨關節強化配方)', '大顆粒設計，富含羊肉，有助於骨關節健康。', 1, 9, 1226, '2024-05-20 00:00:00', 25, 0),
(23, '優格高齡犬 經典系列乾糧 - 鮭魚 (熟齡養生配方)', '含有豐富的鮭魚，適合高齡犬隻，促進健康老齡化。', 1, 9, 1511, '2024-04-16 00:00:00', 80, 0),
(24, '優格全齡犬 零穀系列乾糧 - 5種魚 (晶亮護毛配方)', '使用五種魚肉製成，適合所有年齡段犬隻，促進毛髮健康。', 1, 9, 1612, '2024-04-03 00:00:00', 28, 0),
(25, '優格室內成犬 零穀系列乾糧 - 小顆粒雞肉 (體重管理配方)', '針對室內成犬設計，小顆粒雞肉配方，有助於體重管理。', 1, 9, 1612, '2024-03-13 00:00:00', 5, 0),
(26, '優格成犬 親親食譜乾糧 - 腸胃敏感低脂配方', '低脂肪設計，幫助腸胃敏感的犬隻維持健康。', 1, 9, 1720, '2024-05-08 00:00:00', 21, 0),
(27, '優格高齡犬 經典系列乾糧 - 羊肉 (高纖低脂配方)', '高纖維、低脂肪，適合高齡犬隻，有助於消化健康。', 1, 9, 1226, '2024-02-10 00:00:00', 66, 0),
(28, '優格幼犬 經典系列乾糧 - 鮭魚 (敏感膚質配方)', '含有豐富的鮭魚，適合敏感皮膚的幼犬。', 1, 9, 1511, '2024-02-06 00:00:00', 67, 0),
(29, '優格全齡犬 零穀系列乾糧 - 羊肉+鮭魚 (敏感配方)', '使用羊肉和鮭魚，適合敏感體質的全齡犬。', 1, 9, 1612, '2024-03-09 00:00:00', 91, 0),
(30, '法國皇家SHN 健康體型乾糧 – MP 中型幼犬', '專為中型幼犬設計，提供全面營養，促進健康成長。', 1, 20, 1050, '2024-02-21 00:00:00', 90, 0),
(31, '法國皇家SHN 健康體型乾糧 – MXP 大型幼犬', '針對大型幼犬設計，幫助支持健康骨骼和肌肉發展。', 1, 20, 1050, '2024-02-25 00:00:00', 12, 0),
(32, '法國皇家SHN 健康體型乾糧 – MNA 小型成犬', '適合小型成犬食用，提供均衡營養。', 1, 20, 660, '2024-01-02 00:00:00', 67, 0),
(33, '法國皇家SHN 健康體型乾糧 – MNINA 小型室內成犬', '特別針對室內小型成犬設計，維持理想體型和健康。', 1, 20, 1050, '2024-01-07 00:00:00', 33, 0),
(34, '法國皇家SHN 健康體型乾糧 – MNA+8 小型熟齡犬8+歲', '適合8歲以上的小型熟齡犬，支持健康老化。', 1, 20, 660, '2024-01-01 00:00:00', 72, 0),
(35, '法國皇家SHN 健康體型乾糧 – MA 中型成犬', '為中型成犬提供完整營養，維持健康體態。', 1, 20, 1050, '2024-04-30 00:00:00', 12, 0),
(36, '法國皇家SHN 健康體型乾糧 – M+7 中型熟齡犬7+歲', '適合7歲以上的中型熟齡犬，促進健康老化。', 1, 20, 1050, '2024-05-03 00:00:00', 69, 0),
(37, '法國皇家SHN 健康體型乾糧 – MXA 大型成犬', '為大型成犬設計，提供全面營養支持。', 1, 20, 1050, '2024-01-16 00:00:00', 65, 0),
(38, '法國皇家CCN 敏感保健乾糧 - UMN 泌尿保健 小型成犬', '幫助小型成犬維持泌尿系統健康。', 1, 20, 1112, '2024-03-15 00:00:00', 61, 0),
(39, '法國皇家CCN 敏感保健乾糧 - DGMN 腸胃保健 小型成犬', '針對腸胃敏感的小型成犬，提供腸胃健康支持。', 1, 20, 1112, '2024-04-20 00:00:00', 75, 0),
(40, '法國皇家CCN 敏感保健乾糧 - LWMN 體重控制 小型成犬', '幫助小型成犬控制體重，維持健康體態。', 1, 20, 1112, '2024-05-17 00:00:00', 26, 0),
(41, '法國皇家CCN 敏感保健乾糧 - DMMN 皮膚保健 小型成犬', '特別針對皮膚敏感的小型成犬，促進皮膚健康。', 1, 20, 1112, '2024-04-02 00:00:00', 36, 0),
(42, '法國皇家CCN 敏感保健乾糧 - DMMX 皮膚保健 大型成犬', '為大型成犬設計，提供皮膚健康支持。', 1, 20, 893, '2024-03-05 00:00:00', 43, 0),
(43, '法國皇家CCN 敏感保健乾糧 - DMM 皮膚保健 中型成犬', '中型成犬皮膚保健配方，幫助維持健康皮膚。', 1, 20, 893, '2024-04-17 00:00:00', 27, 0),
(44, '自然邏輯犬用卓越無穀無豆天然糧 ', '無穀無豆配方，提供多種口味，適合各類犬隻。', 1, 21, 1280, '2024-01-26 00:00:00', 92, 0),
(45, 'Orijen 歐睿健鮮雞小型幼犬 無榖配方', '使用新鮮雞肉，針對小型幼犬設計，提供高蛋白和全面營養。', 1, 7, 2499, '2024-02-15 00:00:00', 47, 0),
(46, 'Orijen 歐睿健海洋魚小型犬 無榖配方', '專為小型犬設計的無榖配方，主要成分是海洋魚，提供豐富的蛋白質和Omega-3脂肪酸，支持健康皮膚和光澤毛髮。', 1, 7, 2499, '2024-02-10 00:00:00', 51, 0),
(47, 'Hyperr 超躍98%冷凍乾燥生食餐 - 犬用 ', '含有98%高品質肉類的冷凍乾燥生食餐，有多種口味，提供全面營養。', 1, 3, 1430, '2024-04-11 00:00:00', 66, 0),
(48, '紐崔斯SUBZERO 黑鑽頂級無穀凍乾糧 - 小型犬 火雞肉X雞肉X鮭魚', '專為小型犬設計的無穀凍乾糧，混合了火雞肉、雞肉和鮭魚，提供均衡營養。', 1, 15, 2556, '2024-01-17 00:00:00', 40, 0),
(49, '紐崔斯SUBZERO 黑鑽頂級無穀凍乾糧 - 全齡犬 火雞肉X雞肉X鮭魚', '適合全齡犬的無穀凍乾糧，含火雞肉、雞肉和鮭魚，提供高品質蛋白質。', 1, 15, 474, '2024-01-13 00:00:00', 77, 0),
(50, '紐崔斯SUBZERO 黑鑽頂級無穀凍乾糧 - 全齡犬 七種海洋魚', '適合全齡犬的無穀凍乾糧，主要成分為七種海洋魚，富含Omega-3脂肪酸，支持心臟和關節健康。', 1, 15, 2971, '2024-01-24 00:00:00', 61, 0),
(51, '紐崔斯無穀養生犬用乾糧 – 小型犬 火雞肉X雞肉X鯡魚', '無穀配方的犬用乾糧，混合火雞肉、雞肉和鯡魚，專為小型犬設計，促進健康的消化系統。', 1, 15, 1967, '2024-05-14 00:00:00', 59, 0),
(52, '紐崔斯無穀養生犬用乾糧 – 全齡犬 火雞肉X雞肉X鯡魚', '適合全齡犬的無穀配方乾糧，含火雞肉、雞肉和鯡魚，提供均衡營養。', 1, 15, 3926, '2024-02-19 00:00:00', 89, 0),
(53, '紐崔斯無穀養生犬用乾糧 – 全齡犬 六種魚', '無穀配方的全齡犬乾糧，含有六種魚，提供豐富的Omega-3和高品質蛋白質。', 1, 15, 4316, '2024-05-22 00:00:00', 19, 0),
(54, '紐崔斯INFUSION 天然犬用糧 - 幼犬 雞肉', '天然雞肉配方，專為幼犬設計，提供全面均衡的營養，支持健康成長。', 1, 15, 963, '2024-02-14 00:00:00', 57, 0),
(55, '紐崔斯INFUSION 天然犬用糧 - 小型成犬 雞肉', '專為小型成犬設計的天然雞肉配方，支持日常活動和健康。', 1, 15, 1785, '2024-04-19 00:00:00', 4, 0),
(56, '紐崔斯INFUSION 天然犬用糧 - 成犬 雞肉', '成犬專用的天然雞肉配方，提供均衡的營養，維持健康的體態。', 1, 15, 3154, '2024-03-04 00:00:00', 7, 0),
(57, '紐崔斯INFUSION 天然犬用糧 - 成犬 牛肉X豬肉', '含牛肉和豬肉的成犬配方，提供豐富蛋白質和多種營養素，促進健康。', 1, 15, 1785, '2024-03-03 00:00:00', 19, 0),
(58, '紐崔斯田園犬用糧 – 幼母犬 雞肉', '專為幼母犬設計的雞肉配方，支持健康成長和發育。', 1, 15, 2615, '2024-04-26 00:00:00', 38, 0),
(59, '紐崔斯田園犬用糧 – 小型成犬 雞肉', '適合小型成犬的雞肉配方，提供均衡營養和健康支持。', 1, 15, 1287, '2024-01-22 00:00:00', 97, 0),
(60, '紐崔斯田園犬用糧 – 成犬 雞肉', '成犬專用的雞肉配方，提供全面營養，支持日常健康。', 1, 15, 2615, '2024-04-30 00:00:00', 66, 0),
(61, '紐崔斯CARE+ 頂級無穀犬用處方糧 – 口腔護理', '專為狗狗口腔健康而設計的高品質無穀配方糧。', 1, 15, 4607, '2024-01-18 00:00:00', 51, 0),
(62, '紐崔斯CARE+ 頂級無穀犬用處方糧 – 皮膚腸胃', '針對皮膚和腸胃敏感問題設計的高品質無穀配方糧。', 1, 15, 5976, '2024-02-28 00:00:00', 86, 0),
(63, '紐崔斯CARE+ 頂級無穀犬用處方糧 – 體重控制', '專為控制狗狗體重而設計的高品質無穀配方糧。', 1, 15, 4607, '2024-05-14 00:00:00', 33, 0),
(64, '紐崔斯CARE+ 頂級無穀犬用處方糧 – 情緒安穩', '致力於幫助維持狗狗情緒穩定的高品質無穀配方糧。', 1, 15, 4607, '2024-05-16 00:00:00', 27, 0),
(65, 'Hyperr 超躍無穀鮮肉糧佐凍乾 - 犬用 ', '以新鮮無穀鮮肉為基礎，結合凍乾技術，提供多種口味選擇的高質量狗糧。', 1, 3, 890, '2024-03-16 00:00:00', 94, 0),
(66, '尊爵機能天然糧 - 小型幼犬', '為小型幼犬提供的功能性天然糧，幫助其健康成長。', 1, 11, 680, '2024-01-12 00:00:00', 67, 0),
(67, '尊爵機能天然糧 - 小型成犬', '專為小型成犬設計的功能性天然糧，滿足其營養需求。', 1, 11, 680, '2024-04-03 00:00:00', 90, 0),
(68, '尊爵機能天然糧 - 成犬', '適合成犬的功能性天然糧，幫助維持其整體健康。', 1, 11, 680, '2024-05-02 00:00:00', 82, 0),
(69, '尊爵機能天然糧 - 特級熟齡犬', '針對特級熟齡犬設計的功能性天然糧，提供全面的營養支持。', 1, 11, 680, '2024-01-25 00:00:00', 10, 0),
(70, 'HALO 嘿囉幼犬 雞肉', '專為幼犬設計的無穀配方糧，含有豐富的雞肉蛋白質。', 1, 4, 2300, '2024-05-26 00:00:00', 81, 0),
(71, 'HALO 嘿囉成犬無穀 雞肉', '成犬專用的無穀配方糧，以高品質雞肉為主要成分。', 1, 4, 2300, '2024-01-23 00:00:00', 9, 0),
(72, 'HALO 嘿囉 成犬無穀 低脂火雞肉', '低脂肪的無穀配方糧，以火雞肉為主要蛋白質來源。', 1, 4, 2300, '2024-02-27 00:00:00', 81, 0),
(73, 'HALO 嘿囉成犬無穀 低敏舒膚 (海藻修復配方)', '專為敏感皮膚狗狗設計的無穀配方糧，添加了海藻以幫助皮膚修復。', 1, 4, 2300, '2024-01-29 00:00:00', 39, 0),
(74, 'HALO 嘿囉成犬無穀 低敏舒膚 (新鮮碗豆+鷹嘴豆)', '以新鮮碗豆和鷹嘴豆為特色成分，幫助緩解敏感皮膚問題。', 1, 4, 2300, '2024-04-08 00:00:00', 78, 0),
(75, 'HALO 嘿囉小型成犬無穀 雞肉', '專為小型成犬設計的無穀配方糧，以雞肉為主要蛋白質來源。', 1, 4, 2300, '2024-04-11 00:00:00', 81, 0),
(76, 'HALO 嘿囉熟齡犬無穀 雞肉', '專為老年犬設計的無穀配方糧，以雞肉為主要成分。', 1, 4, 2300, '2024-02-20 00:00:00', 29, 0),
(77, '本牧紐西蘭無穀成犬糧 - 太平洋鯖魚', '採用來自紐西蘭的太平洋鯖魚，提供高質量的蛋白質和營養。', 1, 10, 2430, '2024-05-05 00:00:00', 87, 0),
(78, '本牧紐西蘭無穀成犬糧 - 放牧草飼牛', '以紐西蘭放牧草飼養的牛肉為主要成分，提供均衡的營養。', 1, 10, 2430, '2024-05-09 00:00:00', 40, 0),
(79, '本牧紐西蘭無穀成犬糧 - 放牧草飼羊', '來自紐西蘭的放牧草飼養的羊肉為主要成分，提供豐富的蛋白質和營養。', 1, 10, 2430, '2024-03-18 00:00:00', 87, 0),
(80, '柏萊富特調配方糧 - 雞肉 X 糙米 (幼犬成長)', '結合優質雞肉和營養豐富的糙米，專為幼犬提供全面均衡的營養，促進健康成長。', 1, 16, 842, '2024-04-03 00:00:00', 87, 0),
(81, '柏萊富特調配方糧 - 雞肉 X 糙米 (成犬活力)', '含有高品質的雞肉和營養豐富的糙米，幫助成犬維持健康的活力和良好的體態。', 1, 16, 842, '2024-01-29 00:00:00', 3, 0),
(82, '柏萊富特調配方糧 - 雞肉 X 糙米 (低卡保健犬)', '特別設計為需要低卡路里飲食的狗狗，含有高品質的雞肉和營養均衡的糙米。', 1, 16, 842, '2024-01-08 00:00:00', 27, 0),
(83, '柏萊富特調配方糧 - 羊肉 X 雞肉 X 糙米 (全齡犬)', '獨特配方結合羊肉、雞肉和營養豐富的糙米，適合全齡期的狗狗食用，提供全方位的營養支持。', 1, 16, 842, '2024-05-06 00:00:00', 36, 0),
(84, '柏萊富功能性全齡犬配方糧 - 羊肉 X 糙米 (護膚亮毛)', '專為皮膚健康和毛髮亮澤而設計，含有羊肉和營養豐富的糙米，促進狗狗皮毛的健康。', 1, 16, 978, '2024-04-19 00:00:00', 51, 0),
(85, '柏萊富功能性全齡犬配方糧 - 鮭魚 X 糙米 (腸胃保健)', '以高品質的鮭魚和易消化的糙米為基礎，有助於維護狗狗的腸胃健康。', 1, 16, 978, '2024-02-17 00:00:00', 92, 0),
(86, '柏萊富功能性全齡犬配方糧 - 鯰魚 X 珍珠麥 (滋補養生)', '結合鯰魚和營養豐富的珍珠麥，為狗狗提供全面的營養支持，促進健康的生活方式。', 1, 16, 978, '2024-01-14 00:00:00', 4, 0),
(87, '柏萊富無穀全齡犬配方糧 - 雞肉 X 豌豆 (低敏純淨)', '採用雞肉和易消化的豌豆，適合對穀物敏感的狗狗，提供純淨的營養支持。', 1, 16, 1054, '2024-05-21 00:00:00', 37, 0),
(88, '柏萊富無穀全齡犬配方糧 - 鮭魚 X 豌豆 (低敏挑嘴)', '以高品質的鮭魚和易消化的豌豆製成，適合挑嘴狗狗，提供全面的營養支持。', 1, 16, 1054, '2024-05-28 00:00:00', 99, 0),
(89, '柏萊富極鮮無穀全齡配方糧 - 鯡魚 X 火雞肉 X 扁豆 (小型成犬均衡)', '特別為小型成犬設計，含有鯡魚、火雞肉和營養豐富的扁豆，提供均衡的營養支持。', 1, 16, 1122, '2024-03-16 00:00:00', 98, 0),
(90, '柏萊富極鮮無穀全齡配方糧 - 白鮭魚 X 豌豆 (低敏呵護犬)', '以高品質的白鮭魚和易消化的豌豆為基礎，適合對穀物敏感的狗狗，呵護其健康。', 1, 16, 1122, '2024-04-27 00:00:00', 15, 0),
(91, '柏萊富極鮮無穀全齡配方糧 - 火雞肉 X 扁豆 (活力犬)', '含有火雞肉和營養豐富的扁豆，適合活力充沛的狗狗，提供所需的能量和營養支持。', 1, 16, 1122, '2024-01-25 00:00:00', 40, 0),
(92, '汪喵星球狗狗冷凍乾燥生食餐 ', '多種口味可供選擇的狗狗冷凍乾燥生食餐，新鮮食材保留最大的營養價值。', 1, 24, 1480, '2024-04-06 00:00:00', 51, 0),
(93, '汪喵星球即期品專區 - 狗狗冷凍乾燥生食餐', '提供方便又營養豐富的冷凍乾燥生食餐，適合狗狗即食需求。', 1, 24, 750, '2024-05-16 00:00:00', 83, 0),
(94, '小犬威利主食凍乾熟食餐 - 糙米無麩 ', '含有健康糙米和無麩質配方的凍乾熟食餐，適合小型犬品種。', 1, 22, 580, '2024-03-15 00:00:00', 99, 0),
(95, 'Nurture PRO 天然密碼低敏系列犬用乾糧 – 鮭魚', '針對容易敏感的狗狗而設計，含有鮭魚或羊肉的低敏配方。', 1, 5, 990, '2024-03-26 00:00:00', 17, 0),
(96, 'Nurture PRO 天然密碼低敏系列犬用乾糧 – 羊肉', '採用高品質羊肉作為主要蛋白來源，配方中不含常見的過敏原，同時提供完整的營養支持，促進狗狗的健康和幸福生活。', 1, 5, 990, '2024-04-05 00:00:00', 39, 0),
(97, 'K9 Natural凍乾生食犬用飼料 ', '純天然的凍乾生食飼料，提供最接近自然食物的營養。', 1, 17, 7890, '2024-03-10 00:00:00', 59, 0),
(98, 'Farmina 法米納GD-1 幼犬/懷孕犬 雞肉石榴 天然頂級無穀系列', '專為幼犬和懷孕犬設計，含有高品質雞肉和石榴的無穀配方。', 1, 1, 1400, '2024-05-14 00:00:00', 0, 0),
(99, 'ACANA愛肯拿室內犬無穀配方 放養雞肉+新鮮蔬果', '針對不同生活階段和體型的狗狗而設計的無穀配方。', 1, 18, 950, '2024-03-07 00:00:00', 69, 0),
(100, 'ACANA愛肯拿無穀區域頂級食材主食糧 - 放養雞肉 X 火雞肉', '含有高品質鮮雞的無穀配方，適合幼犬和成犬。', 1, 18, 1050, '2024-04-16 00:00:00', 94, 0),
(101, 'ACANA愛肯拿老犬無穀配方 放養雞肉+新鮮蔬果', '專為老年狗狗設計的無穀配方，含有放養雞肉和新鮮蔬果，提供完整營養支持。', 1, 18, 950, '2024-05-12 00:00:00', 35, 0),
(102, 'ACANA愛肯拿小型成犬無穀配方 放養雞肉+新鮮蔬果', '適合小型成犬的無穀配方，含有放養雞肉和新鮮蔬果，促進健康成長。', 1, 18, 950, '2024-02-16 00:00:00', 75, 0),
(103, 'Orijen 歐睿健鮮雞幼犬 無穀配方', '專為幼犬設計的無穀配方，以新鮮的雞肉為主要成分，提供豐富的蛋白質和營養。', 1, 7, 1250, '2024-02-03 00:00:00', 3, 0),
(104, 'go!火雞 羊肉 鮭魚 鴨肉 低致敏 全犬 無穀狗糧', '低致敏的無穀狗糧，含有多種蛋白質來源，適合所有狗狗。', 1, 2, 1500, '2024-01-27 00:00:00', 37, 0),
(105, 'Orijen 歐睿健鮮雞成犬 六種鮮魚成犬 鮮雞小型犬 無穀配方', '適合成犬的無穀配方，含有新鮮的雞肉，提供全面的營養支持。', 1, 7, 2490, '2024-02-09 00:00:00', 33, 0),
(106, '紐頓S2 幼犬 均衡健康系列 雞肉+燕麥', '專為幼犬設計的均衡健康配方，含有雞肉和燕麥，促進健康成長。', 1, 13, 899, '2024-02-13 00:00:00', 93, 0),
(107, '紐頓S6 S7 S8 S9 S10 均衡健康系列', '均衡健康系列，提供多種不同配方，滿足不同狗狗的需求。', 1, 13, 1999, '2024-05-01 00:00:00', 32, 0),
(108, '紐頓I18 I20 專業理想系列', '專業理想系列，提供專業級別的營養支持。', 1, 13, 899, '2024-03-28 00:00:00', 47, 0),
(109, '紐頓T23 T25 T26 無穀全能系列 火雞+雞肉 鮭魚+鱒魚 羊肉', '適合所有年齡和品種的狗狗。這些配方含有高品質的蛋白質來源，如火雞、雞肉、鮭魚、鱒魚和羊肉，有助於維持狗狗的肌肉健康和全面營養。', 1, 13, 1099, '2024-04-23 00:00:00', 27, 0),
(110, '紐頓T27 T28 T29 迷你犬 無穀全能系列 火雞+雞肉 鮭魚+鱒魚 羊肉', '專為迷你犬而設計的狗糧配方。提供全面均衡的營養，有助於迷你犬維持健康的肌肉和活力。', 1, 13, 2099, '2024-05-06 00:00:00', 68, 0),
(111, 'now鮮肉 紅肉 小型成犬 無穀天然糧', '無穀天然糧，含有新鮮的鮮肉和紅肉，適合小型成犬和成犬。', 1, 6, 1590, '2024-02-06 00:00:00', 80, 0),
(112, 'now鮮肉 紅肉 成犬 無穀天然糧', '這款成犬無穀天然糧含有新鮮的紅肉，提供高品質的蛋白質，幫助成犬維持健康活力。', 1, 6, 1210, '2024-03-19 00:00:00', 18, 0),
(113, 'Farmina 法米納LD-5 老犬 雞肉石榴 天然低穀系列', 'LD-5是專為老犬設計的天然低穀系列，含有雞肉和石榴等成分，營養均衡，有助於老犬的健康管理。', 1, 1, 1210, '2024-03-17 00:00:00', 41, 0),
(114, 'Farmina 法米納GD-2 GD-3 GD-5 GD-6 GD-7 GD-9 天然頂級無穀系列', '這個系列提供多種不同口味的無穀狗糧，含有頂級的成分，有助於狗狗全面的營養需求。', 1, 1, 1400, '2024-01-17 00:00:00', 85, 0),
(115, 'Farmina 法米納LD-6 LD-8 LD-9 天然低穀系列', 'LD-6、LD-8和LD-9是天然低穀系列，適合各年齡段的狗狗，含有優質的蛋白質和其他營養成分。', 1, 1, 1130, '2024-05-02 00:00:00', 36, 0),
(116, 'Farmina 法米納LD-2 LD-3 雞肉石榴 羊肉藍莓 天然低穀系列', '這個低穀系列結合了雞肉、石榴、羊肉和藍莓等成分，提供全面均衡的營養，適合對穀物過敏的狗狗食用。', 1, 1, 1130, '2024-02-13 00:00:00', 89, 0),
(117, 'Farmina 法米納LD-1 幼犬/懷孕犬 雞肉石榴 天然低穀系列', 'LD-1是專為幼犬和懷孕犬設計的天然低穀系列，含有雞肉和石榴等成分，有助於幼犬和懷孕犬的健康發育和生理需要。', 1, 1, 1130, '2024-04-02 00:00:00', 77, 0),
(118, '陪心寵糧全齡犬無穀低敏糧 ', '這款狗糧適合所有年齡段的狗狗食用，無穀物成分，低敏配方，多種口味可供選擇。', 1, 23, 2390, '2024-05-28 00:00:00', 23, 0),
(119, '小犬威利主食凍乾熟食餐 - 馬鈴薯無穀 ', '這種凍乾熟食餐適合小型犬食用，不含馬鈴薯等穀物成分，方便快捷，營養豐富。', 1, 22, 680, '2024-05-20 00:00:00', 60, 0),
(120, 'ACANA愛肯拿潔牙成犬無穀配方 放養雞肉+新鮮蔬果', '這種無穀配方含有放養雞肉和新鮮蔬果，有助於潔牙，保持成犬口腔健康。', 1, 18, 950, '2024-01-08 00:00:00', 78, 0),
(121, 'ACANA愛肯拿挑嘴幼犬無穀配方 放養雞肉+新鮮蔬果', '專為挑嘴幼犬設計的無穀配方，含有放養雞肉和新鮮蔬果，美味可口，有助於幼犬健康成長。', 1, 18, 950, '2024-03-15 00:00:00', 22, 0),
(122, 'ACANA愛肯拿單一蛋白低敏無穀配方 美膚羊肉+蘋果 美膚鴨肉+梨子', '這款無穀配方使用單一蛋白質來源，如美膚羊肉和蘋果、美膚鴨肉和梨子，適合對其他蛋白質過敏的狗狗食用。', 1, 18, 1100, '2024-05-03 00:00:00', 23, 0),
(123, '法國皇家SHN 健康體型乾糧 – MNP 小型幼犬', '這是專為小型幼犬設計的健康體型乾糧，含有全面均衡的營養，有助於幼犬健康成長。', 1, 20, 1264, '2024-03-26 00:00:00', 16, 0),
(124, '汪喵星球天然低敏凍乾犬用主食餐 ', '提供天然低敏的凍乾狗糧，適合對食物敏感的狗狗。', 1, 24, 1480, '2024-02-18 00:00:00', 34, 0),
(125, '沙發馬鈴薯Lazy 懶蟲無穀犬用乾糧 - 黑水虻蟲蛋白', '無穀物配方，採用黑水虻蟲蛋白，為懶洋洋的狗狗提供均衡營養。', 1, 25, 950, '2024-02-27 00:00:00', 19, 0),
(126, 'Nurture PRO 天然密碼無穀配方犬用乾糧 - 鮭魚 X 鯡魚 X 曼哈頓魚', '無穀物配方，含有鮭魚、鯡魚和曼哈頓魚，提供豐富的蛋白質。', 1, 5, 990, '2024-01-13 00:00:00', 28, 0),
(127, 'Nurture PRO 天然密碼無穀配方犬用乾糧 - 羊肉 X 鯡魚', '無穀物配方，含有羊肉和鯡魚，適合對穀物敏感的狗狗。', 1, 5, 990, '2024-01-17 00:00:00', 18, 0),
(128, 'Nurture PRO 天然密碼無穀配方犬用乾糧 - 雞肉 X 火雞肉', '無穀物配方，含有雞肉和火雞肉，提供多種蛋白質。', 1, 5, 990, '2024-02-01 00:00:00', 69, 0),
(129, 'ACANA愛肯拿無穀區域頂級食材主食糧 - 多種魚 X 薰衣草', '含有多種魚類和薰衣草，提供全面均衡的營養。', 1, 18, 1100, '2024-02-21 00:00:00', 47, 0),
(130, '莫比食譜自然糧 - C30 雞肉米幼母犬', '針對幼犬和哺乳母犬設計的雞肉米配方。', 1, 12, 950, '2024-03-24 00:00:00', 96, 0),
(131, '莫比食譜自然糧 - C27 雞肉米成犬', '成犬適用的雞肉米配方。', 1, 12, 950, '2024-05-14 00:00:00', 55, 0),
(132, '莫比食譜自然糧 - L25 羊肉米成犬', '適合成犬的羊肉米配方。', 1, 12, 950, '2024-03-19 00:00:00', 86, 0),
(133, '莫比食譜自然糧 - S26 無穀鮭魚馬鈴薯', '無穀物配方，含有鮭魚和馬鈴薯。', 1, 12, 1080, '2024-02-08 00:00:00', 8, 0),
(134, '莫比食譜自然糧 - C25 雞肉米低卡關節', '低卡路里關節配方，含有雞肉和米。', 1, 12, 950, '2024-05-19 00:00:00', 75, 0),
(135, '洛特夫犬用 紐西蘭風乾主食糧 - 雞肉', '採用紐西蘭風乾技術，含有雞肉或羊肉。', 1, 14, 1825, '2024-05-28 00:00:00', 48, 0),
(136, '法國皇家SHN 健康體型乾糧 – MNS 小型離乳犬 & 母犬', '專為小型犬離乳期和母犬設計，提供全面營養支持。', 1, 20, 1080, '2024-03-15 00:00:00', 70, 0),
(137, '法國皇家SHN 健康體型乾糧 – MNINP 小型室內幼犬', '特別為小型室內幼犬調配的乾糧，幫助它們保持健康體型。', 1, 20, 1080, '2024-05-17 00:00:00', 27, 0),
(138, '紐崔斯SUBZERO 黑鑽頂級無穀凍乾糧 - 小型犬 牛肉X羊肉', '頂級無穀物凍乾糧，適合小型犬，含有牛肉和羊肉。', 1, 15, 2556, '2024-03-12 00:00:00', 63, 0),
(139, '紐崔斯SUBZERO 黑鑽頂級無穀凍乾糧 - 全齡犬 鴨肉X鱒魚X羊肉', '適合全年齡的狗狗，含有鴨肉、鱒魚和羊肉。', 1, 15, 2971, '2024-03-23 00:00:00', 52, 0),
(140, '法國皇家SHN 健康體型乾糧 – XSP 超小型幼犬', '專為超小型幼犬設計，提供全面營養支持。', 1, 20, 656, '2024-04-05 00:00:00', 60, 0),
(141, '法國皇家SHN 健康體型乾糧 – MNINA+8 小型室內熟齡犬8+歲', '專為小型室內熟齡犬（8歲以上）設計，幫助保持健康活力。', 1, 20, 624, '2024-01-21 00:00:00', 15, 0),
(142, '法國皇家SHN 健康體型乾糧 – XSA 超小型成犬', '專為超小型成犬提供全面營養支持。', 1, 20, 624, '2024-04-01 00:00:00', 71, 0),
(143, '法國皇家SHN 健康體型乾糧 – XSA+12 超小型老齡犬12+歲', '專為超小型老齡犬（12歲以上）提供全面營養支持。', 1, 20, 624, '2024-01-09 00:00:00', 59, 0),
(144, '法國皇家SHN 健康體型乾糧 – XSA+8 超小型熟齡犬8+歲', '專為超小型熟齡犬（8歲以上）提供全面營養支持。', 1, 20, 624, '2024-05-06 00:00:00', 74, 0),
(145, 'Farmina 法米納VD-7 Vet Life 犬用泌尿道結石管理照護配方', '專為管理狗狗泌尿道結石問題而設計的營養配方。', 1, 1, 1190, '2024-03-03 00:00:00', 69, 0),
(146, '第一饗宴無穀低敏犬用配方糧 - 澳洲羊肉 (小顆粒)', '小顆粒無穀低敏配方，含有澳洲羊肉，適合對穀物敏感的狗狗。', 1, 19, 990, '2024-04-17 00:00:00', 18, 0),
(147, 'Farmina 法米納加購 天然無穀糧系列 ', '多種口味的加購無穀糧，提供更多選擇。', 1, 1, 200, '2024-05-25 00:00:00', 77, 0),
(148, 'Orijen 歐睿健鮮雞室內犬 無榖配方', '專為室內犬設計的無穀物配方，含有新鮮的雞肉。', 1, 7, 1250, '2024-03-08 00:00:00', 13, 0),
(149, 'Orijen 歐睿健鮮雞高齡犬 無穀配方', '專為高齡犬設計的無穀物配方，含有新鮮的雞肉。', 1, 7, 1250, '2024-04-13 00:00:00', 52, 0),
(150, 'Nurture PRO 天然密碼低敏系列犬用乾糧 – 雞肉 (幼成犬)', '針對幼犬和對食物敏感的狗狗設計的低敏配方。', 1, 5, 990, '2024-05-12 00:00:00', 73, 0),
(151, '洛特夫犬用 紐西蘭風乾主食糧 - 羊肉', '採用紐西蘭風乾技術，含有羊肉。', 1, 14, 1825, '2024-03-17 00:00:00', 10, 0),
(152, '朝貢  深層潔牙骨 (犬用)', ' 高度10mm的扁平設計深層式照護潔牙 不會對顳顎關節造成任何壓力 不硬但可以咀嚼多次的配方', 2, 0, 380, '2024-05-31 00:00:00', 25, 0),
(153, '舒服樂寵兒愛喝水 - 高溶氧水', ' 高含氧量 無菌 小分子團 無塑膠微粒 品質認證', 2, 0, 35, '2024-05-20 00:00:00', 20, 0),
(154, 'Peperoni寵物零食肉丁', ' 質地柔軟，高齡犬也能咬得動！ 含有維生素Ａ,維生素Ｂ和葡萄糖胺，有助於關節健康 韓國原裝進口！無分裝！最新效期！', 2, 0, 800, '2024-05-03 00:00:00', 23, 0),
(155, '毛孩食務所毛孩好棒棒', ' 狗狗專屬的毛孩好棒棒，除了能藉由咬咬釋放心理壓力，同時能作為清潔口腔的好幫手，維持家中毛寶貝的身心健康', 2, 0, 40, '2024-05-06 00:00:00', 59, 0),
(156, '汪喵星球天然起司球', ' 100% 來自澳洲，每口都是滿滿的起司 40g 起司球 ≒ 350ml 牛奶的鈣含量！專利凍乾技術，保留自然奶香與高營養 無添加乳化劑、香料與防腐劑', 2, 24, 139, '2024-05-27 00:00:00', 84, 0),
(157, '纖嚼無穀軟潔齒棒', ' 毛孩的健康，從「齒」開始 低致敏保證 全方位清潔設計 不只除牙垢 同時保健', 2, 0, 165, '2024-05-09 00:00:00', 23, 0),
(158, '纖嚼無穀硬潔齒棒', ' 毛孩的健康，從「齒」開始 低致敏保證 全方位清潔設計 不只除牙垢 同時保健', 2, 0, 185, '2024-05-14 00:00:00', 79, 0),
(159, '汪喵星球香醇零乳糖牛乳', ' 低敏零乳糖，不易造成腸胃負擔 紐西蘭契作牧場乳源，經 RMP管理程序出口 含豐富蛋白質與鈣質，幼老孕哺、術後犬貓補充營養', 2, 24, 59, '2024-05-29 00:00:00', 46, 0),
(160, '寵鮮灶腳手作零食 - 肉乾系列', '國家考試檢定合格，人食用等級採低溫烘烤熟成，保有天然食物原萃產地新鮮採購，食材當天現做雞軟骨最天然的潔牙骨！', 2, 0, 1080, '2024-05-29 00:00:00', 49, 0),
(161, '派庫廚房鮮肉凍乾零食 ', ' 均衡飲食 增加額外營養成分 100%純肉 適口性佳 原肉製造 更香更誘惑 加水還原鮮肉 增加水分攝取 低溫冷凍乾燥技術 台灣製造', 2, 0, 300, '2024-05-18 00:00:00', 45, 0),
(162, 'ZEA真致紐西蘭犬貓專用鮮乳', ' 犬貓都愛喝鮮乳，但犬貓不易消化乳糖，ZEAL使用不含乳糖的牛奶製作，讓寵物喝得無負擔 ', 2, 0, 155, '2024-05-11 00:00:00', 74, 0),
(163, '朝貢  玉筋魚 海鮮凍乾', ' 犬貓皆能吃，採用冷凍乾燥技術 好吃又天然，好剝斷，味道又很好！適用對象：全年齡犬貓', 2, 0, 99, '2024-05-16 00:00:00', 33, 0),
(164, 'KiWi Pet天然原肉凍乾零食 ', ' 100%紐澳純天然食材 冷凍乾燥技術保存滿滿營養 無添加防腐劑及調味料 香濃鮮肉風味 毛孩最愛', 2, 0, 270, '2024-05-09 00:00:00', 48, 0),
(165, 'YORA蟲蟲潔牙棒 - 小型犬', 'YORA蟲蟲潔牙棒獨特造型的結構以及天然活性成分，幫助減少牙菌斑和牙垢形成的機率，其中富含生物可利用的鈣質用以幫助牙齒強健', 2, 0, 250, '2024-05-18 00:00:00', 48, 0),
(166, 'YowUP犬用低卡無糖寵物優格 - 115g', ' 幫助好菌生長的益生元！ 0%乳糖、0%脂肪、0%糖份、豐富鈣質及益生元 滑順濃厚、高適口性、無人工防腐劑 開封前可室溫保存 西班牙原裝進口', 2, 0, 90, '2024-05-23 00:00:00', 91, 0),
(167, '伴拌日嚐犬用寵膳鮮味主食餐包', ' 食療養生，漢醫陰陽五行概念，對應毛孩常見症狀作預防調理設計，依照NRC寵物營養標準精算配比，符合毛孩所需胺基酸、完整鈣磷比', 3, 0, 129, '2024-05-27 00:00:00', 25, 0),
(168, '汪喵星球幼母犬95%營養無膠主食罐 ', ' 專屬營養加強！完善骨骼＆免疫健康 慕斯質地易舔食，更好進食與消化吸收 亦適合術後修復、體質較弱犬作營養補充', 3, 24, 1008, '2024-05-20 00:00:00', 38, 0),
(169, '汪喵星球熟齡犬95%低鈉無膠銀養主食罐 ', ' 慕斯質地易舔食，好消化吸收 低鎂低鈉配方，保健心血管與腎臟 95％超高肉含量，日常補充優質蛋白質 完全無人工膠類、防腐劑等不良添加物', 3, 24, 900, '2024-05-07 00:00:00', 12, 0),
(170, '不麻煩粽夏香草派對 手工寵物肉粽 - 6入組', '今夏CoCo 回歸最擅長的香料運用，運用了屬於南洋的味道，包含香蘭葉、椰子、香茅等等，讓炎炎夏日逐漸降低的食慾再次甦醒！', 3, 0, 749, '2024-05-17 00:00:00', 62, 0),
(171, '汪喵星球犬用95%鮮肉無膠主食罐 ', ' 補肉、補水、補機能一次滿足 真材實料，完全無人工膠類 肉超多＆嗜口性高，滿滿原肉型態 添加天然營養機能，毛孩健康補給', 3, 24, 900, '2024-05-09 00:00:00', 47, 0),
(172, '自然食犬用主食寵鮮包 ', ' 開封即食 免加熱 免解凍 適合全齡狗狗，針對敏感狗狗也很適合', 3, 0, 150, '2024-05-14 00:00:00', 56, 0),
(173, 'MewooFun寵物交流按鈕', ' 分享你的語言 分享牠的內心 寵物友好配色設計 輕輕一按即刻發聲 可重複錄音 簡單三步驟 附贈貼紙 亦可DIY製作', 4, 0, 190, '2024-05-29 00:00:00', 21, 0),
(174, 'PETHROOM微笑花盆栽 寵物藏食發聲玩具', '由三朵花組成的莖和花盆組成，從花瓣到整個莖都沙沙作響的材質刺激寵毛孩朋友們的好奇心背面有可以隱藏零食的X字迷你口袋', 4, 0, 880, '2024-05-25 00:00:00', 59, 0),
(175, 'PETHROOM果凍繽紛袋 寵物藏食發聲玩具', '繽紛袋內含四種玩具迷你口袋，牙齒較弱的朋友們也可以玩果凍袋正面全部都是沙沙作料，刺激毛孩朋友們的好奇心', 4, 0, 880, '2024-05-30 00:00:00', 15, 0),
(176, 'PETHROOM錄影帶 寵物藏食發聲玩具', ' 回憶殺 復古的錄影帶設計 沙沙作響 用力撕咬也OK', 4, 0, 560, '2024-05-30 00:00:00', 35, 0),
(177, 'BITE ME造型發聲玩具 - 動動', '兩頭都有啾啾聲，更可以吸引毛小孩的興趣變長的彈力橡皮筋，請盡情地享受拉繩遊戲。', 4, 0, 320, '2024-05-11 00:00:00', 81, 0),
(178, 'BITE ME藏食發聲玩具 - 拉芙熊', '熊熊的口袋裡，藏著五個零食點零食可以輕鬆地藏起來！愛心有吸引力啾啾聲，像橡皮筋一樣固定住讓整體難易度提升UP！', 4, 0, 420, '2024-05-13 00:00:00', 17, 0),
(179, 'BITE ME藏食發聲玩具 - 墨墨捲餅', '墨墨捲餅，除了厚實的啾啾聲肉排，幫毛小孩快速補充蛋白質，包裝紙和餅皮是響紙沙沙聲，還有滿滿的蔬菜～都是毛小孩最喜歡的！', 4, 0, 440, '2024-05-18 00:00:00', 7, 0),
(180, 'Brightkins寵物益智藏食盤 - DJ盤', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 980, '2024-05-18 00:00:00', 32, 0),
(181, 'Brightkins寵物益智藏食盤 - 橄欖球', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 880, '2024-05-11 00:00:00', 36, 0),
(182, 'Brightkins寵物益智藏食盤 - 腦力禮物', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 880, '2024-05-20 00:00:00', 11, 0),
(183, 'Brightkins寵物益智藏食盤 - 起司堡', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 880, '2024-05-30 00:00:00', 96, 0),
(184, 'FAD汪汪耐咬發聲玩具 - 祥龍獻瑞', ' 雙層布料、雙倍耐咬，內層獨有牛津布緊密貼合，更加耐咬 內層車縫線精密縫合，抗拉扯能力更加強大', 4, 0, 280, '2024-05-16 00:00:00', 43, 0),
(185, 'FAD汪汪耐咬發聲玩具 - 飛龍在天', ' 雙層布料、雙倍耐咬，內層獨有牛津布緊密貼合，更加耐咬 內層車縫線精密縫合，抗拉扯能力更加強大', 4, 0, 280, '2024-05-11 00:00:00', 52, 0),
(186, 'POOZPET寵物網球玩具', ' 耐咬材質 不易壞玩更久 互動接拋 適合各種毛孩 天然橡膠內膽 高彈耐玩', 4, 0, 180, '2024-05-08 00:00:00', 41, 0),
(187, 'POOZPET寵物造型玩具 - 互動網球拍', ' 互動網球拍 怎麼玩都不膩 內置發聲器及響紙 吸引毛孩的注意 天然橡膠內膽 高彈耐玩', 4, 0, 250, '2024-05-17 00:00:00', 53, 0),
(188, '未卡犬用繩結玩具', ' 狗狗解悶神器 互動嗨玩一整天 環保級染料，無毒無害 自嗨解悶 桃牠歡心 一邊玩要 一邊磨牙 盡情抓咬也不怕', 4, 0, 290, '2024-05-09 00:00:00', 62, 0),
(189, 'FandoraX 貓貓蟲咖波 寵物玩具', ' 可發聲 可藏食 內藏發聲器 肉肉的骨頭還能分離', 4, 0, 299, '2024-05-23 00:00:00', 49, 0),
(190, 'Brightkins寵物益智藏食盤 - 驚喜禮物', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 780, '2024-05-16 00:00:00', 32, 0),
(191, 'Brightkins寵物益智藏食盤 - 杯子蛋糕', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 680, '2024-05-07 00:00:00', 2, 0),
(192, 'Brightkins寵物漏食玩具 - 旋轉消防栓', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 880, '2024-05-31 00:00:00', 91, 0),
(193, 'Brightkins寵物魔法零食棒', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 390, '2024-05-10 00:00:00', 21, 0),
(194, 'Brightkins寵物漏食玩具 - 仙人掌', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 550, '2024-05-02 00:00:00', 97, 0),
(195, 'Brightkins寵物漏食玩具 - 杯子蛋糕', '使用不含雙酚A的安心塑料製成 為寵物們帶來生動的學習體驗  激發寵物的好奇心 讓整個家庭都參與其中', 4, 0, 390, '2024-05-24 00:00:00', 91, 0),
(196, 'BITE ME藏食發聲玩具 - 果漾夾心', '吐司中間夾入清爽的水果搭配，滿滿綿密的奶油一口咬下超級幸福的口感～兩邊有較深的口袋可以藏食', 4, 0, 380, '2024-05-01 00:00:00', 96, 0),
(197, 'BITE ME藏食發聲玩具 - 哈哈蘇打', '香草冰淇淋和哈密瓜汽水杯，都有各放入一個啾啾聲，讓喜愛啾啾聲的寶貝，不管玩哪一個，都有滿滿的聲響', 4, 0, 380, '2024-05-07 00:00:00', 33, 0),
(198, 'BITE ME造型發聲玩具 - 達克鴨', '堅韌的構造，搭配40公分大尺寸的達克鴨，裡面有大型的啾啾發聲器。在咬跟甩的過程中，2倍超大分貝啾啾聲，成功吸引寶貝的興趣！', 4, 0, 520, '2024-05-15 00:00:00', 80, 0),
(199, '汪喵星球X 玩具總動員 狗狗彈力球 - 3顆/組', ' Disney 迪士尼正版授權 耐咬材質，發聲完具，不易壞、玩更久 安全布料，經SGS重金屬測試 容易清潔，沖洗、曬乾超方便！', 4, 0, 199, '2024-05-05 00:00:00', 7, 0),
(200, 'POOZPET御守藏食嗅聞玩具', ' 拿走焦慮 藏入快樂 藏食口袋 嗅聞遊戲 Q彈粗繩子 結實耐扯 響紙發聲 吸引愛寵', 4, 0, 230, '2024-05-18 00:00:00', 14, 0),
(201, 'FAD+汪汪耐咬發聲玩具 - 農場乳牛', '來自日本的FAD+無毒安全玩具，每個玩具都經過歐盟EN71 part 3 玩具安全認證，通過無重金屬殘留測試，讓寶貝玩得更安心！', 4, 0, 320, '2024-05-22 00:00:00', 89, 0),
(202, 'BITE ME藏食發聲玩具 - ㄋㄟ一罐', '無止境的嗅聞時間～可愛的白色牛奶裡面，有著長達75cm的藏食布條(總共16個藏食點)不管啃咬牛奶盒哪個位置，都可以享受滿滿的響紙聲派對！', 4, 0, 420, '2024-05-22 00:00:00', 28, 0),
(203, 'FAD+汪汪耐咬發聲玩具 - 農場粉小豬', '來自日本的FAD+無毒安全玩具，每個玩具都經過歐盟EN71 part 3 玩具安全認證，通過無重金屬殘留測試，讓寶貝玩得更安心！', 4, 0, 320, '2024-05-04 00:00:00', 68, 0),
(204, '未卡犬用繩結玩具 - 櫻花', ' 滿足狗狗日常磨牙需求 和愛寵共享遊戲好時光 配色清新 染色環保無害', 4, 0, 250, '2024-05-11 00:00:00', 77, 0),
(205, 'BITE ME小熊軟糖發聲玩具 - 巨熊款', '小熊軟糖變大了！五種顏色的超Q軟綿綿小熊，您一定要入手！一咬就響啾啾，愛不釋手！', 4, 0, 880, '2024-05-28 00:00:00', 79, 0),
(206, 'BITE ME造型發聲玩具 - 椒椒與你', '來自泰國的天然乳膠製成，厚實口感讓寶貝一咬就上癮 啾啾聲屬於較小聲的類型，玩起來比較不會有壓力唷', 4, 0, 420, '2024-05-01 00:00:00', 61, 0),
(207, 'BITE ME造型發聲玩具 - 愛鏟你', '來自泰國的天然乳膠製成，厚實口感讓寶貝一咬就上癮 啾啾聲屬於較小聲的類型，玩起來比較不會有壓力唷', 4, 0, 220, '2024-05-21 00:00:00', 65, 0),
(208, 'BITE ME造型發聲玩具', ' 喜歡啾啾聲還有互動遊戲的寶貝 BITE ME 新推出 抱抱玩偶系列 － 蛙愛你 & 咬我鴨。到處都藏著啾啾聲，不管咬哪裡都可以有驚喜！ ', 4, 0, 360, '2024-05-13 00:00:00', 40, 0),
(209, 'BITE ME藏食發聲玩具 - 復刻卡帶', ' 藏食功能與可愛外型兼具的玩具！ 啾啾聲誘發寶貝好奇心 響紙沙沙聲吸引寶貝注意力 有五個可藏食的口袋 滿足喜歡嗅聞的毛孩', 4, 0, 260, '2024-05-01 00:00:00', 70, 0),
(210, 'BITE ME藏食發聲玩具 - 復刻大哥大', ' 藏食功能與可愛外型兼具的玩具！ 啾啾聲誘發寶貝好奇心 響紙沙沙聲吸引寶貝注意力 可藏食的口袋 滿足喜歡嗅聞的毛孩', 4, 0, 300, '2024-05-12 00:00:00', 56, 0),
(211, 'BITE ME藏食發聲玩具 - My 洗衣書', '第四冊書本終於上市了 — My 洗衣書！洗衣工作終於可以讓寶貝來分攤了~', 4, 0, 840, '2024-05-04 00:00:00', 6, 0),
(212, 'BITE ME藏食發聲玩具 - 毛巾系列 (啾啾聲、嗅聞)', '瘋狂喜歡啾啾聲玩具的朋友們，一口氣放入九個啾啾聲，讓你玩個盡興~將多個毛巾相互黏上，還可以變成一個大型嗅聞玩具哦！', 4, 0, 460, '2024-05-08 00:00:00', 80, 0),
(213, 'FAD+汪汪耐咬發聲玩具 聖誕馴鹿 (節日限定款)', '【聖誕節限定】來自日本的FAD+無毒安全玩具每個玩具都經過歐盟EN71 part 3 玩具安全認證通過無重金屬殘留測試，讓寶貝玩得更安心！', 4, 0, 300, '2024-05-10 00:00:00', 88, 0),
(214, 'FAD+汪汪耐咬發聲玩具 聖誕老公公 (節日限定款)', '【聖誕節限定】來自日本的FAD+無毒安全玩具每個玩具都經過歐盟EN71 part 3 玩具安全認證通過無重金屬殘留測試，讓寶貝玩得更安心！', 4, 0, 300, '2024-05-07 00:00:00', 37, 0),
(215, 'BITE ME造型發聲玩具 - Party ', '開趴必備的佈置道具，色彩鮮豔的氣球狗，是不是超級可愛的~適合咬著的尺寸，搭配上啾啾聲，絕對是寶貝愛不釋手的必備玩具。', 4, 0, 600, '2024-05-12 00:00:00', 17, 0),
(216, 'FAD汪汪耐咬發聲玩具', ' 沒有小零件 啃咬更安全 精密縫線 無懈可擊 雙層布料 雙倍耐咬 內置發聲器 方便清洗 乾淨建康', 4, 0, 320, '2024-05-14 00:00:00', 88, 0),
(217, 'FAD+汪汪耐咬發聲玩具 ', ' 沒有小零件 啃咬更安全 精密縫線 無懈可擊 雙層布料 雙倍耐咬 內置發聲器 方便清洗 乾淨建康', 4, 0, 320, '2024-05-11 00:00:00', 53, 0),
(218, 'POOZPET狗用網球玩具 - 咖啡豆袋', ' 耐撕耐咬 自帶塑料簌簌聲 天然橡膠內膽 內置發聲器 高彈耐咬 做工精致 互動接拋 所有狗狗', 4, 0, 390, '2024-05-29 00:00:00', 29, 0),
(219, 'POOZPET寵物益智嗅聞扯紙玩具 - 豆乳杯', ' 杯蓋硬挺飛盤設計 可玩尋回遊戲 內置發聲器 引起寵物好奇心 杯中藏入零食 嗅聞覓食小遊戲', 4, 0, 250, '2024-05-08 00:00:00', 99, 0),
(220, 'LINSLINS寵物漏食玩具 - 魔法小兔帽', ' 用玩樂安撫分離時的緊張與不安 可藏零食設計 享受尋寶般的樂趣 減少寵物的破壞性 緩解壓力', 4, 0, 250, '2024-05-01 00:00:00', 15, 0),
(221, 'LINSLINS聖誕系列犬用咬繩 ', '磨牙潔齒 助力口腔清潔 增加運動量 避免居家肥胖 軟硬適中不傷牙齒 日常清潔濕布擦拭即可', 4, 0, 310, '2024-05-21 00:00:00', 48, 0),
(222, 'PETHROOM電子字典 寵物藏食發聲玩具', ' 回憶殺 復古的電子字典設計 沙沙作響 用力撕咬也OK 貓貓也愛玩', 4, 0, 470, '2024-05-27 00:00:00', 70, 0),
(223, 'POOZPET嗅聞扯紙玩具 - 芝芝牛牛堡', ' 氣味遊戲 釋放毛寵的精力 可藏貓薄荷、零食 一款玩具 多種玩法 用玩具寵愛毛孩', 4, 0, 390, '2024-05-01 00:00:00', 50, 0),
(224, 'LINSLINS基礎款 結繩玩具', ' 優選材質 耐磨耐咬  解壓玩具同時增加運動量  磨齒工具 培養正確啃咬習慣  增進人寵感情  多種配色 隨心挑選', 4, 0, 140, '2024-05-09 00:00:00', 76, 0),
(225, 'BARKSHOP鳥寶寶 (內藏漏食玩具)', ' 洋蔥剝開是洋蔥，鳥寶寶剝開還有漏食球 柔軟毛絨同時磨牙潔齒 內有隱藏玩具 耐撕耐咬 漏食玩具訓練進食', 4, 0, 450, '2024-05-04 00:00:00', 19, 0),
(226, 'BARKSHOP廚神汪私房菜譜玩具', ' 廚神汪爭霸賽開始了 私房汪菜譜在這 內置發聲 興致盎然 內含四款狗狗食譜 好玩又好吃 ', 4, 0, 200, '2024-05-17 00:00:00', 71, 0),
(227, 'BARKSHOP宅汪神秘背包 (附兩顆球)', '色彩繽紛且柔軟 穿戴輕鬆發聲內膽 挑起興致小書包由魔鬼氈黏起 把球放入可當漏食玩具', 4, 0, 200, '2024-05-08 00:00:00', 35, 0),
(228, 'BARKSHOP紙杯蛋糕玩具', ' 廚神汪爭霸賽上驚現一款創意甜品 內置發聲激發狗狗興趣 咬得放心玩得開心 紙杯蛋糕造型獨特 材質安心 口感nice', 4, 0, 200, '2024-05-12 00:00:00', 63, 0),
(229, 'Hyperr 超躍寵物保健品 - 心臟超好', '心血管保健 有效護心維持血管 循環通暢幫助心肌正常收縮促進新陳代謝 心力充沛', 5, 3, 580, '2024-05-18 00:00:00', 78, 0),
(230, 'Hyperr 超躍寵物保健品 - 心情超好', '心情超好 舒壓、放鬆好心情嚴選國際大廠專利成分調配有效複方專業獸醫師推薦', 5, 3, 520, '2024-05-15 00:00:00', 77, 0),
(231, 'Hyperr 超躍寵物保健品 - 眼睛超好', '護眼黃金配比9合1全消保健7大專利成分專業獸醫推薦', 5, 3, 450, '2024-05-04 00:00:00', 43, 0),
(232, 'Hyperr 超躍寵物保健品 - 排毛超好', '溫和排毛無負擔排便順暢好健康代謝體內髒東西專業獸醫推薦', 5, 3, 350, '2024-05-21 00:00:00', 12, 0),
(233, 'Hyperr 超躍寵物保健品 - 紐西蘭綠唇貝油', '呵護愛寵關節 維持靈巧跳躍力綠唇貝油保護關節 維持舒適自在高吸收率極效養護', 5, 3, 790, '2024-05-11 00:00:00', 63, 0),
(234, '朝貢 寵物保健食品 - 紅魚油', ' 最先進的超臨界萃取法 原料和成品均通過IFOS5 star認證 紅色Omega-3高EPA+DHA攝取量 紅色Omega-3 mini 1cm大小，方便餵食 含有高濃度蝦紅素，具抗氧化作用', 5, 0, 1150, '2024-05-04 00:00:00', 32, 0),
(235, '陪心寵糧Plus+機能保健系列 泌尿道紓壓保健', ' 蔓越莓精萃 採用專利技術 保留整顆蔓越莓精華 洛神花 富含維生素C與多酚類 呵護膀胱系統 南瓜籽萃取 富含色胺酸 可鎮靜情緒 紓緩壓力', 5, 23, 450, '2024-05-05 00:00:00', 84, 0),
(236, '毛孩時代心臟專科保健粉', ' 堅持使用天然萃取原料，滿足毛孩身體健康的需求 日本專利Q10足量添加達到20mg 使用業界活性最高美國納豆激 添加足量專利沙棘果達到30mg', 5, 0, 6990, '2024-05-21 00:00:00', 97, 0),
(237, '汪喵星球寵物益生菌 - 體態管理', '犬貓適用，平衡胖瘦菌叢，打造易瘦體質益生元+白腎豆萃取物，穩定血糖血脂膳食纖維助腸胃蠕動，清理宿便', 5, 24, 650, '2024-05-13 00:00:00', 60, 0),
(238, '陪心寵糧Plus+機能保健系列 優腎君腎臟保健', '以下症狀毛孩可適時補充【不愛喝水】【熟齡犬貓】【吃重口味】【經常憋尿】 台灣專利', 5, 23, 730, '2024-05-13 00:00:00', 54, 0),
(239, '陪心寵糧Plus+機能保健系列 小心肝肝臟保健', '以下症狀毛孩可適時補充長期服藥、肝臟保健、熟齡犬貓、油脂攝取過高 專利GC-25黃金蜆萃取精華 專利LSC-X 微脂體薑黃萃取', 5, 23, 620, '2024-05-11 00:00:00', 81, 0),
(240, 'Hyperr 超躍寵物保健品 - 關節超好', '打造關節避震器 毛孩走跳有底氣挑戰最高濃度GAG高活性魚軟骨素濃縮25倍活性綠唇貝關鍵補充II型膠原蛋白', 5, 3, 980, '2024-05-03 00:00:00', 34, 0),
(241, 'Hyperr 超躍寵物保健品 - 腸胃超好', '培養腸胃小尖兵 毛孩軟便有剋星3大菌王 為免疫紮根酵素添加 便便超有形9大功效 專利益生菌K.0.毛孩 消化道問題', 5, 3, 650, '2024-05-22 00:00:00', 42, 0),
(242, 'Lintbells關節營養保健 - YuMOVE優骼服 (驚奇版)', '僵硬關節與年老犬隻特別強度的關節支持YuMOVE Plus優骼服驚奇版(犬用)特別強度的天然配方，讓狗狗煥然一新，舒緩僵硬關節，支持關節結構', 5, 0, 2100, '2024-05-04 00:00:00', 20, 0),
(243, '毛孩時代95%頂級深海魚油', ' 最高純度95%以上Omega-3 針對毛孩身體的高吸收rTG型態 高新鮮度及高純淨度', 5, 0, 7290, '2024-05-04 00:00:00', 79, 0),
(244, '木入森犬寶變不臭(益生菌)', ' 豐富60億有益菌合狗狗需求 加強腸道免疫力 改善消化吸收 減少排便異味', 5, 0, 550, '2024-05-15 00:00:00', 76, 0),
(245, '木入森犬寶珍心動', ' 強化心臟功能 迅速提升體力 維持心肌機能 促進血液循環', 5, 0, 1280, '2024-05-12 00:00:00', 84, 0),
(246, '木入森犬寶D藻鈣 - 30入', ' 顧及助鈣吸收營養 強健骨骼、牙齒發展 避免骨質鬆散脆弱', 5, 0, 350, '2024-05-31 00:00:00', 62, 0),
(247, '木入森犬寶膚立好', ' 皮膚過敏舒緩 調節皮脂分泌與皮膚乾燥 減輕搔癢等皮膚剌激 維持皮膚正常功能', 5, 0, 920, '2024-05-13 00:00:00', 90, 0),
(248, '木入森犬寶有關膝 (關節保健)', ' 改善關節靈活 增加關節潤滑液 提供肌肉發展 幫助軟骨增生', 5, 0, 920, '2024-05-01 00:00:00', 64, 0),
(249, '木入森犬寶好眼力 (葉黃素)', ' 改善視覺敏銳度 補充滋潤營養眼球 維持視網膜正常運作 促進血液循環', 5, 0, 1280, '2024-05-11 00:00:00', 69, 0),
(250, '木入森犬寶痕淨白', '專業去痕 淨白配方眼睛、鼻子、免疫、菌源 4重守護鮮甜雞肉味膠囊粉 好餵食', 5, 0, 920, '2024-05-18 00:00:00', 73, 0),
(251, '木入森寵物魚油粉', ' 超高適口性，8 成以上狗狗也愛吃的「魚油」 無添加，健康純粹無腥味 Omega-3 優質營養補給：強化體質、過敏舒緩 富含 Omega-3 脂肪酸 (EPA / DHA)', 5, 0, 820, '2024-05-03 00:00:00', 25, 0),
(252, '陪心寵糧Plus+機能保健系列 眼睛保健葉黃素', ' 游離型葉黃素：玉米黃素，黃金５：１ 搭配花青素、蝦紅素、玻尿酸的高效配方 提供多重植化素營養，使毛孩擁有健康好眼力', 5, 23, 420, '2024-05-18 00:00:00', 78, 0),
(253, '毛孩時代腎臟專科保健粉', ' 專利蛹蟲草子、有機五味子 保護腎臟 保健食品成分有效率達95% 專業獸醫師、營養師合作開發 歐日大廠指定專利配方', 5, 0, 6390, '2024-05-23 00:00:00', 33, 0),
(254, '汪喵星球軟便剋星保養粉', ' 腸道快速穩定，便便好成形！ 2 天有感！家庭常備應急小幫手 幫助黏膜健康，建立好菌環境、維持消化機能 品牌大廠專利菌株，可直達腸胃發揮作用', 5, 24, 380, '2024-05-08 00:00:00', 52, 0),
(255, '汪喵星球Omega-3 全保養魚油 - 噴霧型', '全台首創噴霧型魚油讓保存、保養都簡單！單方保健 X 單一小型魚種，減少毛孩過敏機率', 5, 24, 450, '2024-05-30 00:00:00', 38, 0),
(256, 'tomlyn威隆獸醫配方系列 - 泌尿加強錠 (通用)', '維持泌尿道健康防止細菌附著到泌尿道 每次排尿都可以清潔膀胱和泌尿道', 5, 0, 1520, '2024-05-03 00:00:00', 40, 0),
(257, 'Broadreach NATURE+眼睛營養保健', ' 科學實證 獸醫研發配方 包含VIS-EASE天然藥草成分組成的獨特混合物 英國製造針對眼睛健康所設計的營養保健品，由獸醫專家研發，並經過科學驗證支持。', 5, 0, 1480, '2024-05-18 00:00:00', 71, 0),
(258, 'Lintbells膚被毛營養保健 - YuDERM優美登藍油', ' 協助舒緩敏感皮膚 協助減少發癢搔抓 支持皮膚健康 英國獸醫通路皮膚與被毛保健品牌排名第一針對搔癢與敏感皮膚犬隻的必需脂肪酸(EFA)保健營養品。', 5, 0, 1250, '2024-05-07 00:00:00', 97, 0),
(259, '汪喵星球寵物腸胃益生菌', ' 犬貓皆適用，幫助腸胃健康、提高抵抗力 嚴選耐酸鹼、高定殖率及專利包埋益生菌種 高達 70億活菌，足量補充才有效！', 5, 24, 650, '2024-05-20 00:00:00', 46, 0),
(260, '陪心寵糧Plus+機能保健系列 腸胃保健益生菌', '專利天然包埋結構，耐膽鹽、胃酸 MIT台灣研發專利益生菌 維持腸道健康，幫助好菌生長、幫助消化、便便好漂亮！', 5, 23, 599, '2024-05-04 00:00:00', 97, 0),
(261, '陪心寵糧Plus+機能保健系列 3C極淨魚油', '使用阿拉斯加冷壓精粹的深海鱈魚油 還原三酸甘油酯（rTG）型態 85%高濃度omega-3，成份單純乾淨', 5, 23, 580, '2024-05-21 00:00:00', 43, 0),
(262, '陪心寵糧Plus+功能型機能粉 腸道保健', ' 適合腸道敏感，容易有軟便、排便不順的狗狗 六種複方益生菌ｘ益生質ｘ綜合蔬果酵素的黃金組合 有效改善腸道菌叢生態，幫助好菌生長，維持消化道機能', 5, 23, 699, '2024-05-11 00:00:00', 5, 0),
(263, '陪心寵糧Plus+功能型機能粉 皮毛保健', ' 適合需要滋養皮膚、毛色黯淡的狗狗 膠原蛋白ｘ蝦紅素ｘ免疫調節益生菌ｘ黑芝麻的黃金組合 提供皮膚與毛髮生長需要的營養素，使毛色健康亮麗', 5, 23, 699, '2024-05-30 00:00:00', 99, 0),
(264, '陪心寵糧Plus+功能型機能粉 關節保健', ' 適合曾有關節受損，邁入老年期與過胖的狗狗 MSMｘ葡萄糖胺ｘ綠貽貝ｘ非變性二型膠原蛋白 補充關節囊液的組成要素，維持關節活動力和軟骨健康', 5, 23, 699, '2024-05-26 00:00:00', 82, 0),
(265, '陪心寵糧Plus+機能保健系列 鱉蛋爆毛粉', '新鮮鱉蛋ｘ益生菌ｘ膠原蛋白三種皮膚護理組合 使毛髮濃密亮麗有光采，維持皮毛良好狀態', 5, 23, 490, '2024-05-01 00:00:00', 57, 0),
(266, '不麻煩即期品專區 - 有機薑黃粉', ' 內服外用皆可 10公斤以下的狗 : 每日食用<0.5公克 10公斤以上的狗 : 每日食用<1.5公克 ', 5, 0, 250, '2024-05-18 00:00:00', 38, 0),
(267, '毛孩時代寵物保健品 - 情緒穩定保養粉', ' 含減少焦慮成分 具提升睡眠品質成分 可有效舒緩情緒 天然不傷身 擁有日本專利', 5, 0, 4690, '2024-05-09 00:00:00', 45, 0),
(268, '毛孩時代8合1游離型葉黃素', ' 游離型的葉黃素 吸收率佳 效果好 含有玉米黃素 搭配效果加倍 含蝦紅素、黑豆等複合成分 達到全方位護眼保健 國際專利原料 足量配方', 5, 0, 6490, '2024-05-28 00:00:00', 51, 0),
(269, '毛孩時代免疫力平衡保健粉', ' 保健食品成分有效率達95% 專業獸醫師、營養師合作開發 歐日大廠指定專利配方', 5, 0, 7260, '2024-05-14 00:00:00', 46, 0),
(270, '毛孩時代皮膚專科益生菌', ' 五國國際專利+全菌種具菌株編號 世界唯一蛋白質專利 雙層包埋技術 高純度Omega3添加+專利玄米賽洛美', 5, 0, 6150, '2024-05-15 00:00:00', 35, 0),
(271, '毛孩時代泌尿道保健粉', ' CranPure 五項專利蔓越莓 足量Ａ型原花青素 美國40年DDS-1專利泌尿道益生菌 專利UTI-Best 洛神花 西班牙專利南瓜籽', 5, 0, 5400, '2024-05-11 00:00:00', 9, 0),
(272, '毛孩時代腸胃專科益生菌', ' 菌數30億 犬貓專用多元化5隻益菌 菌數含超過20億 美國n.zimes酵素+比利時果寡糖', 5, 0, 5490, '2024-05-25 00:00:00', 94, 0),
(273, '毛孩時代6合1專利化毛粉', ' 含天然分解毛髮、促進腸胃運動成分 含天然油脂，加速毛髮排出 不含礦物油、防腐劑 不含增味劑', 5, 0, 3630, '2024-05-01 00:00:00', 50, 0),
(274, '法國法典酵母鋅爆毛錠', ' 豐富維生素B群及微量元素鋅、硒，調節皮膚代謝，美肌爆毛 啤酒酵母菌調理腸胃，促進吸收 高適口性 增強免疫力 適合換毛期使用', 5, 0, 600, '2024-05-29 00:00:00', 38, 0),
(275, '汪喵星球免疫力提升保養粉', ' 日本 KT-11 益源質，幫助維持口腔健康 美國專利乳鐵蛋白 x 澳洲有機褐藻糖膠 全齡犬貓日常補充;特別推薦體質虛弱、老幼犬貓加強保養', 5, 24, 880, '2024-05-16 00:00:00', 41, 0),
(276, '汪喵星球泌尿道健康保養粉', '有效劑量提高＋D-甘露糖plus 嚴選國際專利複方，從情緒壓力、泌尿道生態、黏膜健康到排尿機能，全面支持泌尿道健康 犬貓皆適用', 5, 24, 650, '2024-05-02 00:00:00', 19, 0),
(277, '汪喵星球紓壓胺基酸保養粉', ' 嚴選國際專利成分，加強有效劑量，安撫毛孩更快更明顯 特別適合毛孩外出就醫、搭車移動前食用', 5, 24, 450, '2024-05-29 00:00:00', 90, 0),
(278, '汪喵星球情緒好放鬆保養粉', ' 適合有長期情緒壓力困擾的毛孩每日補充 嚴選國際專利成分與複方設計，透過天然胺基酸，幫助毛孩減少壓力！', 5, 24, 480, '2024-05-29 00:00:00', 37, 0),
(279, '汪喵星球85% Omega-3 機能魚油', ' 西班牙頂級魚油+日本專利輔 Q10 全齡毛孩機能保健 熟齡＆部分品種犬貓加強補充', 5, 24, 790, '2024-05-20 00:00:00', 22, 0),
(280, '汪喵星球TAURINE 牛磺酸', '市售90%以上的牛磺酸原料來源不明、或來自中國，汪喵選擇來自日本 KASANO 有檢驗報告的純牛磺酸，搭配 10% 的膳食纖維打造！', 5, 24, 320, '2024-05-23 00:00:00', 21, 0),
(281, '汪喵星球亮毛護膚鱉蛋粉', ' 天然鱉蛋 x 五大國際專利原料，讓毛孩皮膚健康、毛髮濃密 汪喵選用台灣無毒飼養鱉蛋，不添加澱粉，成分來源透明', 5, 24, 380, '2024-05-30 00:00:00', 35, 0),
(282, '自然食寵立善保健品 - 綜合完整型營養粉', ' 法國酵母螯合型維生素，經由酵母螯合轉化的天然營養素，更安全、生物利用率更高！', 5, 0, 900, '2024-05-07 00:00:00', 48, 0),
(283, '自然食寵立善保健品 - 皮膚毛髮保健', '能有效防止皮膚內層水分散失，穩定肌膚屏障功能，維持皮膚的健康、彈潤！可針對皮膚、毛髮的健康，提供修復與再生的營養，重拾健康皮毛應有的柔順滑！', 5, 0, 1000, '2024-05-01 00:00:00', 35, 0),
(284, '自然食寵立善保健品 - UC-II 全方位關節保養粉', ' 重量級採用美國專利 UC-II非變性二型膠原蛋白，有效保護關節活動力。', 5, 0, 1000, '2024-05-13 00:00:00', 3, 0),
(285, '自然食寵立善保健品 - 抗氧護眼葉黃素', '美國醫師第一推薦品牌FloraGLO專利游離型葉黃素，天然金盞花萃取，非酯化分子小，吸收率絕佳。', 5, 0, 800, '2024-05-23 00:00:00', 14, 0),
(286, '自然食寵立善保健品 - rTG 超級魚油', '80%高純度、高吸收率的 rTG 型魚油，突破以往傳統EE型（酯化型）需要酵素分解才能吸收，以及TG型純度低的缺點，只需一點點即可補充一日Omega 3所需。', 5, 0, 495, '2024-05-04 00:00:00', 6, 0),
(287, 'PETSEEK半圓北歐雙肩寵物包', '42L大容量 八公斤肥貓無憂正面開口設計 進出很自由正面可拆卸捲簾 透氣互動兩不誤全面通風 自在清新又透氣減重肩帶 不重不受累背板可分段折疊', 6, 0, 1190, '2024-05-31 00:00:00', 61, 0),
(288, 'PETSEEK雙面透明摺疊寵物包', '立體大空間 主子不憋屈空間足夠寬敞 從小狗用到大狗循環通風運作三步折疊 輕鬆收納防開型拉鍊安全出遊', 6, 0, 1270, '2024-05-04 00:00:00', 77, 0),
(289, 'PETSEEK初見寵物包', '初次見面就想帶你看遍世界的最美寬大空間 八公斤寵物輕鬆裝正面大捲簾隱密視窗設計 清晰視野也有滿滿安全感頂部6孔+兩側網窗+正面門窗', 6, 0, 1190, '2024-05-07 00:00:00', 66, 0),
(290, '未卡寵物外出包 - 紫羅蘭之旅', ' 迷人新色 開啟優雅之旅 超大空間 躺臥自如 收放自如 秒變寬敞 三面大開口 靈活進出才方便', 6, 0, 1950, '2024-05-18 00:00:00', 81, 0),
(291, '未卡咖啡拾便器套裝', ' 綠色環保 便捷使用 可與任何牽引繩搭配 環保材質 可分解 無污染 任性加厚 不破不漏', 6, 0, 290, '2024-05-07 00:00:00', 13, 0),
(292, 'pidan新風寵物外出箱', '全新的外出方式 各有各的輕鬆箱內設置風扇 獨立新風系統 外出多久都安心減震設計 路面不平也無妨圓形視窗和私密箱體 隨時安心看世界', 6, 0, 2990, '2024-05-31 00:00:00', 35, 0),
(293, 'pidan寵物拓展背包 - 臨時住所', '拓展設計可增大一倍內部空間 可躺可睡 外出時的臨時住所3秒即可完成拓展及閉合大面積網格布使用 保持內部空氣流通透明視窗滿足寵物好奇心', 6, 0, 2490, '2024-05-06 00:00:00', 24, 0),
(294, '未卡櫻花拾便器套裝', ' 綠色環保 便捷使用 可與任何牽引繩搭配 環保材質 可分解 無污染 任性加厚 不破不漏', 6, 0, 290, '2024-05-18 00:00:00', 39, 0),
(295, '未卡花花拾便器套裝', ' 綠色環保 便捷使用 可與任何牽引繩搭配 環保材質 可分解 無污染 任性加厚 不破不漏', 6, 0, 290, '2024-05-20 00:00:00', 58, 0),
(296, 'pidan寵物背包', '輕便、通透、超易用的pidan寵物出行背包！前所未有大尺寸可背、可拎、還有拉桿箱專用綁帶折疊收納', 6, 0, 1690, '2024-05-18 00:00:00', 58, 0),
(297, 'PETHROOM寵物防蟲散步 LED 燈', '使用100%精油，蟲子OUT，愛犬SMILE強力的一鍵式固定功能，活躍活動也不掉落內置芳香劑結構，不會有直接舔咬的問題', 6, 0, 490, '2024-05-26 00:00:00', 24, 0),
(298, '未卡寵物泡泡箱', ' 出行方便 透明外觀可觀察寵物情況 空間容納大 多方位透氣孔 保證空氣流通 抽拉輕鬆 輪軸360度轉動不受拘束', 6, 0, 1950, '2024-05-04 00:00:00', 8, 0),
(299, '未卡X 皮克斯 聯名外出包 - 熊抱哥', ' 一鐽解超大隱藏空間 盡享寬適 三面開口想從哪進就從哪進 出入無憂 寬敞側袋 零碎物件收納區 可拆卸熊抱哥毛絨斜背包 一包兩用', 6, 0, 1950, '2024-05-04 00:00:00', 28, 0),
(300, 'PETSEEK多功能摺疊便攜手提包', '所謂的，一包三用手提、跨包、雙肩包 任意出行 一包三用僅1.29kg 搭配五公斤以內寵物 輕便容量大底墊支撐 外出更穩固三面通風 透氣不悶熱超萌探頭設計 隨時關注&摸貓', 6, 0, 890, '2024-05-31 00:00:00', 13, 0),
(301, 'PETSEEK折疊式寵物單肩包', '大空間 通風透氣摺疊收納 居家外出加大空間 寵愛牠', 6, 0, 890, '2024-05-19 00:00:00', 86, 0),
(302, 'PETSEEK寵物拉桿方包', '四重貼新用法 滿足多種出行需求拉桿包、雙肩包、手提包、車載包靜音耐磨萬用輪 加持更省力三段高度可調 適配不同身高*拉桿顏色灰、白隨機出貨，不影響產品使用', 6, 0, 2190, '2024-05-12 00:00:00', 64, 0),
(303, 'FurryTail寵物露營背包套裝組', '帶著愛寵逃離城市 奔赴野性浪漫前所未有大尺寸折疊收納 花樣出行頂面大孔徑透氣網格佈設計 拒絕悶熱', 6, 0, 1650, '2024-05-04 00:00:00', 35, 0),
(304, 'HOUSMALLEggy 小宅包', '直接水洗不怕髒汙可承受六公斤愛寵安全勾繩設計底部深碗型設計 出外也有安全感內置置物袋', 6, 0, 3230, '2024-05-30 00:00:00', 86, 0),
(305, '汪喵星球小方塊寵物外出包', ' 首創重心調整設計，省力20% 市售唯一，背包專屬雨衣 立方大空間，毛孩舒適又安穩', 6, 24, 2680, '2024-05-12 00:00:00', 74, 0),
(306, 'FikaGOFLYTTA PLUS 分離式座艙寵物推車 – 大款', '車艙分離 一車兩用獨立座艙 輕巧便攜一秒自動快收車架頂棚前後雙開卡扣座艙內圍易拆易洗全車避震 一踩雙剎實用美學 北歐質感', 6, 0, 9860, '2024-05-14 00:00:00', 57, 0),
(307, 'FikaGOFLYTTA 分離式座艙寵物推車 – 小款', '車艙分離 一車兩用獨立座艙 輕巧便攜一秒自動快收車架頂棚前後雙開卡扣座艙內圍易拆易洗全車避震 一踩雙剎實用美學 北歐質感', 6, 0, 8860, '2024-05-21 00:00:00', 80, 0),
(308, 'FikaGOAGILE 寵物推車', ' 單手操作 手車可站立 前後雙開 高景觀視野 巧小體積 平整好收納 全車避震 前輪可定向 寬敞座艙 舒適毛孩乘坐 實用美學 北歐質感設計', 6, 0, 9980, '2024-05-03 00:00:00', 90, 0),
(309, 'MAOGOUBLUE胸背帶牽引繩', '採用材質的柔軟耐磨，與同色系的環扣渾然一體。有手牽、斜挎多種使用方始，解放雙手，讓毛孩子們與鏟屎官有更好的互動體驗。', 6, 0, 490, '2024-05-28 00:00:00', 39, 0),
(310, 'HiDREAM寵物出行托特斜挎包', ' 10cm海綿寬肩帶緩解肩膀久背負擔 28cm可調式織帶身高150-190cm均可使用 側邊收納袋可收納零食、手機、行動電源等', 6, 0, 920, '2024-05-24 00:00:00', 61, 0),
(311, 'Mango超大貓包', ' 超大喵包 可橫可豎 大容量 大空間 前背視角 隨時安撫 三面透氣窗 不憋悶 雙面設計 隨意進出', 6, 0, 1450, '2024-05-03 00:00:00', 53, 0),
(312, 'MewooFun寵物夜間警示燈', ' 夜間照明 安全出行 安全警示 防誤食 生活防水 雨天無懼 USB充電 持久續航', 6, 0, 450, '2024-05-29 00:00:00', 35, 0),
(313, 'FikaGOTRUFFLE 露踏踏寵物外出包', '可搭配FikaGO系列推車使用一包多用 怎麼用都合用自在坐臥 毛孩愛減壓降負 重量輕', 6, 0, 2780, '2024-05-19 00:00:00', 63, 0),
(314, 'made of organics有機清潔護理系列 - 防蚊驅蟲噴霧', '添加了比避蚊胺更持久的綠花白千層油含有大量親膚有機蘆薈、有機金盞花等天然植物成分，即使是皮膚敏感的狗狗也可以放心使用', 6, 0, 950, '2024-05-09 00:00:00', 99, 0),
(315, 'FikaGO寵物推車專用配件 - 杯架', ' 適用FREE TO GO、AGILE、FLYTTA系列車款 使用本商品不影響收車功能', 6, 0, 880, '2024-05-25 00:00:00', 18, 0),
(316, 'FikaGO寵物推車專用配件 - 手把保護套', ' 防污耐髒易清潔 避免細菌附著 保持衛生 魔鬼粘設計佳 安裝方便 潛水衣布材質 具有彈性 延長推車使用年限', 6, 0, 680, '2024-05-23 00:00:00', 3, 0),
(317, 'FikaGO寵物推車專用配件 - FLYTTA 汽車座椅保護墊', 'ISOFIX兼容，將後向安全扣連接到車輛ISOFIX系統，前向安全扣連結到座艙扣環，再搭配推車附件揹帶環繞汽車座椅頭枕可加強固定力道', 6, 0, 1280, '2024-05-23 00:00:00', 22, 0),
(318, "FikaGOLet's Fika 野餐墊 - 北歐風", '底部防水底膜防潮隔熱絲棉表布觸感舒適柔軟滌淪精細包邊平穩牢固大尺寸設計出遊不擁擠收納提手設計方便攜帶輕', 6, 0, 799, '2024-05-07 00:00:00', 57, 0),
(319, '未卡花花胸背帶牽引繩套裝 - 粉綠', ' 柔軟潛水布內襯 舒適包裹愜意心情 貼心日字釦 胸圍自由調整 快套式胸背 三步驟輕鬆上身', 6, 0, 590, '2024-05-11 00:00:00', 33, 0),
(320, '未卡X 皮克斯 胸背帶牽引繩套裝 - 熊抱哥', ' 穿上熊抱哥胸背 一起環遊世界 甜酷出行 點亮好心情 針對狗狗身形設計 有效防掙脫', 6, 0, 790, '2024-05-17 00:00:00', 95, 0),
(321, '未卡Chroma胸背帶牽引繩套裝 ', ' 受力均勻 不勒脖子 柔軟潛水布內襯 親和舒適 輕盈包裹 自在出街 快套式胸背 三步驟輕鬆上身', 6, 0, 590, '2024-05-14 00:00:00', 61, 0),
(322, 'HiDREAM前後可背托特寵物雙肩包', ' 人體工學設計 護脊三角受力 全新設計背帶 更符合人體舒適度 頂部雙重開口 防止愛寵脫逃', 6, 0, 1290, '2024-05-16 00:00:00', 4, 0),
(323, 'MAOGOUBLUE棉花糖牽引繩', ' 棉花糖般軟糯Q彈的手感 雙段式牽引設計 可移動矽膠束繩環 萬向旋轉掛鉤', 6, 0, 450, '2024-05-10 00:00:00', 8, 0),
(324, 'HiDREAM寵物車載窩', ' 只需要一個 四季通用 陷入雲端舒適感 不受限制 三層結構設計 層層緩壓', 6, 0, 1550, '2024-05-23 00:00:00', 20, 0),
(325, 'HOUSMALLScout 寵物外出定距牽繩', ' 長牽繩設計 美觀好搭配 輕量高強度尼龍織帶 皮革握把 舒適且親膚的握感', 6, 0, 560, '2024-05-25 00:00:00', 82, 0),
(326, 'PURLAB寵物自背包 - 遊戲機', ' 萌趣背包 可愛出街 多處調節設計 胸背穩穩貼合 加粗織帶 肆意奔跑不勒胸 防水帆布 耐髒好清理', 6, 0, 290, '2024-05-17 00:00:00', 84, 0),
(327, 'PURLAB寵物自背包 - 夾心餅乾', ' 人寵共用親子款 強力魔鬼氈 自己的東西自己背 多種用法 告別閒置 優質五金 使用感UP', 6, 0, 290, '2024-05-11 00:00:00', 4, 0),
(328, 'MewooFun寵物外出擠壓水壺 - 背帶款', ' 折疊設計 輕鬆出行 餵食餵水 一個搞定 擠壓出水 滴水不漏 手拎掛繩 攜帶方便', 6, 0, 390, '2024-05-12 00:00:00', 10, 0),
(329, 'HiDREAM寵物前抱式托特背包', ' 豪放大開口 裝崽不卡頓 內設穩固底托 衝減震 解放雙手 輕鬆出行', 6, 0, 950, '2024-05-10 00:00:00', 1, 0),
(330, 'HiDREAM隨行斜挎小包', ' 寬大口徑 收拿方便 正面袖口 隨取隨用 可調節肩帶長度 尼龍材質 髒污好打理', 6, 0, 420, '2024-05-18 00:00:00', 96, 0),
(331, 'FikaGOFREE TO GO 寵物推車', ' 業界領先一秒自動收車 操作easy只需單手 四輪規格大升級 前後頂蓬雙開 更貼近互動 座艙加長升高 舒適超有感 輕巧隨行 滿足外出所有需求', 6, 0, 7680, '2024-05-15 00:00:00', 90, 0),
(332, 'FurryTail露營胸背套裝 (含牽繩 & 拾便袋)', ' 露營胸背套裝含牽繩 & 拾便袋 一組搞定 減壓胸背帶 極致呵護寵 防水衝鋒衣面料 一抖就乾淨 自帶反光條 夜晚散步更安心', 6, 0, 990, '2024-05-10 00:00:00', 73, 0),
(333, 'PETSEEK福利品專區 - 寵物拉桿方包', '四重貼新用法 滿足多種出行需求拉桿包、雙肩包、手提包、車載包靜音耐磨萬用輪 加持更省力三段高度可調 適配不同身高', 6, 0, 1860, '2024-05-06 00:00:00', 26, 0),
(334, 'PURLAB寵物拾便袋包 - 夾心餅乾', ' 小餅乾大容量 可存2捲 底部1.5cm 洞口 方便隨時抽取 優質登山扣 百搭掛法 方便出行', 6, 0, 190, '2024-05-29 00:00:00', 23, 0),
(335, 'HiDREAM寵物便攜斜挎包 - 全棉款', '攜寵出行 久背不累騎車開車都可使用增加愛寵安全感最大可容納7kg內小可愛簡便口袋 可收納手機小物', 6, 0, 750, '2024-05-27 00:00:00', 68, 0),
(336, 'HiDREAM摺疊矽膠隨行碗', ' 可折疊的寵物矽膠隨行碗 食用級別矽膠，無毒無異味 室內室外裝水裝糧，狗貓通用', 6, 0, 150, '2024-05-01 00:00:00', 5, 0),
(337, 'KAMA MUTA幻想家經典系列 - 隨行撿便袋收納盒', ' 享受每一次與你無畏懼的探索 仿尼龍繩帶設計 輕鬆固定耐磨損 適用於各種牽引繩和包包', 6, 0, 260, '2024-05-03 00:00:00', 61, 0),
(338, 'APOMAN北美荊芥系列 - 人體防蚊液', ' 這是一瓶貓家庭專用的防蚊液！不再擔心使用時會影響到貓咪～ 選用貓薄荷精油防蚊成分，無添加DEET、Picaridin、PMD 、除蟲菊精、類除蟲菊精', 6, 0, 760, '2024-05-17 00:00:00', 40, 0),
(339, '未卡花花車載包', ' 頂部超大開口設計 方便寵物進出 內置可收緊防跑網兜，與金屬卡扣可調節安全繩，雙重保護 可調節扣環設計，適用於大多數汽車座椅與類型', 6, 0, 1950, '2024-05-29 00:00:00', 79, 0),
(340, '未卡草莓拾便器套裝', ' 綠色環保 便捷使用 可與任何牽引繩搭配 環保材質 可分解 無污染 任性加厚 不破不漏', 6, 0, 290, '2024-05-13 00:00:00', 55, 0),
(341, '未卡Chroma拾便器', ' 綠色環保 便捷使用 拾便袋100%可降解 可與任何牽引繩搭配 環保材質 可分解 無污染 任性加厚 不破不漏', 6, 0, 350, '2024-05-05 00:00:00', 68, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `products_tags`
--

CREATE TABLE `products_tags` (
  `id` int(13) UNSIGNED NOT NULL,
  `prod_id` bigint(11) UNSIGNED NOT NULL,
  `tag_id` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `products_tags`
--

INSERT INTO `products_tags` (`id`, `prod_id`, `tag_id`) VALUES
(1, 10, 1),
(2, 12, 7),
(3, 13, 7),
(4, 14, 5),
(5, 15, 1),
(6, 15, 5),
(7, 17, 5),
(8, 18, 4),
(9, 19, 5),
(10, 20, 4),
(11, 21, 5),
(12, 22, 5),
(13, 23, 1),
(14, 24, 1),
(15, 25, 4),
(16, 27, 5),
(17, 28, 1),
(18, 29, 1),
(19, 29, 5),
(20, 45, 4),
(21, 46, 1),
(22, 48, 1),
(23, 48, 4),
(24, 49, 1),
(25, 49, 4),
(26, 50, 1),
(27, 51, 1),
(28, 51, 4),
(29, 52, 1),
(30, 52, 4),
(31, 53, 1),
(32, 54, 4),
(33, 55, 4),
(34, 56, 4),
(35, 57, 6),
(36, 57, 7),
(37, 58, 4),
(38, 59, 4),
(39, 60, 4),
(40, 70, 4),
(41, 71, 4),
(42, 72, 4),
(43, 75, 4),
(44, 76, 4),
(45, 77, 1),
(46, 78, 7),
(47, 79, 7),
(48, 80, 4),
(49, 81, 4),
(50, 82, 4),
(51, 83, 4),
(52, 83, 5),
(53, 84, 5),
(54, 85, 1),
(55, 86, 1),
(56, 87, 4),
(57, 88, 1),
(58, 89, 1),
(59, 89, 4),
(60, 90, 1),
(61, 91, 4),
(62, 98, 4),
(63, 99, 1),
(64, 100, 1),
(65, 101, 1),
(66, 102, 1),
(67, 103, 1),
(68, 104, 1),
(69, 104, 3),
(70, 104, 4),
(71, 104, 5),
(72, 105, 1),
(73, 105, 4),
(74, 106, 4),
(75, 109, 1),
(76, 109, 4),
(77, 109, 5),
(78, 110, 1),
(79, 110, 4),
(80, 110, 5),
(81, 113, 4),
(82, 116, 4),
(83, 116, 5),
(84, 117, 4),
(85, 120, 4),
(86, 121, 4),
(87, 122, 3),
(88, 126, 1),
(89, 127, 1),
(90, 127, 5),
(91, 128, 4),
(92, 129, 1),
(93, 130, 4),
(94, 131, 4),
(95, 132, 5),
(96, 133, 1),
(97, 134, 4),
(98, 135, 4),
(99, 138, 5),
(100, 138, 7),
(101, 139, 1),
(102, 139, 3),
(103, 139, 5),
(104, 146, 5),
(105, 148, 4),
(106, 149, 4),
(107, 150, 4),
(108, 151, 5),
(109, 154, 2),
(110, 154, 7),
(111, 162, 2),
(112, 163, 2),
(113, 164, 2),
(114, 344, 1),
(115, 344, 3),
(116, 344, 4),
(117, 345, 3),
(118, 345, 4),
(119, 345, 5),
(120, 346, 1),
(121, 346, 3),
(122, 346, 4),
(123, 348, 2),
(124, 348, 3),
(125, 348, 4),
(126, 349, 2),
(127, 349, 3),
(128, 349, 3),
(129, 350, 1),
(130, 350, 4),
(131, 350, 7),
(132, 354, 1),
(133, 354, 3),
(134, 354, 4),
(135, 347, 1),
(136, 347, 3),
(137, 347, 4);

-- --------------------------------------------------------

--
-- 資料表結構 `prod_tags`
--

CREATE TABLE `prod_tags` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `prod_tags`
--

INSERT INTO `prod_tags` (`id`, `name`) VALUES
(1, '魚'),
(2, '海鮮'),
(3, '鴨肉'),
(4, '雞肉'),
(5, '羊肉'),
(6, '豬肉'),
(7, '牛肉');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `prod_brands`
--
ALTER TABLE `prod_brands`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `prod_categories`
--
ALTER TABLE `prod_categories`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `prod_images`
--
ALTER TABLE `prod_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `prod_tags`
--
ALTER TABLE `prod_tags`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `products_tags`
--
ALTER TABLE `products_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `prod_brands`
--
ALTER TABLE `prod_brands`
  MODIFY `id` int(7) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `prod_categories`
--
ALTER TABLE `prod_categories`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `prod_images`
--
ALTER TABLE `prod_images`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `prod_tags`
--
ALTER TABLE `prod_tags`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

  --
-- 使用資料表自動遞增(AUTO_INCREMENT) `products_tags`
--
ALTER TABLE `products_tags`
  MODIFY `id` int(13) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;