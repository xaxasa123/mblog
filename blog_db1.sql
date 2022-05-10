-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2022 lúc 07:07 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `blog_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_about`
--

CREATE TABLE `tbl_about` (
  `about_id` int(11) NOT NULL,
  `about_image` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `about_description` text CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_about`
--

INSERT INTO `tbl_about` (`about_id`, `about_image`, `about_description`) VALUES
(1, 'sr.png', 'Sản phẩm của Quý - Tuyên - Nhi<br><br>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `category_slug` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`) VALUES
(4, 'Sức khỏe', 'sc-khe'),
(5, 'Cuộc sống', 'cuc-sng'),
(6, 'Du lịch', 'du-lch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_date` timestamp NULL DEFAULT current_timestamp(),
  `comment_name` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `comment_email` varchar(90) CHARACTER SET utf8mb4 DEFAULT NULL,
  `comment_message` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `comment_status` int(11) DEFAULT 0,
  `comment_parent` int(11) DEFAULT 0,
  `comment_post_id` int(11) DEFAULT NULL,
  `comment_image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `comment_date`, `comment_name`, `comment_email`, `comment_message`, `comment_status`, `comment_parent`, `comment_post_id`, `comment_image`) VALUES
(5, '2022-05-03 05:05:49', 'Vo Hai Tuyen', 'vohaituyen12a7@gmail.com', 'Nơi này tôi có ĂN RỒI NÈ... NGON LẮM', 1, 0, 15, 'user_blank.png'),
(6, '2022-05-03 05:06:23', 'nGUYỄN yẾN nHI', 'NhiNguyen@gmail.com', 'aNH CHỦ QUÁN ĐẸP TRAI :V', 1, 0, 15, 'user_blank.png'),
(7, '2022-05-03 05:07:29', 'Võ Hải Tuyên', 'admin@gmail.com', 'Ok Nhi @@', 1, 6, 15, 'fcee14ca639c3ca3c5b93b7c7fc70ba2.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_home`
--

CREATE TABLE `tbl_home` (
  `home_id` int(11) NOT NULL,
  `home_caption_1` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `home_caption_2` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `home_bg_heading` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `home_bg_testimonial` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_home`
--

INSERT INTO `tbl_home` (`home_id`, `home_caption_1`, `home_caption_2`, `home_bg_heading`, `home_bg_testimonial`) VALUES
(1, 'Sẽ chia . Học hỏi . Trao đổi', 'Blog', 'image_4.png', 'image_8.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `inbox_id` int(11) NOT NULL,
  `inbox_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `inbox_email` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL,
  `inbox_subject` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `inbox_message` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `inbox_created_at` timestamp NULL DEFAULT current_timestamp(),
  `inbox_status` varchar(2) DEFAULT '0' COMMENT '0=Unread, 1=Read'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_navbar`
--

CREATE TABLE `tbl_navbar` (
  `navbar_id` int(11) NOT NULL,
  `navbar_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `navbar_slug` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `navbar_parent_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_navbar`
--

INSERT INTO `tbl_navbar` (`navbar_id`, `navbar_name`, `navbar_slug`, `navbar_parent_id`) VALUES
(1, 'Home', NULL, 0),
(2, 'About', 'about', 0),
(3, 'Blog', 'blog', 0),
(4, 'Contact', 'contact', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_post`
--

CREATE TABLE `tbl_post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_description` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_contents` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_image` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT current_timestamp(),
  `post_last_update` datetime DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `post_tags` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_slug` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `post_status` int(11) DEFAULT NULL COMMENT '1=Publish, 0=Unpublish',
  `post_views` int(11) DEFAULT 0,
  `post_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `post_title`, `post_description`, `post_contents`, `post_image`, `post_date`, `post_last_update`, `post_category_id`, `post_tags`, `post_slug`, `post_status`, `post_views`, `post_user_id`) VALUES
(14, '2 Cách làm sữa chua - yaourt tại nhà từ sữa đặc và sữa tươi ngon mịn dễ làm', '', '<p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">Sữa chua (yaourt) là một&nbsp;</span><a title=\"món tráng miệng\" href=\"https://www.dienmayxanh.com/vao-bep/mon-trang-mieng\" target=\"_blank\" rel=\"noopener\" style=\"margin: 0px; padding: 0px; transition: all 0.2s ease 0s; color: rgb(74, 144, 226); font-family: Arial, Helvetica, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);\">món tráng miệng</a><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;vừa ngon lại phù hợp cho nhiều lứa tuổi vì cung cấp nhiều chất dinh dưỡng, hỗ trợ tiêu hóa và giúp làm đẹp da. Hãy cùng Điện máy XANH&nbsp;</span><a title=\"vào bếp\" href=\"https://www.dienmayxanh.com/vao-bep\" target=\"_blank\" rel=\"noopener\" style=\"margin: 0px; padding: 0px; transition: all 0.2s ease 0s; color: rgb(74, 144, 226); font-family: Arial, Helvetica, sans-serif; font-size: 18px; background-color: rgb(255, 255, 255);\">vào bếp</a><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;xem ngay 2 cách làm sữa chua (yaourt) chuẩn vị ngay tại nhà cho gia đình cùng thưởng thức nhé!</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">1. Sữa chua yarout -&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">Cho 5 người</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa tươi 1 lít</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa đặc 200 gr</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa chua 200 ml</span></p><p></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;(làm sữa chua cái)</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">2.&nbsp;Sữa chua - yaourt (công thức được chia sẻ từ người dùng) -&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">Cho 4 người</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa chua 1 hộp&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">(100gr)</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa tươi không đường 440 ml</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Sữa đặc 1 hộp</span></p><p></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;Nước lọc 550 ml</span></p>', '6cc31d24789a1af5ba2399669273dd07.jpg', '2022-05-03 03:38:58', NULL, 4, 'Hướng dẫn,Công thức', '2-cch-lm-sa-chua---yaourt-ti-nh-t-sa-c-v-sa-ti-ngon-mn-d-lm', 1, 1, 1),
(15, 'Quán ăn ngon ở An Khê Gia Lai cung k50', '', '<p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Một quán ăn ngon ở An Khê, Gia Lai trong cung trek k50 mọi người có thể ghé ăn thử. Chủ quán rất dễ thương, mình có rất nhiều cảm tình với nơi nay. Nên muốn giới thiệu chọn mọi người nhé</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Tụi mình dừng ở An Khê để ăn cơm trưa sau khi ra khỏi rừng. Đồ ăn trong thác K50 chủ yếu là thịt và ít rau, mình lại cực thèm cơm và và rau xào. Cầu được ước thấy bạn làm tour chọn được 1 quán đầy đủ món mình thích. Cả quán thì chỉ có mỗi 1 đoàn của tụi mình, không gian quán khá rộng sạch sẽ.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br style=\"outline: none; margin: 0px; padding: 0px;\">Tui mình ngồi một hồi đồ ăn ra dần. Ban đầu ko để ý lắm nhưng khi mọi người xin cơm, thì thấy 1 chú tầm khoảng 50 tuổi cứ rối rít xin lỗi vì ra cơm trễ, thì ra đó là chủ quán. Đồ ăn cứ thế ra cho đến hết món, ai cần gì lại kêu thêm, chú chủ quán lại rối rít đi lấy món hơi lâu 1 xíu lại xin lỗi.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Nguyên đoàn vì quá đói cặm cụi ăn lấy ăn để, chú cứ đi lui đi tới xem mọi người cần gì lâu lâu lại hỏi “thêm dưa chua nha cái này chú tặng không lấy tiền”.Sau khi đánh chén gần sạch đồ ăn trên bàn tụi mình cũng bắt chuyện với chú, hỏi han sao quán ít người vậy. Chú cũng tâm sự nhiều thứ, vì không rành quảng cáo không rành về facebook google nên cũng ít người biết.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br style=\"outline: none; margin: 0px; padding: 0px;\">Không hiểu sao mình lại rất có cảm tình với chú, mọi người trong đoàn cũng thế. Một người có nét mặt phúc hậu, tính cách chân tình. Lúc sắp về chú lại mang ít rượu trong nhà ra mời cả đoàn, tiễn cả nhóm lên xe quay đi rồi mới chịu vào quán.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br style=\"outline: none; margin: 0px; padding: 0px;\">Bản thân mình là một người mê du lịch, lại làm công việc liên quan trực tiếp đến du lịch. Nên mình hiểu thời gian dịch vừa rồi đã lấy đi nhiều thứ, gây ra vô vàn khó khăn cho người làm nghề. Và cũng có lẻ đã lấy đi cái guồng công việc của Chú, nên khi đoàn vào ăn chú lại có sự lúng túng đáng yêu như vậy. Covy có thể lấy đi nhiều thứ nhưng không thể lấy đi sự chân thành vốn có của chú. Chúc chú luôn như vậy thì sớm muộn gì quán cũng sẽ đông lên.<br style=\"outline: none; margin: 0px; padding: 0px;\"></p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Mọi người đi K50 có thể ghé quán chú để ăn, ủng hộ cho một địa điểm làm du lịch có tâm nhé.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Link map quán của chú:&nbsp;<a href=\"https://goo.gl/maps/xcxuVEgXk384gtVj6\" style=\"outline: none; margin: 0px; padding: 0px; text-decoration-line: underline; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\">https://goo.gl/maps/xcxuVEgXk384gtVj6</a></p>', '1862a535879a38125d22ef837b671c17.jpg', '2022-05-03 04:42:33', '2022-05-03 11:45:29', 6, 'Hướng dẫn,Địa điểm', 'qun-n-ngon--an-kh-gia-lai-cung-k50', 1, 1, 2),
(16, 'Blogger du lịch là gì? 10 bí kíp trở thành 1 blogger du lịch', '', '<h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">BLOGGER DU LỊCH LÀ GÌ<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Theo định nghĩa của mình nhé cái này không phải chính thống gì hết ! blogger là 1 người chia sẻ những trải nghiệm những cách nhìn, những suy nghĩ của mình đến với người khác ( nếu không chia sẻ đến người khác là nhật ký rồi ).Blogger du lịch là họ chia sẻ trải nghiệm, cách nhìn, suy nghĩ của họ liên quan tới lĩnh vực du lịch. Chia sẻ trên fb cá nhân, fanpage, group hoặc website.</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">VẬY LÀM SAO ĐỂ TRỞ THÀNH 1 BLOGGER DU LỊCH?<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Dưới đây là 10 bí kíp giúp bạn trở thành 1 blogger du lịch, dành cho người mới</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">1. Học cách quan sát xung quanh để trở thành 1 blogger du lịch<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Vì sao cùng 1 sự vật sực việc nhưng có người viết được rất nhiều cái, có người thì thấy bình thường và không viết được gì. Đó là do cách quan sát, người quan sát sâu nhìn các gốc nhìn khác nhau thì sẽ có nhiều cái để viết hơn. Một mẹo nhỏ giúp bạn có cách quan sát tốt hơn đó là luôn đặt câu hỏi “tại sao?”. Tại sao biển ở Đảo Bé có màu xanh ngọc bích?, vì sao Phan Thiết là 1 tỉnh thuộc miền trung, nhưng lại ăn ngọt hơn cả miền tây?</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Chỉ cần bạn đi tìm ra câu trả lời cho những câu hỏi đó bạn sẽ có rất nhiều tư liệu để viết thành 1 bài viết rồi đúng không, vậy nên để trở thành 1 blogger du lịch bạn phải học quan sát, quan sát càng nhiều góc nhìn bạn sẽ có nhiều tư liệu để viết về 1 vùng đất, 1 cảnh vật, con người ở đó hơn !</p><div><br></div><img src=\"http://localhost/mblog/assets/images/DSC01399.jpg\" style=\"width: 798px;\"><div><br></div><div><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">2. Càng trải nghiệm càng nhiều chất liệu để viết<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Đối với 1 blogger review du lịch, trải nghiệm chính là cái tạo nên chất riêng cho blog của bạn. Vì có thể cùng 1 sự vật sự việc nhưng cách trải nghiệm của một người khác nhau và vì thế blog của bạn cũng sẽ khác với người khác, tạo nên được chất riêng cho bạn. Chính vì thế đừng chỉ đứng trên bờ để nhìn, hãy lao xuống biển, hãy lặn san hô, hãy leo núi hãy trải nghiệm tất cả những gì bạn có thể. Mình thề các bạn sẽ có vô vàn cái để viết.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br></p></div><img src=\"http://localhost/mblog/assets/images/G0311026.jpg\" style=\"width: 798px;\"><div><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br></p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">3. Học cách diễn giải suy nghĩ &amp; trải nghiệm bằng văn viết<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Viết luôn là phần khó nhất của 1 blogger viết du lịch, trong đầu bạn có qúa nhiều thứ nhưng rất khó để diễn tả bằng văn viết. Lý do vì sao ? vì thiếu vốn từ, giống như học tiếng Anh vậy đó, trong đầu thì quá nhiều từ muốn nói nhưng không biết tự vựng là gì.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Vậy làm sao để có nhiều vốn từ? đơn giản đọc nhiều, nhưng đọc có khoa học và có chủ đích nhé. Mình được dạy 1 phương pháp đọc rất hay đó là “nhặt sỏi” tức là sao? khi bạn đọc 1 cuốn sách 1 bài báo chủ đề du lịch bạn cố gắng nhặt ra những từ hay, người ta hay tả cảnh như thế nào bạn tô vàng hoặc lưu về máy. Cứ đọc nhiều và nhặt sỏi nhiều càng ngày vốn từ bạn sẽ nhiều lên và khi đó bạn sẽ viết được toàn bộ suy nghĩ mình ra thành 1 bài văn viết</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"4_Chia_noi_dung_1_chuyen_di_nhu_the_nao\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip4\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>4. Chia nội dung 1 chuyến đi như thế nào?<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Sau khi bạn đã trang bị cho mình 1 số lượng kha khá kiến thức mềm để trở thành 1 blogger du lịch, và bạn cũng đã có 1 chuyến đi. Sau khi đi về bạn cần phải phân chia nội dung sao cho hợp lý để có thể khai thác được tối đa chuyến đi của mình. Mình ví dụ 1 dạng chia nội dung mình hay làm nhất nhé</p><ul style=\"outline: none; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px 0px 0px 36px; list-style: none; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif; font-size: 16px;\"><li style=\"outline: none; margin: 0px 0px 6px; padding: 0px; list-style: square; position: relative; line-height: 1.7;\">1 bài viết review cả nhận bản thân về vùng đất đó ( cái này chính là phần trải nghiệm riêng của bạn thân bạn)</li><li style=\"outline: none; margin: 0px 0px 6px; padding: 0px; list-style: square; position: relative; line-height: 1.7;\">1 bài hướng dẫn làm sao để đi tới chỗ đó chi tiết nhất</li><li style=\"outline: none; margin: 0px 0px 6px; padding: 0px; list-style: square; position: relative; line-height: 1.7;\">1 hoặc 2 bài viết về 1 sự việc nào đó bạn tâm đắc ấn tượng nhất</li></ul><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Với cách chia vậy ít nhất bạn cũng có 3 bài để viết sau 1 chuyến đi rồi đúng không? nếu bạn quan sát và trải nghiệm tốt hơn mình tin các bạn sẽ nhiều chủ đề hơn để viết 1 vùng đất nào đó</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"5_Lay_cam_hung_de_viet_bai\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip5\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>5. Lấy cảm hứng để viết bài<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Hừm ! sau khi chia nội dung rồi tới phần khó nhất đó là viết bài, lúc nào khó không phải là không có gì để viết mà không có cảm hứng để viết. Bạn có cảm hứng chỉ cần 1 tiếng bạn sẽ viết 1 mạch không phải suy nghĩ gì nhiều, như mình đang viết bài này cho các bạn đọc đây. Không dừng lại mà viết 1 mạch, nhưng không có cảm hứng thì “đẻ” hoài không ra 1 bài.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Vậy lấy cảm hứng từ đâu? dễ nhất là lúc bạn đang đi lúc đó đang “cao hứng” nhất cứ note ra điện thoại hết tất cả những gì bạn muốn viết sau đó về nhà đọc lại và trau chuốt. Ngoại ra bạn phải tạo ra không gian và công cụ làm mình có cảm hứng nhất, có người thích viết ở quán cafe, có người thích viết chỗ không người, nhưng mình thì chữ nó cứ tuôn ra lúc chạy xe máy. Nhiêu khi chạy xe 1 quãng là có thể tự viết trong đầu được 1 bài, dừng lại lấy máy ra đánh 1 lèo là xong ( bài này là 1 ví dụ nè)</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"6_Chuan_bi_hinh_anh_1_yeu_to_cuc_ky_quan_trong_cho_nguoi_moi\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip6\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>6. Chuẩn bị hình ảnh 1 yếu tố cực kỳ quan trọng cho người mới<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Hình ảnh là 1 ngôn tư diễn tả sự vật sự việc trực quan nhất của 1 blogger du lịch , vì thế lúc đi bạn gặp cái gì thì cố chụp nhiều vào nhé, chụp bằng bất kỳ thứ gì mà tiện cho bạn nhất. Sau đó về nhà ngồi soạn hình, chọn hình, đây cũng là bước giúp bạn có cảm hứng để viết bài nữa đó.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><br></p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><img loading=\"lazy\" class=\"aligncenter size-full wp-image-5010 lazyloaded\" src=\"http://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM.png\" alt=\"\" width=\"2208\" height=\"1322\" sizes=\"(max-width: 2208px) 100vw, 2208px\" srcset=\"https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM.png 2208w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-600x359.png 600w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-300x180.png 300w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-768x460.png 768w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-1024x613.png 1024w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-1170x701.png 1170w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-1920x1150.png 1920w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.02.19-PM-585x350.png 585w\" data-ll-status=\"loaded\" style=\"outline: none; margin: 5px auto; padding: 0px; max-width: 100%; vertical-align: top; height: auto; clear: both; display: block;\"></p></div><div><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\">7. Viết cho cộng đồng nhỏ trước<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Nhiều bạn hỏi mình&nbsp;<a href=\"https://www.cuongchan.com/blog-du-lich/blogger-du-lich-la-gi-10-bi-kip-tro-thanh-1-blogger-du-lich-tu-blogger-tuan-cuong-chan.html\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\">blogger du lịch</a>&nbsp;thì nên viết&nbsp; ở đâu? mình nghĩ dễ nhất là các bạn viết trên chính trang phây búc cá nhân chính bản thân bạn, và đối tượng đọc không ai khác chính là danh sách bạn bè của bạn. Chỉ cần đơn giản như vậy bạn đã có 1 nơi đẻ chia sẻ rồi đúng không? đừng suy nghĩ lớn lao quá, càng phứt tạp càng khó để bắt đầu !</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"8_Dung_co_lam_hai_long_so_dong\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip8\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>8. Đừng cố làm hài lòng số đông<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Sau khi viết xong chia sẻ lên mạng xong bạn sẽ gặp tình trạng: khen có chê có, góp ý có. Mình thích khen nên đương nhiên khen mình vui, góp ý thì cố gắng chắt lọc cái nào đung thì thay đổi, cái nào mà bạn cảm thấy ko biết đúng sai thì cũng cứ thay đổi để mình biết được nó đúng hay sai. Còn cái nào bạn cảm thấy ko đúng ý bạn thì 1 từ thôi nhé “kệ mẹ nó” bạn sinh ra không phải để làm hài lòng số đông.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Và mình tin bạn chả bao giờ làm hài lòng tất cả mọi người, vì thế hãy viết cho những người thích bạn, những người ko thích không ghét. Còn ai ghét rồi kệ họ, bạn càng bận tâm nhiều thì bạn sẽ rất khó để tiếp tục.</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"9_Lap_1_trang_web_nhu_the_nao\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip9\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>9. Lập 1 trang web như thế nào<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Wow ! phần này khá là khó nhằn, nếu ai rành về IT thì siêu dễ còn những bạn nữ không rành thì siêu khó. Vậy làm sao 1 người ko rành vẫn có 1 trang web ngon lành cành đào? Đầu tiên bạn cần phải có tên miền ví dụ&nbsp;<a href=\"https://www.cuongchan.com/\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\">cuongchan.com</a>&nbsp;là 1 tiên miền, sau đó bạn có 1 hosting để lưu trữ và bạn có 1 bộ code dễ nhất là wordpress.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Sau khi có những cái đó bạn có thể tự mò bằng cách google nhé “cách làm blog từ wordpress”</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Hoặc bạn có thể thuê, thuê ai? giá thuê thì rời tầm 5-6 triệu 1 blog bao gồm tên miền, hosting, giao diện vào setup… cái này thì bạn có thể gửi mail&nbsp;tuancuongchan@gmail.com&nbsp;mình sẽ cho bạn thông tin nếu cần.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><img loading=\"lazy\" class=\"aligncenter size-full wp-image-5011 lazyloaded\" src=\"http://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM.png\" alt=\"\" width=\"2366\" height=\"1172\" sizes=\"(max-width: 2366px) 100vw, 2366px\" srcset=\"https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM.png 2366w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-600x297.png 600w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-300x149.png 300w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-768x380.png 768w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-1024x507.png 1024w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-1170x580.png 1170w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-1920x951.png 1920w, https://www.cuongchan.com/wp-content/uploads/2019/05/Screen-Shot-2019-05-22-at-12.03.53-PM-585x290.png 585w\" data-ll-status=\"loaded\" style=\"outline: none; margin: 5px auto; padding: 0px; max-width: 100%; vertical-align: top; height: auto; clear: both; display: block;\"></p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"10_Cuoi_cung_viet_nua_viet_mai_de_thanh_1_blogger_noi_tieng_du_lich\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip10\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>10. Cuối cùng viết nữa viết mãi để thành 1 blogger nổi tiếng du lịch<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Sau khi đã chuẩn bị 9 cái trên kia, việc tiếp theo để trở thành 1 blogger nổi tiếng du lịch đó là phải viết, phải chia sẻ kiên trì thế thôi. Càng viết nhiều bạn sẽ được nhiều đọc giả biết đến, đó là yếu tố giúp bạn trở thành 1 blogger được nhiều người yêu thích.</p><h2 style=\"outline: none; margin: 0px 0px 17px; padding: 0px; font-size: 22px; font-weight: var(--pchead-wei); font-family: Verdana, Geneva, sans-serif; color: rgb(49, 49, 49); line-height: 1.3em;\"><span class=\"ez-toc-section\" id=\"11_Ket_luan_cho_ai_thich_tro_thanh_1_blogger_du_lich\" style=\"outline: none; margin: 0px; padding: 0px;\"></span><a name=\"bikip11\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer;\"></a>11. Kết luận cho ai thích trở thành 1 blogger du lịch<span class=\"ez-toc-section-end\" style=\"outline: none; margin: 0px; padding: 0px;\"></span></h2><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Đầu tiên bạn hãy cố gắng viết với mục đích chia sẻ là chính, đừng đặt nặng vấn đề nổi tiếng, nhiều người xem như thé bạn mới kiên trì được. Càng chia sẻ nhiều mình tin rằng bạn sẽ có nhiều kinh nghiệm và cũng sẽ có nhiều đọc giả hơn. Nếu bạn có khó khăn thì có thể inbox mình qua fb hoặc email, thông tin bên dưới nhé</p></div>', 'cbe7936a959816e225853a98de5025aa.jpg', '2022-05-03 04:49:48', NULL, 6, 'Mẹo vặt,Hướng dẫn,Địa điểm', 'blogger-du-lch-l-g--10-b-kp-tr-thnh-1-blogger-du-lch', 1, 1, 2);
INSERT INTO `tbl_post` (`post_id`, `post_title`, `post_description`, `post_contents`, `post_image`, `post_date`, `post_last_update`, `post_category_id`, `post_tags`, `post_slug`, `post_status`, `post_views`, `post_user_id`) VALUES
(17, 'Bộ ảnh những câu nói hay về du lịch', '', '<p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Nếu bạn cần những mẫu câu tham khảo để viết status hay khi đăng ảnh du lịch và những status này deep deep xíu để câu like thì có thể xem những câu nói huyền thoại bên dưới nhé. Đây chỉ là bộ ảnh vui mà mình muốn sưu tầm những câu nói rồi ghép vào những bức hình mình đã từng đi.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Và lưu ý đi hay không, nó ko phụ thuộc vào những câu nói hay những bài báo mà bạn nhìn thấy. Nó chỉ đơn giản là bạn muốn đi và khao khát được đi. Những câu nói hay về du lịch mà Cuồng Chân tổng hợp ra đây chỉ là 1 phần nào đó giúp bạn có thêm 1 gốc nhìn mới về “sự đi”, cuộc sống thì cần nhiều gốc nhìn nó sẽ giúp cho chúng ta có sự đa dạng về cuộc sống để cảm nhận mọi cái tốt hơn.</p><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\"><em style=\"outline: none; margin: 0px; padding: 0px;\">Photo: Tuân Cuồng Chân</em><br style=\"outline: none; margin: 0px; padding: 0px;\"><em style=\"outline: none; margin: 0px; padding: 0px;\">Design: Tuân Cuồng Chân</em><br style=\"outline: none; margin: 0px; padding: 0px;\"><em style=\"outline: none; margin: 0px; padding: 0px;\">Rất vui nếu bạn để nguồn khi share hoặc copy album</em></p><div id=\"penci-post-gallery__98320\" class=\"penci-post-gallery-container justified column-3 justified-gallery\" data-height=\"150\" data-margin=\"3\" style=\"outline: none; margin: 0px 0px 20px; padding: 0px; width: 779.987px; position: relative; overflow: hidden; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif; font-size: 16px; height: 3483.69px;\"><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-052.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 3px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-052-585x585.jpg\" alt=\"Một câu nói rất hay cho bạn muốn tìm status hay khi đăng ảnh du lịch\" title=\"Một câu nói rất hay cho bạn muốn tìm status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Một câu nói rất hay cho bạn muốn tìm status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-042.jpg\" data-cap=\"Lại thêm 1 câu nói hay để viết status hay khi đăng ảnh du lịch ” Thế giới là một cuốn sách, và ai không đi chỉ đọc được một trang.” – St. Augustine\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 3px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-042-585x585.jpg\" alt=\"Lại thêm 1 câu nói hay để viết status hay khi đăng ảnh du lịch\" title=\"Lại thêm 1 câu nói hay để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Lại thêm 1 câu nói hay để viết status hay khi đăng ảnh du lịch ” Thế giới là một cuốn sách, và ai không đi chỉ đọc được một trang.” – St. Augustine</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-032.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 198.747px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-032-585x585.jpg\" alt=\"\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-022.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 198.747px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-022-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-012.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 394.493px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-012-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-321.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 394.493px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-321-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-311.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 590.24px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-311-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-301.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 590.24px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-301-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-291.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 785.987px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-291-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-271.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 785.987px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-271-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-261.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 981.734px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-261-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-251.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 981.734px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-251-585x585.jpg\" alt=\"\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-231.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 1177.48px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-231-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-221.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 1177.48px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-221-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-211.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 1373.23px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-211-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-201.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 1373.23px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-201-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-191.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 1568.97px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-191-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-181.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 1568.97px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-181-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-161.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 1764.72px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-161-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-151.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 1764.72px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-151-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-141.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 1960.47px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-141-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-131.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 1960.47px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-131-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-121.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 2156.21px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-121-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-111.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 2156.21px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-111-585x585.jpg\" alt=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" title=\"Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"><div class=\"caption\" style=\"outline: none; margin: 0px; padding: 9px 15px; position: absolute; bottom: 0px; background: rgba(0, 0, 0, 0.6); left: 0px; right: 0px; color: rgb(255, 255, 255); font-size: 12px; font-weight: inherit; font-family: inherit; line-height: 1.5; opacity: 0;\">Câu này cũng có thể áp dụng để viết status hay khi đăng ảnh du lịch</div></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-101.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 2351.96px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-101-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-10\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-081.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 2351.96px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-081-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-08\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-071.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 2547.71px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-071-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-07\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-051.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 2547.71px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-051-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-05\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-041.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 2743.45px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-041-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-04\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-031.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 2743.45px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-031-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-03\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-021.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 2939.2px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-021-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-02\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-011.jpg\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 2939.2px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/cc-nhung-cau-noi-hay-ve-du-lich-011-585x585.jpg\" alt=\"\" title=\"cc-nhung-cau-noi-hay-ve-du-lich-01\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/DSC_0050.png\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 385px; height: 192.747px; top: 3134.95px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/DSC_0050-585x585.png\" alt=\"\" title=\"DSC_0050\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -192.5px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 192.5px; width: 385px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/MG_1005.png\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 386px; height: 192.747px; top: 3134.95px; left: 391px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/MG_1005-585x585.png\" alt=\"\" title=\"_MG_1005\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -96.5px 0px 0px -193px; padding: 0px; max-width: 100%; vertical-align: top; height: 193px; position: absolute; top: 96.3625px; left: 193px; width: 386px;\"></a><a class=\"penci-gallery-ite item-gallery-justified jg-entry\" href=\"https://www.cuongchan.com/wp-content/uploads/2015/09/MG_0639.png\" style=\"outline: none; margin: 0px; padding: 0px; color: rgb(139, 195, 74); transition: color 0.3s ease 0s; cursor: pointer; position: absolute; display: inline-block; overflow: hidden; opacity: 1; width: 300px; height: 150px; top: 3330.69px; left: 3px;\"><img src=\"https://www.cuongchan.com/wp-content/uploads/2015/09/MG_0639-585x585.png\" alt=\"\" title=\"_MG_0639\" class=\"lazyloaded\" data-ll-status=\"loaded\" style=\"outline: none; margin: -75px 0px 0px -150px; padding: 0px; max-width: 100%; vertical-align: top; height: 150px; position: absolute; top: 75px; left: 150px; width: 300px;\"></a></div><p style=\"outline: none; margin-bottom: 17px; padding: 0px; font-size: 16px; line-height: 1.8; color: rgb(49, 49, 49); font-family: Verdana, Geneva, sans-serif;\">Hy vọng bộ hình trên sẽ giúp bạn có thêm nhiều tham khảo để viết status hay khi đăng ảnh du lịch, nếu bạn có những câu này hay hơn thì có thể comment ở bên dứoi nha, mính sẽ tổng hợp thêm cho mọi người cùng xem</p>', '74eaa858c11413637f00bfa0654b5794.jpg', '2022-05-03 04:53:18', NULL, 6, 'Công cụ', 'b-nh-nhng-cu-ni-hay-v-du-lch', 1, 0, 2),
(18, 'Bếp điện là sự thay thế hoàn hảo cho các loại bếp truyền thống', '', '<p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Bếp điện là sự thay thế hoàn hảo cho các loại bếp truyền thống, ngay cả với bếp gas, bếp điện cũng có nhiều ưu điểm nổi bật hơn, mang đến nhiều lợi ích hơn cho người dùng. Trên cơ sở đó, các loại bếp điện ngày càng được phát triển dựa trên nhiều công nghệ khác nhau, được bày bán rộng rãi trên thị trường.</p><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Bếp hồng ngoại là một loại bếp điện, chúng hoạt động bằng điện và tạo ra ánh sáng hồng ngoại, làm gia tăng mức nhiệt từ đó nấu chín đồ ăn. Vậy, bếp hồng ngoại có những ưu điểm gì và những điều cần lưu ý khi sử dụng bếp hồng ngoại ra sao?</p><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><span style=\"font-weight: 600;\">Ưu điểm của bếp hồng ngoại</span></p><ol style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\"><span style=\"font-weight: 600;\">An toàn trong phòng cháy chữa cháy</span></li></ol><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">So với bếp gas, bếp củi, bếp hồng ngoài được đánh giá là an toàn hơn cho người dùng khi chúng không sử dụng nguyên liệu đốt, không sản sinh lửa, giảm thiểu tối đa tình trạng cháy/ nổ. Cũng vì lý do đó mà trong tất cả các chung cư hiện nay, người dân được yêu cầu sử dụng bếp hồng ngoại thay vì bếp gas để đảm bảo an toàn.</p><ol start=\"2\" style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\"><span style=\"font-weight: 600;\">Không sản sinh mùi khói lửa</span></li></ol><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Một ưu điểm khác của bếp hồng ngoại đó là không sản sinh mùi khói lửa, bụi mịn – sản phẩm của quá trình đốt cháy. Với lý do này, người sử dụng bếp hồng ngoại có thể giảm bớt việc sử dụng&nbsp;<a href=\"https://may-loc-tinh-dien-cong-nghiep.business.site/posts/7978044850022794420?hl=vi\" rel=\"nofollow noopener\" target=\"_blank\" style=\"touch-action: manipulation; color: rgb(0, 122, 255);\">thiết bị xử lý khói bếp</a>, bầu không khí trong nhà luôn ở trạng thái sạch sẽ.</p><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><img loading=\"lazy\" class=\"alignnone size-full wp-image-706 aligncenter\" src=\"https://meovatblog.com/wp-content/uploads/2021/06/cach-su-dung-bep-hong-ngoai-4.jpg\" alt=\"\" width=\"600\" height=\"449\" style=\"border-style: none; max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin-top: 0px; margin-right: auto; margin-left: auto; margin-bottom: 0px !important;\"></p><ol start=\"3\" style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\"><span style=\"font-weight: 600;\">Dễ dàng vệ sinh</span></li></ol><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Bếp hồng ngoại sở hữu phần mặt làm bằng kính nên sau mỗi lần nấu ăn, các bà nội trợ chỉ cần dùng khăn mềm cùng nước rửa mặt kính chuyên dụng để lấy lại sự sáng bóng cho chiếc bếp mà không tốn quá nhiều công sức hay thời gian.</p><ol start=\"4\" style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\"><span style=\"font-weight: 600;\">Nhiệt độ ổn định, dễ dàng thay đổi mức nhiệt</span></li></ol><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Nếu như với bếp củi, bạn cần phải gồng mình để thổi, làm tăng sự cháy của vật liệu từ đó làm tăng quá trình gia nhiệt, giúp thực phẩm nhanh chín; với bếp gas, đôi khi việc điều chỉnh nhiệt độ không chính xác vì núm điều chỉnh chỉ mang tính ước chừng; với bếp hồng ngoại thì khác, người dùng có thể cài đặt chính xác mức nhiệt mà họ muốn. Điều này mang đến sự thuận tiện hơn nhưng cũng đảm bảo món ăn được ngon, phù hợp với tiêu chuẩn đưa ra.</p><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Ngoài các ưu điểm trên, bề hồng ngoại cũng được đánh giá cao bởi khả năng kháng nhiệt, độ bền cao, dễ di chuyển, …</p><p style=\"margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 17px; text-align: justify; background-color: rgb(242, 242, 242);\">Hiện nay, bếp hồng ngoại được bày bán rộng rãi trên thị trường, với nhiều mức giá khác nhau từ vài trăm nghìn đến vài chục triệu đồng. Tuỳ theo yêu cầu sử dụng, người dùng dễ dàng tìm được sản phẩm phù hợp với điều kiện tài chính của mình. Tuy nhiên, bạn không nên dùng bếp có giá quá rẻ, chúng có thể không đảm bảo chất lượng sử dụng.</p>', 'e1190786bc5c08dfe5f5095ae1a27707.jpg', '2022-05-03 04:54:38', NULL, 5, 'Mẹo vặt,Công cụ,Hướng dẫn', 'bp-in-l-s-thay-th-hon-ho-cho-cc-loi-bp-truyn-thng', 1, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_post_views`
--

CREATE TABLE `tbl_post_views` (
  `view_id` int(11) NOT NULL,
  `view_date` timestamp NULL DEFAULT current_timestamp(),
  `view_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `view_post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_post_views`
--

INSERT INTO `tbl_post_views` (`view_id`, `view_date`, `view_ip`, `view_post_id`) VALUES
(58, '2022-05-03 03:39:12', '::1', 14),
(59, '2022-05-03 04:42:42', '::1', 15),
(60, '2022-05-03 04:49:58', '::1', 16),
(61, '2022-05-03 04:55:19', '::1', 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_site`
--

CREATE TABLE `tbl_site` (
  `site_id` int(11) NOT NULL,
  `site_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_title` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_description` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_favicon` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_logo_header` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_logo_footer` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_logo_big` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_facebook` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_twitter` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_instagram` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_pinterest` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `site_linkedin` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_site`
--

INSERT INTO `tbl_site` (`site_id`, `site_name`, `site_title`, `site_description`, `site_favicon`, `site_logo_header`, `site_logo_footer`, `site_logo_big`, `site_facebook`, `site_twitter`, `site_instagram`, `site_pinterest`, `site_linkedin`) VALUES
(1, 'MBLOG', 'MBLOG - Source Code untuk Blogger', 'Open Source source code untuk personal blog, simple, elegan, full responsif, dan mudah di customize.  ', 'favicon.png', 'logo-black.png', 'favicon.png', 'LOGO-BIG.png', 'https://www.facebook.com/mfikridotcom/', 'https://twitter.com/MFikri75770694/', 'https://www.instagram.com/mfikricom/', 'https://id.pinterest.com/mfikricom/', 'https://www.linkedin.com/in/m-fikri-setiadi-b03370148/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_subscribe`
--

CREATE TABLE `tbl_subscribe` (
  `subscribe_id` int(11) NOT NULL,
  `subscribe_email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `subscribe_created_at` timestamp NULL DEFAULT current_timestamp(),
  `subscribe_status` int(11) DEFAULT 0,
  `subscribe_rating` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_subscribe`
--

INSERT INTO `tbl_subscribe` (`subscribe_id`, `subscribe_email`, `subscribe_created_at`, `subscribe_status`, `subscribe_rating`) VALUES
(6, 'vohaituyen12a7@gmail.com', '2022-05-03 05:04:48', 1, 0),
(7, '1951120146@sv.ut.edu.vn', '2022-05-03 05:04:59', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_tags`
--

CREATE TABLE `tbl_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_tags`
--

INSERT INTO `tbl_tags` (`tag_id`, `tag_name`) VALUES
(5, 'Mẹo vặt'),
(6, 'Công cụ'),
(7, 'Ý tưởng'),
(8, 'Hướng dẫn'),
(9, 'Công thức'),
(10, 'Địa điểm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `testimonial_content` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `testimonial_image` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `testimonial_created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`testimonial_id`, `testimonial_name`, `testimonial_content`, `testimonial_image`, `testimonial_created_at`) VALUES
(1, 'Võ Hải Tuyên', 'Blog được tạo ra nhằm chia sẽ những kinh nghiệm về cuộc sống, mẹo vặt, du lịch,... hi vọng sẽ giúp mọi người có thêm nhưng kiến thức cần thiết cho cuộc sống tốt đẹp hơn &amp;lt;3.', 'b4d8e2b191213f72dc41ce768b03b2d9.png', '2020-01-03 03:31:51'),
(2, 'Lê Xuân Quý', 'Hãy liên hệ với chúng tôi nếu bạn có những ý tưởng, kinh nghiệm,... bổ ích, hay ho về cuộc sống, du lịch,... để có thể đăng bài trên blog của chúng tôi nhé.', '8974c88ea2a92b1a27c062d2f78411f8.png', '2022-05-03 05:01:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_email` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_password` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_level` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_status` varchar(10) CHARACTER SET utf8mb4 DEFAULT '1',
  `user_photo` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_level`, `user_status`, `user_photo`) VALUES
(1, 'Võ Hải Tuyên', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', 'fcee14ca639c3ca3c5b93b7c7fc70ba2.png'),
(2, 'Lê Xuân Quý', 'quyle@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2', '1', '3d0be9678f99be0b5180634d37ff8ef4.png'),
(3, 'Nguyễn Yến Nhi', 'NhiNguyen@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2', '1', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `visit_id` int(11) NOT NULL,
  `visit_date` timestamp NULL DEFAULT current_timestamp(),
  `visit_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `visit_platform` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_visitors`
--

INSERT INTO `tbl_visitors` (`visit_id`, `visit_date`, `visit_ip`, `visit_platform`) VALUES
(541362, '2022-05-03 03:27:57', '::1', 'Chrome');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`about_id`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Chỉ mục cho bảng `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`home_id`);

--
-- Chỉ mục cho bảng `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Chỉ mục cho bảng `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  ADD PRIMARY KEY (`navbar_id`);

--
-- Chỉ mục cho bảng `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Chỉ mục cho bảng `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Chỉ mục cho bảng `tbl_site`
--
ALTER TABLE `tbl_site`
  ADD PRIMARY KEY (`site_id`);

--
-- Chỉ mục cho bảng `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  ADD PRIMARY KEY (`subscribe_id`);

--
-- Chỉ mục cho bảng `tbl_tags`
--
ALTER TABLE `tbl_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Chỉ mục cho bảng `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`visit_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_navbar`
--
ALTER TABLE `tbl_navbar`
  MODIFY `navbar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tbl_post_views`
--
ALTER TABLE `tbl_post_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `tbl_site`
--
ALTER TABLE `tbl_site`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tbl_tags`
--
ALTER TABLE `tbl_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541363;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
