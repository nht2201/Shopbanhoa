-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2021 lúc 02:52 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'Mod đz', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Loại hoa', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'Hoa tươi', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Hoa khô', '', 1, 2, '2017-04-22 05:37:36'),
(9, 'Khuôn hoa', '', 1, 3, '2017-04-22 05:37:50'),
(10, 'Hoa hồng', '', 7, 1, '2017-04-22 09:08:19'),
(11, 'Hoa cúc', '', 7, 2, '2017-04-22 09:08:36'),
(12, 'Hoa Tulip', '', 7, 3, '2017-04-22 09:09:01'),
(13, 'Hoa mai', '', 7, 4, '2017-04-22 09:09:14'),
(14, 'Hoa đào', '', 7, 5, '2017-04-22 09:09:31'),
(15, 'Hoa giấy', '', 8, 1, '2017-04-22 09:09:46'),
(16, 'Hoa cánh sao', '', 8, 2, '2017-04-22 09:10:10'),
(17, 'Hoa loa kèn', '', 8, 3, '2017-04-22 09:23:39'),
(18, 'Hoa súng', '', 8, 4, '2017-04-22 09:23:57'),
(19, 'Lễ tang', '', 9, 1, '2017-04-22 09:25:55'),
(20, 'Đám cưới', '', 9, 2, '2017-04-22 09:26:21'),
(21, 'Khai trương', '', 9, 4, '2017-04-22 09:26:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(12, 9, 4, 1, '200000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0),
(14, 11, 25, 1, '300000.00', 0),
(15, 12, 28, 1, '169000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(4, 18, 'Hoa súng Việt ', '<p>C&acirc;y hoa s&uacute;ng c&oacute; nguồn gốc từ Ấn Độ. Với sự th&iacute;ch nghi cao, c&acirc;y đ&atilde; lan rộng qua c&aacute;c nước kh&aacute;c từ thời cổ đại đến nay. Những vườn hoa của c&aacute;c cung điện ở Th&aacute;i Lan v&agrave; Myanmar thường trồng s&uacute;ng để trang tr&iacute; cho những ao hồ, vườn tược.&nbsp;</p>\r\n\r\n<p>Ở Việt Nam, c&oacute; 3 loại s&uacute;ng chủ yếu l&agrave; Nymphaea, Euryale v&agrave; Barclaya. C&acirc;y hoa s&uacute;ng thường sống hoang dại trong ao, mương, k&ecirc;nh rạch, tr&ecirc;n khắp mọi khu vực của nước ta. Trong đ&oacute;, Đồng th&aacute;p Mười l&agrave; nơi c&oacute; nhiều hoa s&uacute;ng nhất ở Việt Nam.</p>\r\n\r\n<p>S&uacute;ng l&agrave; một lo&agrave;i hoa thủy sinh thường sinh sống ở c&aacute;c khu vực ao, hồ v&agrave; đầm lầy, với l&aacute; v&agrave; hoa nổi l&ecirc;n tr&ecirc;n mặt nước. Hoa xếp xoắn v&ograve;ng: l&aacute; đ&agrave;i 4 - 12 (thường 5 - 6), c&oacute; m&ugrave;i thơm nhẹ. L&aacute; s&uacute;ng h&igrave;nh tr&ograve;n, l&aacute; đơn, mọc c&aacute;ch. Hoa s&uacute;ng c&ograve;n c&oacute; thể ph&acirc;n loại th&agrave;nh 2 loại ch&iacute;nh: s&uacute;ng chịu r&eacute;t v&agrave; s&uacute;ng nhiệt đới. C&aacute;c lo&agrave;i s&uacute;ng chịu r&eacute;t chỉ nở hoa v&agrave;o ban ng&agrave;y. Trong khi đ&oacute;, c&aacute;c lo&agrave;i s&uacute;ng nhiệt đới c&oacute; thể nở hoa v&agrave;o ban ng&agrave;y hoặc ban đ&ecirc;m.</p>\r\n', '280000.00', 80000, 'images_(3).jpg', '[\"images_(3)1.jpg\",\"images_(4).jpg\",\"images_(5).jpg\"]', 17, 7, 18, 4, 1493983674),
(12, 17, 'Hoa kèn Náng, Đại tướng quân trắng ', '<p>Cụm hoa tr&ecirc;n cuống chung lớn d&agrave;i hơi dẹt, mang 20-30 hoa l&agrave;m th&agrave;nh t&aacute;n, rất thơm, gốc c&oacute; một mo chung. Trong d&acirc;n gian, lo&agrave;i c&acirc;y n&agrave;y c&oacute; t&ecirc;n l&agrave; n&aacute;ng hoa trắng, c&acirc;y l&aacute; n&aacute;ng hay tỏi voi. Hoa c&oacute; cuống d&agrave;i, c&aacute;nh hoa hợp th&agrave;nh ống tr&ecirc;n chia 6 phiến d&agrave;i, m&agrave;u đỏ nhạt c&oacute; v&acirc;n t&iacute;a ở giữa, hoa nở lu&acirc;n phi&ecirc;n, t&agrave;n hoa n&agrave;y hoa kh&aacute;c thay thế để khoe hương sắc. C&acirc;y c&oacute; nhiều c&ocirc;ng dụng y học, đặc biệt l&agrave; chữa bong g&acirc;n, đau xương.</p>\r\n', '720000.00', 360000, '321400062_1bb9decca8_o.jpg', '[\"321400056_1cde970529_o1.jpg\",\"321400062_1bb9decca8_o1.jpg\",\"cac-loai-hoa-loa-ken2.jpg\"]', 27, 3, 9, 2, 0),
(11, 15, 'Hoa giấy đỏ', '<p><strong>Hoa Giấy</strong>&nbsp;được biết đến l&agrave; một trong những loại&nbsp;<a href=\"https://cayxinh.vn/danh-muc/cay-canh-van-phong/cay-canh-ban-cong\" target=\"_blank\">c&acirc;y trồng ban c&ocirc;ng</a>, cổng nh&agrave; v&ocirc; c&ugrave;ng quen thuộc. C&acirc;y c&oacute; vẻ ngo&agrave;i nhẹ nh&agrave;ng, mộc mạc. Kh&ocirc;ng chỉ c&oacute; t&aacute;c dụng trang tr&iacute;, c&acirc;y Hoa Giấy c&ograve;n mang đến cho gia đ&igrave;nh những &yacute; nghĩa phong thủy tốt đẹp.</p>\r\n\r\n<p>Được trồng v&agrave; nh&acirc;n giống ở nhiều nơi, tuy nhi&ecirc;n kh&ocirc;ng phải ai cũng nắm vững những kiến thức cơ bản để chăm s&oacute;c được một c&acirc;y Hoa Giấy đẹp. B&agrave;i chia sẻ dưới đ&acirc;y của&nbsp;<strong>C&acirc;y Xinh</strong>&nbsp;sẽ gi&uacute;p người y&ecirc;u th&iacute;ch loại c&acirc;y n&agrave;y những kỹ thuật trồng hữu &iacute;ch.</p>\r\n', '80000.00', 10000, 'hoa-giay-14-510x510.jpg', '[\"hoa-giay-12-510x510.jpg\",\"hoa-giay-13-510x510.jpg\",\"hoa-giay-14-510x5101.jpg\"]', 35, 3, 5, 1, 1493983674),
(10, 15, 'Hoa giấy Tím', '<p><strong>Hoa Giấy</strong>&nbsp;được biết đến l&agrave; một trong những loại&nbsp;<a href=\"https://cayxinh.vn/danh-muc/cay-canh-van-phong/cay-canh-ban-cong\" target=\"_blank\">c&acirc;y trồng ban c&ocirc;ng</a>, cổng nh&agrave; v&ocirc; c&ugrave;ng quen thuộc. C&acirc;y c&oacute; vẻ ngo&agrave;i nhẹ nh&agrave;ng, mộc mạc. Kh&ocirc;ng chỉ c&oacute; t&aacute;c dụng trang tr&iacute;, c&acirc;y Hoa Giấy c&ograve;n mang đến cho gia đ&igrave;nh những &yacute; nghĩa phong thủy tốt đẹp.</p>\r\n\r\n<p>Được trồng v&agrave; nh&acirc;n giống ở nhiều nơi, tuy nhi&ecirc;n kh&ocirc;ng phải ai cũng nắm vững những kiến thức cơ bản để chăm s&oacute;c được một c&acirc;y Hoa Giấy đẹp. B&agrave;i chia sẻ dưới đ&acirc;y của&nbsp;<strong>C&acirc;y Xinh</strong>&nbsp;sẽ gi&uacute;p người y&ecirc;u th&iacute;ch loại c&acirc;y n&agrave;y những kỹ thuật trồng hữu &iacute;ch.</p>\r\n', '129000.00', 60000, 'hoa-giay-13-510x5101.jpg', '[\"hoa-giay-12-510x5101.jpg\",\"hoa-giay-13-510x5102.jpg\",\"hoa-giay-14-510x5102.jpg\"]', 8, 2, 4, 1, 1493983674),
(14, 17, 'Hoa kèn Huệ đỏ – Lan quân tử', '<p>Lan qu&acirc;n tử l&agrave; loại hoa qu&yacute;, đẹp rực rỡ từ những ch&ugrave;m hoa m&agrave;u cam đậm,viền hoa v&agrave;ng đến những chiếc l&aacute; xanh tươi m&aacute;t mắt. Vẻ đẹp của lan qu&acirc;n tử rất cuốn h&uacute;t, khiến ai đi qua cũng phải ngo&aacute;i nh&igrave;n.&nbsp;C&acirc;y hoa&nbsp;chịu được những ho&agrave;n cảnh kh&oacute;, cứ như người &ldquo;qu&acirc;n tử cố c&ugrave;ng&rdquo;? V&iacute; dụ đất c&oacute; thật kh&ocirc;, hay ngược lại qu&aacute; ướt, c&acirc;y vẫn sống được như thường, ch&iacute;nh v&igrave; vậy đ&acirc;y l&agrave; loại c&acirc;y ưa th&iacute;ch của rất nhiều l&atilde;nh đạo biết thưởng hoa .</p>\r\n', '200000.00', 50000, 'cac-loai-hoa-loa-ken.jpg', '[\"321400056_1cde970529_o.jpg\",\"cac-loai-hoa-loa-ken1.jpg\"]', 4, 2, 4, 1, 1493983674),
(16, 19, 'Viếng tang người thân', '<p>Hoa tươi phần n&agrave;o gi&uacute;p người chết nhanh ch&oacute;ng được nhẹ l&ograve;ng v&agrave; được si&ecirc;u tho&aacute;t. Hoa l&agrave; đại diện cho sắc đẹp của mẹ thi&ecirc;n nhi&ecirc;n. Nhiều người quan niệm rằng, khi d&acirc;ng k&iacute;nh những b&ocirc;ng hoa tang lễ đến với người đ&atilde; khuất th&igrave; chắc chắn rằng mẹ thi&ecirc;n nhi&ecirc;n sẽ gi&uacute;p cho linh hồn của họ được bay c&ugrave;ng gi&oacute;, bay c&ugrave;ng m&acirc;y. Quan trọng hơn hết v&agrave; xa rời trần thế, những tiếng kh&oacute;c bi thương để c&oacute; thể đến một nơi chỉ c&oacute; niềm vui v&agrave; hạnh ph&uacute;c tr&ecirc;n thi&ecirc;n đ&agrave;ng..</p>\r\n', '580000.00', 0, '8_(1)1.jpg', '[\"8_(1)2.jpg\",\"dat-vong-hoa-chia-buon-tai-ha-noi1.jpg\",\"vong-hoa-tang-le-hoa-lan-tran1.jpg\"]', 4, 3, 13, 3, 1493983674),
(17, 19, 'Viếng tang bạn bè ', '<p>Hoa tươi phần n&agrave;o gi&uacute;p người chết nhanh ch&oacute;ng được nhẹ l&ograve;ng v&agrave; được si&ecirc;u tho&aacute;t. Hoa l&agrave; đại diện cho sắc đẹp của mẹ thi&ecirc;n nhi&ecirc;n. Nhiều người quan niệm rằng, khi d&acirc;ng k&iacute;nh những b&ocirc;ng hoa tang lễ đến với người đ&atilde; khuất th&igrave; chắc chắn rằng mẹ thi&ecirc;n nhi&ecirc;n sẽ gi&uacute;p cho linh hồn của họ được bay c&ugrave;ng gi&oacute;, bay c&ugrave;ng m&acirc;y. Quan trọng hơn hết v&agrave; xa rời trần thế, những tiếng kh&oacute;c bi thương để c&oacute; thể đến một nơi chỉ c&oacute; niềm vui v&agrave; hạnh ph&uacute;c tr&ecirc;n thi&ecirc;n đ&agrave;ng.</p>\r\n', '500000.00', 50000, 'dat-vong-hoa-chia-buon-tai-ha-noi.jpg', '[\"8_(1).jpg\",\"vong-hoa-tang-le-hoa-lan-tran.jpg\"]', 36, 1, 14, 4, 1493983674),
(18, 20, 'Khuôn hoa tình yêu', '<p>Khu&ocirc;n hoa t&igrave;nh y&ecirc;u&nbsp;được biết đến l&agrave; một trong những m&agrave;u độc, v&agrave; hiếm hoi bậc nhất của họ nh&agrave; hồng, hoa hồng xanh cũng như hồng đen, b&iacute; hiểm v&agrave; đầy quyền năng. B&oacute; hoa l&agrave; sự tượng trưng cho t&igrave;nh y&ecirc;u vĩnh cửu, chung thủy, trường tồn m&atilde;i theo thời gian, bởi m&agrave;u xanh l&agrave; m&agrave;u của trời của biển kết hợp với m&agrave;u trắng nhẹ nh&agrave;ng tinh khiết thơ mộng</p>\r\n', '900000.00', 0, 'cam-hoa-dam-cuoi-hinh-chop.jpg', '[\"c\\u00fac-th\\u1ea1ch-tbaor-23.png\",\"c\\u00fac-th\\u1ea1ch-th\\u1ea3o2.png\"]', 1, 1, 5, 1, 0),
(19, 21, 'Hoa hồng trắng Winchester Cathedral Rose', '<p><strong>Đặc điểm hoa Winchester Cathedral Rose l&agrave;:</strong></p>\r\n\r\n<ul>\r\n	<li>Giống hồng thuộc dạng c&acirc;y bụi cao, th&acirc;n mềm, kh&aacute; dẻo, gai nhỏ, t&aacute;n l&aacute; rậm rạp.</li>\r\n	<li>Khi trưởng th&agrave;nh trong điều kiện chăm s&oacute;c tốt, c&acirc;y sẽ cho t&aacute;n rộng từ 1,2m - 1,5m.</li>\r\n	<li>Hoa Winchester Cathedral Rose khi nở c&oacute; đường k&iacute;nh từ 3 - 5cm với 80 - 85 c&aacute;nh/1 b&ocirc;ng.</li>\r\n	<li>Hoa nở th&agrave;nh từng ch&ugrave;m, c&oacute; m&agrave;u trắng phớt hồng, nụ h&igrave;nh tr&ograve;n.</li>\r\n	<li>Một năm giống hồng Winchester Cathedral Rose thường cho nhiều đợt hoa.</li>\r\n</ul>\r\n\r\n<p><strong>&Yacute; nghĩa của hoa hồng Winchester Cathedral Rose:</strong></p>\r\n\r\n<p>Hoa hồng trắng Winchester Cathedral Rose biểu tượng cho t&igrave;nh y&ecirc;u trong trắng, tinh khiết của người phụ nữ. Khi 1 người đ&agrave;n &ocirc;ng tặng cho người thương của m&igrave;nh 1 đ&oacute;a hồng Winchester Cathedral Rose c&oacute; nghĩa anh ta muốn trao đến n&agrave;ng 1 t&igrave;nh y&ecirc;u thuần khiết, kh&ocirc;ng vướng m&agrave;u sắc dục.</p>\r\n', '390000.00', 50000, 'download_(1)1.jpg', '[\"download1.jpg\",\"th1.jpg\"]', 2, 1, 4, 1, 1493983674),
(20, 21, 'Hoa hồng trắng Shizuku Rose', '<p><strong>Đặc điểm của c&aacute;c loại hoa hồng trắng Shizuku Rose:</strong></p>\r\n\r\n<ul>\r\n	<li>Hồng trắng Shizuku c&oacute; đặc điểm c&aacute;nh k&eacute;p m&agrave;u trắng ng&agrave;.</li>\r\n	<li>Hoa c&oacute; hương thơm mộc dược thuần khiết n&ecirc;n được nhiều người sử dụng ướp tr&agrave;.</li>\r\n	<li>C&acirc;y ưa &aacute;nh s&aacute;ng, c&oacute; khả năng sinh trưởng v&agrave; ph&aacute;t triển tốt, kh&aacute; ph&ugrave; hợp với kh&iacute; hậu nước ta.</li>\r\n	<li>Hoa rất sai với mỗi 4 -5 tuần cho 1 đợt hoa.</li>\r\n</ul>\r\n\r\n<p><strong>&Yacute; nghĩa hoa hồng trắng Shizuku Rose:</strong></p>\r\n\r\n<p>Hoa hồng Shizuku mang &yacute; nghĩa về 1 t&igrave;nh y&ecirc;u ch&acirc;n th&agrave;nh, mộc mạc, giản đơn, kh&ocirc;ng cầu kỳ hoa mỹ. Những b&ocirc;ng hồng Shizuku đem tặng l&agrave; m&oacute;n qu&agrave; thay lời thổ lộ về t&igrave;nh cảm trong s&aacute;ng, mộc mạc giữa 2 người.</p>\r\n', '380000.00', 90000, 'download.jpg', '[\"download_(1).jpg\"]', 32, 1, 4, 1, 1493983674),
(21, 21, 'Hoa hồng trắng Rambling Rector Rose', '<p><strong>Đặc trưng của giống hồng n&agrave;y l&agrave;:</strong></p>\r\n\r\n<ul>\r\n	<li>Th&acirc;n c&acirc;y rất dai c&ugrave;ng sức sống mạnh mẽ.</li>\r\n	<li>C&acirc;y vươn cao, cho t&aacute;n rộng.</li>\r\n	<li>Đặc biệt ch&uacute;ng c&oacute; thể đạt đến chiều cao 12m hoặc hơn nữa trong điều kiện trồng v&agrave; chăm b&oacute;n tốt.</li>\r\n	<li>Hoa hồng Rambling Rector c&oacute; b&ocirc;ng nhỏ, nở th&agrave;nh ch&ugrave;m lớn, khoảng tr&ecirc;n dưới 10 b&ocirc;ng/1 ch&ugrave;m.</li>\r\n	<li>C&aacute;nh hoa mỏng, mịn, trắng muốt.</li>\r\n</ul>\r\n\r\n<p><strong>&Yacute; nghĩa hoa Rambling Rector Rose:</strong></p>\r\n\r\n<p>Biểu trưng cho t&igrave;nh y&ecirc;u mạnh mẽ nhưng thuần khiết v&agrave; trong s&aacute;ng. Một đ&oacute;a hồng Rambling Rector d&agrave;nh tặng người y&ecirc;u thương ch&iacute;nh l&agrave; th&ocirc;ng điệp mong muốn trao gửi 1 t&igrave;nh y&ecirc;u thanh thuần v&agrave; m&atilde;nh liệt.</p>\r\n', '180000.00', 35000, 'th.jpg', '[\"combo-doi-dam-me-va-be-mickey-ddp08444.jpg\",\"combo-doi-dam-me-va-be-mickey-ddp08444-1m4G.jpg\",\"combo-doi-dam-me-va-be-mickey-ddp08444-1m4G3-6653ea_simg_d0daf0_800x1200_max.jpg\"]', 0, 1, 4, 1, 1493983674),
(22, 21, 'Hybrid teas roses (hồng trà lai)', '<p>Hồng leo c&oacute; c&agrave;nh d&agrave;i, c&oacute; xu hướng mọc thẳng đứng, phải uốn cho c&aacute;c nh&aacute;nh b&aacute;m theo tường r&agrave;o, gi&agrave;n gi&aacute; nếu kh&ocirc;ng c&aacute;c c&agrave;nh hồng leo sẽ b&ograve; la liệt tr&ecirc;n mặt đất. Hồng leo thường nở hoa dọc theo chiều d&agrave;i của c&agrave;nh nh&aacute;nh.</p>\r\n\r\n<p>Một số giống hồng leo chỉ nở hoa một lần v&agrave;o m&ugrave;a xu&acirc;n, nhưng nhiều giống hoa hồng leo hiện đại cho hoa trong suốt năm.</p>\r\n', '400000.00', 100000, '1902-bigview.jpg', '[\"images_(2)1.jpg\",\"images.jpg\"]', 0, 1, 4, 1, 1493983674),
(23, 21, 'Hồng cổ Sapa', '<p>Được ph&aacute;t triển lần đầu ti&ecirc;n v&agrave;o năm 1867 với c&aacute;c giống nổi tiếng như:&nbsp;<em>yellow Peace, red Mister Lincoln and orange-red Fragrant Cloud</em>.<br />\r\nC&aacute;c giống hồng thuộc loại Hybrid teas roses c&oacute; th&acirc;n c&acirc;y cứng c&aacute;p, thẳng đứng, khỏe. C&agrave;nh hoa d&agrave;i, nụ hoa h&igrave;nh trứng, h&igrave;nh tr&ograve;n cao nhọn. Hồng Hybrid teas c&oacute;&nbsp;<em>h</em><em>oa mọc đơn, to, đẹp, đa dạng về m&agrave;u sắc, nhưng ch&uacute;ng c&oacute; sức sống k&eacute;m dễ bị đ&oacute;m đen v&agrave; rệp</em>.</p>\r\n\r\n<p>Hồng Hybrid teas thường cho hoa suốt cả năm, l&agrave; một sự lựa chọn tuyệt vời nếu bạn th&iacute;ch những b&ocirc;ng hoa hồng c&oacute; đường k&iacute;nh lớn với form hoa c&oacute; phần trung t&acirc;m cao hơn c&aacute;nh hoa b&ecirc;n ngo&agrave;i. Loại n&agrave;y th&iacute;ch hợp để cắm b&igrave;nh hoa.</p>\r\n', '450000.00', 80000, 'images_(1).jpg', '[\"images_(2).jpg\"]', 20, 7, 27, 6, 1493983674),
(24, 11, 'Hoa cúc chi ', '<p>Hoa c&uacute;c chi cũng l&agrave; lo&agrave;i hoa c&uacute;c rất được y&ecirc;u th&iacute;ch v&agrave; ưa chuộng hiện nay. Hoa c&uacute;c chi mang sắc trắng tinh kh&ocirc;i, thuần khiết, c&oacute; k&iacute;ch thước kh&aacute; nhỏ. C&aacute;c c&acirc;y hoa c&uacute;c chi thường chỉ cao 0.5-1m, th&acirc;n mềm, c&oacute; l&ocirc;ng trắng to&agrave;n th&acirc;n. Hoa c&uacute;c chi c&oacute; b&ocirc;ng hoa nhỏ, c&aacute;c c&aacute;nh hoa xếp chồng l&ecirc;n nhau bao xung quanh nhụy v&agrave;ng.</p>\r\n\r\n<p>Đ&acirc;y cũng l&agrave; lo&agrave;i hoa c&uacute;c kh&aacute; dễ trồng v&agrave; chăm s&oacute;c, c&oacute; thể th&iacute;ch nghi với mọi điều kiện sống, hoa c&uacute;c chi c&oacute; thể ra hoa quanh năm n&ecirc;n được trồng rất nhiều hiện nay.</p>\r\n', '230000.00', 0, 'hoa-cúc-chi.png', '[\"c\\u00fac-th\\u1ea1ch-tbaor-22.png\",\"c\\u00fac-th\\u1ea1ch-th\\u1ea3o1.png\",\"c\\u00fac-th\\u1ea1ch-th\\u1ea3o-31.png\"]', 36, 1, 9, 2, 1493983674),
(25, 11, 'Hoa cúc Thạch Thảo', '<p>Hoa c&uacute;c thạch thảo, hoa thạch thảo l&agrave; lo&agrave;i c&uacute;c được biết đến nhiều nhất hiện nay v&agrave; xuất hiện thường xuy&ecirc;n trong cuộc sống h&agrave;ng ng&agrave;y của ch&uacute;ng ta. Hoa c&uacute;c thạch thảo hay c&ograve;n được gọi l&agrave; c&uacute;c c&aacute;nh mối hay hoa lưu ly. Đ&acirc;y l&agrave; một lo&agrave;i c&uacute;c c&oacute; nguồn gốc từ đất nước Italia, nằm trong họ c&uacute;c &ndash; Asteraceae v&agrave; c&oacute; t&ecirc;n khoa học l&agrave; Aster amellus. Đ&acirc;y l&agrave; lo&agrave;i c&uacute;c ưa kh&iacute; hậu lạnh n&ecirc;n chủ yếu chỉ được trồng ở khu vực Đ&agrave; Lạt, nhiều l&uacute;c c&uacute;c thạch thảo c&ograve;n c&oacute; thể mọc dại ở cả ven đường.</p>\r\n', '450000.00', 150000, 'cúc-thạch-tbaor-2.png', '[\"c\\u00fac-th\\u1ea1ch-tbaor-21.png\",\"c\\u00fac-th\\u1ea1ch-th\\u1ea3o.png\",\"c\\u00fac-th\\u1ea1ch-th\\u1ea3o-3.png\"]', 2, 1, 9, 2, 1493983674),
(26, 14, 'Hoa đào Someiyoshino (Anh Đào Yoshino)', '<p>C&oacute; hơn 100 loại hoa anh đ&agrave;o c&oacute; th&ecirc;̉ t&igrave;m th&acirc;́y ở Nh&acirc;̣t Bản, bao g&ocirc;̀m cả những loại anh đ&agrave;o mọc hoang d&atilde;. Lo&agrave;i hoa anh đ&agrave;o Yoshino n&agrave;y được cho l&agrave; loại ph&ocirc;̉ bi&ecirc;́n nh&acirc;́t. Lo&agrave;i hoa n&agrave;y l&agrave; k&ecirc;́t quả của sự k&ecirc;́t hợp tr&ocirc;̣n l&acirc;̃n giữa gi&ocirc;́ng Edohigan Zakura v&agrave; Oshimazakura. C&aacute;nh hoa c&oacute; m&agrave;u h&ocirc;̀ng nhạt, mặc d&ugrave; nh&igrave;n phớt qua, đ&ocirc;i khi bạn sẽ l&acirc;̀m tưởng ch&uacute;ng c&oacute; m&agrave;u trắng. M&ocirc;̃i đ&oacute;a hoa khi nở r&ocirc;̣ sẽ c&oacute; 5 c&aacute;nh. Ph&acirc;̀n lớn những c&acirc;y hoa Yoshino được tr&ocirc;̀ng trong thời k&igrave; Edo. C&acirc;y hoa anh đ&agrave;o Somei Yoshino l&acirc;u đời nh&acirc;́t được tr&ocirc;̀ng tại c&ocirc;ng vi&ecirc;n Hirosaki, tỉnh Aomori năm 1882 v&acirc;̃n tr&ocirc;ng tuy&ecirc;̣t đẹp v&agrave; căng đ&acirc;̀y nhựa s&ocirc;́ng cho đ&ecirc;́n ng&agrave;y nay.</p>\r\n\r\n<p>Lo&agrave;i hoa n&agrave;y thường bắt đ&acirc;̀u nở từ đ&acirc;̀u th&aacute;ng 4 nhưng phải đ&ecirc;́n nửa cu&ocirc;́i th&aacute;ng 4 mới trở n&ecirc;n rực rỡ nh&acirc;́t. M&ocirc;̣t đi&ecirc;̀u đặc bi&ecirc;̣t l&agrave; trong thời k&igrave; hoa nở bạn sẽ kh&ocirc;ng t&igrave;m th&acirc;́y b&acirc;́t k&igrave; m&ocirc;̣t ch&ocirc;̀i non n&agrave;o xu&acirc;́t hi&ecirc;̣n cho đ&ecirc;́n khi những c&aacute;nh hoa n&agrave;y rụng đi. N&ecirc;́u bạn mu&ocirc;́n ngắm nh&igrave;n lo&agrave;i hoa sakura n&agrave;y tại m&ocirc;̣t địa đi&ecirc;̉m ngắm hoa &iacute;t đ&ocirc;ng đ&uacute;c, h&atilde;y tới c&ocirc;ng vi&ecirc;n Hirosaki &ndash; nơi sở hữu những c&acirc;y anh đ&agrave;o đ&aacute;ng y&ecirc;u với l&ecirc;̃ h&ocirc;̣i được t&ocirc;̉ chức từ cu&ocirc;́i th&aacute;ng 3 đ&ecirc;́n đ&acirc;̀u th&aacute;ng 4. N&ecirc;́u bạn mu&ocirc;́n c&oacute; m&ocirc;̣t c&acirc;y hoa anh đ&agrave;o Yoshino trong khoảnh s&acirc;n của m&igrave;nh, đừng ng&acirc;̀n ngại c&acirc;̀m những hạt gi&ocirc;́ng tại đ&acirc;y v&ecirc;̀ tr&ocirc;̀ng nh&eacute;!</p>\r\n', '165000.00', 0, '81.jpg', '[\"21.jpg\",\"71.jpg\",\"91.jpg\"]', 5, 1, 9, 2, 1493983674),
(27, 14, 'Hoa đào Kawazuzakura', '<p>Kawazuzakura l&agrave; loại hoa anh đ&agrave;o nở sớm nh&acirc;́t Nh&acirc;̣t Bản. Bạn c&oacute; th&ecirc;̉ t&igrave;m th&acirc;́y m&ocirc;̣t lượng lớn loại hoa n&agrave;y tại m&ocirc;̣t thị tr&acirc;́n mang t&ecirc;n Kawazu thu&ocirc;̣c địa ph&acirc;̣n tỉnh Izu. Lo&agrave;i hoa n&agrave;y thường bắt đ&acirc;̀u nở v&agrave;o đ&acirc;̀u th&aacute;ng 2. V&agrave;o thời gian n&agrave;y, người d&acirc;n nơi đ&acirc;y cũng t&ocirc;̉ chức l&ecirc;̃ h&ocirc;̣i ngắm hoa với t&ecirc;n gọi &ldquo;L&ecirc;̃ h&ocirc;̣i Hoa Anh Đ&agrave;o Kawazuzakura&rdquo;. L&ecirc;̃ h&ocirc;̣i thường k&eacute;o d&agrave;i từ đ&acirc;̀u th&aacute;ng 2 đ&ecirc;́n đ&acirc;̀u th&aacute;ng 3, thu h&uacute;t h&agrave;ng tri&ecirc;̣u du kh&aacute;ch đ&ecirc;́n tham quan m&ocirc;̃i năm. Ph&acirc;̀n lớn kh&aacute;ch tham quan đ&ecirc;́n với thị tr&acirc;́n Kawazu l&agrave; đ&ecirc;̉ tham gia v&agrave;o l&ecirc;̃ h&ocirc;̣i n&agrave;y.</p>\r\n\r\n<p>Kawazuzakura l&agrave; m&ocirc;̣t loại anh đ&agrave;o 5 c&aacute;nh, m&agrave;u h&ocirc;̀ng v&agrave; k&iacute;ch thước c&aacute;nh hoa lớn hơn c&aacute;c loại hoa anh đ&agrave;o kh&aacute;c m&ocirc;̣t ch&uacute;t. V&agrave;o m&ugrave;a nở r&ocirc;̣, hoa thường k&egrave;m theo những l&ocirc;̣c non xanh bi&ecirc;́c đang đ&acirc;m ch&ocirc;̀i cho m&ocirc;̣t sức s&ocirc;́ng mới. V&ograve;ng đời của lo&agrave;i hoa n&agrave;y cũng tương đ&ocirc;́i d&agrave;i hơn so với t&acirc;́t cả c&aacute;c loại hoa anh đ&agrave;o kh&aacute;c bạn c&oacute; th&ecirc;̉ t&igrave;m th&acirc;́y tr&ecirc;n nước Nh&acirc;̣t.</p>\r\n', '200000.00', 40000, '2.jpg', '[\"7.jpg\",\"8.jpg\",\"9.jpg\"]', 3, 1, 4, 1, 1493983674),
(28, 13, 'Mai núi', '<p>Cũng l&agrave; một loại mai rừng nhưng c&oacute; số lượng c&aacute;nh nhiều hơn từ 12 cho&nbsp;đến 18 c&aacute;nh, c&oacute; khi c&ograve;n hơn thế nữa. Mai n&agrave;y mọc tr&ecirc;n những n&uacute;i&nbsp;đ&aacute;&nbsp;kh&ocirc; khốc v&agrave; sống chủ yếu bằng hơi sương, nước mưa v&agrave; nước ngầm trong l&ograve;ng&nbsp;đất cộng với kh&iacute; hậu ẩm thấp của miền n&uacute;i. Lo&agrave;i mai n&agrave;y thường xuất hiện nhiều tại c&aacute;c v&ugrave;ng n&uacute;i thuộc T&acirc;y Nguy&ecirc;n v&agrave; nước bạn Campuchia.</p>\r\n', '169000.00', 0, 'Hoamai_Núi.jpg', '[\"Hoamai_011.jpg\",\"Hoamai_021.jpg\",\"Hoamai_bach1.jpg\"]', 16, 1, 18, 4, 1493983674),
(29, 13, 'Mai Năm Cánh', '<p><strong>Loại mai v&agrave;ng mọc phổ biến tại miền Trung (Từ&nbsp;Đ&agrave;&nbsp;Nẵng, Quảng&nbsp;Nam&nbsp;cho&nbsp;đến</strong>&nbsp;Kh&aacute;nh H&ograve;a) v&agrave; tr&ecirc;n d&atilde;y trường Sơn, trong những khu rừng gi&agrave;.&nbsp;Đ&acirc;y l&agrave; loại mai năm c&aacute;nh tự nhi&ecirc;n, hoa nhỏ, th&acirc;n vừa v&agrave; nở hoa kh&ocirc;ng nhiều v&agrave; rậm như&nbsp;một số lo&agrave;i mai kh&aacute;c m&agrave; nở thưa thớt. Nhưng nếu lạc v&agrave;o rừng mai n&agrave;y v&agrave;o m&ugrave;a xu&acirc;n th&igrave; ch&uacute;ng ta sẽ thấy sắc hoa v&agrave;ng rực rỡ cả một khu rừng, cả một triền n&uacute;i v&agrave; x&aacute;c hoa rơi c&oacute; khi v&agrave;ng cả một d&ograve;ng suối. Hương thơm ngập tr&agrave;n v&agrave; lan tỏa cả một v&ugrave;ng rộng lớn. Ở một số ngọn n&uacute;i thuộc&nbsp;đồng bằng s&ocirc;ng Cửu Long như&nbsp;tại v&ugrave;ng Thất sơn (bảy n&uacute;i) cũng c&oacute; loại mai n&agrave;y nhưng &iacute;t hơn v&agrave; rải r&aacute;c kh&ocirc;ng tập trung.</p>\r\n', '300000.00', 120000, 'Hoamai_Nămcánh.jpg', '[\"Hoamai_01.jpg\",\"Hoamai_02.jpg\",\"Hoamai_bach.jpg\"]', 25, 1, 4, 1, 1493983674);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'images_(6).jpg', 'http://localhost/webshop/phoi-ren-p4', 1, '2017-04-25 15:24:43'),
(4, '2', 'slider-01.png', 'http://localhost/webshop/ao-gia-dinh-ag0560-p16', 4, '2017-04-25 15:36:41'),
(5, '3', 'download_(2).jpg', 'http://localhost/webshop/phong-cach-phoi-mau-p24', 3, '2017-04-25 15:37:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(4, 1, 0, 'An Nhiên', 'annhien@gmail.com', '0166666666', 'Hoàng Mai - Hà Nội', 'Vui lòng trao hàng đến địa chỉ trên...', '350000.00', '', 1493983674),
(3, 1, 5, 'GoO', 'GoO@gmail.com', '01215345336', 'Hải Phòng', 'GUi hang den dia chi tren', '360000.00', '', 1493983674),
(5, 1, 0, 'Bình Nguyễn', 'binh@gmail.com', '0987654321', 'Hà Nội ', 'Gửi đến địa chỉ trên', '370000.00', '', 1494083674),
(6, 0, 0, 'Tô Nam', 'tonam@yahoo.com.vn', '098989876', 'Thủy Nguyên - Hải Phòng', 'Ship đến địa chỉ vào sáng ngày 23/5', '469000.00', '', 1494283674),
(7, 1, 5, 'GoO', 'GoO@gmail.com', '01215345336', 'Hải Phòng', 'Ship vào sáng mai.', '70000.00', '', 1494183674),
(8, 0, 0, 'Linh', 'ling@yahoo.com', '098798787', 'hai Phong', 'ship', '69000.00', '', 1494342674),
(9, 1, 0, 'Nhi', 'nhi@test.com', '0987654321', 'Long Biên - Hà Nội', 'Gửi hàng đến địa chỉ trên vào ngày mai', '200000.00', '', 1493983674),
(10, 0, 0, 'VIP User', 'test@gmail.com', '1234567890', 'Hải Phòng', 'Ship free', '450000.00', '', 1493983674),
(11, 0, 0, 'test', 'test@gmail.com', '1234567890', 'Hải Phòng', 'TESE', '300000.00', '', 1494383674),
(12, 0, 6, 'Nguyen An', 'khachhang1@gmail.com', '01201212222', 'Thủy Nguyên - Hải Phòng', 'SHIP TO', '169000.00', '', 1494407353);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(6, 'Nguyen An', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(5, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(7, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
